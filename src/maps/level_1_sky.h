#ifndef LEVEL_1_SKY_H
#define LEVEL_1_SKY_H

#include <gb/gb.h>
#include <stdint.h>
#include "level_1_cloud_data.h"

#define SKY_BACKGROUND_SCROLL_INTERVAL 8

static uint8_t sky_frame;

void hide_level_1_cloud_sprites(void) {}
void show_level_1_cloud_sprites(void) {}

void init_level_1_sky(void) {
  set_bkg_data(0, LEVEL_1_CLOUD_TILE_COUNT, level_1_cloud_tiles);
  BGP_REG = 0xE4;
  fill_bkg_rect(0, 0, 32, 32, NUBES_BLANK_TILE);

  set_bkg_tiles(2, 2, NUBE_CUMULO_32X16_WIDTH_TILES, NUBE_CUMULO_32X16_HEIGHT_TILES,
                nube_cumulo_32x16_map);
  set_bkg_tiles(10, 8, NUBE_ESTELA_32X16_WIDTH_TILES, NUBE_ESTELA_32X16_HEIGHT_TILES,
                nube_estela_32x16_map);
  set_bkg_tiles(22, 4, NUBE_BANCO_16X8_WIDTH_TILES, NUBE_BANCO_16X8_HEIGHT_TILES,
                nube_banco_16x8_map);
  set_bkg_tiles(26, 13, NUBE_BANCO_32X16_WIDTH_TILES, NUBE_BANCO_32X16_HEIGHT_TILES,
                nube_banco_32x16_map);

  move_bkg(0, 0);
  HIDE_WIN;
  sky_frame = 0;
}

void update_level_1_sky(void) {
  if ((++sky_frame % SKY_BACKGROUND_SCROLL_INTERVAL) == 0)
    scroll_bkg(1, 0);
}

void reset_level_1_sky_scroll(void) {
  sky_frame = 0;
  move_bkg(0, 0);
}

#endif
