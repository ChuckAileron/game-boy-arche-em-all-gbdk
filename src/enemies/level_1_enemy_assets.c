#include <stdint.h>
#include "level_1_enemy_assets.h"
#include "level_1_enemy_data.h"

void level_1_copy_enemy_frame(uint8_t type, uint8_t animation, uint8_t frame,
                              uint8_t *destination) {
  const uint8_t *frame_map;
  const uint8_t *tiles;
  uint8_t        frame_count, tile, byte;

  if (type == LEVEL1_WASP) {
    tiles = wasp_unique_tiles;
    if (animation == LEVEL1_ATTACKING) {
      frame_map   = wasp_attack_map;
      frame_count = 6;
    } else if (animation == LEVEL1_HURT) {
      frame_map   = wasp_hurt_map;
      frame_count = 2;
    } else if (animation == LEVEL1_DYING) {
      frame_map   = wasp_death_map;
      frame_count = 4;
    } else {
      frame_map   = wasp_fly_map;
      frame_count = 4;
    }
  } else {
    tiles = medusa_unique_tiles;
    if (animation == LEVEL1_ATTACKING) {
      frame_map   = medusa_attack_map;
      frame_count = 6;
    } else if (animation == LEVEL1_HURT) {
      frame_map   = medusa_hurt_map;
      frame_count = 2;
    } else if (animation == LEVEL1_DYING) {
      frame_map   = medusa_death_map;
      frame_count = 4;
    } else {
      frame_map   = medusa_fly_map;
      frame_count = 4;
    }
  }

  frame_map += (uint16_t)(frame % frame_count) * 4u;
  for (tile = 0; tile < 4; ++tile) {
    uint16_t source_offset      = (uint16_t)frame_map[tile] * 16u;
    uint8_t  destination_offset = tile * 16;
    for (byte = 0; byte < 16; ++byte) {
      destination[destination_offset + byte] = tiles[source_offset + byte];
    }
  }
}
