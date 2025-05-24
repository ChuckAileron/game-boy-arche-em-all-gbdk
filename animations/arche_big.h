#ifndef ARCHE_BIG_H
#define ARCHE_BIG_H


//#########################################//
//#              ENCABEZADOS              #//
//#########################################//
void animate_levitation_start_screen(uint8_t base_x, uint8_t base_y);
void animate_levitation_step(uint8_t base_x, uint8_t base_y);
void init_and_move_48x48_sprite(uint8_t base_sprite_id, uint8_t base_x, uint8_t base_y);
void slide_metasprite_to_center(uint8_t base_sprite_id, uint8_t start_x, uint8_t start_y, uint8_t target_x, uint8_t target_y, uint8_t speed);


//#################################################################//
//#                     FUNCIONES DE ANIMACION                    #//
//#################################################################//
// Efecto de levitación
void animate_levitation_start_screen(uint8_t base_x, uint8_t base_y) {
  int8_t direction = 1; // Dirección del movimiento (1 = arriba, -1 = abajo)
  uint8_t y_offset = 0; // Desplazamiento vertical

  while (1) {
    // if (joypad() & J_START) { break; }

    init_start_metasprite(base_x, base_y + y_offset); // Mueve el metasprite con el desplazamiento actual
    y_offset += direction; // Actualiza el desplazamiento vertical

    // Cambia la dirección si alcanza los límites del movimiento
    if (y_offset >= 4 || y_offset <= 0) {
      direction = -direction;
    }
    wait_vbl_done(); // Sincroniza con el ciclo de renderizado
    delay(100);
  }
}

void animate_levitation_step(uint8_t base_x, uint8_t base_y) {
    static int8_t y_offset = 0; // Desplazamiento actual en Y
    static int8_t direction = 1; // Dirección del movimiento: 1 para subir, -1 para bajar

    // Calcula la nueva posición
    uint8_t new_y = base_y + y_offset;

    // Actualiza el metasprite en la nueva posición
    init_start_metasprite(base_x, new_y);

    // Cambia el desplazamiento vertical
    y_offset += direction;

    // Cambia la dirección al alcanzar los límites
    if (y_offset >= 4) {
        direction = -1; // Cambia a bajar
    } else if (y_offset <= 0) {
        direction = 1; // Cambia a subir
    }

    // Sincronización con el hardware
    wait_vbl_done();
}

// Función para inicializar y mover un metasprite de 48x48
void init_and_move_48x48_sprite(uint8_t base_sprite_id, uint8_t base_x, uint8_t base_y) {
  for (uint8_t i = 0; i < 36; i++) {
    uint8_t sprite_id = base_sprite_id + i;
    set_sprite_tile(sprite_id, sprite_id); // Asigna cada tile al sprite correspondiente
    move_sprite(sprite_id, base_x + map_48_x_48_offsets[i][0], base_y + map_48_x_48_offsets[i][1]);
  }
}

// Animación tipo "slide" para un metasprite 48x48
void slide_metasprite_to_center(uint8_t base_sprite_id, uint8_t start_x, uint8_t start_y, uint8_t target_x, uint8_t target_y, uint8_t speed) {
    uint8_t current_x = start_x;
    uint8_t current_y = start_y;

    // Mientras no se alcance el objetivo
    while (current_x != target_x || current_y != target_y) {
        // Actualiza la posición X
        if (current_x < target_x) {
            current_x += (current_x + speed > target_x) ? (target_x - current_x) : speed;
        }
        else if (current_x > target_x) {
            current_x -= (current_x < speed) ? current_x : speed;
        }

        // Actualiza la posición Y
        if (current_y < target_y) {
            current_y += (current_y + speed > target_y) ? (target_y - current_y) : speed;
        }
        else if (current_y > target_y) {
            current_y -= (current_y < speed) ? current_y : speed;
        }

        // Mueve el metasprite a la nueva posición
        init_and_move_48x48_sprite(base_sprite_id, current_x, current_y);

        // Sincronización con el VBLANK para fluidez
        wait_vbl_done();
    }
}



#endif // ARCHE_BIG_H