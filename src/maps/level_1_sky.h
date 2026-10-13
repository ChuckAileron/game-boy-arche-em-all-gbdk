#ifndef LEVEL_1_SKY_H
#define LEVEL_1_SKY_H

#include <gb/gb.h>
#include <stdint.h>
#include "level_1_cloud_data.h"

#define SKY_BACKGROUND_SCROLL_INTERVAL 8

static uint8_t sky_frame;

/* The clouds are part of the scrolling BG map, not OAM sprites. */
void hide_level_1_cloud_sprites(void) {}
void show_level_1_cloud_sprites(void) {}

void init_level_1_sky(void) {
  set_bkg_data(0, LEVEL_1_CLOUD_TILE_COUNT, level_1_cloud_tiles);
  BGP_REG = NUBES_DMG_BGP;
  fill_bkg_rect(0, 0, 32, 32, NUBES_BLANK_TILE);

  /* Varied cloud types and sizes spread across the 32-tile scrolling map. */
  set_bkg_tiles(17, 4, NUBE_CUMULO_48X24_WIDTH_TILES, NUBE_CUMULO_48X24_HEIGHT_TILES,
                nube_cumulo_48x24_map);
  set_bkg_tiles(0, 12, NUBE_CUMULO_64X32_WIDTH_TILES, NUBE_CUMULO_64X32_HEIGHT_TILES,
                nube_cumulo_64x32_map);

  set_bkg_tiles(8, 5, NUBE_ESTELA_32X16_WIDTH_TILES, NUBE_ESTELA_32X16_HEIGHT_TILES,
                nube_estela_32x16_map);
  set_bkg_tiles(10, 9, NUBE_ESTELA_48X24_WIDTH_TILES, NUBE_ESTELA_48X24_HEIGHT_TILES,
                nube_estela_48x24_map);

  set_bkg_tiles(0, 5, NUBE_BANCO_48X24_WIDTH_TILES, NUBE_BANCO_48X24_HEIGHT_TILES,
                nube_banco_48x24_map);

  move_bkg(0, 0);
  HIDE_WIN;
  sky_frame = 0;
}

void update_level_1_sky(void) {
  if ((++sky_frame % SKY_BACKGROUND_SCROLL_INTERVAL) == 0)
    scroll_bkg(1, 0);
}

#endif
