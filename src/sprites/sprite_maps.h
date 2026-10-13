#ifndef SPRITE_MAPS_H
#define SPRITE_MAPS_H

// #########################################//
// #                  MAPS                 #//
// #########################################//
//  Mapeo de posiciones para 16x16 tiles
const int8_t row1_offsets[4][2] = {{0, 0}, {8, 0}, {16, 0}, {24, 0}}; // Sprite superior
const int8_t row2_offsets[4][2] = {{0, 8}, {8, 8}, {16, 8}, {24, 8}}; // Sprite inferior

const int8_t map_4_tiles_offsets[4][2] = {{0, 0}, {8, 0}, {0, 8}, {8, 8}};

const int8_t map_16_x_16_offsets[8][2] = {{0, 0},  {8, 0},  {0, 8},  {8, 8},
                                          {16, 0}, {16, 8}, {24, 0}, {24, 8}};

// Mapeo de posiciones para 32x32 tiles
const int8_t map_32_x_32_offsets[16][2] = {
    {0, 0},   // Sprite 0
    {0, 8},   // Sprite 1
    {8, 0},   // Sprite 2
    {8, 8},   // Sprite 3
    {0, 16},  // Sprite 4
    {0, 24},  // Sprite 5
    {8, 16},  // Sprite 6
    {8, 24},  // Sprite 7
    {16, 0},  // Sprite 8
    {16, 8},  // Sprite 9
    {24, 0},  // Sprite 10
    {24, 8},  // Sprite 11
    {16, 16}, // Sprite 12
    {16, 24}, // Sprite 13
    {24, 16}, // Sprite 14
    {24, 24}  // Sprite 15
};

// Mapeo de posiciones para un sprite de 48x48 píxeles
const int8_t map_48_x_48_offsets[36][2] = {
    {0, 0},  {8, 0},  {16, 0},  {24, 0},  {32, 0},  {40, 0},  // Fila 1
    {0, 8},  {8, 8},  {16, 8},  {24, 8},  {32, 8},  {40, 8},  // Fila 2
    {0, 16}, {8, 16}, {16, 16}, {24, 16}, {32, 16}, {40, 16}, // Fila 3
    {0, 24}, {8, 24}, {16, 24}, {24, 24}, {32, 24}, {40, 24}, // Fila 4
    {0, 32}, {8, 32}, {16, 32}, {24, 32}, {32, 32}, {40, 32}, // Fila 5
    {0, 40}, {8, 40}, {16, 40}, {24, 40}, {32, 40}, {40, 40}  // Fila 6
};

// Mapa de posiciones para 144x16 tiles
const int8_t map_144_x_16_offsets[20][2] = {{0, 1},   {2, 3},   {4, 5},   {6, 7},   {8, 9},
                                            {10, 11}, {12, 13}, {14, 15}, {16, 17}, {18, 19},
                                            {20, 21}, {22, 23}, {24, 25}, {26, 27}, {28, 29},
                                            {30, 31}, {32, 33}, {34, 35}, {36, 37}, {38, 39}};
// Aplanar el mapa de 144x16 tiles en una sola dimensión
const unsigned char map_144_x_16_offsets_flat[40] = {
    0,  1,  2,  3,  4,  5,  6,  7,  8,  9,  10, 11, 12, 13, 14, 15, 16, 17, 18, 19,
    20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39};

// Mapa de posiciones para sprite de PRESS START de 80x16 tiles
// const int8_t press_start_offsets[20][2] = {
//   {  0,  0 }, {  8,  0 }, { 16,  0 }, { 24,  0 }, { 32,  0 },
//   { 40,  0 }, { 48,  0 }, { 56,  0 }, { 64,  0 }, { 72,  0 },
//   {  0,  8 }, {  8,  8 }, { 16,  8 }, { 24,  8 }, { 32,  8 },
//   { 40,  8 }, { 48,  8 }, { 56,  8 }, { 64,  8 }, { 72,  8 }
// };

// Arreglo de posiciones para los sprites del texto "PRESS START" (88x16 píxeles, 22 tiles)
const int8_t press_start_offsets[22][2] = {{0, 0},  {8, 0},  {16, 0}, {24, 0}, {32, 0}, {40, 0},
                                           {48, 0}, {56, 0}, {64, 0}, {72, 0}, {80, 0}, {0, 8},
                                           {8, 8},  {16, 8}, {24, 8}, {32, 8}, {40, 8}, {48, 8},
                                           {56, 8}, {64, 8}, {72, 8}, {80, 8}};

#endif // SPRITE_MAPS_H
