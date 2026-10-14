#ifndef GAME_HUD_H
#define GAME_HUD_H

#include <gb/gb.h>
#include <stdint.h>
#include "../player_progress.h"

#define GAME_HUD_TILE_FIRST   220
#define GAME_HUD_TILE_COUNT   17
#define GAME_HUD_ROW_Y        0
#define GAME_HUD_INFO_ROW_Y   10
#define GAME_HUD_SPRITE_FIRST 0
#define GAME_HUD_SPRITE_COUNT 10
#define GAME_HUD_BG_BLANK     0

#define GAME_HUD_TILE_HEART          0
#define GAME_HUD_TILE_HEALTH_FIRST   1
#define GAME_HUD_TILE_HEALTH_FULL    1
#define GAME_HUD_TILE_HEALTH_EMPTY   2
#define GAME_HUD_TILE_HEALTH_LOCKED  3
#define GAME_HUD_TILE_LVL_LABEL      4
#define GAME_HUD_TILE_LEVEL_VALUE    5
#define GAME_HUD_TILE_XP_LABEL       6
#define GAME_HUD_TILE_XP_CURRENT     7
#define GAME_HUD_TILE_XP_SLASH       10
#define GAME_HUD_TILE_XP_NEEDED      11
#define GAME_HUD_TILE_MAX_M          14
#define GAME_HUD_TILE_MAX_A          15
#define GAME_HUD_TILE_MAX_X          16

static uint8_t game_hud_tiles[GAME_HUD_TILE_COUNT * 16];

static const uint8_t game_hud_big_digits[10][7] = {
    {0x6, 0x9, 0x9, 0x9, 0x9, 0x9, 0x6},
    {0x2, 0x6, 0x2, 0x2, 0x2, 0x2, 0x7},
    {0x6, 0x9, 0x1, 0x2, 0x4, 0x8, 0xF},
    {0xE, 0x1, 0x1, 0x6, 0x1, 0x1, 0xE},
    {0x9, 0x9, 0x9, 0xF, 0x1, 0x1, 0x1},
    {0xF, 0x8, 0x8, 0xE, 0x1, 0x1, 0xE},
    {0x6, 0x8, 0x8, 0xE, 0x9, 0x9, 0x6},
    {0xF, 0x1, 0x2, 0x2, 0x4, 0x4, 0x4},
    {0x6, 0x9, 0x9, 0x6, 0x9, 0x9, 0x6},
    {0x6, 0x9, 0x9, 0x7, 0x1, 0x1, 0x6},
};

static void game_hud_clear_tile(uint8_t tile) {
  uint8_t i;
  for (i = 0; i < 16; ++i)
    game_hud_tiles[tile * 16 + i] = 0;
}

static void game_hud_pixel(uint8_t tile, uint8_t x, uint8_t y, uint8_t color) {
  uint8_t offset = tile * 16 + y * 2;
  uint8_t mask   = (uint8_t)(0x80u >> x);
  if (color & 1)
    game_hud_tiles[offset] |= mask;
  if (color & 2)
    game_hud_tiles[offset + 1] |= mask;
}

static void game_hud_draw_big_digit(uint8_t tile, uint8_t digit, uint8_t x_offset) {
  uint8_t row, column;
  for (row = 0; row < 7; ++row)
    for (column = 0; column < 4; ++column)
      if (game_hud_big_digits[digit][row] & (uint8_t)(8u >> column))
        game_hud_pixel(tile, x_offset + column, row, 3);
}

static void game_hud_draw_pair(uint8_t tile, uint8_t left, uint8_t right) {
  game_hud_clear_tile(tile);
  game_hud_draw_big_digit(tile, left, 0);
  game_hud_draw_big_digit(tile, right, 4);
}

static void game_hud_draw_single_digit(uint8_t tile, uint8_t digit) {
  game_hud_clear_tile(tile);
  game_hud_draw_big_digit(tile, digit, 0);
}

