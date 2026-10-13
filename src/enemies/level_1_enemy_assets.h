#ifndef LEVEL_1_ENEMY_ASSETS_H
#define LEVEL_1_ENEMY_ASSETS_H

#include <stdint.h>

enum { LEVEL1_WASP = 0, LEVEL1_MEDUSA = 1 };
enum { LEVEL1_FLYING = 0, LEVEL1_ATTACKING = 1, LEVEL1_HURT = 2, LEVEL1_DYING = 3 };

void level_1_copy_enemy_frame(uint8_t type, uint8_t animation, uint8_t frame, uint8_t *destination);

#endif
