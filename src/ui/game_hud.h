#ifndef GAME_HUD_H
#define GAME_HUD_H

#include <gb/gb.h>
#include <stdint.h>
#include "../player_progress.h"

#define GAME_HUD_OAM_FIRST    0
#define GAME_HUD_SPRITE_COUNT 18
#define GAME_HUD_TILE_FIRST   200
#define GAME_HUD_TILE_COUNT   17

#define GAME_HUD_HEART_SPRITE 0
#define GAME_HUD_HEALTH_FIRST 1
#define GAME_HUD_LEVEL_N      8
#define GAME_HUD_LEVEL_V      9
#define GAME_HUD_LEVEL_TENS   10
#define GAME_HUD_LEVEL_ONES   11
#define GAME_HUD_XP_FIRST     12

#define GAME_HUD_TILE_HEART          0
#define GAME_HUD_TILE_HEALTH_FULL    1
#define GAME_HUD_TILE_HEALTH_EMPTY   2
#define GAME_HUD_TILE_HEALTH_LOCKED  3
#define GAME_HUD_TILE_LVL_LABEL      4
#define GAME_HUD_TILE_LEVEL_VALUE    5
#define GAME_HUD_TILE_XP_LABEL       6
#define GAME_HUD_TILE_XP_CURRENT     7 /* tiles 7..9 */
#define GAME_HUD_TILE_XP_SLASH       10
#define GAME_HUD_TILE_XP_NEEDED      11 /* tiles 11..13 */
#define GAME_HUD_TILE_MAX_M          14
#define GAME_HUD_TILE_MAX_A          15
#define GAME_HUD_TILE_MAX_X          16

static uint8_t game_hud_tiles[GAME_HUD_TILE_COUNT * 16];

