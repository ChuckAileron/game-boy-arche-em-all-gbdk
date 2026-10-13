#ifndef ENEMY_SYSTEM_H
#define ENEMY_SYSTEM_H

#include "../../assets/enemies/avispa/avispa_ataque.h"
#include "../../assets/enemies/avispa/avispa_dano.h"
#include "../../assets/enemies/avispa/avispa_destruccion.h"
#include "../../assets/enemies/avispa/avispa_vuelo.h"
#include "../../assets/enemies/dragon/dragon_ataque.h"
#include "../../assets/enemies/dragon/dragon_dano.h"
#include "../../assets/enemies/dragon/dragon_destruccion.h"
#include "../../assets/enemies/dragon/dragon_vuelo.h"
#include "../../assets/enemies/dron/dron_ataque.h"
#include "../../assets/enemies/dron/dron_dano.h"
#include "../../assets/enemies/dron/dron_destruccion.h"
#include "../../assets/enemies/dron/dron_vuelo.h"
#include "../../assets/enemies/medusa/medusa_ataque.h"
#include "../../assets/enemies/medusa/medusa_dano.h"
#include "../../assets/enemies/medusa/medusa_destruccion.h"
#include "../../assets/enemies/medusa/medusa_vuelo.h"
#include "../../assets/enemies/murcielago/murcielago_ataque.h"
#include "../../assets/enemies/murcielago/murcielago_dano.h"
#include "../../assets/enemies/murcielago/murcielago_destruccion.h"
#include "../../assets/enemies/murcielago/murcielago_vuelo.h"
#include "../../assets/enemies/ojo_alado/ojo_alado_ataque.h"
#include "../../assets/enemies/ojo_alado/ojo_alado_dano.h"
#include "../../assets/enemies/ojo_alado/ojo_alado_destruccion.h"
#include "../../assets/enemies/ojo_alado/ojo_alado_vuelo.h"
#include <stdint.h>

/* Cada fotograma de enemigo es un metasprite 32x32 (16 tiles de 8x8). */
#define ENEMY_FRAME_TILES      16
#define ENEMY_PROJECTILE_COUNT 4

typedef enum {
  ENEMY_DRONE,
  ENEMY_DRACO,
  ENEMY_WASP,
  ENEMY_MEDUSA,
  ENEMY_BAT,
  ENEMY_WINGED_EYE,
  ENEMY_TYPE_COUNT
} EnemyType;

typedef enum { ENEMY_FLYING, ENEMY_ATTACKING, ENEMY_HURT, ENEMY_DYING, ENEMY_DEAD } EnemyAnimation;

typedef struct {
  uint8_t type, x, y, active;
  uint8_t animation, animation_frame, animation_tick;
  uint8_t attack_tick, pattern_tick, direction, health;
} Enemy;

typedef enum { ENEMY_SHOT_NORMAL, ENEMY_SHOT_SPREAD, ENEMY_SHOT_FLAME } EnemyShotType;
typedef struct {
  uint8_t x, y, active, type;
  int8_t  dx, dy;
} EnemyProjectile;

static EnemyProjectile enemy_projectiles[ENEMY_PROJECTILE_COUNT];

/* Single 8x8 flame tile, stored in the Game Boy 2bpp format. */
static const uint8_t draco_flame_tile[16] = {0x10, 0x10, 0x38, 0x28, 0x7C, 0x44, 0xFE, 0x82,
                                             0x7C, 0x38, 0x3E, 0x1C, 0x1C, 0x08, 0x08, 0x00};

static const uint8_t *enemy_fly_frames[ENEMY_TYPE_COUNT] = {
    dron_vuelo_32,   dragon_vuelo_32,     avispa_vuelo_32,
    medusa_vuelo_32, murcielago_vuelo_32, ojo_alado_vuelo_32};
static const uint8_t *enemy_attack_frames[ENEMY_TYPE_COUNT] = {
    dron_ataque_32,   dragon_ataque_32,     avispa_ataque_32,
    medusa_ataque_32, murcielago_ataque_32, ojo_alado_ataque_32};
static const uint8_t *enemy_hurt_frames[ENEMY_TYPE_COUNT] = {dron_dano_32,       dragon_dano_32,
                                                             avispa_dano_32,     medusa_dano_32,
                                                             murcielago_dano_32, ojo_alado_dano_32};
