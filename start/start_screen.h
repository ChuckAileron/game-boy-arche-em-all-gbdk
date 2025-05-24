#include <gb/cgb.h>
#include "../sprites/clean.h"
#include "../animations/arche_big.h"
#include "../sprites/title_screen/start_screen_sprites.h"
#include "../sprites/texts/press_start_sprites.h"

#ifndef START_SCREEN_H
#define START_SCREEN_H

// Define el índice inicial de los sprites en VRAM
#define PRESS_START_SPRITE_INDEX 0

// Tamaño del texto "PRESS START" en términos de sprites
#define PRESS_START_SPRITE_COUNT 20 // 20 sprites de 8x8

// Arreglos para almacenar posiciones de sprites
uint8_t sprite_x_positions[PRESS_START_SPRITE_COUNT];
uint8_t sprite_y_positions[PRESS_START_SPRITE_COUNT];


//#########################################//
//#              ENCABEZADOS              #//
//#########################################//
void clear_background(void);
void draw_press_start_sprite(void);
void toggle_press_start_visibility(uint8_t visible);
void load_128x128_full_screen(const uint8_t *full_screen_sprite, int8_t center, int8_t isTitleScreen);
void show_start_screen(void);

void prueba_full_screen_subset(const uint8_t *full_screen_sprite);

//#################################################################//
//#                FUNCIONES DE PANTALLA DE INICIO                #//
//#################################################################//
void clear_background(void) {
  const uint8_t white_tile[16] = {
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
  };

  // Cargar un tile blanco en el índice 0 de VRAM
  set_bkg_data(0, 1, white_tile);

  // Crear un arreglo temporal para representar una sección de la pantalla con tiles vacíos
  uint8_t empty_screen[256];
  for (uint16_t i = 0; i < 256; i++) {
    empty_screen[i] = 0; // Todo el fondo se llena con el tile vacío (índice 0)
  }

  // Rellenar toda la pantalla con el tile blanco
  set_bkg_tiles(0, 0, 160, 144, empty_screen);
}


// // Función para dibujar y posicionar "PRESS START"
// void draw_press_start_sprite(void) {
//   // Carga los datos de los gráficos en VRAM
//   set_sprite_data(PRESS_START_SPRITE_INDEX, PRESS_START_SPRITE_COUNT, press_start_tiles);

//   // Calcula la posición para centrar y alinear el texto con el borde inferior
//   int8_t start_x = (160 - (10 * 8)) / 2; // Centrado horizontalmente (10 sprites de ancho)
//   int8_t start_y = 144 - 16;            // Justo encima del borde inferior

//   // Posiciona cada sprite y almacena sus coordenadas
//   for (uint8_t i = 0; i < PRESS_START_SPRITE_COUNT; i++) {
//     int8_t sprite_x = start_x + (i % 10) * 8; // 10 columnas (texto de 20 sprites en 2 filas)
//     int8_t sprite_y = start_y + (i / 10) * 8; // Mueve a la siguiente fila cada 10 sprites

//     sprite_x_positions[i] = sprite_x; // Almacena posición X
//     sprite_y_positions[i] = sprite_y; // Almacena posición Y

//     set_sprite_tile(i, PRESS_START_SPRITE_INDEX + i); // Asigna el tile al sprite
//     move_sprite(i, sprite_x + 8, sprite_y + 16);     // Mueve a la posición inicial
//   }
// }

// // Función para dibujar y posicionar "PRESS START" centrado en la parte superior
// void draw_press_start_sprite(void) {
//   // Carga los datos de los gráficos en VRAM
//   // set_sprite_data(0, 32, press_start_tiles);
//   set_sprite_data(0, 32, press_start_80x16_tiles);

//   // Calcula la posición para centrar el texto en la parte superior
//   int8_t start_x = (160 - (16 * 8)) / 2; // Centrado horizontalmente (16 sprites de ancho)
//   int8_t start_y = 0;                    // Justo en la parte superior de la pantalla

//   // // Posiciona cada sprite y almacena sus coordenadas
//   // for (uint8_t i = 0; i < 32; i++) {
//   //   int8_t sprite_x = start_x + (i % 16) * 8; // 16 columnas (texto de 16 sprites en una fila)
//   //   int8_t sprite_y = start_y + (i / 16) * 8; // Mueve a la siguiente fila si es necesario (1 fila aquí)

//   //   sprite_x_positions[i] = sprite_x; // Almacena posición X
//   //   sprite_y_positions[i] = sprite_y; // Almacena posición Y

//   //   set_sprite_tile(i, i);                        // Asigna el tile al sprite
//   //   move_sprite(i, sprite_x + 8, sprite_y + 16);  // Mueve a la posición inicial
//   //   set_sprite_prop(i, 0);                        // Limpia cualquier atributo que los ponga detrás del fondo
//   // }
//   // // Activa las capas necesarias
//   // SHOW_SPRITES;  // Muestra los sprites en la pantalla

