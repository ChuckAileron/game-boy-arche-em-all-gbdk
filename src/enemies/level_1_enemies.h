#ifndef LEVEL_1_ENEMIES_H
#define LEVEL_1_ENEMIES_H

#include "../sprites/sprite_ids.h"
#include "level_1_enemy_assets.h"
#include <gb/gb.h>
#include <stdint.h>

#define LEVEL_1_ENEMY_COUNT 3
#define ENEMY_TILE_FIRST    192

typedef enum { ENEMY_WASP, ENEMY_MEDUSA } Level1EnemyType;
typedef enum { ENEMY_FLYING, ENEMY_ATTACKING, ENEMY_HURT, ENEMY_DYING } Level1EnemyAnimation;
typedef enum {
  XP_BAT_NEEDLE,
  XP_WINGED_EYE,
  XP_BLADE_CROW,
  XP_IRON_WASP,
  XP_GHOST_MEDUSA,
  XP_SENTINEL_DRONE,
  XP_EMBER_DRACO,
  XP_VESPER,
  XP_WASP_QUEEN
} EnemyRewardKind;

typedef struct {
  uint8_t  type, x, y, active;
  uint8_t  animation, frame, frame_tick;
  uint8_t  attack_tick, movement_tick, direction;
  uint8_t  rendered_animation, rendered_frame, frame_loaded;
  uint8_t  sprite_tiles_dirty;
  uint8_t  xp_awarded, contact_damage;
  uint16_t xp_reward;
} Level1Enemy;

typedef struct {
  uint8_t x, y, active;
  int8_t  dx, dy;
  uint8_t damage;
} Level1EnemyShot;

static Level1Enemy     level_1_enemies[LEVEL_1_ENEMY_COUNT];
static Level1EnemyShot level_1_enemy_shots[ENEMY_PROJECTILE_COUNT];
static uint8_t         level_1_enemy_tiles[LEVEL_1_ENEMY_COUNT][64];
static uint8_t         level_1_respawn_timer;
static uint8_t         level_1_wave_number;
static uint8_t         level_1_round_in_wave;
static uint8_t         level_1_rounds_total;
static uint8_t level_1_round_delay;
static uint8_t level_1_respawn_timer;
static const int8_t    enemy_sprite_offsets[4][2]  = {{0, 0}, {8, 0}, {0, 8}, {8, 8}};
static const uint8_t   enemy_attack_frame_ticks[6] = {8, 8, 6, 4, 6, 8};

static uint8_t level_1_rounds_for_wave(uint8_t wave) {
  return wave < 4 ? wave : 4;
}

static uint8_t level_1_enemy_frame_duration(const Level1Enemy *enemy) {
  if (enemy->animation == ENEMY_ATTACKING)
    return enemy_attack_frame_ticks[enemy->frame % 6];
  if (enemy->animation == ENEMY_HURT)
    return 4;
  if (enemy->animation == ENEMY_DYING)
    return 5;
  return 6;
}

static void level_1_enemy_render(uint8_t index) {
  Level1Enemy *enemy       = &level_1_enemies[index];
  uint8_t      base_sprite = ENEMY_SPRITE_FIRST + index * ENEMY_SPRITES_PER_ENEMY;
  uint8_t      base_tile   = ENEMY_TILE_FIRST + index * 4;
  uint8_t      i;

  if (!enemy->active) {
    for (i = 0; i < 4; ++i)
      move_sprite(base_sprite + i, 0, 0);
    return;
  }

  if (!enemy->frame_loaded || enemy->rendered_animation != enemy->animation ||
      enemy->rendered_frame != enemy->frame) {
    level_1_copy_enemy_frame(enemy->type, enemy->animation, enemy->frame,
                             level_1_enemy_tiles[index]);
    set_sprite_data(base_tile, 4, level_1_enemy_tiles[index]);
    enemy->rendered_animation = enemy->animation;
    enemy->rendered_frame     = enemy->frame;
    enemy->frame_loaded       = 1;
  }
  for (i = 0; i < 4; ++i) {
    /* The pause overlay temporarily borrows OAM entries 21-26. */
    if (enemy->sprite_tiles_dirty) {
      set_sprite_tile(base_sprite + i, base_tile + i);
      set_sprite_prop(base_sprite + i, S_PALETTE);
    }
    move_sprite(base_sprite + i, enemy->x + enemy_sprite_offsets[i][0],
                enemy->y + enemy_sprite_offsets[i][1]);
  }
  enemy->sprite_tiles_dirty = 0;
}

