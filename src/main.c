#include <gb/cgb.h>
#include <gb/drawing.h>
#include <gb/gb.h>
#include <gb/metasprites.h>
#include <stdint.h>
#include <stdio.h>
#include <string.h>

#include "./actions/fire.h"
#include "./sprites/clean.h"
#include "./sprites/sprite_generate.h"
#include "./animations/arche_big.h"
#include "./enemies/level_1_enemies.h"
#include "./level_start/level_start_screen.h"
#include "./maps/level_1_sky.h"
#include "./movement/sprite_movement.h"
#include "./skits/skit_start.h"
#include "./sprites/arche/arche_big_sprites.h"
#include "./sprites/arche/arche_small_sprites.h"
#include "./sprites/effects/small_effect_sprites.h"
#include "./sprites/sprite_ids.h"
#include "./sprites/texts/press_start_sprites.h"
#include "./sprites/title_screen/start_screen_sprites.h"
#include "./start/start_screen.h"
#include "./text/text.h"
#include "./ui/pause_overlay.h"

// #########################################//
// #          VARIABLES GLOBALES           #//
// #########################################//
//  Variables globales marcadas como volátiles para evitar optimización excesiva
volatile uint8_t player_x = 20, player_y = 78; // Posición inicial de ARCHE (en gameplay)
static uint8_t   player_health          = 3;
static uint8_t   player_invulnerability = 0;
static uint8_t   player_defeated        = 0;

static void resolve_player_shot_collisions(void) {
  uint8_t i;
  if (bullet_active && level_1_player_shot_collision(bullet_x, bullet_y)) {
    bullet_active = 0;
    move_sprite(BULLET_SINGLE_SPRITE, 0, 0);
  }
  for (i = 0; i < 3; ++i) {
    if (spread_bullet_active[i] &&
        level_1_player_shot_collision(spread_bullet_x[i], spread_bullet_y[i])) {
      spread_bullet_active[i] = 0;
      move_sprite(BULLET_SPRITE_FIRST + i, 0, 0);
    }
  }
}

static void damage_player(void) {
  if (player_invulnerability || player_defeated)
    return;
  if (player_health)
    --player_health;
  player_invulnerability = 60;
  if (!player_health) {
    uint8_t i;
    player_defeated = 1;
    for (i = 0; i < 4; ++i)
      move_sprite(PLAYER_SPRITE_FIRST + i, 0, 0);
  }
}

// #################################################################//
// #                      FUNCIONES PRINCIPAL                      #//
// #################################################################//
void main(void) {
  DISPLAY_OFF;  // Apagar la pantalla
  HIDE_BKG;     // Oculta el fondo
  HIDE_SPRITES; // Oculta los sprites

  load_128x128_full_screen(start_chuck_screen_sprite, 1, 0); // Pantalla de inicio 1
  load_128x128_full_screen(start_title_screen_sprite, 0, 1); // Pantalla de inicio 2 (Press Start)
  load_skit_start_screen();                                  // Muestra el skit de inicio
  // load_level_start_screen();                                  // Muestra pantalla previa a LEVEL
  // 1

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
  level_1_enemies_init(); // Wasp y Medusa del primer nivel
  DISPLAY_ON;
  SHOW_BKG;
  SHOW_SPRITES;

  uint8_t paused            = 0;
  uint8_t start_was_pressed = (joypad() & J_START) != 0;

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
    if (!player_defeated && !player_invulnerability &&
        (level_1_enemy_projectile_collision(player_x, player_y) ||
         level_1_enemy_body_collision(player_x, player_y))) {
      damage_player();
    }
    update_level_1_sky(); // Scroll horizontal único del fondo
    delay(10);            // Retraso para suavizar el movimiento
    wait_vbl_done();
  }
}
