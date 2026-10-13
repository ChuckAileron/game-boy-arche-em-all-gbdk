#include "../sprites/texts/text_box_sprite.h"
#include <gb/gb.h>
#include <stdint.h>

#ifndef TEXT_BOX_H
#define TEXT_BOX_H

// // Gráficos simples para una caja de texto
// const uint8_t text_box_tiles[] = {
//     0xFF, 0x81, 0x81, 0xFF, // Borde superior
//     0x81, 0x00, 0x00, 0x81, // Lado izquierdo y derecho
//     0xFF, 0x81, 0x81, 0xFF  // Borde inferior
// };

// Índices de los tiles en el arreglo
#define TILE_BORDER_TOP    0
#define TILE_BORDER_SIDE   1
#define TILE_BORDER_BOTTOM 2

// #########################################//
// #              ENCABEZADOS              #//
// #########################################//
void load_text_box_tiles(void);
void draw_text_box(void);

// #################################################################//
// #                  FUNCIONES DE CAJA DE TEXTO                   #//
// #################################################################//
//  Cargar los gráficos de la caja de texto en VRAM
//  void load_text_box_tiles(void) {
//    set_bkg_data(0, 1, text_box_left_top_corner_tile);     // Tile 0: Esquina superior izquierda
//    set_bkg_data(1, 1, text_box_left_edge_tile);           // Tile 1: Borde izquierdo
//    set_bkg_data(2, 1, text_box_left_bottom_corner_tile);  // Tile 2: Esquina inferior izquierda
//    set_bkg_data(3, 1, text_box_right_top_corner_tile);    // Tile 3: Esquina superior derecha
//    set_bkg_data(4, 1, text_box_right_edge_tile);          // Tile 4: Borde derecho
//    set_bkg_data(5, 1, text_box_right_bottom_corner_tile); // Tile 5: Esquina inferior derecha
//  }

// Función para dibujar la caja de texto
void draw_text_box(void) {
  uint8_t horizontal_edge_tile = 96; // Índice del tile en blanco (puedes cargarlo si no existe)
  uint8_t vertical_edge_tile   = 97; // Índice del tile en blanco (puedes cargarlo si no existe)
  uint8_t text_box_left_top_corner_tile =
      98; // Índice del tile en blanco (puedes cargarlo si no existe)
  uint8_t text_box_right_top_corner_tile =
      99; // Índice del tile en blanco (puedes cargarlo si no existe)
  uint8_t text_box_left_bottom_corner_tile =
      100; // Índice del tile en blanco (puedes cargarlo si no existe)
  uint8_t text_box_right_bottom_corner_tile =
      101; // Índice del tile en blanco (puedes cargarlo si no existe)

  // Tamaño de la caja en tiles
  uint8_t box_width  = 20; // Ancho de la caja (en tiles)
  uint8_t box_height = 8;  // Alto de la caja (en tiles)

  // Posición inicial de la caja (esquina superior izquierda)
  uint8_t x_box = 0;  // Columna de inicio
  uint8_t y_box = 10; // Fila de inicio

  // Esquinas
  set_bkg_tiles(x_box, y_box, 1, 1, &text_box_left_top_corner_tile); // Esquina superior izquierda
  set_bkg_tiles(x_box, y_box + box_height - 1, 1, 1,
                &text_box_left_bottom_corner_tile); // Esquina inferior izquierda
  set_bkg_tiles(x_box + box_width - 1, y_box, 1, 1,
                &text_box_right_top_corner_tile); // Esquina superior derecha
  set_bkg_tiles(x_box + box_width - 1, y_box + box_height - 1, 1, 1,
                &text_box_right_bottom_corner_tile); // Esquina inferior derecha

  // Bordes horizontales
  for (uint8_t i = 1; i < box_width - 1; i++) {
    set_bkg_tiles(x_box + i, y_box, 1, 1, &horizontal_edge_tile);                  // Borde superior
    set_bkg_tiles(x_box + i, y_box + box_height - 1, 1, 1, &horizontal_edge_tile); // Borde inferior
  }

  // Bordes verticales
  for (uint8_t j = 1; j < box_height - 1; j++) {
    set_bkg_tiles(x_box, y_box + j, 1, 1, &vertical_edge_tile);                 // Borde izquierdo
    set_bkg_tiles(x_box + box_width - 1, y_box + j, 1, 1, &vertical_edge_tile); // Borde derecho
  }

  // Interior de la caja (rellenar con un tile en blanco)
  uint8_t blank_tile = 0; // Índice del tile en blanco
  for (uint8_t j = 1; j < box_height - 1; j++) {
    for (uint8_t i = 1; i < box_width - 1; i++) {
      set_bkg_tiles(x_box + i, y_box + j, 1, 1, &blank_tile);
    }
  }
}

#endif // TEXT_BOX_H
