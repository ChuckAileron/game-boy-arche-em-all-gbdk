#include "../sprites/skits/arche_skit_sprites.h"
#include "../animations/arche_big.h"
#include "../actions/input.h"
#include "../text/text.h"

#ifndef SKIT_START_H
#define SKIT_START_H

//#########################################//
//#              ENCABEZADOS              #//
//#########################################//
void load_skit_start_screen(void);


//#################################################################//
//#                FUNCIONES DE PANTALLA DE SKITS                 #//
//#################################################################//
// Pantalla de inicio
void load_skit_start_screen(void) {
  // Forzar la carga de la fuente predeterminada
  printf(" "); // Asegura que la fuente se cargue en la VRAM

  DISPLAY_ON;     // Enciende la pantalla
  SHOW_BKG;       // Muestra el fondo
  SHOW_SPRITES;   // Mostrar los sprites

  // Sprite centrado de Arche
  uint8_t center_x = (160 - 32) / 2; // Centro horizontal
  uint8_t center_y = 36; // Centro vertical
  load_48_x_48_sprite(0, skit_arche_normal_48x48_sprite, center_x, center_y);
  slide_metasprite_to_center(0, 0, center_y, center_x, center_y, 2); // Empieza fuera de pantalla y se centra

  // Espera a que el jugador presione Start
  while (1) {
    // uint16_t dialog_finished = display_text_box("Hello %s, your score is %d.", "CHUCK", 999); // no funciona con argumentos %s %d
    uint16_t dialog_finished = display_text_box("Zip zib zib bla bla bla blebleble glorp glorp glorb.", 0, 0);
    wait_vbl_done(); // Sincronización con el hardware

    if (dialog_finished && wait_for_any_button()) {
      hide_all_sprites();             // Oculta todos los sprites antes de comenzar el juego
      fill_bkg_rect(0, 0, 20, 18, 0); // Limpia el fondo de la pantalla de inicio
      HIDE_BKG;                       // Opcional: oculta el fondo si no lo necesitas en el juego
      HIDE_SPRITES;                   // Opcional: oculta los sprites de la pantalla de inicio
      DISPLAY_OFF;                    // Apaga la pantalla para preparar el juego
      clear_vram();
      break;
    }
    delay(100); // Pequeño retraso para reducir el uso de CPU
  }
}

#endif // SKIT_START_H