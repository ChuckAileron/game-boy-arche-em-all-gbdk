#include <gb/gb.h>
#include <gb/cgb.h>
#include <gb/drawing.h>
#include <gb/metasprites.h>
#include <stdint.h>
#include <stdio.h>
#include <string.h>

#include "./text/text.h"
#include "./actions/fire.h"
#include "./sprites/clean.h"
#include "./sprites/sprite_generate.h"
#include "./start/start_screen.h"
#include "./animations/arche_big.h"
#include "./movement/sprite_movement.h"
#include "./sprites/arche/arche_big_sprites.h"
#include "./sprites/arche/arche_small_sprites.h"
#include "./sprites/effects/small_effect_sprites.h"
#include "./sprites/title_screen/start_screen_sprites.h"
#include "./sprites/texts/press_start_sprites.h"
#include "./sprites/tilesets/tilesets_sky_night_palmtrees.h"
#include "./skits/skit_start.h"
#include "./level_start/level_start_screen.h"
#include "./maps/level_1_map.h"
#include "./maps/generate_map.h"


//#########################################//
//#          VARIABLES GLOBALES           #//
//#########################################//
// Variables globales marcadas como volátiles para evitar optimización excesiva
volatile uint8_t player_x = 20, player_y = 78; // Posición inicial de ARCHE (en gameplay)


//#################################################################//
//#                      FUNCIONES PRINCIPAL                      #//
//#################################################################//
void main(void) {
  DISPLAY_OFF;    // Apagar la pantalla
  HIDE_BKG;       // Oculta el fondo
  HIDE_SPRITES;   // Oculta los sprites

  load_128x128_full_screen(start_chuck_screen_sprite, 1, 0);  // Pantalla de inicio 1
  load_128x128_full_screen(start_title_screen_sprite, 0, 1);  // Pantalla de inicio 2 (Press Start)
  load_skit_start_screen();                                   // Muestra el skit de inicio
  // load_level_start_screen();                                  // Muestra pantalla previa a LEVEL 1

  // Configurar la pantalla y el fondo
  DISPLAY_ON;   // Encender la pantalla
  SHOW_BKG;     // Mostrar el fondo
  SHOW_SPRITES; // Mostrar los sprites

  // Cargar datos gráficos
  // load_and_draw_background_foreground_map(player_x, player_y);
  load_16_x_16_sprite(0, arche_sprite_tiles, player_x, player_y); // Carga el sprite de Arche para el gameplay
  init_single_bullet();                                           // Inicializa sprite de proyectil disparo
  init_spread_bullets();                                          // Inicializa sprite de proyectil disparo

  // Bucle principal. Lógica del juego, detección de entradas, etc.
  while (1) {
    uint8_t input = joypad(); // Lee las entradas del control
    decrease_fire_delay();    // Reduce el retraso entre disparos

    // Disparo con el botón A
    if (input & J_A) { fire_single_bullet(player_x, player_y); }
    // Disparo spread con el botón B
    if (input & J_B) { fire_spread(player_x, player_y); }

    // Movimiento básico con el D-Pad
    if (input & J_LEFT)   { player_x -= 2; }
    if (input & J_RIGHT)  { player_x += 2; }
    if (input & J_UP)     { player_y -= 2; }
    if (input & J_DOWN)   { player_y += 2; }

    // move_16_x_16_sprite(0, x, y);
    // move_16_x_16_sprite(0, player_x, player_y);
    move_16_x_16_sprite(0, &player_x, &player_y); // Mueve el sprite de Arche a la nueva posición
    update_single_bullet();                       // Actualiza el disparo
    update_spread_bullets();                      // Actualiza el disparo spread
    delay(10);                                    // Retraso para suavizar el movimiento
    wait_vbl_done();
  }
}
