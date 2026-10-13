#include <gb/cgb.h>
#include <gb/drawing.h>
#include <gb/gb.h>
#include <gb/metasprites.h>
#include <stdint.h>

#include "./actions/fire.h"
#include "./sprites/clean.h"
#include "./sprites/sprite_generate.h"
#include "./enemies/level_1_enemies.h"
#include "./maps/level_1_sky.h"
#include "./movement/sprite_movement.h"
#include "./player_progress.h"
#include "./sprites/arche/arche_small_sprites.h"
#include "./sprites/effects/small_effect_sprites.h"
#include "./sprites/sprite_ids.h"
#include "./start/start_screen.h"
#include "./ui/game_hud.h"
#include "./ui/pause_overlay.h"

// #########################################//
// #          VARIABLES GLOBALES           #//
// #########################################//
//  Variables globales marcadas como volátiles para evitar optimización excesiva
volatile uint8_t        player_x = 20, player_y = 78; // Posición inicial de ARCHE (en gameplay)
static uint8_t          player_health          = PLAYER_START_HEALTH;
static uint8_t          player_max_health      = PLAYER_START_HEALTH;
static uint8_t          player_level           = 1;
static uint32_t         player_xp              = 0;
static uint32_t         player_xp_required     = 70;
static uint8_t          player_invulnerability = 0;
static uint8_t          player_defeated        = 0;
static uint8_t          player_hud_dirty       = 0;
static uint8_t          player_respawn_timer   = 0;
static PlayerCheckpoint player_checkpoint      = {1, 1, 0, 0};

static void save_player_checkpoint(uint8_t stage) {
  player_checkpoint.stage          = stage;
  player_checkpoint.level          = player_level;
  player_checkpoint.stage_progress = level_1_wave_number ? level_1_wave_number - 1 : 0;
  player_checkpoint.xp_progress    = player_xp;
}

static void award_enemy_experience(uint16_t reward) {
  uint8_t previous_max_health;
  if (reward == 0 || player_level >= PLAYER_LEVEL_CAP)
    return;

  player_xp += reward;
  while (player_level < PLAYER_LEVEL_CAP && player_xp >= player_xp_required) {
    player_xp -= player_xp_required;
    ++player_level;
    previous_max_health = player_max_health;
    player_max_health   = player_max_health_for_level(player_level);
    if (player_max_health > previous_max_health) {
      player_health += player_max_health - previous_max_health;
      if (player_health > player_max_health)
        player_health = player_max_health;
    }
    player_xp_required = player_xp_required_for_level(player_level);
  }
  if (player_level >= PLAYER_LEVEL_CAP) {
    player_xp          = 0;
    player_xp_required = 0;
  }
  player_hud_dirty = 1;
}

static void clear_player_projectiles(void) {
  uint8_t i;
  bullet_active = 0;
  move_sprite(BULLET_SINGLE_SPRITE, 0, 0);
  for (i = 0; i < 3; ++i) {
    spread_bullet_active[i] = 0;
    move_sprite(BULLET_SPRITE_FIRST + i, 0, 0);
  }
  fire_delay = 0;
}

static void respawn_at_checkpoint(void) {
  player_level           = player_checkpoint.level;
  player_xp              = player_checkpoint.xp_progress;
  player_xp_required     = player_xp_required_for_level(player_level);
  player_max_health      = player_max_health_for_level(player_level);
  player_health          = player_max_health;
  player_x               = 20;
  player_y               = 78;
  player_invulnerability = PLAYER_INVULNERABILITY_TICKS;
  player_defeated        = 0;
  player_respawn_timer   = 0;
  clear_player_projectiles();
  level_1_enemies_init(player_checkpoint.stage_progress);
  reset_level_1_sky_scroll();
  player_hud_dirty = 1;
}

static void resolve_player_shot_collisions(void) {
  uint8_t  i;
  uint16_t reward;
  if (bullet_active && level_1_player_shot_collision(bullet_x, bullet_y, &reward)) {
    bullet_active = 0;
    move_sprite(BULLET_SINGLE_SPRITE, 0, 0);
    award_enemy_experience(reward);
  }
  for (i = 0; i < 3; ++i) {
    if (spread_bullet_active[i] &&
        level_1_player_shot_collision(spread_bullet_x[i], spread_bullet_y[i], &reward)) {
      spread_bullet_active[i] = 0;
      move_sprite(BULLET_SPRITE_FIRST + i, 0, 0);
      award_enemy_experience(reward);
    }
  }
}

static void damage_player(uint8_t damage) {
  if (player_invulnerability || player_defeated)
    return;
  if (damage >= player_health)
    player_health = 0;
  else
    player_health -= damage;
  player_hud_dirty       = 1;
  player_invulnerability = PLAYER_INVULNERABILITY_TICKS;
  if (!player_health) {
    uint8_t i;
    player_defeated      = 1;
    player_respawn_timer = PLAYER_RESPAWN_TICKS;
    for (i = 0; i < 4; ++i)
      move_sprite(PLAYER_SPRITE_FIRST + i, 0, 0);
    clear_player_projectiles();
  }
}

