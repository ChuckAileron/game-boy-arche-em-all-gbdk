#include "../actions/input.h"
#include "../text/text.h"

#ifndef LEVEL_START_SCREEN_H
#define LEVEL_START_SCREEN_H


//#########################################//
//#              ENCABEZADOS              #//
//#########################################//
void load_level_start_screen(void);


//#################################################################//
//#            FUNCIONES DE PANTALLA DE PREVIA A NIVEL            #//
//#################################################################//
// Pantalla de inicio
void load_level_start_screen(void) {
  // Forzar la carga de la fuente predeterminada
  printf(" "); // Asegura que la fuente se cargue en la VRAM

  DISPLAY_ON;     // Enciende la pantalla
  SHOW_BKG;       // Muestra el fondo
  SHOW_SPRITES;   // Mostrar los sprites

  // write_text_to_background("PRESS ANY BUTTON", 2, 15); // Aproximadamente centrado

  // Sprite centrado de Arche
  uint8_t center_x = (160 - 32) / 2; // Centro horizontal
  // uint8_t center_y = (144 - 32) / 2; // Centro vertical
  uint8_t center_y = 44; // Centro vertical

  // Espera a que el jugador presione Start
  while (1) {
    // animate_levitation_start_screen(center_x, center_y);
    // animate_levitation_step(center_x, center_y);
    uint16_t dialog_finished = display_text_box("Hello %s, your score is %d.", "CHUCK", 999); // no funciona con argumentos %s %d
    // uint16_t dialog_finished = display_text_box("Zip zib zib bla bla bla blebleble glorp glorp glorb.");
    wait_vbl_done(); // Sincronización con el hardware

    if (dialog_finished && wait_for_any_button()) {
      // Comienza el juego
      hide_all_sprites();             // Oculta todos los sprites antes de comenzar el juego
      fill_bkg_rect(0, 0, 20, 18, 0); // Limpia el fondo de la pantalla de inicio
      HIDE_BKG;                       // Opcional: oculta el fondo si no lo necesitas en el juego
      HIDE_SPRITES;                   // Opcional: oculta los sprites de la pantalla de inicio
      DISPLAY_OFF;                    // Apaga la pantalla para preparar el juego
      clear_vram();
      break;
    }
    // if (joypad() & J_START) {
    //   // Comienza el juego
    //   hide_all_sprites(); // Oculta todos los sprites antes de comenzar el juego
    //   fill_bkg_rect(0, 0, 20, 18, 0); // Limpia el fondo de la pantalla de inicio
    //   HIDE_BKG;       // Opcional: oculta el fondo si no lo necesitas en el juego
    //   HIDE_SPRITES;   // Opcional: oculta los sprites de la pantalla de inicio
    //   DISPLAY_OFF;    // Apaga la pantalla para preparar el juego
    //   clear_vram();
    //   break;
    // }
    delay(100); // Pequeño retraso para reducir el uso de CPU
  }
}

#endif // LEVEL_START_SCREEN_H