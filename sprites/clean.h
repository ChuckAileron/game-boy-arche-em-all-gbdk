#ifndef CLEAN_H
#define CLEAN_H

//#########################################//
//#              ENCABEZADOS              #//
//#########################################//
void hide_unused_sprites(UINT8 start_id);
void hide_all_sprites(void);
void clear_vram(void);


//#################################################################//
//#                FUNCIONES DE LIMPIEZA DE MEMORIA               #//
//#################################################################//
// Oculta todos los sprites no utilizados. (El Game Boy soporta hasta 40 sprites)
void hide_unused_sprites(UINT8 start_id) {
  for (UINT8 i = start_id; i < 40; i++) {
    move_sprite(i, 0, 0); // Mueve los sprites a una posición invisible
  }
}

// Oculta todos los sprites
void hide_all_sprites(void) {
  for (UINT8 i = 0; i < 40; i++) {
    move_sprite(i, 0, 0); // Mueve los sprites fuera de pantalla
  }
}

// Limpieza de tiles cargados en VRAM
void clear_vram(void) {
  // Tile vacío (8 bytes, todos ceros)
  const uint8_t empty_tile[16] = { 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 };
  // Mapa de fondo vacío (20x18 tiles = 360 tiles)
  const uint8_t empty_map[360] = {0};

  DISPLAY_OFF; // Apaga pantalla antes de manipular la VRAM
  set_bkg_data(0, 1, empty_tile); // Carga el tile vacío en el índice 0
  set_bkg_tiles(0, 0, 20, 18, empty_map); // Llena toda la pantalla con el tile vacío
  hide_all_sprites(); // Mueve todos los sprites fuera de la pantalla colocando cada sprite en la posición (0, 0)
  DISPLAY_ON; // Enciende la pantalla después de limpiar
}

#endif // CLEAN_H