// #################################################################//
// #                      FUNCIONES PRINCIPAL                      #//
// #################################################################//
void main(void) {
  DISPLAY_OFF;  // Apagar la pantalla
  HIDE_BKG;     // Oculta el fondo
  HIDE_SPRITES; // Oculta los sprites

  load_128x128_full_screen(start_chuck_screen_sprite, 1, 0);
  load_128x128_full_screen(start_title_screen_sprite, 0, 1);
  // load_level_start_screen();                                  // Muestra pantalla previa a LEVEL
  // 1
  save_player_checkpoint(1);

  // Configurar la pantalla y el fondo
  hide_all_sprites();
  DISPLAY_OFF;
  init_level_1_sky();

  // Cargar datos gráficos
  load_16_x_16_sprite_at(PLAYER_SPRITE_FIRST, PLAYER_TILE_FIRST, arche_sprite_tiles, player_x,
                         player_y); // Carga Arche para el gameplay
  init_single_bullet();             // Inicializa sprite de proyectil disparo
  init_spread_bullets();            // Inicializa sprite de proyectil disparo
  init_pause_overlay();
  level_1_enemies_init(0); // Wasp y Medusa del primer nivel
  game_hud_init(player_health, player_max_health, player_level);
  DISPLAY_ON;
  SHOW_BKG;
  SHOW_SPRITES;

  uint8_t paused             = 0;
  uint8_t start_was_pressed  = (joypad() & J_START) != 0;
  uint8_t info_screen        = 0;
  uint8_t select_was_pressed = (joypad() & J_SELECT) != 0;

  // Bucle principal. Lógica del juego, detección de entradas, etc.
  while (1) {
    uint8_t input = joypad(); // Lee las entradas del control

    // Start alterna pausa/reanudación solo al presionarse, no al sostenerlo.
    if (input & J_START) {
      if (!start_was_pressed) {
        paused = !paused;
        if (paused) {
          hide_level_1_cloud_sprites();
          level_1_enemies_hide();
          show_pause_overlay();
        } else {
          hide_pause_overlay();
          show_level_1_cloud_sprites();
        }
      }
      start_was_pressed = 1;
    } else {
      start_was_pressed = 0;
    }

    // Mantiene el fotograma actual y congela toda la lógica hasta reanudar.
    if (paused) {
      wait_vbl_done();
      continue;
    }

    if (player_defeated) {
      if (player_respawn_timer && --player_respawn_timer == 0)
        respawn_at_checkpoint();
      wait_vbl_done();
      continue;
    }

    if (input & J_SELECT) {
      if (!select_was_pressed) {
        info_screen = !info_screen;
        if (info_screen) {
          level_1_enemies_hide();
          for (uint8_t i = 0; i < 4; ++i)
            move_sprite(PLAYER_SPRITE_FIRST + i, 0, 0);
          move_sprite(BULLET_SINGLE_SPRITE, 0, 0);
          for (uint8_t i = 0; i < 3; ++i)
            move_sprite(BULLET_SPRITE_FIRST + i, 0, 0);
          game_hud_show_info(player_health, player_max_health, player_level, player_xp,
                             player_xp_required);
        } else {
          game_hud_update(player_health, player_max_health, player_level);
        }
      }
      select_was_pressed = 1;
    } else {
      select_was_pressed = 0;
    }
    if (info_screen) {
      wait_vbl_done();
      continue;
    }

    decrease_fire_delay(); // Reduce el retraso entre disparos

    if (player_invulnerability)
      --player_invulnerability;

    // Disparo con el botón A / spread con B mientras Arche siga en combate.
    if (!player_defeated && (input & J_A)) {
      fire_single_bullet(player_x, player_y);
    }
    if (!player_defeated && (input & J_B)) {
      fire_spread(player_x, player_y);
    }

    if (!player_defeated) {
      move_16_x_16_sprite(PLAYER_SPRITE_FIRST, &player_x, &player_y);
      if (player_invulnerability && (player_invulnerability & 4)) {
        uint8_t i;
        for (i = 0; i < 4; ++i)
          move_sprite(PLAYER_SPRITE_FIRST + i, 0, 0);
      }
    }
    update_single_bullet();  // Actualiza el disparo
    update_spread_bullets(); // Actualiza el disparo spread
    resolve_player_shot_collisions();
    level_1_enemies_update(player_y);
    if (!player_invulnerability) {
      uint8_t damage = level_1_enemy_projectile_collision(player_x, player_y);
      if (!damage)
        damage = level_1_enemy_body_collision(player_x, player_y);
      if (damage)
        damage_player(damage);
    }
    if (player_hud_dirty) {
      game_hud_update(player_health, player_max_health, player_level);
      player_hud_dirty = 0;
    }
    update_level_1_sky(); // Scroll horizontal único del fondo
    delay(10);            // Retraso para suavizar el movimiento
    wait_vbl_done();
  }
}