static void game_hud_draw_health_segment(uint8_t tile, uint8_t style) {
  uint8_t x, y;
  for (y = 0; y < 8; ++y) {
    for (x = 0; x < 8; ++x) {
      uint8_t color = 0;
      if (style == 0)
        color = 3;
      else if (style == 1)
        color = (x == 0 || x == 7 || y == 0 || y == 7) ? 3 : 1;
      else if (x == 0 || x == 7 || y == 0 || y == 7 || ((x + y) & 1u) == 0)
        color = 1;
      if (color)
        game_hud_pixel(tile, x, y, color);
    }
  }
}

static void game_hud_draw_xp_field(uint8_t first_tile, uint32_t value) {
  uint8_t digits[5];
  uint8_t i;
  for (i = 0; i < 5; ++i) {
    digits[4 - i] = (uint8_t)(value % 10u);
    value /= 10u;
  }
  game_hud_draw_pair(first_tile, digits[0], digits[1]);
  game_hud_draw_pair(first_tile + 1, digits[2], digits[3]);
  game_hud_draw_single_digit(first_tile + 2, digits[4]);
}

static void game_hud_build_xp_tiles(uint32_t xp_progress, uint32_t xp_required) {
  uint8_t i;
  game_hud_clear_tile(GAME_HUD_TILE_XP_SLASH);
  game_hud_draw_xp_field(GAME_HUD_TILE_XP_CURRENT, xp_progress);
  game_hud_draw_xp_field(GAME_HUD_TILE_XP_NEEDED, xp_required);
  for (i = 0; i < 8; ++i)
    game_hud_pixel(GAME_HUD_TILE_XP_SLASH, (uint8_t)(7u - i), i, 3);
  set_bkg_data((uint8_t)(GAME_HUD_TILE_FIRST + GAME_HUD_TILE_XP_CURRENT), 7,
               &game_hud_tiles[GAME_HUD_TILE_XP_CURRENT * 16]);
}

static void game_hud_update(uint8_t health, uint8_t max_health, uint8_t level) {
  uint8_t i;
  uint8_t tens = level / 10u;
  uint8_t ones = level % 10u;

  for (i = 0; i < 7; ++i) {
    uint8_t tile;
    if (i >= max_health)
      tile = GAME_HUD_TILE_HEALTH_LOCKED;
    else if (i < health)
      tile = GAME_HUD_TILE_HEALTH_FULL;
    else
      tile = GAME_HUD_TILE_HEALTH_EMPTY;
    set_sprite_tile((uint8_t)(GAME_HUD_SPRITE_FIRST + 1 + i),
                    (uint8_t)(GAME_HUD_TILE_FIRST + tile));
    move_sprite(GAME_HUD_SPRITE_FIRST + 1 + i, 24 + i * 8, 16);
  }

  game_hud_draw_pair(GAME_HUD_TILE_LEVEL_VALUE, tens, ones);
  set_sprite_data((uint8_t)(GAME_HUD_TILE_FIRST + GAME_HUD_TILE_LEVEL_VALUE), 1,
                  &game_hud_tiles[GAME_HUD_TILE_LEVEL_VALUE * 16]);
  set_sprite_tile(GAME_HUD_SPRITE_FIRST,
                  (uint8_t)(GAME_HUD_TILE_FIRST + GAME_HUD_TILE_HEART));
  set_sprite_tile(GAME_HUD_SPRITE_FIRST + 8,
                  (uint8_t)(GAME_HUD_TILE_FIRST + GAME_HUD_TILE_LVL_LABEL));
  set_sprite_tile(GAME_HUD_SPRITE_FIRST + 9,
                  (uint8_t)(GAME_HUD_TILE_FIRST + GAME_HUD_TILE_LEVEL_VALUE));
  move_sprite(GAME_HUD_SPRITE_FIRST, 16, 16);
  move_sprite(GAME_HUD_SPRITE_FIRST + 8, 144, 16);
  move_sprite(GAME_HUD_SPRITE_FIRST + 9, 152, 16);

  uint8_t blank = GAME_HUD_BG_BLANK;
  for (i = 0; i < 20; ++i) {
    set_bkg_tiles(i, GAME_HUD_INFO_ROW_Y, 1, 1, &blank);
    set_bkg_tiles(i, GAME_HUD_INFO_ROW_Y + 1, 1, 1, &blank);
    set_bkg_tiles(i, GAME_HUD_INFO_ROW_Y + 2, 1, 1, &blank);
  }
}