static uint16_t level_1_enemy_reward(EnemyRewardKind kind) {
  /* XP_BAT_NEEDLE, XP_WINGED_EYE, XP_BLADE_CROW, XP_IRON_WASP, XP_GHOST_MEDUSA,
     XP_SENTINEL_DRONE (mas alto por ser metalico y con ataque spread),
     XP_EMBER_DRACO, XP_VESPER, XP_WASP_QUEEN. */
  static const uint16_t rewards[9] = {8, 12, 16, 20, 24, 40, 48, 160, 280};
  return (kind <= XP_WASP_QUEEN) ? rewards[kind] : 0;
}

static void level_1_enemy_spawn(uint8_t index, uint8_t x, uint8_t y, uint8_t direction,
                                uint16_t xp_reward) {
  Level1Enemy *enemy        = &level_1_enemies[index];
  enemy->type               = index == 1 ? ENEMY_MEDUSA : ENEMY_WASP;
  enemy->x                  = x;
  enemy->y                  = y;
  enemy->active             = 1;
  enemy->animation          = ENEMY_FLYING;
  enemy->frame              = 0;
  enemy->frame_tick         = 0;
  enemy->attack_tick        = 0;
  enemy->movement_tick      = 0;
  enemy->direction          = direction;
  enemy->xp_reward          = xp_reward;
  enemy->xp_awarded         = 0;
  enemy->contact_damage     = 1;
  enemy->frame_loaded       = 0;
  enemy->sprite_tiles_dirty = 1;
  level_1_enemy_render(index);
}

static void level_1_start_round(void) {
  uint8_t base_y = 28 + ((level_1_wave_number * 37u) % 60u);
  uint8_t dir    = level_1_wave_number & 1u;
  level_1_enemy_spawn(0, 164, base_y, dir, level_1_enemy_reward(XP_IRON_WASP));
  level_1_enemy_spawn(1, 172, base_y + 24, (dir + 1u) & 1u, level_1_enemy_reward(XP_GHOST_MEDUSA));
  level_1_enemy_spawn(2, 156, base_y + 48, dir ^ 1u, level_1_enemy_reward(XP_IRON_WASP));
}

static void level_1_start_wave(void) {
  level_1_round_in_wave = 0;
  level_1_rounds_total  = level_1_rounds_for_wave(level_1_wave_number);
  level_1_round_delay   = 0;
  level_1_start_round();
}

static void level_1_enemies_init(uint8_t starting_wave) {
  uint8_t i;
  level_1_wave_number   = starting_wave;
  level_1_respawn_timer = 0;
  level_1_start_wave();

  for (i = 0; i < ENEMY_PROJECTILE_COUNT; ++i) {
    level_1_enemy_shots[i].active = 0;
    set_sprite_tile(ENEMY_PROJECTILE_FIRST + i, BULLET_TILE_FIRST);
    move_sprite(ENEMY_PROJECTILE_FIRST + i, 0, 0);
  }
}

static void level_1_spawn_shot(uint8_t x, uint8_t y, int8_t dy) {
  uint8_t i;
  for (i = 0; i < ENEMY_PROJECTILE_COUNT; ++i) {
    if (!level_1_enemy_shots[i].active) {
      level_1_enemy_shots[i].x      = x;
      level_1_enemy_shots[i].y      = y;
      level_1_enemy_shots[i].dx     = -1;
      level_1_enemy_shots[i].dy     = dy;
      level_1_enemy_shots[i].damage = 1;
      level_1_enemy_shots[i].active = 1;
      return;
    }
  }
}

