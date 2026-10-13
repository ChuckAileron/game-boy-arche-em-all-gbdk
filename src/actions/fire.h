#ifndef FIRE_H
#define FIRE_H

#include "../player_progress.h"
#include "../sprites/sprite_ids.h"

// Enfriamiento entre rafagas de spread (en frames).
#define SPREAD_FIRE_DELAY      10
#define FAST_SPREAD_FIRE_DELAY 6

// #########################################//
// #               VARIABLES               #//
// #########################################//
volatile UINT8 bullet_x, bullet_y; // Posición del disparo simple
volatile UINT8 bullet_active = 0;  // Estado del disparo simple (0 = inactivo, 1 = activo)
volatile UINT8 spread_bullet_x[3], spread_bullet_y[3]; // Posiciones de las balas spread
volatile INT8  spread_bullet_dx[3],
    spread_bullet_dy[3]; // Direcciones de las balas (admite negativos)
volatile UINT8 spread_bullet_active[3] = {0, 0,
                                          0}; // Estados de las balas (0 = inactiva, 1 = activa)
volatile UINT8 fire_delay              = 0;   // Retraso entre disparos
volatile UINT8 spread_unlocked         = 0;   // Habilidad spread (nivel 10)
volatile UINT8 fast_spread_unlocked    = 0;   // Habilidad fast spread (nivel 15)

// #########################################//
// #              ENCABEZADOS              #//
// #########################################//
void fire_single_bullet(UINT8 x, UINT8 y);
void fire_spread(UINT8 x, UINT8 y);
void update_single_bullet(void);
void update_spread_bullets(void);
void decrease_fire_delay(void);
void fire_update_skills(UINT8 level);

// Sincroniza el desbloqueo de habilidades con el nivel actual del jugador.
void fire_update_skills(UINT8 level) {
  spread_unlocked      = (level >= PLAYER_SPREAD_SKILL_LEVEL);
  fast_spread_unlocked = (level >= PLAYER_FAST_SPREAD_SKILL_LEVEL);
}

// #################################################################//
// #                      FUNCIONES DE ACCION                      #//
// #################################################################//
//  Funcion para disparar proyectil
void fire_single_bullet(UINT8 x, UINT8 y) {
  if (!bullet_active) {     // Solo disparar si no hay un disparo activo
    bullet_x      = x + 16; // Ajuste horizontal para iniciar a la derecha del personaje
    bullet_y      = y + 8;  // Ajuste vertical para centrar el disparo
    bullet_active = 1;      // Marca el disparo como activo
    move_sprite(BULLET_SINGLE_SPRITE, bullet_x, bullet_y); // Muestra el sprite del disparo
  }
}

// Activa las tres balas. La habilidad debe estar desbloqueada (nivel 10).
void fire_spread(UINT8 x, UINT8 y) {
  if (!spread_unlocked)  // Ataque spread todavia no desbloqueado
    return;

  if (fire_delay != 0)   // Respeta el enfriamiento entre rafagas
    return;

  if (!fast_spread_unlocked) {
    // Spread normal: espera a que los 3 proyectiles anteriores desaparezcan.
    // Asi nunca se generan rafagas incompletas al pulsar rapido el boton.
    for (UINT8 i = 0; i < 3; i++) {
      if (spread_bullet_active[i])
        return;
    }
  }

  // Siempre lanza un grupo completo de 3 proyectiles.
  for (UINT8 i = 0; i < 3; i++) {
    spread_bullet_x[i] = x + 16; // Todas las balas empiezan justo a la derecha del personaje
    spread_bullet_y[i] = y + 8;  // Centra las balas verticalmente respecto al personaje

    // Configurar la direccion de las balas
    spread_bullet_dx[i] = 2; // Todas las balas se mueven horizontalmente

    if (i == 1) {
      spread_bullet_dy[i] = -1;
    } // Bala superior (diagonal hacia arriba)
    else if (i == 2) {
      spread_bullet_dy[i] = 1;
    } // Bala inferior (diagonal hacia abajo)
    else {
      spread_bullet_dy[i] = 0;
    } // Bala central (horizontal)

    spread_bullet_active[i] = 1; // Marca la bala como activa
    move_sprite(BULLET_SPRITE_FIRST + i, spread_bullet_x[i],
                spread_bullet_y[i]); // Muestra el sprite de la bala
  }

  // El fast spread puede re-disparar antes: enfriamiento mas corto.
  fire_delay = fast_spread_unlocked ? FAST_SPREAD_FIRE_DELAY : SPREAD_FIRE_DELAY;
}

// Funcion para actualizar movimiento del disparo
void update_single_bullet(void) {
  if (bullet_active) {
    bullet_x += 3; // Mover hacia la derecha

    if (bullet_x > 160) {                      // Disparo horizontal
      bullet_active = 0;                       // Desactiva el disparo
      move_sprite(BULLET_SINGLE_SPRITE, 0, 0); // Oculta el sprite del disparo
    } else {
      move_sprite(BULLET_SINGLE_SPRITE, bullet_x, bullet_y); // Actualiza la posición del sprite
    }
  }
}

// Actualiza las balas
void update_spread_bullets(void) {
  for (UINT8 i = 0; i < 3; i++) {
    if (spread_bullet_active[i]) {
      spread_bullet_x[i] += spread_bullet_dx[i]; // Movimiento horizontal
      spread_bullet_y[i] += spread_bullet_dy[i]; // Movimiento vertical

      // Si la bala sale de la pantalla, desactivarla
      if (spread_bullet_x[i] > 160 || spread_bullet_y[i] < 8 || spread_bullet_y[i] > 152) {
        spread_bullet_active[i] = 0;
        move_sprite(BULLET_SPRITE_FIRST + i, 0, 0); // Oculta el sprite
      } else {
        move_sprite(BULLET_SPRITE_FIRST + i, spread_bullet_x[i],
                    spread_bullet_y[i]); // Actualiza la posición
      }
    }
  }
}

// Reduce el retraso entre disparos
void decrease_fire_delay(void) {
  if (fire_delay > 0) {
    fire_delay--;
  }
}

#endif // FIRE_H