static void game_hud_show_info(uint8_t health, uint8_t max_health, uint8_t level,
                               uint32_t xp_progress, uint32_t xp_required) {
  uint8_t i;
  game_hud_update(health, max_health, level);
  for (i = 0; i < GAME_HUD_SPRITE_COUNT; ++i)
    move_sprite(GAME_HUD_SPRITE_FIRST + i, 0, 0);

  uint8_t lvl_tile = (uint8_t)(GAME_HUD_TILE_FIRST + GAME_HUD_TILE_LVL_LABEL);
  uint8_t val_tile = (uint8_t)(GAME_HUD_TILE_FIRST + GAME_HUD_TILE_LEVEL_VALUE);
  set_bkg_tiles(9, GAME_HUD_INFO_ROW_Y, 1, 1, &lvl_tile);
  set_bkg_tiles(10, GAME_HUD_INFO_ROW_Y, 1, 1, &val_tile);

  if (level == PLAYER_LEVEL_CAP) {
    uint8_t m = (uint8_t)(GAME_HUD_TILE_FIRST + GAME_HUD_TILE_MAX_M);
    uint8_t a = (uint8_t)(GAME_HUD_TILE_FIRST + GAME_HUD_TILE_MAX_A);
    uint8_t x = (uint8_t)(GAME_HUD_TILE_FIRST + GAME_HUD_TILE_MAX_X);
    set_bkg_tiles(11, GAME_HUD_INFO_ROW_Y, 1, 1, &m);
    set_bkg_tiles(12, GAME_HUD_INFO_ROW_Y, 1, 1, &a);
    set_bkg_tiles(13, GAME_HUD_INFO_ROW_Y, 1, 1, &x);
  } else {
    game_hud_build_xp_tiles(xp_progress, xp_required);
    uint8_t xp_label = (uint8_t)(GAME_HUD_TILE_FIRST + GAME_HUD_TILE_XP_LABEL);
    uint8_t xp_cur0 = (uint8_t)(GAME_HUD_TILE_FIRST + GAME_HUD_TILE_XP_CURRENT);
    uint8_t xp_cur1 = (uint8_t)(GAME_HUD_TILE_FIRST + GAME_HUD_TILE_XP_CURRENT + 1);
    uint8_t xp_cur2 = (uint8_t)(GAME_HUD_TILE_FIRST + GAME_HUD_TILE_XP_CURRENT + 2);
    uint8_t xp_slash = (uint8_t)(GAME_HUD_TILE_FIRST + GAME_HUD_TILE_XP_SLASH);
    uint8_t xp_need0 = (uint8_t)(GAME_HUD_TILE_FIRST + GAME_HUD_TILE_XP_NEEDED);
    uint8_t xp_need1 = (uint8_t)(GAME_HUD_TILE_FIRST + GAME_HUD_TILE_XP_NEEDED + 1);
    uint8_t xp_need2 = (uint8_t)(GAME_HUD_TILE_FIRST + GAME_HUD_TILE_XP_NEEDED + 2);
    set_bkg_tiles(6, GAME_HUD_INFO_ROW_Y + 1, 1, 1, &xp_label);
    set_bkg_tiles(7, GAME_HUD_INFO_ROW_Y + 1, 1, 1, &xp_cur0);
    set_bkg_tiles(8, GAME_HUD_INFO_ROW_Y + 1, 1, 1, &xp_cur1);
    set_bkg_tiles(9, GAME_HUD_INFO_ROW_Y + 1, 1, 1, &xp_cur2);
    set_bkg_tiles(10, GAME_HUD_INFO_ROW_Y + 1, 1, 1, &xp_slash);
    set_bkg_tiles(11, GAME_HUD_INFO_ROW_Y + 1, 1, 1, &xp_need0);
    set_bkg_tiles(12, GAME_HUD_INFO_ROW_Y + 1, 1, 1, &xp_need1);
    set_bkg_tiles(13, GAME_HUD_INFO_ROW_Y + 1, 1, 1, &xp_need2);
  }

  uint8_t heart_tile = (uint8_t)(GAME_HUD_TILE_FIRST + GAME_HUD_TILE_HEART);
  set_bkg_tiles(6, GAME_HUD_INFO_ROW_Y + 2, 1, 1, &heart_tile);
  for (i = 0; i < 7; ++i) {
    uint8_t tile;
    if (i >= max_health)
      tile = (uint8_t)(GAME_HUD_TILE_FIRST + GAME_HUD_TILE_HEALTH_LOCKED);
    else if (i < health)
      tile = (uint8_t)(GAME_HUD_TILE_FIRST + GAME_HUD_TILE_HEALTH_FULL);
    else
      tile = (uint8_t)(GAME_HUD_TILE_FIRST + GAME_HUD_TILE_HEALTH_EMPTY);
    set_bkg_tiles(7 + i, GAME_HUD_INFO_ROW_Y + 2, 1, 1, &tile);
  }
}

