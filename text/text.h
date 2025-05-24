#include <gb/gb.h>
#include <stdio.h>
#include "./text_box.h"

#ifndef TEXT_H
#define TEXT_H


//#########################################//
//#              ENCABEZADOS              #//
//#########################################//
uint8_t find_syllable_break(const char *word, uint8_t max_length);
void write_text_to_background(const char* text, UINT8 x, UINT8 y);
void draw_text_slowly(uint8_t x, uint8_t y, const char *text, uint16_t delay_ms);
uint8_t display_text_box(const char *text, const char *name, uint16_t score);
void draw_dynamic_text_slowly(uint8_t x, uint8_t y, uint16_t delay_ms, const char *text, const char *name, uint16_t score);
void display_text_with_printf(const char *format, ...);


//#################################################################//
//#                FUNCIONES DE GENERACION DE TEXTO               #//
//#################################################################//
// // Función auxiliar para dividir palabras en sílabas
// uint8_t find_syllable_break(const char *word, uint8_t max_length) {
//   for (int8_t i = max_length - 1; i >= 0; i--) {
//     if (word[i] == 'a' || word[i] == 'e' || word[i] == 'i' || word[i] == 'o' || word[i] == 'u') {
//       return i + 1; // Rompe en la vocal (sílaba)
//     }
//   }
//   return max_length; // No encontró, corta en el máximo permitido
// }

// Función auxiliar para dividir palabras en sílabas
uint8_t find_syllable_break(const char *word, uint8_t max_length) {
  for (int8_t i = max_length - 1; i >= 0; i--) {
    if (word[i] == 'a' || word[i] == 'e' || word[i] == 'i' || word[i] == 'o' || word[i] == 'u') {
      return i + 1; // Rompe en la vocal (sílaba)
    }
  }
  return max_length; // No encontró, corta en el máximo permitido
}

// Convierte texto en índices de tiles y lo escribe en una posición del fondo
void write_text_to_background(const char* text, UINT8 x, UINT8 y) {
  UINT8 text_length = strlen(text); // Longitud del texto
  UINT8 title_indexes[20];          // Espacio para convertir caracteres a índices de tiles

  // Convierte los caracteres ASCII a índices de tiles
  for (UINT8 i = 0; i < text_length; i++) {
    title_indexes[i] = text[i] - 32; // Ajuste ASCII (espacio `' '` está en índice 0)
  }

  // Escribe los índices de tiles en la posición indicada del fondo
  set_bkg_tiles(x, y, text_length, 1, title_indexes);
}

// // Función para mostrar texto carácter por carácter
// void draw_text_slowly(uint8_t x, uint8_t y, const char *text, uint16_t delay_ms) {
//   uint8_t char_tile_index;
//   uint8_t cursor_x = x, cursor_y = y;

//   for (uint8_t i = 0; text[i] != '\0'; i++) {
//     // Salto de línea si encuentra '\n' o al final de la línea
//     if (text[i] == '\n' || cursor_x >= 19) { // 19 tiles de ancho en pantalla
//       cursor_x = x;
//       cursor_y++;
//       continue;
//     }

//     // Convierte el caracter en índice de tile (0 para espacio, 1 para 'A', etc.)
//     char_tile_index = text[i] - 32; // Ajusta según tu mapeo de caracteres en tileset
//     set_bkg_tiles(cursor_x, cursor_y, 1, 1, &char_tile_index); // Dibujar el carácter en pantalla
//     cursor_x++; // Avanzar el cursor

//     // Espera antes de mostrar el siguiente carácter
//     for (uint16_t j = 0; j < delay_ms / 16; j++) {
//       wait_vbl_done(); // Espera ~16 ms por cuadro
//     }
//   }
// }

// // Función para mostrar texto carácter por carácter con alineación y corte de palabras
// void draw_text_slowly(uint8_t x, uint8_t y, const char *text, uint16_t delay_ms) {
//   uint8_t char_tile_index;
//   uint8_t cursor_x = x, cursor_y = y;
//   uint8_t line_width = 17; // Ancho de la caja de texto en tiles (deja margen)
//   const char *current_word = text;
  
//   while (*current_word != '\0') {
//     // Salta espacios iniciales o después de salto de línea
//     if (*current_word == ' ') {
//       current_word++;
//       continue;
//     }

//     // Identifica la longitud de la palabra
//     uint8_t word_length = 0;
//     while (current_word[word_length] != '\0' && current_word[word_length] != ' ' && current_word[word_length] != '\n') {
//       word_length++;
//     }