//      // Iterar sobre los 16 sprites necesarios (128x16 píxeles)
//     for (uint8_t i = 0; i < 32; i++) {
//         uint8_t sprite_x = start_x + (i % 16) * 8; // Incremento horizontal (16 sprites por fila)
//         uint8_t sprite_y = start_y;               // Todos en la misma fila superior

//         set_sprite_tile(i, i); // Asigna el tile correspondiente
//         move_sprite(i, sprite_x, sprite_y); // Posicionar sprite
//         set_sprite_prop(i, 0); // Asegura que los sprites estén visibles
//     }

//     SHOW_SPRITES; // Habilitar visibilidad de sprites
// }


// Función para dibujar y posicionar "PRESS START" (80x16 píxeles)
void draw_press_start_sprite(void) {
  // Cargar los datos de los gráficos en VRAM
  set_sprite_data(0, 16, press_start_64x16_tiles);

  // Coordenadas iniciales para centrar el texto
  int8_t start_x = (160 - 64) / 2; // Centrado horizontalmente (64 píxeles de ancho)
  int8_t start_y = 0;             // Posición en la parte superior

  // Iterar sobre los 20 tiles que conforman el sprite (80x16 = 20 tiles de 8x8 píxeles)
  for (uint8_t i = 0; i < 16; i++) {
    uint8_t sprite_x = start_x + (i % 8) * 8; // 8 columnas (64 píxeles de ancho)
    // uint8_t sprite_y = start_y + (i / 8) * 8; // Avanzar una fila cada 8 sprites
    uint8_t sprite_y = start_y + ((i & 0xF8) >> 3) * 8;     // Avanza a la fila siguiente después de 8 sprites

    set_sprite_tile(i, i);                  // Asigna el tile correspondiente
    move_sprite(i, sprite_x + 6, sprite_y); // Posiciona el sprite con 6 pixeles extra en x para mejor centrado
    // move_sprite(i, sprite_x + 8, sprite_y + 16); // Posiciona el sprite
    set_sprite_prop(i, 0);                  // Asegura que los sprites sean visibles
  }
  
  SHOW_SPRITES; // Asegura que los sprites sean visibles
}

// // Función para alternar la visibilidad de los sprites
// void toggle_press_start_visibility(uint8_t visible) {
//   // Coordenadas iniciales para centrar el texto
//   int8_t start_x = (160 - 64) / 2; // Centrado horizontalmente (88 píxeles de ancho)
//   int8_t start_y = 0;             // Posición en la parte superior

//   for (uint8_t i = 0; i < 16; i++) {
//     if (visible) {
//       move_sprite(i, start_x + 8, start_y + 16); // Reposiciona en su lugar
//     }
//     else {
//       move_sprite(i, 0, 0); // Mueve fuera de la pantalla
//     }
//   }
// }

// Función para alternar la visibilidad de los sprites
void toggle_press_start_visibility(uint8_t visible) {
  // Coordenadas iniciales para centrar el texto
  uint8_t start_x = (160 - 64) / 2; // Centrado horizontalmente (64 píxeles de ancho)
  uint8_t start_y = 16;             // Posición en la parte superior

  for (uint8_t i = 0; i < 16; i++) {
    if (visible) {
      uint8_t sprite_x = start_x + (i % 8) * 8;     // 8 columnas de ancho
      // uint8_t sprite_y = start_y + (i / 8) * 8;     // Avanza a la fila siguiente después de 8 sprites
      uint8_t sprite_y = start_y + ((i & 0xF8) >> 3) * 8;     // Avanza a la fila siguiente después de 8 sprites
      move_sprite(i, sprite_x + 6, sprite_y);       // Reposiciona el sprite en su lugar con 6 pixeles extra en x para mejor centrado
    }
    else {
      move_sprite(i, 0, 0); // Mueve el sprite fuera de la pantalla
    }
  }
}