static uint8_t level_1_spawn_medusa_volley(uint8_t x, uint8_t y) {
  uint8_t first = ENEMY_PROJECTILE_COUNT;
  uint8_t second = ENEMY_PROJECTILE_COUNT;
  uint8_t i;

  for (i = 0; i < ENEMY_PROJECTILE_COUNT; ++i) {
    if (!level_1_enemy_shots[i].active) {
      if (first == ENEMY_PROJECTILE_COUNT)
        first = i;
      else {
        second = i;
        break;
      }
    }
  }

  if (second == ENEMY_PROJECTILE_COUNT)
    return 0;

  level_1_enemy_shots[first].x = x;
  level_1_enemy_shots[first].y = y;
  level_1_enemy_shots[first].dx = -1;
  level_1_enemy_shots[first].dy = -1;
  level_1_enemy_shots[first].damage = 1;
  level_1_enemy_shots[first].active = 1;

  level_1_enemy_shots[second].x = x;
  level_1_enemy_shots[second].y = y;
  level_1_enemy_shots[second].dx = -1;
  level_1_enemy_shots[second].dy = 1;
  level_1_enemy_shots[second].damage = 1;
  level_1_enemy_shots[second].active = 1;
  return 1;
}

static uint16_t level_1_enemy_damage(uint8_t index) {
  Level1Enemy *enemy = &level_1_enemies[index];
  if (!enemy->active || enemy->animation == ENEMY_DYING)
    return 0;
  /* Wasp and Medusa are defeated by one Arche projectile. */
  enemy->animation  = ENEMY_DYING;
  enemy->frame      = 0;
  enemy->frame_tick = 0;
  if (enemy->xp_awarded)
    return 0;
  enemy->xp_awarded = 1;
  return enemy->xp_reward;
}

static void level_1_enemy_update(uint8_t index, uint8_t player_y) {
  Level1Enemy *enemy         = &level_1_enemies[index];
  uint8_t      base_period   = (enemy->type == ENEMY_WASP) ? 110 : 145;
  uint8_t      speedup       = (level_1_wave_number < 10) ? level_1_wave_number * 5 : 50;
  uint8_t      attack_period = (base_period * (100 - speedup)) / 100;
  if (!enemy->active)
    return;

  if (++enemy->frame_tick >= level_1_enemy_frame_duration(enemy)) {
    uint8_t frame_count = (enemy->animation == ENEMY_ATTACKING) ? 6
                          : (enemy->animation == ENEMY_HURT)    ? 2
                                                                : 4;
    enemy->frame_tick   = 0;
    if (++enemy->frame >= frame_count) {
      enemy->frame = 0;
      if (enemy->animation == ENEMY_DYING) {
        enemy->active = 0;
        level_1_enemy_render(index);
        return;
      }
      if (enemy->animation != ENEMY_FLYING)
        enemy->animation = ENEMY_FLYING;
    }
  }

  if (enemy->animation == ENEMY_DYING || enemy->animation == ENEMY_HURT) {
    level_1_enemy_render(index);
    return;
  }

  ++enemy->movement_tick;
  if (enemy->type == ENEMY_WASP) {
    if (enemy->x > 92)
      --enemy->x;

    if ((enemy->movement_tick & 7u) == 0)
      enemy->y += enemy->direction ? 2 : 254;

    if (enemy->y < 32)
      enemy->direction = 1;

    if (enemy->y > 112)
      enemy->direction = 0;

  } else {
    if (enemy->x > 112)
      --enemy->x;

    if ((enemy->movement_tick & 7u) == 0) {
      if (enemy->y + 8 < player_y && enemy->y < 120)
        ++enemy->y;

      else if (enemy->y > player_y + 8 && enemy->y > 24)
        --enemy->y;
    }
  }

  if (++enemy->attack_tick >= attack_period) {
    if (enemy->type == ENEMY_WASP) {
      level_1_spawn_shot(enemy->x, enemy->y + 8, 0);
    } else if (!level_1_spawn_medusa_volley(enemy->x, enemy->y + 8)) {
      /* Espera hasta que haya dos slots y lanza siempre la pareja completa. */
      enemy->attack_tick = attack_period - 1;
      level_1_enemy_render(index);
      return;
    }

    enemy->attack_tick = 0;
    enemy->animation   = ENEMY_ATTACKING;
    enemy->frame       = 0;
  }
  level_1_enemy_render(index);
}

static void level_1_enemies_hide(void) {
  uint8_t i;
  uint8_t enemy_index;

  for (i = 0; i < LEVEL_1_ENEMY_COUNT * ENEMY_SPRITES_PER_ENEMY; ++i)
    move_sprite(ENEMY_SPRITE_FIRST + i, 0, 0);

  for (enemy_index = 0; enemy_index < LEVEL_1_ENEMY_COUNT; ++enemy_index)
    level_1_enemies[enemy_index].sprite_tiles_dirty = 1;

  for (i = 0; i < ENEMY_PROJECTILE_COUNT; ++i)
    move_sprite(ENEMY_PROJECTILE_FIRST + i, 0, 0);
}