static const uint8_t *enemy_death_frames[ENEMY_TYPE_COUNT] = {
    dron_destruccion_32,   dragon_destruccion_32,     avispa_destruccion_32,
    medusa_destruccion_32, murcielago_destruccion_32, ojo_alado_destruccion_32};

static uint8_t enemy_animation_length(uint8_t animation) {
  if (animation == ENEMY_ATTACKING)
    return 6;

  if (animation == ENEMY_HURT)
    return 2;

  if (animation == ENEMY_DYING)
    return 4;

  return 4;
}

/* Returns the current frame's 16 tiles for uploading with set_sprite_data(). */
static const uint8_t *enemy_current_frame(const Enemy *enemy) {
  const uint8_t *frames;
  uint8_t        count;

  if (enemy->animation == ENEMY_ATTACKING) {
    frames = enemy_attack_frames[enemy->type];
    count  = 6;
  } else if (enemy->animation == ENEMY_HURT) {
    frames = enemy_hurt_frames[enemy->type];
    count  = 2;
  } else if (enemy->animation == ENEMY_DYING) {
    frames = enemy_death_frames[enemy->type];
    count  = 4;
  } else {
    frames = enemy_fly_frames[enemy->type];
    count  = 4;
  }
  return frames + ((uint16_t)(enemy->animation_frame % count) * ENEMY_FRAME_TILES * 16u);
}

static void enemy_spawn_projectile(uint8_t x, uint8_t y, uint8_t type, int8_t dx, int8_t dy) {
  uint8_t i;

  for (i = 0; i < ENEMY_PROJECTILE_COUNT; ++i) {
    if (!enemy_projectiles[i].active) {
      enemy_projectiles[i].x      = x;
      enemy_projectiles[i].y      = y;
      enemy_projectiles[i].type   = type;
      enemy_projectiles[i].dx     = dx;
      enemy_projectiles[i].dy     = dy;
      enemy_projectiles[i].active = 1;
      return;
    }
  }
}

static void enemy_damage(Enemy *enemy) {
  if (!enemy->active || enemy->animation == ENEMY_DYING || enemy->animation == ENEMY_DEAD)
    return;

  if (enemy->health > 1) {
    --enemy->health;
    enemy->animation       = ENEMY_HURT;
    enemy->animation_frame = 0;
    enemy->animation_tick  = 0;
  } else {
    enemy->health          = 0;
    enemy->animation       = ENEMY_DYING;
    enemy->animation_frame = 0;
    enemy->animation_tick  = 0;
  }
}

static void enemy_init(Enemy *enemy, uint8_t type, uint8_t x, uint8_t y) {
  enemy->type            = type;
  enemy->x               = x;
  enemy->y               = y;
  enemy->active          = 1;
  enemy->animation       = ENEMY_FLYING;
  enemy->animation_frame = 0;
  enemy->animation_tick  = 0;
  enemy->attack_tick     = 0;
  enemy->pattern_tick    = 0;
  enemy->direction       = 0;
  enemy->health          = (type == ENEMY_DRACO || type == ENEMY_MEDUSA) ? 3 : 2;
}

