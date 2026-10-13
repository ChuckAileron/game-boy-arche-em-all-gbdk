#ifndef PLAYER_PROGRESS_H
#define PLAYER_PROGRESS_H

#include <stdint.h>

#define PLAYER_LEVEL_CAP             99u
#define PLAYER_HEALTH_CAP            7u
#define PLAYER_START_HEALTH          3u
#define PLAYER_INVULNERABILITY_TICKS 45u
#define PLAYER_RESPAWN_TICKS         90u

/* Habilidades desbloqueadas por nivel. */
#define PLAYER_SPREAD_SKILL_LEVEL      10u /* Ataque spread (B). */
#define PLAYER_FAST_SPREAD_SKILL_LEVEL 15u /* Fast spread: se puede spamear B. */

typedef struct {
  uint8_t  stage;
  uint8_t  level;
  uint8_t  stage_progress;
  uint32_t xp_progress;
} PlayerCheckpoint;

static uint32_t player_xp_required_for_level(uint8_t level) {
  uint32_t l = level;
  if (level >= PLAYER_LEVEL_CAP)
    return 0u;
  return 40UL + 20UL * l + 10UL * l * l;
}

static uint8_t player_max_health_for_level(uint8_t level) {
  if (level >= 80u)
    return 7u;
  if (level >= 50u)
    return 6u;
  if (level >= 25u)
    return 5u;
  if (level >= 5u)
    return 4u;
  return PLAYER_START_HEALTH;
}

#endif
