#include "./arche/arche_big_sprites.h"
#include "./arche/arche_small_sprites.h"
#include "./clean.h"
#include "./effects/small_effect_sprites.h"
#include "./sprite_ids.h"
#include "./sprite_maps.h"

#ifndef SPRITE_GENERATE_H
#define SPRITE_GENERATE_H

// #########################################//
// #              ENCABEZADOS              #//
// #########################################//
void load_16_x_16_sprite(uint8_t sprite_index, const uint8_t character_sprite[],
                         uint8_t character_x, uint8_t character_y);
void load_16_x_16_sprite_at(uint8_t sprite_index, uint8_t tile_index,
                            const uint8_t character_sprite[], uint8_t character_x,
                            uint8_t character_y);
void load_48_x_48_sprite(uint8_t sprite_index, const uint8_t *character_sprite, uint8_t character_x,
                         uint8_t character_y);
void init_row(uint8_t base_sprite_id, const int8_t offsets[][2], uint8_t tile_start_index,
              uint8_t x, uint8_t y, uint8_t num_tiles);
void init_start_metasprite(uint8_t base_x, uint8_t base_y);
void render_static_metasprite(uint8_t base_x, uint8_t base_y);
void init_metasprite(uint8_t x, uint8_t y);
void init_single_bullet(void);
void init_spread_bullets(void);

// #################################################################//
// #               FUNCIONES DE GENERACION DE SPRITES              #//
// #################################################################//
//  Función para cargar gráficos de 16x16 pixeles (4 tiles)
void load_16_x_16_sprite(uint8_t sprite_index, const uint8_t *character_sprite, uint8_t character_x,
                         uint8_t character_y) {
  load_16_x_16_sprite_at(sprite_index, sprite_index, character_sprite, character_x, character_y);
}

void load_16_x_16_sprite_at(uint8_t sprite_index, uint8_t tile_index,
                            const uint8_t *character_sprite, uint8_t character_x,
                            uint8_t character_y) {
  set_sprite_data(tile_index, 4, character_sprite);

  // Configurar cada tile del metasprite
  for (uint8_t i = 0; i < 4; i++) {
    set_sprite_tile(sprite_index + i, tile_index + i);
    move_sprite(sprite_index + i, character_x + map_4_tiles_offsets[i][0],
                character_y + map_4_tiles_offsets[i][1]); // Posición del tile
  }
}

// Función para cargar gráficos de 48x48 pixeles (36 tiles)
void load_48_x_48_sprite(uint8_t sprite_index, const uint8_t *character_sprite, uint8_t character_x,
                         uint8_t character_y) {
  set_sprite_data(sprite_index, 36, character_sprite); // Carga los datos de los tiles en VRAM

  // Configurar cada tile del metasprite
  for (uint8_t i = 0; i < 36; i++) {
    set_sprite_tile(sprite_index + i, sprite_index + i); // Asigna el tile en VRAM
    move_sprite(sprite_index + i, character_x + map_48_x_48_offsets[i][0],
                character_y + map_48_x_48_offsets[i][1]); // Posición del tile
  }
}

// Inicializa una fila
void init_row(uint8_t base_sprite_id, const int8_t offsets[][2], uint8_t tile_start_index,
              uint8_t x, uint8_t y, uint8_t num_tiles) {
  for (uint8_t i = 0; i < num_tiles; i++) {
    uint8_t sprite_id = base_sprite_id + i;
    set_sprite_tile(sprite_id, tile_start_index + i);             // Asigna el gráfico correcto
    move_sprite(sprite_id, x + offsets[i][0], y + offsets[i][1]); // Posiciona el sprite
  }
}

// Inicializa el metasprite en la pantalla
void init_start_metasprite(uint8_t base_x, uint8_t base_y) {
  set_sprite_data(0, 16, arche_32x32_normal_sprite); // Carga los 16 tiles en VRAM

  // Renderiza cada sprite usando los offsets
  for (uint8_t i = 0; i < 16; i++) {
    set_sprite_tile(i, i); // Asigna el tile al sprite
    move_sprite(i, base_x + map_32_x_32_offsets[i][0], base_y + map_32_x_32_offsets[i][1]);
  }
}

// TEST de renderizado estatico de metasprite Arche START SCREEN
void render_static_metasprite(uint8_t base_x, uint8_t base_y) {
  set_sprite_data(0, 16, arche_32x32_normal_sprite); // Carga los 16 tiles en VRAM

  // Renderizar manualmente cada sprite
  set_sprite_tile(0, 0); // Tile 0
  move_sprite(0, base_x, base_y);

  set_sprite_tile(1, 1); // Tile 1
  move_sprite(1, base_x, base_y + 8);

  set_sprite_tile(2, 2); // Tile 2
  move_sprite(2, base_x + 8, base_y);

  set_sprite_tile(3, 3); // Tile 3
  move_sprite(3, base_x + 8, base_y + 8);

  set_sprite_tile(4, 4); // Tile 4
  move_sprite(4, base_x, base_y + 16);

  set_sprite_tile(5, 5); // Tile 5
  move_sprite(5, base_x, base_y + 24);

  set_sprite_tile(6, 6); // Tile 6
  move_sprite(6, base_x + 8, base_y + 16);

  set_sprite_tile(7, 7); // Tile 7
  move_sprite(7, base_x + 8, base_y + 24);

  set_sprite_tile(8, 8); // Tile 8
  move_sprite(8, base_x + 16, base_y);

  set_sprite_tile(9, 9); // Tile 9
  move_sprite(9, base_x + 16, base_y + 8);

  set_sprite_tile(10, 10); // Tile 10
  move_sprite(10, base_x + 24, base_y);

  set_sprite_tile(11, 11); // Tile 11
  move_sprite(11, base_x + 24, base_y + 8);

  set_sprite_tile(12, 12); // Tile 12
  move_sprite(12, base_x + 16, base_y + 16);

  set_sprite_tile(13, 13); // Tile 13
  move_sprite(13, base_x + 16, base_y + 24);

  set_sprite_tile(14, 14); // Tile 14
  move_sprite(14, base_x + 24, base_y + 16);

  set_sprite_tile(15, 15); // Tile 15
  move_sprite(15, base_x + 24, base_y + 24);
}

// Inicializa el metasprite de Arche (2 filas)
void init_metasprite(uint8_t x, uint8_t y) {
  set_sprite_data(0, 4, arche_sprite_tiles); // Cargar los datos gráficos en VRAM
  init_row(0, row1_offsets, 0, x, y, 4);     // Inicializa la fila superior (sprites 0-3, tiles 0-3)
  init_row(4, row2_offsets, 4, x, y, 4);     // Inicializa la fila inferior (sprites 4-7, tiles 4-7)
  hide_unused_sprites(4);                    // Ocultar sprites no usados (a partir del ID 4)
}

// Inicializa el sprite de bala
void init_single_bullet(void) {
  set_sprite_data(BULLET_TILE_FIRST, 1, bullet_tile);
  set_sprite_tile(BULLET_SINGLE_SPRITE, BULLET_TILE_FIRST);
  move_sprite(BULLET_SINGLE_SPRITE, 0, 0);
}

// Inicializa las balas
void init_spread_bullets(void) {
  set_sprite_data(BULLET_TILE_FIRST, 1, bullet_tile);

  // Oculta los tres sprites de las balas
  for (uint8_t i = 0; i < 3; i++) {
    set_sprite_tile(BULLET_SPRITE_FIRST + i, BULLET_TILE_FIRST);
    move_sprite(BULLET_SPRITE_FIRST + i, 0, 0);
  }
}

#endif // SPRITE_GENERATE_H