/* Per-type movement and attack cadences. Call once per game-loop frame. */
static void enemy_update(Enemy *enemy, uint8_t player_y) {
  uint8_t period;
  if (!enemy->active || enemy->animation == ENEMY_DEAD)
    return;

  if (++enemy->animation_tick >= 8) {
    enemy->animation_tick = 0;
    ++enemy->animation_frame;

    if (enemy->animation_frame >= enemy_animation_length(enemy->animation)) {
      enemy->animation_frame = 0;

      if (enemy->animation == ENEMY_HURT)
        enemy->animation = ENEMY_FLYING;

      else if (enemy->animation == ENEMY_ATTACKING)
        enemy->animation = ENEMY_FLYING;

      else if (enemy->animation == ENEMY_DYING) {
        enemy->animation = ENEMY_DEAD;
        enemy->active    = 0;
        return;
      }
    }
  }
  if (enemy->animation == ENEMY_HURT || enemy->animation == ENEMY_DYING)
    return;

  ++enemy->pattern_tick;
  switch (enemy->type) {
  case ENEMY_DRONE: /* steady advance with a small vertical sine-like bob */
    if (enemy->x > 48)
      --enemy->x;

    if ((enemy->pattern_tick & 15u) == 0)
      enemy->y += (enemy->direction ? 1 : 255);

    if (enemy->y < 32)
      enemy->direction = 1;

    if (enemy->y > 112)
      enemy->direction = 0;

    period = 52;
    break;

  case ENEMY_DRACO: /* slower, heavier, descending arc */
    if (enemy->x > 60)
      --enemy->x;

    if ((enemy->pattern_tick & 31u) == 0 && enemy->y < 112)
      enemy->y += 4;

    period = 88;
    break;

  case ENEMY_WASP: /* quick diagonal dive, then climb and repeat */
    if (enemy->pattern_tick % 20u < 10u) {
      if (enemy->x > 36)
        enemy->x -= 2;

      enemy->y += enemy->direction ? 2 : 254;
    } else
      enemy->y += enemy->direction ? 254 : 2;

    if (enemy->y < 28)
      enemy->direction = 1;

    if (enemy->y > 116)
      enemy->direction = 0;

    period = 64;
    break;

  case ENEMY_MEDUSA: /* hovers in place and slowly tracks the player's height */
    if ((enemy->pattern_tick & 7u) == 0) {
      if (enemy->y + 16 < player_y && enemy->y < 112)
        ++enemy->y;
      else if (enemy->y > player_y + 16 && enemy->y > 24)
        --enemy->y;
    }
    period = 76;
    break;
  case ENEMY_BAT: /* fast zig-zag swoop */
    if (enemy->x > 30)
      enemy->x -= 2;

    if ((enemy->pattern_tick & 7u) == 0)
      enemy->direction = !enemy->direction;

    enemy->y += enemy->direction ? 2 : 254;

    if (enemy->y < 24)
      enemy->direction = 1;

    if (enemy->y > 116)
      enemy->direction = 0;

    period = 58;
    break;

  default: /* Winged Eye: slow oscillating patrol and aimed single shots */
    if (enemy->x > 54)
      --enemy->x;

    if ((enemy->pattern_tick & 15u) == 0)
      enemy->direction = !enemy->direction;

    if ((enemy->pattern_tick & 3u) == 0)
      enemy->y += enemy->direction ? 1 : 255;

    if (enemy->y < 28)
      enemy->direction = 1;

    if (enemy->y > 116)
      enemy->direction = 0;

    period = 70;
    break;
  }

  if (++enemy->attack_tick >= period) {
    enemy->attack_tick     = 0;
    enemy->animation       = ENEMY_ATTACKING;
    enemy->animation_frame = 0;

    if (enemy->type == ENEMY_DRONE) {
      /* Normal shots are frequent; three-way spread is deliberately rarer. */
      if ((enemy->pattern_tick % 4u) == 0) {
        enemy_spawn_projectile(enemy->x, enemy->y + 12, ENEMY_SHOT_SPREAD, -2, 0);
        enemy_spawn_projectile(enemy->x, enemy->y + 12, ENEMY_SHOT_SPREAD, -2, -1);
        enemy_spawn_projectile(enemy->x, enemy->y + 12, ENEMY_SHOT_SPREAD, -2, 1);
      } else
        enemy_spawn_projectile(enemy->x, enemy->y + 12, ENEMY_SHOT_NORMAL, -3, 0);
    } else if (enemy->type == ENEMY_DRACO) {
      enemy_spawn_projectile(enemy->x, enemy->y + 12, ENEMY_SHOT_FLAME, -2, 0);
    } else if (enemy->type == ENEMY_WASP || enemy->type == ENEMY_BAT) {
      enemy_spawn_projectile(enemy->x, enemy->y + 12, ENEMY_SHOT_NORMAL, -2, 1);
    } else if (enemy->type == ENEMY_MEDUSA) {
      enemy_spawn_projectile(enemy->x, enemy->y + 12, ENEMY_SHOT_SPREAD, -2, 0);
      enemy_spawn_projectile(enemy->x, enemy->y + 12, ENEMY_SHOT_SPREAD, -2, -1);
      enemy_spawn_projectile(enemy->x, enemy->y + 12, ENEMY_SHOT_SPREAD, -2, 1);
    } else {
      enemy_spawn_projectile(enemy->x, enemy->y + 12, ENEMY_SHOT_NORMAL, -3, 0);
    }
  }
}

static void enemy_update_projectiles(void) {
  uint8_t i;
  for (i = 0; i < ENEMY_PROJECTILE_COUNT; ++i) {
    EnemyProjectile *shot = &enemy_projectiles[i];

    if (!shot->active)
      continue;

    shot->x += shot->dx;
    shot->y += shot->dy;

    if (shot->x < 8 || shot->x > 160 || shot->y < 8 || shot->y > 152)
      shot->active = 0;
  }
}

#endif