static uint8_t level_1_player_shot_collision(uint8_t x, uint8_t y, uint16_t *xp_reward) {
  uint8_t i;
  *xp_reward = 0;

  for (i = 0; i < LEVEL_1_ENEMY_COUNT; ++i) {
    Level1Enemy *enemy = &level_1_enemies[i];

    if (enemy->active && enemy->animation != ENEMY_DYING && x < enemy->x + 16 && x + 8 > enemy->x &&
        y < enemy->y + 16 && y + 8 > enemy->y) {
      *xp_reward = level_1_enemy_damage(i);
      return 1;
    }
  }
  return 0;
}

static uint8_t level_1_enemy_projectile_collision(uint8_t player_x, uint8_t player_y) {
  uint8_t i;

  for (i = 0; i < ENEMY_PROJECTILE_COUNT; ++i) {
    Level1EnemyShot *shot = &level_1_enemy_shots[i];

    if (shot->active && shot->x < player_x + 16 && shot->x + 8 > player_x &&
        shot->y < player_y + 16 && shot->y + 8 > player_y) {
      shot->active = 0;
      move_sprite(ENEMY_PROJECTILE_FIRST + i, 0, 0);
      return shot->damage;
    }
  }
  return 0;
}

static uint8_t level_1_enemy_body_collision(uint8_t player_x, uint8_t player_y) {
  uint8_t i;
  for (i = 0; i < LEVEL_1_ENEMY_COUNT; ++i) {
    Level1Enemy *enemy = &level_1_enemies[i];
    if (enemy->active && enemy->animation != ENEMY_DYING && player_x < enemy->x + 16 &&
        player_x + 16 > enemy->x && player_y < enemy->y + 16 && player_y + 16 > enemy->y) {
      return enemy->contact_damage;
    }
  }
  return 0;
}

static void level_1_enemies_update(uint8_t player_y) {
  uint8_t i;

  for (i = 0; i < LEVEL_1_ENEMY_COUNT; ++i)
    level_1_enemy_update(i, player_y);

  for (i = 0; i < ENEMY_PROJECTILE_COUNT; ++i) {
    Level1EnemyShot *shot = &level_1_enemy_shots[i];

    if (!shot->active)
      continue;

    shot->x += shot->dx;
    shot->y += shot->dy;

    if (shot->x < 8 || shot->y < 8 || shot->y > 152) {
      shot->active = 0;
      move_sprite(ENEMY_PROJECTILE_FIRST + i, 0, 0);
    } else {
      move_sprite(ENEMY_PROJECTILE_FIRST + i, shot->x, shot->y);
    }
  }

  for (i = 0; i < LEVEL_1_ENEMY_COUNT; ++i) {
    if (!level_1_enemies[i].active && level_1_enemies[i].animation != ENEMY_DYING) {
      if (level_1_respawn_timer == 0) {
        level_1_respawn_timer = 60;
      } else if (--level_1_respawn_timer == 0) {
        if ((rand() & 0xFFu) < 64u) {
          uint8_t base_y = 28 + ((level_1_wave_number * 37u) % 60u);
          uint8_t dir    = level_1_wave_number & 1u;
          uint8_t new_type = (rand() & 1u) ? ENEMY_WASP : ENEMY_MEDUSA;
          level_1_enemies[i].type = new_type;
          level_1_enemy_spawn(i, 164, base_y + (i * 24), dir,
                              (new_type == ENEMY_WASP) ? level_1_enemy_reward(XP_IRON_WASP)
                                                       : level_1_enemy_reward(XP_GHOST_MEDUSA));
        }
      }
    }
  }

  uint8_t any_active = 0;
  for (i = 0; i < LEVEL_1_ENEMY_COUNT; ++i) {
    if (level_1_enemies[i].active) {
      any_active = 1;
      break;
    }
  }
  if (!any_active) {
    if (level_1_round_delay == 0) {
      level_1_round_delay = 90;
    } else if (--level_1_round_delay == 0) {
      ++level_1_round_in_wave;
      if (level_1_round_in_wave < level_1_rounds_total) {
        level_1_start_round();
      } else {
        ++level_1_wave_number;
        level_1_start_wave();
      }
    }
  }
}

#endif