static void game_hud_init(uint8_t health, uint8_t max_health, uint8_t level) {
  static const uint8_t heart_rows[8] = {0x00, 0x66, 0xFF, 0xFF, 0x7E, 0x3C, 0x18, 0x00};
  static const uint8_t lvl_rows[8]   = {0x96, 0x96, 0x96, 0x96, 0x96, 0x96, 0xCB, 0x00};
  static const uint8_t rows_x[5]     = {5, 5, 2, 5, 5};
  static const uint8_t rows_p[5]     = {7, 5, 7, 4, 4};
  static const uint8_t rows_m[5]     = {5, 7, 7, 5, 5};
  static const uint8_t rows_a[5]     = {2, 5, 7, 5, 5};
  uint8_t              i, x, y;
  uint16_t             t;

  for (t = 0; t < GAME_HUD_TILE_COUNT * 16u; ++t)
    game_hud_tiles[t] = 0;
  for (y = 0; y < 8; ++y)
    for (x = 0; x < 8; ++x)
      if (heart_rows[y] & (uint8_t)(0x80u >> x))
        game_hud_pixel(GAME_HUD_TILE_HEART, x, y, 3);

  game_hud_draw_health_segment(GAME_HUD_TILE_HEALTH_FULL, 0);
  game_hud_draw_health_segment(GAME_HUD_TILE_HEALTH_EMPTY, 1);
  game_hud_draw_health_segment(GAME_HUD_TILE_HEALTH_LOCKED, 2);
  for (y = 0; y < 8; ++y)
    for (x = 0; x < 8; ++x)
      if (lvl_rows[y] & (uint8_t)(0x80u >> x))
        game_hud_pixel(GAME_HUD_TILE_LVL_LABEL, x, y, 3);
  for (y = 0; y < 5; ++y) {
    for (x = 0; x < 3; ++x) {
      if (rows_x[y] & (uint8_t)(4u >> x))
        game_hud_pixel(GAME_HUD_TILE_XP_LABEL, x, y + 1, 3);
      if (rows_p[y] & (uint8_t)(4u >> x))
        game_hud_pixel(GAME_HUD_TILE_XP_LABEL, x + 4, y + 1, 3);
      if (rows_m[y] & (uint8_t)(4u >> x))
        game_hud_pixel(GAME_HUD_TILE_MAX_M, x + 1, y + 1, 3);
      if (rows_a[y] & (uint8_t)(4u >> x))
        game_hud_pixel(GAME_HUD_TILE_MAX_A, x + 1, y + 1, 3);
      if (rows_x[y] & (uint8_t)(4u >> x))
        game_hud_pixel(GAME_HUD_TILE_MAX_X, x + 1, y + 1, 3);
    }
  }
  set_bkg_data(GAME_HUD_TILE_FIRST, GAME_HUD_TILE_COUNT, game_hud_tiles);
  set_sprite_data(GAME_HUD_TILE_FIRST, GAME_HUD_TILE_COUNT, game_hud_tiles);
  for (i = 0; i < GAME_HUD_SPRITE_COUNT; ++i)
    set_sprite_prop(GAME_HUD_SPRITE_FIRST + i, 0);

  game_hud_update(health, max_health, level);
}

#endif
