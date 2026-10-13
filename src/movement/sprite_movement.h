#ifndef SPRITE_MOVEMENT_H
#define SPRITE_MOVEMENT_H

// #########################################//
// #              ENCABEZADOS              #//
// #########################################//
//  void move_16_x_16_sprite(uint8_t base_sprite_id, uint8_t pos_x, uint8_t pos_y);
//  void move_16_x_16_sprite(uint8_t base_sprite_id, uint8_t player_x, uint8_t player_y);
void move_16_x_16_sprite(uint8_t base_sprite_id, uint8_t *player_x, uint8_t *player_y);
// void move_row(UINT8 base_sprite_id, const INT8 offsets[][2], UINT8 x, UINT8 y, UINT8 num_tiles);
// void move_metasprite_custom(UINT8 x, UINT8 y);

// #################################################################//
// #               FUNCIONES DE MOVIMIENTO DE SPRITES              #//
// #################################################################//
//  // Función para actualizar la posición del sprite de 16x16
//  void move_16_x_16_sprite(uint8_t base_sprite_id, uint8_t pos_x, uint8_t pos_y) {
//    for (uint8_t i = 0; i < 4; i++) {
//      uint8_t sprite_id = base_sprite_id + i;
//      move_sprite(sprite_id, pos_x + map_4_tiles_offsets[i][0], pos_y +
//      map_4_tiles_offsets[i][1]);
//    }
//  }

// // Función para mover el personaje basado en las coordenadas globales player_x y player_y
// void move_16_x_16_sprite(uint8_t base_sprite_id, uint8_t player_x, uint8_t player_y) {
//   // Limitar las coordenadas para mantener al personaje dentro de la pantalla
//   if (player_x < 8) player_x = 8;             // Límite izquierdo
//   if (player_x > 160 - 8) player_x = 160 - 8; // Límite derecho
//   if (player_y < 16) player_y = 16;           // Límite superior
//   if (player_y > 144) player_y = 144; // Límite inferior

//   // Actualizar las posiciones de los 4 sprites que forman el personaje
//   for (uint8_t i = 0; i < 4; i++) {
//     uint8_t sprite_id = base_sprite_id + i;
//     move_sprite(sprite_id, player_x + map_4_tiles_offsets[i][0], player_y +
//     map_4_tiles_offsets[i][1]);
//   }
// }

void move_16_x_16_sprite(uint8_t base_sprite_id, uint8_t *player_x, uint8_t *player_y) {
  // Lee la entrada del jugador
  uint8_t input = joypad();

  // Movimiento horizontal
  if ((input & J_LEFT) && *player_x > 0) {
    *player_x -= 2; // Mueve hacia la izquierda
  } else if ((input & J_RIGHT) && *player_x < (160)) {
    *player_x += 2; // Mueve hacia la derecha
  }

  // Movimiento vertical
  if ((input & J_UP) && *player_y > 0) {
    *player_y -= 2; // Mueve hacia arriba
  } else if ((input & J_DOWN) && *player_y < (144)) {
    *player_y += 2; // Mueve hacia abajo
  }

  // Validar límites después del movimiento para evitar reaparecer
  if (*player_x <= 8) {
    *player_x = 8; // Mantén en el borde izquierdo
  } else if (*player_x >= (153)) {
    *player_x = 153; // Mantén en el borde derecho
  }

  if (*player_y <= 16) {
    *player_y = 16; // Mantén en el borde superior
  } else if (*player_y >= (144)) {
    *player_y = 144; // Mantén en el borde inferior
  }

  // Actualiza la posición del sprite en pantalla
  for (uint8_t i = 0; i < 4; i++) {
    uint8_t sprite_id = base_sprite_id + i;
    move_sprite(sprite_id, *player_x + map_4_tiles_offsets[i][0],
                *player_y + map_4_tiles_offsets[i][1]);
  }
}

// // Mueve una fila
// void move_row(uint8_t base_sprite_id, const int8_t offsets[][2], uint8_t x, uint8_t y, uint8_t
// num_tiles) {
//   for (uint8_t i = 0; i < num_tiles; i++) {
//     uint8_t sprite_id = base_sprite_id + i;
//     move_sprite(sprite_id, x + offsets[i][0], y + offsets[i][1]);
//   }
// }

// // Función para mover el metasprite (solo fila superior)
// void move_metasprite_custom(uint8_t x, uint8_t y) {
//   move_row(0, row1_offsets, x, y, 2); // Sprite superior
//   move_row(2, row2_offsets, x, y, 2); // Sprite inferior
// }

// // Función para mover el metasprite completo de 16x16
// void move_16x16_sprite(uint8_t base_sprite_id, const int8_t offsets[][2], uint8_t x, uint8_t y) {
//   for (uint8_t i = 0; i < 4; i++) { // 4 tiles en el metasprite 16x16
//     uint8_t sprite_id = base_sprite_id + i;
//     move_sprite(sprite_id, x + offsets[i][0], y + offsets[i][1]);
//   }
// }

#endif // SPRITE_MOVEMENT_H