/* Digitos de 4x7 pixels (mas grandes y legibles que los 3x5 anteriores). */
static const uint8_t game_hud_big_digits[10][7] = {
    {0x6, 0x9, 0x9, 0x9, 0x9, 0x9, 0x6}, /* 0 */
    {0x2, 0x6, 0x2, 0x2, 0x2, 0x2, 0x7}, /* 1 */
    {0x6, 0x9, 0x1, 0x2, 0x4, 0x8, 0xF}, /* 2 */
    {0xE, 0x1, 0x1, 0x6, 0x1, 0x1, 0xE}, /* 3 */
    {0x9, 0x9, 0x9, 0xF, 0x1, 0x1, 0x1}, /* 4 */
    {0xF, 0x8, 0x8, 0xE, 0x1, 0x1, 0xE}, /* 5 */
    {0x6, 0x8, 0x8, 0xE, 0x9, 0x9, 0x6}, /* 6 */
    {0xF, 0x1, 0x2, 0x2, 0x4, 0x4, 0x4}, /* 7 */
    {0x6, 0x9, 0x9, 0x6, 0x9, 0x9, 0x6}, /* 8 */
    {0x6, 0x9, 0x9, 0x7, 0x1, 0x1, 0x6}, /* 9 */
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
  if (style == 1)
    return; /* Lost health slots are fully transparent. */
  for (y = 0; y < 8; ++y) {
    for (x = 0; x < 8; ++x) {
      uint8_t color = 0;
      if (style == 0)
        color = 3;
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
  set_sprite_data((uint8_t)(GAME_HUD_TILE_FIRST + GAME_HUD_TILE_XP_CURRENT), 7,
                  &game_hud_tiles[GAME_HUD_TILE_XP_CURRENT * 16]);
}

static void game_hud_update(uint8_t health, uint8_t max_health, uint8_t level) {
  uint8_t i;
  uint8_t tens = level / 10u;
  uint8_t ones = level % 10u;

  for (i = 0; i < 7; ++i) {
    uint8_t tile = i >= max_health ? GAME_HUD_TILE_HEALTH_LOCKED
                   : i < health    ? GAME_HUD_TILE_HEALTH_FULL
                                   : GAME_HUD_TILE_HEALTH_EMPTY;
    set_sprite_tile(GAME_HUD_HEALTH_FIRST + i, GAME_HUD_TILE_FIRST + tile);
  }

  game_hud_draw_pair(GAME_HUD_TILE_LEVEL_VALUE, tens, ones);
  set_sprite_data((uint8_t)(GAME_HUD_TILE_FIRST + GAME_HUD_TILE_LEVEL_VALUE), 1,
                  &game_hud_tiles[GAME_HUD_TILE_LEVEL_VALUE * 16]);

  for (i = GAME_HUD_LEVEL_TENS; i < GAME_HUD_SPRITE_COUNT; ++i)
    move_sprite(i, 0, 0);

  set_sprite_tile(GAME_HUD_HEART_SPRITE, (uint8_t)(GAME_HUD_TILE_FIRST + GAME_HUD_TILE_HEART));
  set_sprite_tile(GAME_HUD_LEVEL_N, (uint8_t)(GAME_HUD_TILE_FIRST + GAME_HUD_TILE_LVL_LABEL));
  set_sprite_tile(GAME_HUD_LEVEL_V, (uint8_t)(GAME_HUD_TILE_FIRST + GAME_HUD_TILE_LEVEL_VALUE));
  move_sprite(GAME_HUD_HEART_SPRITE, 16, 16);
  move_sprite(GAME_HUD_LEVEL_N, 144, 16);
  move_sprite(GAME_HUD_LEVEL_V, 152, 16);
  for (i = 0; i < 7; ++i)
    move_sprite(GAME_HUD_HEALTH_FIRST + i, 24 + i * 8, 16);
}

static void game_hud_show_info(uint8_t health, uint8_t max_health, uint8_t level,
                               uint32_t xp_progress, uint32_t xp_required) {
  uint8_t i;
  game_hud_update(health, max_health, level);

  set_sprite_tile(0, (uint8_t)(GAME_HUD_TILE_FIRST + GAME_HUD_TILE_LVL_LABEL));
  set_sprite_tile(1, (uint8_t)(GAME_HUD_TILE_FIRST + GAME_HUD_TILE_LEVEL_VALUE));
  if (level == PLAYER_LEVEL_CAP) {
    move_sprite(0, 60, 48);
    move_sprite(1, 68, 48);
    set_sprite_tile(2, (uint8_t)(GAME_HUD_TILE_FIRST + GAME_HUD_TILE_MAX_M));
    set_sprite_tile(3, (uint8_t)(GAME_HUD_TILE_FIRST + GAME_HUD_TILE_MAX_A));
    set_sprite_tile(4, (uint8_t)(GAME_HUD_TILE_FIRST + GAME_HUD_TILE_MAX_X));
    move_sprite(2, 76, 48);
    move_sprite(3, 84, 48);
    move_sprite(4, 92, 48);
    for (i = 5; i < 8; ++i)
      move_sprite(i, 0, 0);
    move_sprite(16, 0, 0);
    move_sprite(17, 0, 0);
  } else {
    game_hud_build_xp_tiles(xp_progress, xp_required);
    move_sprite(0, 72, 48);
    move_sprite(1, 80, 48);
    set_sprite_tile(2, (uint8_t)(GAME_HUD_TILE_FIRST + GAME_HUD_TILE_XP_LABEL));
    set_sprite_tile(3, (uint8_t)(GAME_HUD_TILE_FIRST + GAME_HUD_TILE_XP_CURRENT + 0));
    set_sprite_tile(4, (uint8_t)(GAME_HUD_TILE_FIRST + GAME_HUD_TILE_XP_CURRENT + 1));
    set_sprite_tile(5, (uint8_t)(GAME_HUD_TILE_FIRST + GAME_HUD_TILE_XP_CURRENT + 2));
    set_sprite_tile(6, (uint8_t)(GAME_HUD_TILE_FIRST + GAME_HUD_TILE_XP_SLASH));
    set_sprite_tile(7, (uint8_t)(GAME_HUD_TILE_FIRST + GAME_HUD_TILE_XP_NEEDED + 0));
    set_sprite_tile(16, (uint8_t)(GAME_HUD_TILE_FIRST + GAME_HUD_TILE_XP_NEEDED + 1));
    set_sprite_tile(17, (uint8_t)(GAME_HUD_TILE_FIRST + GAME_HUD_TILE_XP_NEEDED + 2));
    move_sprite(2, 48, 64);
    move_sprite(3, 56, 64);
    move_sprite(4, 64, 64);
    move_sprite(5, 72, 64);
    move_sprite(6, 80, 64);
    move_sprite(7, 88, 64);
    move_sprite(16, 96, 64);
    move_sprite(17, 104, 64);
  }
  set_sprite_tile(8, (uint8_t)(GAME_HUD_TILE_FIRST + GAME_HUD_TILE_HEART));
  move_sprite(8, 48, 80);
  for (i = 0; i < 7; ++i) {
    uint8_t tile = i >= max_health ? GAME_HUD_TILE_HEALTH_LOCKED
                   : i < health    ? GAME_HUD_TILE_HEALTH_FULL
                                   : GAME_HUD_TILE_HEALTH_EMPTY;
    set_sprite_tile(9 + i, (uint8_t)(GAME_HUD_TILE_FIRST + tile));
    move_sprite(9 + i, 56 + i * 8, 80);
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
  set_sprite_data(GAME_HUD_TILE_FIRST, GAME_HUD_TILE_COUNT, game_hud_tiles);

  for (i = 0; i < GAME_HUD_SPRITE_COUNT; ++i)
    set_sprite_prop(GAME_HUD_OAM_FIRST + i, 0);
  set_sprite_tile(GAME_HUD_HEART_SPRITE, (uint8_t)(GAME_HUD_TILE_FIRST + GAME_HUD_TILE_HEART));
  set_sprite_tile(GAME_HUD_LEVEL_N, (uint8_t)(GAME_HUD_TILE_FIRST + GAME_HUD_TILE_LVL_LABEL));
  set_sprite_tile(GAME_HUD_LEVEL_V, (uint8_t)(GAME_HUD_TILE_FIRST + GAME_HUD_TILE_LEVEL_VALUE));
  for (i = 0; i < 7; ++i)
    move_sprite(GAME_HUD_HEALTH_FIRST + i, 24 + i * 8, 16);
  move_sprite(GAME_HUD_HEART_SPRITE, 16, 16);
  move_sprite(GAME_HUD_LEVEL_N, 144, 16);
  move_sprite(GAME_HUD_LEVEL_V, 152, 16);
  game_hud_update(health, max_health, level);
}

#endif