//     // Verificar si cabe en la línea actual
//     if (cursor_x + word_length > x + line_width) {
//       // La palabra no cabe, cortar y agregar guión
//       uint8_t syllable_break = find_syllable_break(current_word, line_width - (cursor_x - x));
//       for (uint8_t i = 0; i < syllable_break; i++) {
//         char_tile_index = current_word[i] - 32;
//         set_bkg_tiles(cursor_x, cursor_y, 1, 1, &char_tile_index);
//         cursor_x++;
//         for (uint16_t j = 0; j < delay_ms / 16; j++) { wait_vbl_done(); }
//       }
//       // Agregar guión al final
//       char_tile_index = '-' - 32;
//       set_bkg_tiles(cursor_x, cursor_y, 1, 1, &char_tile_index);
//       cursor_x = x; // Salto de línea
//       cursor_y++;
//       current_word += syllable_break;
//     }
//     else {
//       // La palabra cabe en la línea actual
//       for (uint8_t i = 0; i < word_length; i++) {
//         char_tile_index = current_word[i] - 32;
//         set_bkg_tiles(cursor_x, cursor_y, 1, 1, &char_tile_index);
//         cursor_x++;
//         for (uint16_t j = 0; j < delay_ms / 16; j++) { wait_vbl_done(); }
//       }
//       cursor_x++; // Espacio después de la palabra
//       current_word += word_length;
//     }

//     // Manejo de salto de línea
//     if (cursor_x > x + line_width) {
//       cursor_x = x;
//       cursor_y++;
//     }
//   }
// }

// Función para mostrar texto carácter por carácter con alineación y manejo correcto de guiones
void draw_text_slowly(uint8_t x, uint8_t y, const char *text, uint16_t delay_ms) {
  uint8_t char_tile_index;
  uint8_t cursor_x = x, cursor_y = y;
  uint8_t line_width = 18; // Ancho de la caja de texto en tiles (deja margen)
  const char *current_word = text;
  
  while (*current_word != '\0') {
    // Salta espacios iniciales o después de salto de línea
    if (*current_word == ' ') {
      current_word++;
      continue;
    }

    // Identifica la longitud de la palabra
    uint8_t word_length = 0;
    while (current_word[word_length] != '\0' && current_word[word_length] != ' ' && current_word[word_length] != '\n') {
      word_length++;
    }

    // Verificar si cabe en la línea actual
    if (cursor_x + word_length > x + line_width) {
      // Si un espacio no cabe al final, solo salta de línea sin guión
      if (current_word[word_length] == ' ') {
        cursor_x = x;
        cursor_y++;
        continue;
      }

      // La palabra no cabe, cortar y agregar guión
      uint8_t syllable_break = find_syllable_break(current_word, line_width - (cursor_x - x));
      for (uint8_t i = 0; i < syllable_break; i++) {
        char_tile_index = current_word[i] - 32;
        set_bkg_tiles(cursor_x, cursor_y, 1, 1, &char_tile_index);
        cursor_x++;
        for (uint16_t j = 0; j < delay_ms / 16; j++) { wait_vbl_done(); }
      }
      // Agregar guión al final
      char_tile_index = '-' - 32;
      set_bkg_tiles(cursor_x, cursor_y, 1, 1, &char_tile_index);
      cursor_x = x; // Salto de línea
      cursor_y++;
      current_word += syllable_break;
    }
    else {
      // La palabra cabe en la línea actual
      for (uint8_t i = 0; i < word_length; i++) {
        char_tile_index = current_word[i] - 32;
        set_bkg_tiles(cursor_x, cursor_y, 1, 1, &char_tile_index);
        cursor_x++;
        for (uint16_t j = 0; j < delay_ms / 16; j++) { wait_vbl_done(); }
      }
      cursor_x++; // Espacio después de la palabra
      current_word += word_length;
    }

    // Manejo de salto de línea
    if (cursor_x > x + line_width) {
      cursor_x = x;
      cursor_y++;
    }
  }
}

#include <stdio.h> // Para usar sprintf

// Función para dibujar texto formateado, carácter por carácter
void draw_dynamic_text_slowly(uint8_t x, uint8_t y, uint16_t delay_ms, const char *text, const char *name, uint16_t score) {
    char formatted_text[128]; // Buffer para almacenar el texto formateado

    // Construir la cadena manualmente
    if (name && score) {
      sprintf(formatted_text, text, name, score);
    }
    else if (name && !score) {
      sprintf(formatted_text, text, name);
    }
    else if (!name && score) {
      sprintf(formatted_text, text, score);
    }
    else {
      sprintf(formatted_text, text);
    }

    // Muestra el texto carácter por carácter
    draw_text_slowly(x, y, formatted_text, delay_ms);
}


uint8_t display_text_box(const char *text, const char *name, uint16_t score) {
  DISPLAY_OFF;
  draw_text_box(); // Dibuja el cuadro de texto en la parte inferior
  DISPLAY_ON;

  // Muestra el texto carácter por carácter dentro del cuadro
  // draw_text_slowly(1, 11, text, 100); // Comienza en la posición 1, 11
  // draw_dynamic_text_slowly(1, 11, text, 100); // Comienza en la posición 1, 11
  draw_dynamic_text_slowly(1, 11, 100, text, name, score);
  return 1;
}

// void display_text_with_printf(const char *format, ...) {
//   char buffer[128]; // Buffer para almacenar el texto formateado

//   va_list args;
//   va_start(args, format);
//   vsnprintf(buffer, sizeof(buffer), format, args);
//   va_end(args);

//   // Usa la función para mostrar el cuadro y el texto
//   display_text_box(buffer);
// }
// Ejemplo
// display_text_with_printf("Hello %s, your score is %d.\n", "Alice", 95);


#endif // TEXT_H