// Funcion para desplegar pantallas de inicio
void load_128x128_full_screen(const uint8_t *full_screen_sprite, int8_t center, int8_t isTitleScreen) {
  DISPLAY_OFF;          // Apagar la pantalla mientras se cargan los datos
  // clear_background();   // Limpia el mapa de fondo
  fill_bkg_rect(0, 0, 20, 18, 80); // Llena la pantalla completa con el tile 60 (color verde/amarillo solido)

  uint8_t pos_x = 0;
  uint8_t pos_y = 0;

  if (center) {
    // Coordenadas centrales (para centrar el sprite de 128x128)
    pos_x = (20 - 16) / 2; // (Ancho pantalla en tiles - ancho sprite en tiles) / 2
    pos_y = (18 - 16) / 2; // (Alto pantalla en tiles - alto sprite en tiles) / 2
  }
  else {
    // Coordenadas centrales (con ajuste para alinear al borde inferior)
    pos_x = (20 - 16) / 2; // Centrado horizontalmente
    pos_y = 18 - 16;       // Alineado al borde inferior
  }

  // Cargar los tiles del sprite completo en la VRAM
  set_bkg_data(0, 256, full_screen_sprite); // Carga 256 tiles en VRAM desde el arreglo
  
  // Tile para relleno de bordes
  fill_bkg_rect(0, 0, 20, 18, 80); // Llena la pantalla completa con el tile 60 (color verde/amarillo solido)

  // Dibujar el sprite en la pantalla
  for (uint8_t row = 0; row < 16; row++) {    // Recorre filas (128 píxeles = 16 tiles)
    for (uint8_t col = 0; col < 16; col++) {  // Recorre columnas (128 píxeles = 16 tiles)
      uint8_t tile_index = row * 16 + col;    // Calcula el índice del tile basado en fila y columna
      uint8_t x_tile = pos_x + col;        // Posición x en tiles
      uint8_t y_tile = pos_y + row;        // Posición y en tiles
      set_bkg_tiles(x_tile, y_tile, 1, 1, &tile_index); // Coloca el tile
    }
  }
  
  DISPLAY_ON;     // Enciende la pa ntalla
  SHOW_BKG;       // Muestra el fondo

  if (isTitleScreen) {
    // Controla la visibilidad del texto "PRESS START"
    uint8_t visible = 1;

    // Dibujar y posicionar "PRESS START" como sprite
    HIDE_BKG; // Oculta la capa de fondo temporalmente
    draw_press_start_sprite(); // Llama a la función para dibujar los sprites
    SHOW_BKG; // Opcional: vuelve a mostrar la capa de fondo si es necesario

    // Espera a que el jugador presione Start
    while (1) {
      wait_vbl_done();
      toggle_press_start_visibility(visible); // Alterna la visibilidad del texto PRESS START
      visible = !visible; // Cambia el estado la visibilidad del texto PRESS START
      
      if (joypad() & J_START) {
        // Comienza el juego
        toggle_press_start_visibility(0); // Oculta el texto antes de salir
        HIDE_BKG;                         // Oculta el fondo si no lo necesitas en el juego
        HIDE_SPRITES;                     // Oculta los sprites de la pantalla de inicio
        DISPLAY_OFF;                      // Apaga la pantalla para preparar el juego
        hide_all_sprites();               // Oculta todos los sprites antes de comenzar el juego
        fill_bkg_rect(0, 0, 20, 18, 0);   // Limpia el fondo de la pantalla de inicio
        clear_background();               // Limpia el mapa de fondo
        clear_vram();                     // Limpia la memoria VRAM
        break;
      } 
      delay(100); // Pequeño retraso para reducir el uso de CPU
    }
  }
  else {
    // Esperar 5 segundos (300 frames)
    for (uint16_t frame_counter = 0; frame_counter < 200; frame_counter++) {
      wait_vbl_done();
    }
    HIDE_BKG;                         // Oculta el fondo
    DISPLAY_OFF;                      // Apagar pantalla
    fill_bkg_rect(0, 0, 20, 18, 0);   // Limpia el fondo de la pantalla de inicio
    clear_background();               // Limpia el mapa de fondo
    clear_vram();                     // Limpia la memoria VRAM
    // set_bkg_data(0, 256, NULL);       // Limpia la VRAM de tiles de background (deja un fondo negro)
  }
}

// Pantalla de inicio
void show_start_screen(void) {
  // Forzar la carga de la fuente predeterminada
  printf(" "); // Asegura que la fuente se cargue en la VRAM

  DISPLAY_ON;     // Enciende la pantalla
  SHOW_BKG;       // Muestra el fondo
  SHOW_SPRITES;   // Mostrar los sprites

  // load_start_screen();

  // Texto centrado
  write_text_to_background("PRESS START", 4, 15); // Sprite 15, columna 4 (aproximadamente centrado)

  // Sprite centrado de Arche
  uint8_t center_x = (160 - 32) / 2; // Centro horizontal
  uint8_t center_y = (144 - 32) / 2; // Centro vertical
  // uint8_t base_x = 80; // Coordenada X inicial
  // uint8_t base_y = 72; // Coordenada Y inicial
  // init_start_metasprite(center_x, center_y); // Inicializa el metasprite en el centro
  // render_static_metasprite(center_x, center_y); // Renderizar estáticamente el metasprite
  animate_levitation_start_screen(center_x, center_y);

  // Espera a que el jugador presione Start
  while (1) {
    wait_vbl_done();
    if (joypad() & J_START) {
      // Comienza el juego
      hide_all_sprites(); // Oculta todos los sprites antes de comenzar el juego
      fill_bkg_rect(0, 0, 20, 18, 0); // Limpia el fondo de la pantalla de inicio
      HIDE_BKG;       // Opcional: oculta el fondo si no lo necesitas en el juego
      HIDE_SPRITES;   // Opcional: oculta los sprites de la pantalla de inicio
      DISPLAY_OFF;    // Apaga la pantalla para preparar el juego
      clear_vram();
      break;
    } 
    delay(100); // Pequeño retraso para reducir el uso de CPU
  }
}

#endif // START_SCREEN_H