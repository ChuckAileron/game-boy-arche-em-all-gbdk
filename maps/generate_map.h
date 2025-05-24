#include "./level_1_map.h"
#include "./tilemap_offsets.h"

#ifndef GENERATE_MAP_H
#define GENERATE_MAP_H

#define TILEMAP_WIDTH 20
#define TILEMAP_HEIGHT 8
#define SCREEN_HEIGHT 144

// Variables globales para controlar la posición del background
uint8_t bkg_scroll_x = 0; // Desplazamiento horizontal
uint8_t bkg_scroll_y = 0; // Desplazamiento vertical


//#########################################//
//#              ENCABEZADOS              #//
//#########################################//
void load_tilemaps(const uint8_t tileset_size, const uint8_t *tileset, const uint8_t *background_tilemap);
void start_background_scroll();


//#################################################################//
//#               FUNCIONES DE GENERACION DE SPRITES              #//
//#################################################################//
void load_tilemaps(const uint8_t tileset_size, const uint8_t *tileset, const uint8_t *background_tilemap) {
  set_bkg_data(0, tileset_size, tileset);           // Carga el tileset que contiene gráficos comunes
  set_bkg_tiles(0, 0, 20, 20, level_1_tilemap_bkg); // Dibujar el mapa en la pantalla
}

// Función para inicializar el scroll automático
void start_background_scroll() {
  while (1) {
    // Incrementa el desplazamiento
    bkg_scroll_x++; // Scroll horizontal (puedes cambiar a negativo para ir hacia la izquierda)

    // Aplica el desplazamiento al background
    scroll_bkg(bkg_scroll_x, 0);

    // Sincroniza con la pantalla para evitar artefactos
    wait_vbl_done();
  }
}

// Funcion para cargar y dibujar tiles de background y foreground
void load_and_draw_background_foreground_map(uint8_t player_x, uint8_t player_y) {
  DISPLAY_OFF;
  load_tilemaps(120, all_tilesets_sky_night_palmtrees, level_1_tilemap_bkg);
  DISPLAY_ON;
  start_background_scroll();
}

#endif // GENERATE_MAP_H