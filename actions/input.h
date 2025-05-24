#ifndef INPUT_H
#define INPUT_H


//#########################################//
//#              ENCABEZADOS              #//
//#########################################//
int8_t wait_for_any_button(void);


//#################################################################//
//#                FUNCIONES DE PANTALLA DE INICIO                #//
//#################################################################//
// Si el jugador presiona cualquier boton, envia bandera para cerrar pantalla
int8_t wait_for_any_button(void) {
  // Espera a que el jugador presione cualquier botón
  while (1) {
    wait_vbl_done();  // Espera al próximo frame
    if (joypad()) {   // Detecta si algún botón está presionado
      return 1;       // Retorna bandera de que la pantalla actual debe ser cerrada
    }
  }
}

#endif // INPUT_H