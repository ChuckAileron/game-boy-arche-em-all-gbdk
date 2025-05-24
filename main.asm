;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.3.2 #14228 (MINGW64)
;--------------------------------------------------------
	.module main
	.optsdcc -msm83
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _main
	.globl _load_and_draw_background_foreground_map
	.globl _strlen
	.globl _sprintf
	.globl _printf
	.globl _fill_bkg_rect
	.globl _set_sprite_data
	.globl _set_bkg_tiles
	.globl _set_bkg_data
	.globl _display_off
	.globl _wait_vbl_done
	.globl _joypad
	.globl _delay
	.globl _player_y
	.globl _player_x
	.globl _bkg_scroll_y
	.globl _bkg_scroll_x
	.globl _foreground_tilemap_positions
	.globl _skit_arche_normal_48x48_bin_len
	.globl _press_start_64x16_tiles_len
	.globl _press_start_64x16_tiles
	.globl _press_start_88x16_len
	.globl _press_start_tiles_len
	.globl _start_title_screen_128x128_len
	.globl _start_chuck_screen_128x128_len
	.globl _sprite_bin_len
	.globl _fire_delay
	.globl _spread_bullet_active
	.globl _bullet_active
	.globl _sprite_y_positions
	.globl _sprite_x_positions
	.globl _spread_bullet_dy
	.globl _spread_bullet_dx
	.globl _spread_bullet_y
	.globl _spread_bullet_x
	.globl _bullet_y
	.globl _bullet_x
	.globl _level_1_tilemap_frg
	.globl _level_1_tilemap_bkg
	.globl _arche_level_1_background
	.globl _skit_arche_normal_48x48_sprite
	.globl _all_tilesets_sky_night_palmtrees
	.globl _press_start_88x16_tiles
	.globl _press_start_tiles
	.globl _start_full_screen_offsets
	.globl _start_screen_128_x_128_offsets
	.globl _start_title_screen_sprite
	.globl _start_chuck_screen_sprite
	.globl _start_screen_sprite
	.globl _press_start_offsets
	.globl _map_144_x_16_offsets_flat
	.globl _map_144_x_16_offsets
	.globl _map_48_x_48_offsets
	.globl _map_32_x_32_offsets
	.globl _map_16_x_16_offsets
	.globl _map_4_tiles_offsets
	.globl _row2_offsets
	.globl _row1_offsets
	.globl _bullet_tile
	.globl _arche_sprite_tiles
	.globl _arche_32x32_normal_sprite
	.globl _text_box_tiles
	.globl _text_box_right_bottom_corner_tile
	.globl _text_box_right_edge_tile
	.globl _text_box_right_top_corner_tile
	.globl _text_box_left_bottom_corner_tile
	.globl _text_box_left_edge_tile
	.globl _text_box_left_top_corner_tile
	.globl _draw_text_box
	.globl _find_syllable_break
	.globl _write_text_to_background
	.globl _draw_text_slowly
	.globl _draw_dynamic_text_slowly
	.globl _display_text_box
	.globl _fire_single_bullet
	.globl _fire_spread
	.globl _update_single_bullet
	.globl _update_spread_bullets
	.globl _decrease_fire_delay
	.globl _hide_unused_sprites
	.globl _hide_all_sprites
	.globl _clear_vram
	.globl _load_16_x_16_sprite
	.globl _load_48_x_48_sprite
	.globl _init_row
	.globl _init_start_metasprite
	.globl _render_static_metasprite
	.globl _init_metasprite
	.globl _init_single_bullet
	.globl _init_spread_bullets
	.globl _animate_levitation_start_screen
	.globl _animate_levitation_step
	.globl _init_and_move_48x48_sprite
	.globl _slide_metasprite_to_center
	.globl _clear_background
	.globl _draw_press_start_sprite
	.globl _toggle_press_start_visibility
	.globl _load_128x128_full_screen
	.globl _show_start_screen
	.globl _move_16_x_16_sprite
	.globl _wait_for_any_button
	.globl _load_skit_start_screen
	.globl _load_level_start_screen
	.globl _load_tilemaps
	.globl _start_background_scroll
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_bullet_x::
	.ds 1
_bullet_y::
	.ds 1
_spread_bullet_x::
	.ds 3
_spread_bullet_y::
	.ds 3
_spread_bullet_dx::
	.ds 3
_spread_bullet_dy::
	.ds 3
_animate_levitation_step_y_offset_65536_487:
	.ds 1
_animate_levitation_step_direction_65536_487:
	.ds 1
_sprite_x_positions::
	.ds 20
_sprite_y_positions::
	.ds 20
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _INITIALIZED
_bullet_active::
	.ds 1
_spread_bullet_active::
	.ds 3
_fire_delay::
	.ds 1
_sprite_bin_len::
	.ds 2
_start_chuck_screen_128x128_len::
	.ds 2
_start_title_screen_128x128_len::
	.ds 2
_press_start_tiles_len::
	.ds 2
_press_start_88x16_len::
	.ds 2
_press_start_64x16_tiles::
	.ds 256
_press_start_64x16_tiles_len::
	.ds 2
_skit_arche_normal_48x48_bin_len::
	.ds 2
_foreground_tilemap_positions::
	.ds 320
_bkg_scroll_x::
	.ds 1
_bkg_scroll_y::
	.ds 1
_player_x::
	.ds 1
_player_y::
	.ds 1
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area _DABS (ABS)
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area _HOME
	.area _GSINIT
	.area _GSFINAL
	.area _GSINIT
;./start/../animations/arche_big.h:38: static int8_t y_offset = 0; // Desplazamiento actual en Y
	ld	hl, #_animate_levitation_step_y_offset_65536_487
	ld	(hl), #0x00
;./start/../animations/arche_big.h:39: static int8_t direction = 1; // Dirección del movimiento: 1 para subir, -1 para bajar
	ld	hl, #_animate_levitation_step_direction_65536_487
	ld	(hl), #0x01
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area _HOME
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE
;./text/./text_box.h:42: void draw_text_box(void) {
;	---------------------------------
; Function draw_text_box
; ---------------------------------
_draw_text_box::
	add	sp, #-8
;./text/./text_box.h:43: uint8_t horizontal_edge_tile = 96;                // Índice del tile en blanco (puedes cargarlo si no existe)
	ldhl	sp,	#0
;./text/./text_box.h:44: uint8_t vertical_edge_tile = 97;                  // Índice del tile en blanco (puedes cargarlo si no existe)
	ld	a, #0x60
	ld	(hl+), a
;./text/./text_box.h:45: uint8_t text_box_left_top_corner_tile = 98;       // Índice del tile en blanco (puedes cargarlo si no existe)
	ld	a, #0x61
	ld	(hl+), a
;./text/./text_box.h:46: uint8_t text_box_right_top_corner_tile = 99;      // Índice del tile en blanco (puedes cargarlo si no existe)
	ld	a, #0x62
	ld	(hl+), a
;./text/./text_box.h:47: uint8_t text_box_left_bottom_corner_tile = 100;   // Índice del tile en blanco (puedes cargarlo si no existe)
	ld	a, #0x63
	ld	(hl+), a
;./text/./text_box.h:48: uint8_t text_box_right_bottom_corner_tile = 101;  // Índice del tile en blanco (puedes cargarlo si no existe)
	ld	a, #0x64
	ld	(hl+), a
	ld	(hl), #0x65
;./text/./text_box.h:59: set_bkg_tiles(x_box, y_box, 1, 1, &text_box_left_top_corner_tile);                              // Esquina superior izquierda
	ldhl	sp,	#2
	push	hl
	ld	hl, #0x101
	push	hl
	ld	hl, #0xa00
	push	hl
	call	_set_bkg_tiles
	add	sp, #6
;./text/./text_box.h:60: set_bkg_tiles(x_box, y_box + box_height - 1, 1, 1, &text_box_left_bottom_corner_tile);              // Esquina inferior izquierda
	ldhl	sp,	#4
	push	hl
	ld	hl, #0x101
	push	hl
	ld	hl, #0x1100
	push	hl
	call	_set_bkg_tiles
	add	sp, #6
;./text/./text_box.h:61: set_bkg_tiles(x_box + box_width - 1, y_box, 1, 1, &text_box_right_top_corner_tile);                 // Esquina superior derecha
	ldhl	sp,	#3
	push	hl
	ld	hl, #0x101
	push	hl
	ld	hl, #0xa13
	push	hl
	call	_set_bkg_tiles
	add	sp, #6
;./text/./text_box.h:62: set_bkg_tiles(x_box + box_width - 1, y_box + box_height - 1, 1, 1, &text_box_right_bottom_corner_tile); // Esquina inferior derecha
	ldhl	sp,	#5
	push	hl
	ld	hl, #0x101
	push	hl
	ld	hl, #0x1113
	push	hl
	call	_set_bkg_tiles
	add	sp, #6
;./text/./text_box.h:65: for (uint8_t i = 1; i < box_width - 1; i++) {
	ld	b, #0x01
00106$:
	ld	c, b
	ld	l, #0x00
;	spillPairReg hl
;	spillPairReg hl
	ld	a, c
	sub	a, #0x13
	ld	a, l
	rla
	ccf
	rra
	sbc	a, #0x80
	jr	NC, 00101$
;./text/./text_box.h:66: set_bkg_tiles(x_box + i, y_box, 1, 1, &horizontal_edge_tile);               // Borde superior
	ldhl	sp,	#0
;	spillPairReg hl
;	spillPairReg hl
;	spillPairReg hl
;	spillPairReg hl
	push	hl
	push	hl
	ld	hl, #0x101
	push	hl
	ld	a, #0x0a
	push	af
	inc	sp
	push	bc
	inc	sp
	call	_set_bkg_tiles
	add	sp, #6
	ld	hl, #0x101
	push	hl
	ld	a, #0x11
	push	af
	inc	sp
	push	bc
	inc	sp
	call	_set_bkg_tiles
	add	sp, #6
;./text/./text_box.h:65: for (uint8_t i = 1; i < box_width - 1; i++) {
	inc	b
	jr	00106$
00101$:
;./text/./text_box.h:71: for (uint8_t j = 1; j < box_height - 1; j++) {
	ld	c, #0x01
00109$:
;	spillPairReg hl
;	spillPairReg hl
	ld	a, c
	ld	l, #0x00
	sub	a, #0x07
	ld	a, l
	rla
	ccf
	rra
	sbc	a, #0x80
	jr	NC, 00102$
;./text/./text_box.h:72: set_bkg_tiles(x_box, y_box + j, 1, 1, &vertical_edge_tile);             // Borde izquierdo
	ldhl	sp,	#1
;	spillPairReg hl
;	spillPairReg hl
	ld	e,l
	ld	d,h
;	spillPairReg hl
;	spillPairReg hl
	ld	a, c
	add	a, #0x0a
	ld	b, a
	push	de
	push	hl
	ld	hl, #0x101
	push	hl
	push	bc
	inc	sp
	xor	a, a
	push	af
	inc	sp
	call	_set_bkg_tiles
	add	sp, #6
	ld	hl, #0x101
	push	hl
	push	bc
	inc	sp
	ld	a, #0x13
	push	af
	inc	sp
	call	_set_bkg_tiles
	add	sp, #6
;./text/./text_box.h:71: for (uint8_t j = 1; j < box_height - 1; j++) {
	inc	c
	jr	00109$
00102$:
;./text/./text_box.h:77: uint8_t blank_tile = 0; // Índice del tile en blanco
	ldhl	sp,	#6
	ld	(hl), #0x00
;./text/./text_box.h:78: for (uint8_t j = 1; j < box_height - 1; j++) {
	ld	c, #0x01
00115$:
;	spillPairReg hl
;	spillPairReg hl
	ld	a, c
	ld	l, #0x00
	sub	a, #0x07
	ld	a, l
	rla
	ccf
	rra
	sbc	a, #0x80
	jr	NC, 00117$
;./text/./text_box.h:79: for (uint8_t i = 1; i < box_width - 1; i++) {
	ld	a, c
	add	a, #0x0a
	ldhl	sp,	#7
	ld	(hl), a
	ld	b, #0x01
00112$:
	ld	l, b
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	ld	a, l
	sub	a, #0x13
	ld	a, h
	rla
	ccf
	rra
	sbc	a, #0x80
	jr	NC, 00116$
;./text/./text_box.h:80: set_bkg_tiles(x_box + i, y_box + j, 1, 1, &blank_tile);
	ldhl	sp,	#6
	push	hl
	ld	hl, #0x101
	push	hl
	ldhl	sp,	#11
	ld	a, (hl)
	push	af
	inc	sp
	push	bc
	inc	sp
	call	_set_bkg_tiles
	add	sp, #6
;./text/./text_box.h:79: for (uint8_t i = 1; i < box_width - 1; i++) {
	inc	b
	jr	00112$
00116$:
;./text/./text_box.h:78: for (uint8_t j = 1; j < box_height - 1; j++) {
	inc	c
	jr	00115$
00117$:
;./text/./text_box.h:83: }
	add	sp, #8
	ret
_text_box_left_top_corner_tile:
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
_text_box_left_edge_tile:
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
_text_box_left_bottom_corner_tile:
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0xff	; 255
	.db #0xff	; 255
_text_box_right_top_corner_tile:
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
_text_box_right_edge_tile:
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
_text_box_right_bottom_corner_tile:
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0xff	; 255
	.db #0xff	; 255
_text_box_tiles:
	.db #0xff	; 255
	.db #0x81	; 129
	.db #0x81	; 129
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x81	; 129
	.db #0x81	; 129
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x81	; 129
	.db #0x81	; 129
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x81	; 129
	.db #0x81	; 129
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x81	; 129
	.db #0x81	; 129
	.db #0x81	; 129
	.db #0xff	; 255
	.db #0x81	; 129
	.db #0x81	; 129
	.db #0x81	; 129
	.db #0x81	; 129
	.db #0x81	; 129
	.db #0x81	; 129
	.db #0x81	; 129
	.db #0x81	; 129
	.db #0x81	; 129
	.db #0x81	; 129
	.db #0x81	; 129
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
;./text/text.h:34: uint8_t find_syllable_break(const char *word, uint8_t max_length) {
;	---------------------------------
; Function find_syllable_break
; ---------------------------------
_find_syllable_break::
	dec	sp
	ld	c, e
	ld	b, d
	ldhl	sp,	#0
	ld	(hl), a
;./text/text.h:35: for (int8_t i = max_length - 1; i >= 0; i--) {
	ld	l, (hl)
;	spillPairReg hl
;	spillPairReg hl
	dec	l
	ld	h, l
;	spillPairReg hl
;	spillPairReg hl
00109$:
	bit	7, h
	jr	NZ, 00107$
;./text/text.h:36: if (word[i] == 'a' || word[i] == 'e' || word[i] == 'i' || word[i] == 'o' || word[i] == 'u') {
	ld	a, h
	push	af
	rlca
	sbc	a, a
	ld	d, a
	pop	af
	add	a, c
	ld	e, a
	ld	a, d
	adc	a, b
	ld	d, a
	ld	a, (de)
	cp	a, #0x61
	jr	Z, 00101$
	cp	a, #0x65
	jr	Z, 00101$
	cp	a, #0x69
	jr	Z, 00101$
	cp	a, #0x6f
	jr	Z, 00101$
	sub	a, #0x75
	jr	NZ, 00110$
00101$:
;./text/text.h:37: return i + 1; // Rompe en la vocal (sílaba)
	ld	a, l
	inc	a
	jr	00111$
00110$:
;./text/text.h:35: for (int8_t i = max_length - 1; i >= 0; i--) {
	dec	h
	ld	l, h
;	spillPairReg hl
;	spillPairReg hl
	jr	00109$
00107$:
;./text/text.h:40: return max_length; // No encontró, corta en el máximo permitido
	ldhl	sp,	#0
	ld	a, (hl)
00111$:
;./text/text.h:41: }
	inc	sp
	ret
;./text/text.h:44: void write_text_to_background(const char* text, UINT8 x, UINT8 y) {
;	---------------------------------
; Function write_text_to_background
; ---------------------------------
_write_text_to_background::
	add	sp, #-25
	ld	c, e
	ld	b, d
	ldhl	sp,	#23
	ld	(hl), a
;./text/text.h:45: UINT8 text_length = strlen(text); // Longitud del texto
	push	bc
	call	_strlen
	pop	hl
	ldhl	sp,	#20
	ld	(hl), e
;./text/text.h:49: for (UINT8 i = 0; i < text_length; i++) {
	ldhl	sp,	#24
	ld	(hl), #0x00
00103$:
	ldhl	sp,	#24
	ld	a, (hl)
	ldhl	sp,	#20
	sub	a, (hl)
	jr	NC, 00101$
;./text/text.h:50: title_indexes[i] = text[i] - 32; // Ajuste ASCII (espacio `' '` está en índice 0)
	push	hl
	ld	hl, #2
	add	hl, sp
	ld	e, l
	ld	d, h
	pop	hl
	ldhl	sp,	#24
	ld	l, (hl)
	ld	h, #0x00
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#23
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#22
	ld	(hl+), a
	inc	hl
	ld	l, (hl)
	ld	h, #0x00
	add	hl, bc
	ld	e, l
	ld	d, h
	ld	a, (de)
	add	a, #0xe0
	ldhl	sp,	#21
	push	af
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	pop	af
	ld	(hl), a
;./text/text.h:49: for (UINT8 i = 0; i < text_length; i++) {
	ldhl	sp,	#24
	inc	(hl)
	jr	00103$
00101$:
;./text/text.h:54: set_bkg_tiles(x, y, text_length, 1, title_indexes);
	ld	hl, #0
	add	hl, sp
	push	hl
	ld	a, #0x01
	push	af
	inc	sp
	ldhl	sp,	#23
	ld	a, (hl)
	push	af
	inc	sp
	ldhl	sp,	#31
	ld	a, (hl)
	push	af
	inc	sp
	ldhl	sp,	#28
	ld	a, (hl)
	push	af
	inc	sp
	call	_set_bkg_tiles
	add	sp, #6
;./text/text.h:55: }
	add	sp, #25
	pop	hl
	inc	sp
	jp	(hl)
;./text/text.h:140: void draw_text_slowly(uint8_t x, uint8_t y, const char *text, uint16_t delay_ms) {
;	---------------------------------
; Function draw_text_slowly
; ---------------------------------
_draw_text_slowly::
	add	sp, #-13
	ldhl	sp,	#7
;./text/text.h:142: uint8_t cursor_x = x, cursor_y = y;
	ld	(hl), a
	ldhl	sp,	#12
	ld	(hl), a
	ldhl	sp,	#8
	ld	(hl), e
;./text/text.h:144: const char *current_word = text;
	ldhl	sp,	#15
	ld	a, (hl)
	ldhl	sp,	#9
	ld	(hl), a
	ldhl	sp,	#16
	ld	a, (hl)
	ldhl	sp,	#10
	ld	(hl), a
;./text/text.h:146: while (*current_word != '\0') {
00119$:
	ldhl	sp,#9
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	or	a, a
	jp	Z, 00134$
;./text/text.h:148: if (*current_word == ' ') {
	sub	a, #0x20
	jr	NZ, 00102$
;./text/text.h:149: current_word++;
	dec	hl
	inc	(hl)
	jr	NZ, 00119$
	inc	hl
	inc	(hl)
;./text/text.h:150: continue;
	jr	00119$
00102$:
;./text/text.h:155: while (current_word[word_length] != '\0' && current_word[word_length] != ' ' && current_word[word_length] != '\n') {
	ldhl	sp,	#6
	ld	(hl), #0x00
00105$:
	ldhl	sp,#9
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ldhl	sp,	#6
	ld	l, (hl)
	ld	h, #0x00
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#6
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#5
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
	sub	a, #0x20
	ld	a, #0x01
	jr	Z, 00271$
	xor	a, a
00271$:
	ldhl	sp,	#11
	ld	(hl), a
	ld	a, c
	or	a, a
	jr	Z, 00154$
	bit	0, (hl)
	jr	NZ, 00154$
	ld	a, c
	sub	a, #0x0a
	jr	Z, 00154$
;./text/text.h:156: word_length++;
	ldhl	sp,	#6
	inc	(hl)
	jr	00105$
00154$:
	ldhl	sp,	#6
	ld	a, (hl-)
	ld	(hl), a
;./text/text.h:160: if (cursor_x + word_length > x + line_width) {
	ldhl	sp,	#12
	ld	c, (hl)
	ld	b, #0x00
	ldhl	sp,	#6
	ld	e, (hl)
	ld	d, #0x00
	ld	l, e
	ld	h, d
	add	hl, bc
	inc	sp
	inc	sp
	push	hl
	ldhl	sp,	#7
	ld	c, (hl)
	ld	b, #0x00
	ld	hl, #0x0012
	add	hl, bc
	push	hl
	ld	a, l
	ldhl	sp,	#5
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#4
	ld	(hl), a
;./text/text.h:174: for (uint16_t j = 0; j < delay_ms / 16; j++) { wait_vbl_done(); }
	ldhl	sp,	#17
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	srl	b
	rr	c
	srl	b
	rr	c
	srl	b
	rr	c
	srl	b
	rr	c
;./text/text.h:160: if (cursor_x + word_length > x + line_width) {
	ldhl	sp,	#3
	ld	e, l
	ld	d, h
	ldhl	sp,	#0
	ld	a, (de)
	inc	de
	sub	a, (hl)
	inc	hl
	ld	a, (de)
	sbc	a, (hl)
	ld	a, (de)
	ld	d, a
	bit	7, (hl)
	jr	Z, 00273$
	bit	7, d
	jr	NZ, 00274$
	cp	a, a
	jr	00274$
00273$:
	bit	7, d
	jr	Z, 00274$
	scf
00274$:
	jp	NC, 00152$
;./text/text.h:164: cursor_y++;
	ldhl	sp,	#8
	ld	a, (hl)
	inc	a
	ldhl	sp,	#5
	ld	(hl), a
;./text/text.h:162: if (current_word[word_length] == ' ') {
	ldhl	sp,	#11
	ld	a, (hl)
	or	a, a
	jr	Z, 00109$
;./text/text.h:163: cursor_x = x;
	ldhl	sp,	#7
	ld	a, (hl)
	ldhl	sp,	#12
	ld	(hl), a
;./text/text.h:164: cursor_y++;
	ldhl	sp,	#5
	ld	a, (hl)
	ldhl	sp,	#8
	ld	(hl), a
;./text/text.h:165: continue;
	jp	00119$
00109$:
;./text/text.h:169: uint8_t syllable_break = find_syllable_break(current_word, line_width - (cursor_x - x));
	ldhl	sp,	#12
	ld	a, (hl)
	ldhl	sp,	#7
	sub	a, (hl)
	inc	hl
	inc	hl
	ld	e, a
	ld	a, #0x12
	sub	a, e
	ld	e, a
	push	bc
	ld	a, e
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	call	_find_syllable_break
	ldhl	sp,	#8
	ld	(hl), a
	pop	bc
;./text/text.h:170: for (uint8_t i = 0; i < syllable_break; i++) {
	ldhl	sp,	#12
	ld	a, (hl-)
	ld	(hl+), a
	ld	(hl), #0x00
00126$:
	ldhl	sp,	#12
	ld	a, (hl)
	ldhl	sp,	#6
	sub	a, (hl)
	jr	NC, 00111$
;./text/text.h:171: char_tile_index = current_word[i] - 32;
	ldhl	sp,#9
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl+)
	inc	hl
	ld	d, a
	ld	l, (hl)
	ld	h, #0x00
	add	hl, de
	ld	e, l
	ld	d, h
	ld	a, (de)
	add	a, #0xe0
;./text/text.h:172: set_bkg_tiles(cursor_x, cursor_y, 1, 1, &char_tile_index);
	ldhl	sp,#2
	ld	(hl), a
	push	hl
	ld	hl, #0x101
	push	hl
	ldhl	sp,	#12
	ld	a, (hl)
	push	af
	inc	sp
	ldhl	sp,	#16
	ld	a, (hl)
	push	af
	inc	sp
	call	_set_bkg_tiles
	add	sp, #6
;./text/text.h:173: cursor_x++;
	ldhl	sp,	#11
	inc	(hl)
;./text/text.h:174: for (uint16_t j = 0; j < delay_ms / 16; j++) { wait_vbl_done(); }
	ld	de, #0x0000
00123$:
	ld	l, e
;	spillPairReg hl
;	spillPairReg hl
	ld	h, d
;	spillPairReg hl
;	spillPairReg hl
	ld	a, l
	sub	a, c
	ld	a, h
	sbc	a, b
	jr	NC, 00127$
	call	_wait_vbl_done
	inc	de
	jr	00123$
00127$:
;./text/text.h:170: for (uint8_t i = 0; i < syllable_break; i++) {
	ldhl	sp,	#12
	inc	(hl)
	jr	00126$
00111$:
;./text/text.h:177: char_tile_index = '-' - 32;
	ldhl	sp,	#2
	ld	(hl), #0x0d
;./text/text.h:178: set_bkg_tiles(cursor_x, cursor_y, 1, 1, &char_tile_index);
	ld	hl, #2
	add	hl, sp
	push	hl
	ld	hl, #0x101
	push	hl
	ldhl	sp,	#12
	ld	a, (hl)
	push	af
	inc	sp
	ldhl	sp,	#16
	ld	a, (hl)
	push	af
	inc	sp
	call	_set_bkg_tiles
	add	sp, #6
;./text/text.h:179: cursor_x = x; // Salto de línea
	ldhl	sp,	#7
	ld	a, (hl)
	ldhl	sp,	#12
	ld	(hl), a
;./text/text.h:180: cursor_y++;
	ldhl	sp,	#5
	ld	a, (hl)
	ldhl	sp,	#8
;./text/text.h:181: current_word += syllable_break;
	ld	(hl-), a
	dec	hl
	ld	e, (hl)
	ld	d, #0x00
	ldhl	sp,	#9
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#11
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#10
	ld	(hl), a
	jr	00116$
;./text/text.h:185: for (uint8_t i = 0; i < word_length; i++) {
00152$:
	ldhl	sp,	#12
	ld	a, (hl)
	ldhl	sp,	#6
	ld	(hl), a
	ldhl	sp,	#11
	ld	(hl), #0x00
00132$:
;./text/text.h:188: cursor_x++;
	ldhl	sp,	#6
	ld	a, (hl)
	inc	a
	ldhl	sp,	#12
;./text/text.h:185: for (uint8_t i = 0; i < word_length; i++) {
	ld	(hl-), a
	ld	a, (hl)
	ldhl	sp,	#5
	sub	a, (hl)
	jr	NC, 00113$
;./text/text.h:186: char_tile_index = current_word[i] - 32;
	ldhl	sp,#9
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl+)
	ld	d, a
	ld	l, (hl)
	ld	h, #0x00
	add	hl, de
	ld	e, l
	ld	d, h
	ld	a, (de)
	add	a, #0xe0
;./text/text.h:187: set_bkg_tiles(cursor_x, cursor_y, 1, 1, &char_tile_index);
	ldhl	sp,#2
	ld	(hl), a
	push	hl
	ld	hl, #0x101
	push	hl
	ldhl	sp,	#12
	ld	a, (hl-)
	dec	hl
	push	af
	inc	sp
	ld	a, (hl)
	push	af
	inc	sp
	call	_set_bkg_tiles
	add	sp, #6
;./text/text.h:188: cursor_x++;
	ldhl	sp,	#12
	ld	a, (hl)
	ldhl	sp,	#6
	ld	(hl), a
;./text/text.h:189: for (uint16_t j = 0; j < delay_ms / 16; j++) { wait_vbl_done(); }
	ld	de, #0x0000
00129$:
	ld	l, e
;	spillPairReg hl
;	spillPairReg hl
	ld	h, d
;	spillPairReg hl
;	spillPairReg hl
	ld	a, l
	sub	a, c
	ld	a, h
	sbc	a, b
	jr	NC, 00133$
	call	_wait_vbl_done
	inc	de
	jr	00129$
00133$:
;./text/text.h:185: for (uint8_t i = 0; i < word_length; i++) {
	ldhl	sp,	#11
	inc	(hl)
	jr	00132$
00113$:
;./text/text.h:191: cursor_x++; // Espacio después de la palabra
;./text/text.h:192: current_word += word_length;
	ldhl	sp,#9
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ldhl	sp,	#5
	ld	l, (hl)
	ld	h, #0x00
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#11
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#10
	ld	(hl), a
00116$:
;./text/text.h:196: if (cursor_x > x + line_width) {
	ldhl	sp,	#12
	ld	c, (hl)
	ld	b, #0x00
	ldhl	sp,	#3
	ld	a, (hl+)
	sub	a, c
	ld	a, (hl)
	sbc	a, b
	ld	d, (hl)
	ld	a, b
	bit	7,a
	jr	Z, 00275$
	bit	7, d
	jr	NZ, 00276$
	cp	a, a
	jr	00276$
00275$:
	bit	7, d
	jr	Z, 00276$
	scf
00276$:
	jp	NC, 00119$
;./text/text.h:197: cursor_x = x;
	ldhl	sp,	#7
	ld	a, (hl)
	ldhl	sp,	#12
	ld	(hl), a
;./text/text.h:198: cursor_y++;
	ldhl	sp,	#8
	inc	(hl)
	jp	00119$
00134$:
;./text/text.h:201: }
	add	sp, #13
	pop	hl
	add	sp, #4
	jp	(hl)
;./text/text.h:206: void draw_dynamic_text_slowly(uint8_t x, uint8_t y, uint16_t delay_ms, const char *text, const char *name, uint16_t score) {
;	---------------------------------
; Function draw_dynamic_text_slowly
; ---------------------------------
_draw_dynamic_text_slowly::
	add	sp, #-128
	ld	d, a
;./text/text.h:210: if (name && score) {
	ld	hl, #135
	add	hl, sp
	ld	a, (hl-)
	or	a, (hl)
	jr	Z, 00110$
	ld	hl, #137
	add	hl, sp
	ld	a, (hl-)
	or	a, (hl)
	jr	Z, 00110$
;./text/text.h:211: sprintf(formatted_text, text, name, score);
	push	de
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	push	bc
	ld	hl, #138
	add	hl, sp
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	push	bc
	ld	hl, #138
	add	hl, sp
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	push	bc
	ld	hl, #8
	add	hl, sp
	push	hl
	call	_sprintf
	add	sp, #8
	pop	de
	jr	00111$
00110$:
;./text/text.h:213: else if (name && !score) {
	ld	hl, #135
	add	hl, sp
	ld	a, (hl-)
	or	a, (hl)
	jr	Z, 00106$
	ld	hl, #137
	add	hl, sp
	ld	a, (hl-)
	or	a, (hl)
	jr	NZ, 00106$
;./text/text.h:214: sprintf(formatted_text, text, name);
	dec	hl
	dec	hl
	push	de
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	push	bc
	ld	hl, #136
	add	hl, sp
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	push	bc
	ld	hl, #6
	add	hl, sp
	push	hl
	call	_sprintf
	add	sp, #6
	pop	de
	jr	00111$
00106$:
;./text/text.h:216: else if (!name && score) {
	ld	hl, #135
	add	hl, sp
	ld	a, (hl-)
	or	a, (hl)
	jr	NZ, 00102$
	ld	hl, #137
	add	hl, sp
	ld	a, (hl-)
	or	a, (hl)
	jr	Z, 00102$
;./text/text.h:217: sprintf(formatted_text, text, score);
	push	de
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	push	bc
	ld	hl, #136
	add	hl, sp
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	push	bc
	ld	hl, #6
	add	hl, sp
	push	hl
	call	_sprintf
	add	sp, #6
	pop	de
	jr	00111$
00102$:
;./text/text.h:220: sprintf(formatted_text, text);
	push	de
	ld	hl, #134
	add	hl, sp
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	push	bc
	ld	hl, #4
	add	hl, sp
	push	hl
	call	_sprintf
	add	sp, #4
	pop	de
00111$:
;./text/text.h:224: draw_text_slowly(x, y, formatted_text, delay_ms);
	ld	hl, #130
	add	hl, sp
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	push	bc
	ld	hl, #2
	add	hl, sp
	push	hl
	ld	a, d
	call	_draw_text_slowly
;./text/text.h:225: }
	add	sp, #127
	inc	sp
	pop	hl
	add	sp, #8
	jp	(hl)
;./text/text.h:228: uint8_t display_text_box(const char *text, const char *name, uint16_t score) {
;	---------------------------------
; Function display_text_box
; ---------------------------------
_display_text_box::
;./text/text.h:229: DISPLAY_OFF;
	call	_display_off
;./text/text.h:230: draw_text_box(); // Dibuja el cuadro de texto en la parte inferior
	push	bc
	push	de
	call	_draw_text_box
	pop	de
	pop	bc
;./text/text.h:231: DISPLAY_ON;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x80
	ldh	(_LCDC_REG + 0), a
;./text/text.h:236: draw_dynamic_text_slowly(1, 11, 100, text, name, score);
	ldhl	sp,	#2
	ld	a, (hl+)
	ld	h, (hl)
;	spillPairReg hl
;	spillPairReg hl
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	push	hl
	push	bc
	push	de
	ld	de, #0x0064
	push	de
	ld	e, #0x0b
	ld	a, #0x01
	call	_draw_dynamic_text_slowly
;./text/text.h:237: return 1;
	ld	a, #0x01
;./text/text.h:238: }
	pop	hl
	pop	bc
	jp	(hl)
;./actions/fire.h:29: void fire_single_bullet(UINT8 x, UINT8 y) {
;	---------------------------------
; Function fire_single_bullet
; ---------------------------------
_fire_single_bullet::
	ld	c, a
;./actions/fire.h:30: if (!bullet_active) { // Solo disparar si no hay un disparo activo
	ld	a, (#_bullet_active)
	or	a, a
	ret	NZ
;./actions/fire.h:31: bullet_x = x + 16; // Ajuste horizontal para iniciar a la derecha del personaje
	ld	a, c
	add	a, #0x10
	ld	(#_bullet_x),a
;./actions/fire.h:32: bullet_y = y + 8;  // Ajuste vertical para centrar el disparo
	ld	a, e
	add	a, #0x08
	ld	(#_bullet_y),a
;./actions/fire.h:33: bullet_active = 1; // Marca el disparo como activo
	ld	hl, #_bullet_active
	ld	(hl), #0x01
;./actions/fire.h:34: move_sprite(5, bullet_x, bullet_y); // Muestra el sprite del disparo
	ld	hl, #_bullet_y
	ld	b, (hl)
	ld	hl, #_bullet_x
	ld	c, (hl)
;c:\gbdk\include\gb\gb.h:1877: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 20)
;c:\gbdk\include\gb\gb.h:1878: itm->y=y, itm->x=x;
	ld	a, b
	ld	(hl+), a
	ld	(hl), c
;./actions/fire.h:34: move_sprite(5, bullet_x, bullet_y); // Muestra el sprite del disparo
;./actions/fire.h:36: }
	ret
;./actions/fire.h:39: void fire_spread(UINT8 x, UINT8 y) {
;	---------------------------------
; Function fire_spread
; ---------------------------------
_fire_spread::
	add	sp, #-3
	ld	c, a
	ldhl	sp,	#2
	ld	(hl), e
;./actions/fire.h:40: if (fire_delay == 0) { // Solo dispara si no hay retraso activo
	ld	a, (#_fire_delay)
;./actions/fire.h:41: for (UINT8 i = 0; i < 3; i++) {
	or	a,a
	jp	NZ,00116$
	ld	b,a
00114$:
	ld	a, b
	sub	a, #0x03
	jp	NC, 00109$
;./actions/fire.h:42: if (!spread_bullet_active[i]) {
	ld	de, #_spread_bullet_active+0
	ld	l, b
	ld	h, #0x00
	add	hl, de
	ld	a, (hl)
	or	a, a
	jp	NZ, 00115$
;./actions/fire.h:43: spread_bullet_x[i] = x + 16; // Todas las balas empiezan justo a la derecha del personaje
	ld	de, #_spread_bullet_x+0
	ld	l, b
	ld	h, #0x00
	add	hl, de
	ld	a, c
	add	a, #0x10
	ld	(hl), a
;./actions/fire.h:44: spread_bullet_y[i] = y + 8;  // Centra las balas verticalmente respecto al personaje
	ld	de, #_spread_bullet_y+0
	ld	a, e
	add	a, b
	ld	e, a
	jr	NC, 00161$
	inc	d
00161$:
	ldhl	sp,	#2
	ld	a, (hl)
	add	a, #0x08
	ld	(de), a
;./actions/fire.h:47: spread_bullet_dx[i] = 2; // Todas las balas se mueven horizontalmente
	ld	de, #_spread_bullet_dx+0
	ld	l, b
	ld	h, #0x00
	add	hl, de
	ld	(hl), #0x02
;./actions/fire.h:49: if      (i == 1)  { spread_bullet_dy[i] = -1; } // Bala superior (diagonal hacia arriba)
	ld	a, b
	dec	a
	jr	NZ, 00105$
	ld	de, #_spread_bullet_dy+0
	ld	l, b
	ld	h, #0x00
	add	hl, de
	ld	(hl), #0xff
	jr	00106$
00105$:
;./actions/fire.h:50: else if (i == 2)  { spread_bullet_dy[i] = 1; } // Bala inferior (diagonal hacia abajo)
	ld	a, b
	sub	a, #0x02
	jr	NZ, 00102$
	ld	de, #_spread_bullet_dy+0
	ld	l, b
	ld	h, #0x00
	add	hl, de
	ld	(hl), #0x01
	jr	00106$
00102$:
;./actions/fire.h:51: else              { spread_bullet_dy[i] = 0; } // Bala central (horizontal)
	ld	de, #_spread_bullet_dy+0
	ld	l, b
	ld	h, #0x00
	add	hl, de
	ld	(hl), #0x00
00106$:
;./actions/fire.h:53: spread_bullet_active[i] = 1; // Marca la bala como activa
	ld	de, #_spread_bullet_active+0
	ld	l, b
	ld	h, #0x00
	add	hl, de
	ld	(hl), #0x01
;./actions/fire.h:54: move_sprite(5 + i, spread_bullet_x[i], spread_bullet_y[i]); // Muestra el sprite de la bala
	ld	de, #_spread_bullet_y+0
	ld	l, b
	ld	h, #0x00
	add	hl, de
	ld	a, (hl)
	ldhl	sp,	#0
	ld	(hl), a
	ld	de, #_spread_bullet_x+0
	ld	l, b
	ld	h, #0x00
	add	hl, de
	ld	a, (hl)
	ldhl	sp,	#1
	ld	(hl), a
	ld	a, b
	add	a, #0x05
	ld	e, a
;c:\gbdk\include\gb\gb.h:1877: OAM_item_t * itm = &shadow_OAM[nb];
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	ld	l, e
	add	hl, hl
	add	hl, hl
	ld	de, #_shadow_OAM
	add	hl, de
	ld	e, l
	ld	d, h
;c:\gbdk\include\gb\gb.h:1878: itm->y=y, itm->x=x;
	ldhl	sp,	#0
	ld	a, (hl+)
	ld	(de), a
	inc	de
	ld	a, (hl)
	ld	(de), a
;./actions/fire.h:54: move_sprite(5 + i, spread_bullet_x[i], spread_bullet_y[i]); // Muestra el sprite de la bala
00115$:
;./actions/fire.h:41: for (UINT8 i = 0; i < 3; i++) {
	inc	b
	jp	00114$
00109$:
;./actions/fire.h:57: fire_delay = 10; // Establece un retraso de 10 frames antes del siguiente disparo
	ld	hl, #_fire_delay
	ld	(hl), #0x0a
00116$:
;./actions/fire.h:59: }
	add	sp, #3
	ret
;./actions/fire.h:62: void update_single_bullet(void) {
;	---------------------------------
; Function update_single_bullet
; ---------------------------------
_update_single_bullet::
;./actions/fire.h:63: if (bullet_active) {
	ld	a, (#_bullet_active)
	or	a, a
	ret	Z
;./actions/fire.h:64: bullet_x += 3;            // Mover hacia la derecha
	ld	hl, #_bullet_x
	ld	a, (hl)
	add	a, #0x03
	ld	(hl), a
;./actions/fire.h:66: if (bullet_x > 160) {     // Disparo horizontal
	ld	a, #0xa0
	sub	a, (hl)
	jr	NC, 00102$
;./actions/fire.h:67: bullet_active = 0;      // Desactiva el disparo
	ld	hl, #_bullet_active
	ld	(hl), #0x00
;c:\gbdk\include\gb\gb.h:1877: OAM_item_t * itm = &shadow_OAM[nb];
	ld	bc, #_shadow_OAM+20
;c:\gbdk\include\gb\gb.h:1878: itm->y=y, itm->x=x;
	xor	a, a
	ld	(bc), a
	inc	bc
	xor	a, a
	ld	(bc), a
;./actions/fire.h:68: move_sprite(5, 0, 0);   // Oculta el sprite del disparo
	ret
00102$:
;./actions/fire.h:71: move_sprite(5, bullet_x, bullet_y); // Actualiza la posición del sprite
	ld	hl, #_bullet_y
	ld	b, (hl)
	ld	hl, #_bullet_x
	ld	c, (hl)
;c:\gbdk\include\gb\gb.h:1877: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 20)
;c:\gbdk\include\gb\gb.h:1878: itm->y=y, itm->x=x;
	ld	a, b
	ld	(hl+), a
	ld	(hl), c
;./actions/fire.h:71: move_sprite(5, bullet_x, bullet_y); // Actualiza la posición del sprite
;./actions/fire.h:74: }
	ret
;./actions/fire.h:77: void update_spread_bullets(void) {
;	---------------------------------
; Function update_spread_bullets
; ---------------------------------
_update_spread_bullets::
	dec	sp
	dec	sp
;./actions/fire.h:78: for (UINT8 i = 0; i < 3; i++) {
	ld	c, #0x00
00112$:
	ld	a, c
	sub	a, #0x03
	jp	NC, 00114$
;./actions/fire.h:79: if (spread_bullet_active[i]) {
	ld	hl, #_spread_bullet_active
	ld	b, #0x00
	add	hl, bc
	ld	a, (hl)
	or	a, a
	jp	Z, 00113$
;./actions/fire.h:80: spread_bullet_x[i] += 2; // Movimiento horizontal para todas las balas
	ld	de, #_spread_bullet_x+0
	ld	a, e
	add	a, c
	ld	e, a
	jr	NC, 00152$
	inc	d
00152$:
	ld	hl, #_spread_bullet_x
	ld	b, #0x00
	add	hl, bc
	ld	a, (hl)
	add	a, #0x02
	ld	(de), a
;./actions/fire.h:85: spread_bullet_x[i] += spread_bullet_dx[i]; // Movimiento horizontal
	ld	a, #<(_spread_bullet_x)
	add	a, c
	ld	e, a
	ld	a, #>(_spread_bullet_x)
	adc	a, #0x00
	ld	d, a
	ld	hl, #_spread_bullet_x
	ld	b, #0x00
	add	hl, bc
	ld	b, (hl)
	ld	a, #<(_spread_bullet_dx)
	add	a, c
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #>(_spread_bullet_dx)
	adc	a, #0x00
	ld	h, a
;	spillPairReg hl
;	spillPairReg hl
	ld	a, (hl)
	ld	l, b
;	spillPairReg hl
;	spillPairReg hl
	add	a, l
	ld	(de), a
;./actions/fire.h:86: spread_bullet_y[i] += spread_bullet_dy[i]; // Movimiento vertical
	ld	a, #<(_spread_bullet_y)
	add	a, c
	ld	e, a
	ld	a, #>(_spread_bullet_y)
	adc	a, #0x00
	ld	d, a
	ld	hl, #_spread_bullet_y
	ld	b, #0x00
	add	hl, bc
	ld	b, (hl)
	ld	a, #<(_spread_bullet_dy)
	add	a, c
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #>(_spread_bullet_dy)
	adc	a, #0x00
	ld	h, a
;	spillPairReg hl
;	spillPairReg hl
	ld	a, (hl)
	ld	l, b
;	spillPairReg hl
;	spillPairReg hl
	add	a, l
	ld	(de), a
;./actions/fire.h:89: if (spread_bullet_x[i] > 160 || spread_bullet_y[i] < 8 || spread_bullet_y[i] > 152) {
	ld	hl, #_spread_bullet_x
	ld	b, #0x00
	add	hl, bc
	ld	b, (hl)
	ld	a, #0xa0
	sub	a, b
	jr	C, 00101$
	ld	hl, #_spread_bullet_y
	ld	b, #0x00
	add	hl, bc
	ld	a, (hl)
	sub	a, #0x08
	jr	C, 00101$
	ld	hl, #_spread_bullet_y
	ld	b, #0x00
	add	hl, bc
	ld	b, (hl)
	ld	a, #0x98
	sub	a, b
	jr	NC, 00102$
00101$:
;./actions/fire.h:90: spread_bullet_active[i] = 0;
	ld	hl, #_spread_bullet_active
	ld	b, #0x00
	add	hl, bc
	ld	(hl), #0x00
;./actions/fire.h:91: move_sprite(5 + i, 0, 0); // Oculta el sprite
	ld	a, c
	add	a, #0x05
;c:\gbdk\include\gb\gb.h:1877: OAM_item_t * itm = &shadow_OAM[nb];
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	ld	de, #_shadow_OAM
	add	hl, de
;c:\gbdk\include\gb\gb.h:1878: itm->y=y, itm->x=x;
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
;./actions/fire.h:91: move_sprite(5 + i, 0, 0); // Oculta el sprite
	jr	00113$
00102$:
;./actions/fire.h:94: move_sprite(5 + i, spread_bullet_x[i], spread_bullet_y[i]); // Actualiza la posición
	ld	hl, #_spread_bullet_y
	ld	b, #0x00
	add	hl, bc
	ld	a, (hl)
	ldhl	sp,	#0
	ld	(hl), a
	ld	hl, #_spread_bullet_x
	ld	b, #0x00
	add	hl, bc
	ld	a, (hl)
	ldhl	sp,	#1
	ld	(hl), a
	ld	a, c
	add	a, #0x05
	ld	b, a
;c:\gbdk\include\gb\gb.h:1877: OAM_item_t * itm = &shadow_OAM[nb];
	ld	de, #_shadow_OAM+0
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	ld	l, b
	add	hl, hl
	add	hl, hl
	add	hl, de
	ld	e, l
	ld	d, h
;c:\gbdk\include\gb\gb.h:1878: itm->y=y, itm->x=x;
	ldhl	sp,	#0
	ld	a, (hl+)
	ld	(de), a
	inc	de
	ld	a, (hl)
	ld	(de), a
;./actions/fire.h:94: move_sprite(5 + i, spread_bullet_x[i], spread_bullet_y[i]); // Actualiza la posición
00113$:
;./actions/fire.h:78: for (UINT8 i = 0; i < 3; i++) {
	inc	c
	jp	00112$
00114$:
;./actions/fire.h:98: }
	inc	sp
	inc	sp
	ret
;./actions/fire.h:101: void decrease_fire_delay(void) {
;	---------------------------------
; Function decrease_fire_delay
; ---------------------------------
_decrease_fire_delay::
;./actions/fire.h:102: if (fire_delay > 0) {
	ld	hl, #_fire_delay
	ld	a, (hl)
	or	a, a
	ret	Z
;./actions/fire.h:103: fire_delay--;
	dec	(hl)
	ld	a, (hl)
;./actions/fire.h:105: }
	ret
;./sprites/clean.h:16: void hide_unused_sprites(UINT8 start_id) {
;	---------------------------------
; Function hide_unused_sprites
; ---------------------------------
_hide_unused_sprites::
	ld	c, a
;./sprites/clean.h:17: for (UINT8 i = start_id; i < 40; i++) {
00104$:
	ld	a, c
	sub	a, #0x28
	ret	NC
;c:\gbdk\include\gb\gb.h:1877: OAM_item_t * itm = &shadow_OAM[nb];
	ld	de, #_shadow_OAM+0
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	add	hl, de
;c:\gbdk\include\gb\gb.h:1878: itm->y=y, itm->x=x;
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
;./sprites/clean.h:17: for (UINT8 i = start_id; i < 40; i++) {
	inc	c
;./sprites/clean.h:20: }
	jr	00104$
;./sprites/clean.h:23: void hide_all_sprites(void) {
;	---------------------------------
; Function hide_all_sprites
; ---------------------------------
_hide_all_sprites::
;./sprites/clean.h:24: for (UINT8 i = 0; i < 40; i++) {
	ld	c, #0x00
00104$:
	ld	a, c
	sub	a, #0x28
	ret	NC
;c:\gbdk\include\gb\gb.h:1877: OAM_item_t * itm = &shadow_OAM[nb];
	ld	de, #_shadow_OAM+0
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	add	hl, de
;c:\gbdk\include\gb\gb.h:1878: itm->y=y, itm->x=x;
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
;./sprites/clean.h:24: for (UINT8 i = 0; i < 40; i++) {
	inc	c
;./sprites/clean.h:27: }
	jr	00104$
;./sprites/clean.h:30: void clear_vram(void) {
;	---------------------------------
; Function clear_vram
; ---------------------------------
_clear_vram::
	ld	hl, #-376
	add	hl, sp
	ld	sp, hl
;./sprites/clean.h:32: const uint8_t empty_tile[16] = { 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 };
	ldhl	sp,	#0
	ld	c, l
	ld	b, h
	xor	a, a
	ld	(bc), a
	ldhl	sp,	#1
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
;./sprites/clean.h:34: const uint8_t empty_map[360] = {0};
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
;./sprites/clean.h:36: DISPLAY_OFF; // Apaga pantalla antes de manipular la VRAM
	call	_display_off
;./sprites/clean.h:37: set_bkg_data(0, 1, empty_tile); // Carga el tile vacío en el índice 0
	push	bc
	xor	a, a
	inc	a
	push	af
	call	_set_bkg_data
	add	sp, #4
;./sprites/clean.h:38: set_bkg_tiles(0, 0, 20, 18, empty_map); // Llena toda la pantalla con el tile vacío
	ld	hl, #16
	add	hl, sp
	push	hl
	ld	hl, #0x1214
	push	hl
	xor	a, a
	rrca
	push	af
	call	_set_bkg_tiles
	add	sp, #6
;./sprites/clean.h:39: hide_all_sprites(); // Mueve todos los sprites fuera de la pantalla colocando cada sprite en la posición (0, 0)
	call	_hide_all_sprites
;./sprites/clean.h:40: DISPLAY_ON; // Enciende la pantalla después de limpiar
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x80
	ldh	(_LCDC_REG + 0), a
;./sprites/clean.h:41: }
	ld	hl, #376
	add	hl, sp
	ld	sp, hl
	ret
;./sprites/sprite_generate.h:27: void load_16_x_16_sprite(uint8_t sprite_index, const uint8_t *character_sprite, uint8_t character_x, uint8_t character_y) {
;	---------------------------------
; Function load_16_x_16_sprite
; ---------------------------------
_load_16_x_16_sprite::
	add	sp, #-5
	ldhl	sp,	#4
	ld	(hl), a
;./sprites/sprite_generate.h:28: set_sprite_data(sprite_index, 4, character_sprite); // Carga los datos de los tiles en VRAM
	push	de
	ld	a, #0x04
	push	af
	inc	sp
	ld	a, (hl)
	push	af
	inc	sp
	call	_set_sprite_data
	add	sp, #4
;./sprites/sprite_generate.h:31: for (uint8_t i = 0; i < 4; i++) {
	ld	c, #0x00
00105$:
	ld	a, c
	sub	a, #0x04
	jr	NC, 00107$
;./sprites/sprite_generate.h:32: set_sprite_tile(sprite_index + i, sprite_index + i); // Asigna el tile en VRAM
	ldhl	sp,	#4
	ld	a, (hl)
	add	a, c
	ld	e, a
	ld	b, e
;c:\gbdk\include\gb\gb.h:1804: shadow_OAM[nb].tile=tile;
	xor	a, a
	sla	e
	adc	a, a
	sla	e
	adc	a, a
	ldhl	sp,	#0
	ld	(hl), e
	inc	hl
	ld	(hl), a
	ld	de, #_shadow_OAM
	pop	hl
	push	hl
	add	hl, de
	inc	hl
	inc	hl
	ld	e, l
	ld	d, h
	ld	a, b
	ld	(de), a
;./sprites/sprite_generate.h:33: move_sprite(sprite_index + i, character_x + map_4_tiles_offsets[i][0], character_y + map_4_tiles_offsets[i][1]); // Posición del tile
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	ld	a, l
	add	a, #<(_map_4_tiles_offsets)
	ld	e, a
	ld	a, h
	adc	a, #>(_map_4_tiles_offsets)
	ld	d, a
	ld	l, e
;	spillPairReg hl
;	spillPairReg hl
	ld	h, d
;	spillPairReg hl
;	spillPairReg hl
	inc	hl
	ld	a, (hl)
	ldhl	sp,	#8
	ld	b, (hl)
	add	a, b
	ldhl	sp,	#2
	ld	(hl), a
	ld	a, (de)
	ldhl	sp,	#7
	ld	b, (hl)
	add	a, b
	ldhl	sp,	#3
	ld	(hl), a
;c:\gbdk\include\gb\gb.h:1877: OAM_item_t * itm = &shadow_OAM[nb];
	ld	de, #_shadow_OAM
	pop	hl
	push	hl
	add	hl, de
	ld	e, l
	ld	d, h
;c:\gbdk\include\gb\gb.h:1878: itm->y=y, itm->x=x;
	ldhl	sp,	#2
	ld	a, (hl+)
	ld	(de), a
	inc	de
	ld	a, (hl)
	ld	(de), a
;./sprites/sprite_generate.h:31: for (uint8_t i = 0; i < 4; i++) {
	inc	c
	jr	00105$
00107$:
;./sprites/sprite_generate.h:35: }
	add	sp, #5
	pop	hl
	pop	af
	jp	(hl)
_arche_32x32_normal_sprite:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x06	; 6
	.db #0x07	; 7
	.db #0x0c	; 12
	.db #0x0b	; 11
	.db #0xf0	; 240
	.db #0xff	; 255
	.db #0x46	; 70	'F'
	.db #0x7f	; 127
	.db #0x38	; 56	'8'
	.db #0x3f	; 63
	.db #0x0b	; 11
	.db #0x0f	; 15
	.db #0x16	; 22
	.db #0x1f	; 31
	.db #0x1d	; 29
	.db #0x16	; 22
	.db #0x2f	; 47
	.db #0x31	; 49	'1'
	.db #0x25	; 37
	.db #0x3b	; 59
	.db #0x33	; 51	'3'
	.db #0x3f	; 63
	.db #0x13	; 19
	.db #0x1f	; 31
	.db #0x1e	; 30
	.db #0x1f	; 31
	.db #0x0e	; 14
	.db #0x0e	; 14
	.db #0x3d	; 61
	.db #0x3d	; 61
	.db #0xe2	; 226
	.db #0xfe	; 254
	.db #0xcf	; 207
	.db #0x3d	; 61
	.db #0x21	; 33
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x29	; 41
	.db #0xff	; 255
	.db #0x48	; 72	'H'
	.db #0xff	; 255
	.db #0xee	; 238
	.db #0x5f	; 95
	.db #0x5b	; 91
	.db #0xef	; 239
	.db #0xfb	; 251
	.db #0xef	; 239
	.db #0xaa	; 170
	.db #0xba	; 186
	.db #0x9b	; 155
	.db #0x9b	; 155
	.db #0x8b	; 139
	.db #0x8b	; 139
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x1d	; 29
	.db #0x1f	; 31
	.db #0x1c	; 28
	.db #0x17	; 23
	.db #0x16	; 22
	.db #0x1f	; 31
	.db #0x0b	; 11
	.db #0x0b	; 11
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x06	; 6
	.db #0x0a	; 10
	.db #0x0f	; 15
	.db #0x39	; 57	'9'
	.db #0x3f	; 63
	.db #0x5a	; 90	'Z'
	.db #0x67	; 103	'g'
	.db #0x7e	; 126
	.db #0x45	; 69	'E'
	.db #0x5f	; 95
	.db #0x63	; 99	'c'
	.db #0x16	; 22
	.db #0x1f	; 31
	.db #0x0b	; 11
	.db #0x0b	; 11
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0xc0	; 192
	.db #0xc1	; 193
	.db #0xff	; 255
	.db #0x7f	; 127
	.db #0x57	; 87	'W'
	.db #0xbc	; 188
	.db #0xa9	; 169
	.db #0x7f	; 127
	.db #0xf1	; 241
	.db #0x3f	; 63
	.db #0xfb	; 251
	.db #0x5f	; 95
	.db #0xff	; 255
	.db #0xcf	; 207
	.db #0x7a	; 122	'z'
	.db #0xd7	; 215
	.db #0x37	; 55	'7'
	.db #0xfa	; 250
	.db #0x1b	; 27
	.db #0xfe	; 254
	.db #0x31	; 49	'1'
	.db #0xf1	; 241
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0xa7	; 167
	.db #0xa7	; 167
	.db #0xfb	; 251
	.db #0xfc	; 252
	.db #0x4e	; 78	'N'
	.db #0xff	; 255
	.db #0x07	; 7
	.db #0xff	; 255
	.db #0x73	; 115	's'
	.db #0xff	; 255
	.db #0x0f	; 15
	.db #0xff	; 255
	.db #0x47	; 71	'G'
	.db #0xff	; 255
	.db #0x33	; 51	'3'
	.db #0xfe	; 254
	.db #0x55	; 85	'U'
	.db #0xbb	; 187
	.db #0x9d	; 157
	.db #0xef	; 239
	.db #0xdd	; 221
	.db #0x6f	; 111	'o'
	.db #0x4d	; 77	'M'
	.db #0xff	; 255
	.db #0xef	; 239
	.db #0xff	; 255
	.db #0x6f	; 111	'o'
	.db #0x7f	; 127
	.db #0x37	; 55	'7'
	.db #0x3f	; 63
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x40	; 64
	.db #0xc0	; 192
	.db #0x20	; 32
	.db #0xc0	; 192
	.db #0x90	; 144
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0x70	; 112	'p'
	.db #0xf8	; 248
	.db #0x78	; 120	'x'
	.db #0xe8	; 232
	.db #0x28	; 40
	.db #0xe0	; 224
	.db #0xe0	; 224
	.db #0xd0	; 208
	.db #0xf0	; 240
	.db #0x68	; 104	'h'
	.db #0xf8	; 248
	.db #0xb8	; 184
	.db #0x68	; 104	'h'
	.db #0x74	; 116	't'
	.db #0xac	; 172
	.db #0x4c	; 76	'L'
	.db #0xb4	; 180
	.db #0x4c	; 76	'L'
	.db #0xb4	; 180
	.db #0x7c	; 124
	.db #0x94	; 148
	.db #0x27	; 39
	.db #0x3f	; 63
	.db #0x2f	; 47
	.db #0x3f	; 63
	.db #0x5f	; 95
	.db #0x73	; 115	's'
	.db #0xff	; 255
	.db #0xf3	; 243
	.db #0xfd	; 253
	.db #0xbd	; 189
	.db #0xd1	; 209
	.db #0xb1	; 177
	.db #0xa9	; 169
	.db #0xd9	; 217
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0xc8	; 200
	.db #0xf8	; 248
	.db #0xec	; 236
	.db #0x7c	; 124
	.db #0xf7	; 247
	.db #0x2f	; 47
	.db #0xe6	; 230
	.db #0x3d	; 61
	.db #0xf7	; 247
	.db #0x2d	; 45
	.db #0x7c	; 124
	.db #0xff	; 255
	.db #0xc7	; 199
	.db #0xc7	; 199
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xb4	; 180
	.db #0xdc	; 220
	.db #0xac	; 172
	.db #0xcc	; 204
	.db #0xac	; 172
	.db #0xcc	; 204
	.db #0xa4	; 164
	.db #0xc4	; 196
	.db #0xa0	; 160
	.db #0xc0	; 192
	.db #0x80	; 128
	.db #0xe0	; 224
	.db #0xa6	; 166
	.db #0xe6	; 230
	.db #0xef	; 239
	.db #0xeb	; 235
	.db #0xd5	; 213
	.db #0xdb	; 219
	.db #0x8f	; 143
	.db #0x93	; 147
	.db #0xed	; 237
	.db #0xff	; 255
	.db #0x1b	; 27
	.db #0xfd	; 253
	.db #0xfd	; 253
	.db #0x03	; 3
	.db #0xf2	; 242
	.db #0xfe	; 254
	.db #0xe4	; 228
	.db #0xfc	; 252
	.db #0x38	; 56	'8'
	.db #0x38	; 56	'8'
_arche_sprite_tiles:
	.db #0x73	; 115	's'
	.db #0x73	; 115	's'
	.db #0x8e	; 142
	.db #0xff	; 255
	.db #0x43	; 67	'C'
	.db #0x7f	; 127
	.db #0x84	; 132
	.db #0xff	; 255
	.db #0x88	; 136
	.db #0xff	; 255
	.db #0x88	; 136
	.db #0xff	; 255
	.db #0xc8	; 200
	.db #0xbf	; 191
	.db #0xc9	; 201
	.db #0xbf	; 191
	.db #0xcc	; 204
	.db #0xcc	; 204
	.db #0x32	; 50	'2'
	.db #0xfe	; 254
	.db #0x14	; 20
	.db #0xec	; 236
	.db #0x3a	; 58
	.db #0xc6	; 198
	.db #0x7e	; 126
	.db #0x82	; 130
	.db #0x2a	; 42
	.db #0xfe	; 254
	.db #0xaa	; 170
	.db #0xfe	; 254
	.db #0xd4	; 212
	.db #0xfc	; 252
	.db #0x98	; 152
	.db #0xff	; 255
	.db #0x95	; 149
	.db #0xf7	; 247
	.db #0x93	; 147
	.db #0xf3	; 243
	.db #0x3a	; 58
	.db #0x7b	; 123
	.db #0x7e	; 126
	.db #0x67	; 103	'g'
	.db #0xff	; 255
	.db #0x83	; 131
	.db #0x7e	; 126
	.db #0x7e	; 126
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xfc	; 252
	.db #0xac	; 172
	.db #0xfc	; 252
	.db #0xa4	; 164
	.db #0xfc	; 252
	.db #0x04	; 4
	.db #0xf8	; 248
	.db #0xf8	; 248
	.db #0x30	; 48	'0'
	.db #0xf0	; 240
	.db #0xf8	; 248
	.db #0xc8	; 200
	.db #0xf8	; 248
	.db #0x98	; 152
	.db #0x70	; 112	'p'
	.db #0x70	; 112	'p'
_bullet_tile:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x3c	; 60
	.db #0x3c	; 60
	.db #0x3c	; 60
	.db #0x3c	; 60
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
_row1_offsets:
	.db #0x00	;  0
	.db #0x00	;  0
	.db #0x08	;  8
	.db #0x00	;  0
	.db #0x10	;  16
	.db #0x00	;  0
	.db #0x18	;  24
	.db #0x00	;  0
_row2_offsets:
	.db #0x00	;  0
	.db #0x08	;  8
	.db #0x08	;  8
	.db #0x08	;  8
	.db #0x10	;  16
	.db #0x08	;  8
	.db #0x18	;  24
	.db #0x08	;  8
_map_4_tiles_offsets:
	.db #0x00	;  0
	.db #0x00	;  0
	.db #0x08	;  8
	.db #0x00	;  0
	.db #0x00	;  0
	.db #0x08	;  8
	.db #0x08	;  8
	.db #0x08	;  8
_map_16_x_16_offsets:
	.db #0x00	;  0
	.db #0x00	;  0
	.db #0x08	;  8
	.db #0x00	;  0
	.db #0x00	;  0
	.db #0x08	;  8
	.db #0x08	;  8
	.db #0x08	;  8
	.db #0x10	;  16
	.db #0x00	;  0
	.db #0x10	;  16
	.db #0x08	;  8
	.db #0x18	;  24
	.db #0x00	;  0
	.db #0x18	;  24
	.db #0x08	;  8
_map_32_x_32_offsets:
	.db #0x00	;  0
	.db #0x00	;  0
	.db #0x00	;  0
	.db #0x08	;  8
	.db #0x08	;  8
	.db #0x00	;  0
	.db #0x08	;  8
	.db #0x08	;  8
	.db #0x00	;  0
	.db #0x10	;  16
	.db #0x00	;  0
	.db #0x18	;  24
	.db #0x08	;  8
	.db #0x10	;  16
	.db #0x08	;  8
	.db #0x18	;  24
	.db #0x10	;  16
	.db #0x00	;  0
	.db #0x10	;  16
	.db #0x08	;  8
	.db #0x18	;  24
	.db #0x00	;  0
	.db #0x18	;  24
	.db #0x08	;  8
	.db #0x10	;  16
	.db #0x10	;  16
	.db #0x10	;  16
	.db #0x18	;  24
	.db #0x18	;  24
	.db #0x10	;  16
	.db #0x18	;  24
	.db #0x18	;  24
_map_48_x_48_offsets:
	.db #0x00	;  0
	.db #0x00	;  0
	.db #0x08	;  8
	.db #0x00	;  0
	.db #0x10	;  16
	.db #0x00	;  0
	.db #0x18	;  24
	.db #0x00	;  0
	.db #0x20	;  32
	.db #0x00	;  0
	.db #0x28	;  40
	.db #0x00	;  0
	.db #0x00	;  0
	.db #0x08	;  8
	.db #0x08	;  8
	.db #0x08	;  8
	.db #0x10	;  16
	.db #0x08	;  8
	.db #0x18	;  24
	.db #0x08	;  8
	.db #0x20	;  32
	.db #0x08	;  8
	.db #0x28	;  40
	.db #0x08	;  8
	.db #0x00	;  0
	.db #0x10	;  16
	.db #0x08	;  8
	.db #0x10	;  16
	.db #0x10	;  16
	.db #0x10	;  16
	.db #0x18	;  24
	.db #0x10	;  16
	.db #0x20	;  32
	.db #0x10	;  16
	.db #0x28	;  40
	.db #0x10	;  16
	.db #0x00	;  0
	.db #0x18	;  24
	.db #0x08	;  8
	.db #0x18	;  24
	.db #0x10	;  16
	.db #0x18	;  24
	.db #0x18	;  24
	.db #0x18	;  24
	.db #0x20	;  32
	.db #0x18	;  24
	.db #0x28	;  40
	.db #0x18	;  24
	.db #0x00	;  0
	.db #0x20	;  32
	.db #0x08	;  8
	.db #0x20	;  32
	.db #0x10	;  16
	.db #0x20	;  32
	.db #0x18	;  24
	.db #0x20	;  32
	.db #0x20	;  32
	.db #0x20	;  32
	.db #0x28	;  40
	.db #0x20	;  32
	.db #0x00	;  0
	.db #0x28	;  40
	.db #0x08	;  8
	.db #0x28	;  40
	.db #0x10	;  16
	.db #0x28	;  40
	.db #0x18	;  24
	.db #0x28	;  40
	.db #0x20	;  32
	.db #0x28	;  40
	.db #0x28	;  40
	.db #0x28	;  40
_map_144_x_16_offsets:
	.db #0x00	;  0
	.db #0x01	;  1
	.db #0x02	;  2
	.db #0x03	;  3
	.db #0x04	;  4
	.db #0x05	;  5
	.db #0x06	;  6
	.db #0x07	;  7
	.db #0x08	;  8
	.db #0x09	;  9
	.db #0x0a	;  10
	.db #0x0b	;  11
	.db #0x0c	;  12
	.db #0x0d	;  13
	.db #0x0e	;  14
	.db #0x0f	;  15
	.db #0x10	;  16
	.db #0x11	;  17
	.db #0x12	;  18
	.db #0x13	;  19
	.db #0x14	;  20
	.db #0x15	;  21
	.db #0x16	;  22
	.db #0x17	;  23
	.db #0x18	;  24
	.db #0x19	;  25
	.db #0x1a	;  26
	.db #0x1b	;  27
	.db #0x1c	;  28
	.db #0x1d	;  29
	.db #0x1e	;  30
	.db #0x1f	;  31
	.db #0x20	;  32
	.db #0x21	;  33
	.db #0x22	;  34
	.db #0x23	;  35
	.db #0x24	;  36
	.db #0x25	;  37
	.db #0x26	;  38
	.db #0x27	;  39
_map_144_x_16_offsets_flat:
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x03	; 3
	.db #0x04	; 4
	.db #0x05	; 5
	.db #0x06	; 6
	.db #0x07	; 7
	.db #0x08	; 8
	.db #0x09	; 9
	.db #0x0a	; 10
	.db #0x0b	; 11
	.db #0x0c	; 12
	.db #0x0d	; 13
	.db #0x0e	; 14
	.db #0x0f	; 15
	.db #0x10	; 16
	.db #0x11	; 17
	.db #0x12	; 18
	.db #0x13	; 19
	.db #0x14	; 20
	.db #0x15	; 21
	.db #0x16	; 22
	.db #0x17	; 23
	.db #0x18	; 24
	.db #0x19	; 25
	.db #0x1a	; 26
	.db #0x1b	; 27
	.db #0x1c	; 28
	.db #0x1d	; 29
	.db #0x1e	; 30
	.db #0x1f	; 31
	.db #0x20	; 32
	.db #0x21	; 33
	.db #0x22	; 34
	.db #0x23	; 35
	.db #0x24	; 36
	.db #0x25	; 37
	.db #0x26	; 38
	.db #0x27	; 39
_press_start_offsets:
	.db #0x00	;  0
	.db #0x00	;  0
	.db #0x08	;  8
	.db #0x00	;  0
	.db #0x10	;  16
	.db #0x00	;  0
	.db #0x18	;  24
	.db #0x00	;  0
	.db #0x20	;  32
	.db #0x00	;  0
	.db #0x28	;  40
	.db #0x00	;  0
	.db #0x30	;  48	'0'
	.db #0x00	;  0
	.db #0x38	;  56	'8'
	.db #0x00	;  0
	.db #0x40	;  64
	.db #0x00	;  0
	.db #0x48	;  72	'H'
	.db #0x00	;  0
	.db #0x50	;  80	'P'
	.db #0x00	;  0
	.db #0x00	;  0
	.db #0x08	;  8
	.db #0x08	;  8
	.db #0x08	;  8
	.db #0x10	;  16
	.db #0x08	;  8
	.db #0x18	;  24
	.db #0x08	;  8
	.db #0x20	;  32
	.db #0x08	;  8
	.db #0x28	;  40
	.db #0x08	;  8
	.db #0x30	;  48	'0'
	.db #0x08	;  8
	.db #0x38	;  56	'8'
	.db #0x08	;  8
	.db #0x40	;  64
	.db #0x08	;  8
	.db #0x48	;  72	'H'
	.db #0x08	;  8
	.db #0x50	;  80	'P'
	.db #0x08	;  8
;./sprites/sprite_generate.h:38: void load_48_x_48_sprite(uint8_t sprite_index, const uint8_t *character_sprite, uint8_t character_x, uint8_t character_y) {
;	---------------------------------
; Function load_48_x_48_sprite
; ---------------------------------
_load_48_x_48_sprite::
	add	sp, #-5
	ldhl	sp,	#4
	ld	(hl), a
;./sprites/sprite_generate.h:39: set_sprite_data(sprite_index, 36, character_sprite); // Carga los datos de los tiles en VRAM
	push	de
	ld	a, #0x24
	push	af
	inc	sp
	ld	a, (hl)
	push	af
	inc	sp
	call	_set_sprite_data
	add	sp, #4
;./sprites/sprite_generate.h:42: for (uint8_t i = 0; i < 36; i++) {
	ld	c, #0x00
00105$:
	ld	a, c
	sub	a, #0x24
	jr	NC, 00107$
;./sprites/sprite_generate.h:43: set_sprite_tile(sprite_index + i, sprite_index + i); // Asigna el tile en VRAM
	ldhl	sp,	#4
	ld	a, (hl)
	add	a, c
	ld	e, a
	ld	b, e
;c:\gbdk\include\gb\gb.h:1804: shadow_OAM[nb].tile=tile;
	xor	a, a
	sla	e
	adc	a, a
	sla	e
	adc	a, a
	ldhl	sp,	#0
	ld	(hl), e
	inc	hl
	ld	(hl), a
	ld	de, #_shadow_OAM
	pop	hl
	push	hl
	add	hl, de
	inc	hl
	inc	hl
	ld	e, l
	ld	d, h
	ld	a, b
	ld	(de), a
;./sprites/sprite_generate.h:44: move_sprite(sprite_index + i, character_x + map_48_x_48_offsets[i][0], character_y + map_48_x_48_offsets[i][1]); // Posición del tile
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	ld	a, l
	add	a, #<(_map_48_x_48_offsets)
	ld	e, a
	ld	a, h
	adc	a, #>(_map_48_x_48_offsets)
	ld	d, a
	ld	l, e
;	spillPairReg hl
;	spillPairReg hl
	ld	h, d
;	spillPairReg hl
;	spillPairReg hl
	inc	hl
	ld	a, (hl)
	ldhl	sp,	#8
	ld	b, (hl)
	add	a, b
	ldhl	sp,	#2
	ld	(hl), a
	ld	a, (de)
	ldhl	sp,	#7
	ld	b, (hl)
	add	a, b
	ldhl	sp,	#3
	ld	(hl), a
;c:\gbdk\include\gb\gb.h:1877: OAM_item_t * itm = &shadow_OAM[nb];
	ld	de, #_shadow_OAM
	pop	hl
	push	hl
	add	hl, de
	ld	e, l
	ld	d, h
;c:\gbdk\include\gb\gb.h:1878: itm->y=y, itm->x=x;
	ldhl	sp,	#2
	ld	a, (hl+)
	ld	(de), a
	inc	de
	ld	a, (hl)
	ld	(de), a
;./sprites/sprite_generate.h:42: for (uint8_t i = 0; i < 36; i++) {
	inc	c
	jr	00105$
00107$:
;./sprites/sprite_generate.h:46: }
	add	sp, #5
	pop	hl
	pop	af
	jp	(hl)
;./sprites/sprite_generate.h:49: void init_row(uint8_t base_sprite_id, const int8_t offsets[][2], uint8_t tile_start_index, uint8_t x, uint8_t y, uint8_t num_tiles) {
;	---------------------------------
; Function init_row
; ---------------------------------
_init_row::
	add	sp, #-7
	ldhl	sp,	#6
	ld	(hl-), a
	dec	hl
	ld	a, e
	ld	(hl+), a
	ld	(hl), d
;./sprites/sprite_generate.h:50: for (uint8_t i = 0; i < num_tiles; i++) {
	ld	c, #0x00
00105$:
	ld	a, c
	ldhl	sp,	#12
	sub	a, (hl)
	jr	NC, 00107$
;./sprites/sprite_generate.h:51: uint8_t sprite_id = base_sprite_id + i;
	ldhl	sp,	#6
	ld	a, (hl)
	add	a, c
	ld	e, a
;./sprites/sprite_generate.h:52: set_sprite_tile(sprite_id, tile_start_index + i); // Asigna el gráfico correcto
	ldhl	sp,	#9
	ld	a, (hl)
	add	a, c
	ld	b, a
;c:\gbdk\include\gb\gb.h:1804: shadow_OAM[nb].tile=tile;
	xor	a, a
	sla	e
	adc	a, a
	sla	e
	adc	a, a
	ldhl	sp,	#0
	ld	(hl), e
	inc	hl
	ld	(hl), a
	ld	de, #_shadow_OAM
	pop	hl
	push	hl
	add	hl, de
	inc	hl
	inc	hl
	ld	e, l
	ld	d, h
	ld	a, b
	ld	(de), a
;./sprites/sprite_generate.h:53: move_sprite(sprite_id, x + offsets[i][0], y + offsets[i][1]); // Posiciona el sprite
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	ld	e, l
	ld	d, h
	ldhl	sp,	#4
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, de
;	spillPairReg hl
;	spillPairReg hl
	ld	e,l
	ld	d,h
;	spillPairReg hl
;	spillPairReg hl
	inc	hl
	ld	a, (hl)
	ldhl	sp,	#11
	ld	b, (hl)
	add	a, b
	ldhl	sp,	#2
	ld	(hl), a
	ld	a, (de)
	ldhl	sp,	#10
	ld	b, (hl)
	add	a, b
	ldhl	sp,	#3
	ld	(hl), a
;c:\gbdk\include\gb\gb.h:1877: OAM_item_t * itm = &shadow_OAM[nb];
	ld	de, #_shadow_OAM
	pop	hl
	push	hl
	add	hl, de
	ld	e, l
	ld	d, h
;c:\gbdk\include\gb\gb.h:1878: itm->y=y, itm->x=x;
	ldhl	sp,	#2
	ld	a, (hl+)
	ld	(de), a
	inc	de
	ld	a, (hl)
	ld	(de), a
;./sprites/sprite_generate.h:50: for (uint8_t i = 0; i < num_tiles; i++) {
	inc	c
	jr	00105$
00107$:
;./sprites/sprite_generate.h:55: }
	add	sp, #7
	pop	hl
	add	sp, #4
	jp	(hl)
;./sprites/sprite_generate.h:58: void init_start_metasprite(uint8_t base_x, uint8_t base_y) {
;	---------------------------------
; Function init_start_metasprite
; ---------------------------------
_init_start_metasprite::
	add	sp, #-6
	ldhl	sp,	#5
	ld	(hl-), a
	ld	(hl), e
;./sprites/sprite_generate.h:59: set_sprite_data(0, 16, arche_32x32_normal_sprite); // Carga los 16 tiles en VRAM
	ld	de, #_arche_32x32_normal_sprite
	push	de
	ld	hl, #0x1000
	push	hl
	call	_set_sprite_data
	add	sp, #4
;./sprites/sprite_generate.h:62: for (uint8_t i = 0; i < 16; i++) {
	ld	c, #0x00
00105$:
	ld	a, c
	sub	a, #0x10
	jr	NC, 00107$
;c:\gbdk\include\gb\gb.h:1804: shadow_OAM[nb].tile=tile;
	ld	e, c
	ld	d, #0x00
	inc	sp
	inc	sp
	push	de
	ld	a, #0x02
00124$:
	ldhl	sp,	#0
	sla	(hl)
	inc	hl
	rl	(hl)
	dec	a
	jr	NZ, 00124$
	push	de
	ld	de, #_shadow_OAM
	ld	a, (hl-)
	ld	l, (hl)
	ld	h, a
	add	hl, de
;	spillPairReg hl
;	spillPairReg hl
;	spillPairReg hl
;	spillPairReg hl
	inc	hl
	inc	hl
	pop	de
	ld	(hl), c
;./sprites/sprite_generate.h:64: move_sprite(i, base_x + map_32_x_32_offsets[i][0], base_y + map_32_x_32_offsets[i][1]);
	sla	e
	rl	d
	ld	hl, #_map_32_x_32_offsets
	add	hl, de
;	spillPairReg hl
;	spillPairReg hl
	ld	e,l
	ld	d,h
;	spillPairReg hl
;	spillPairReg hl
	inc	hl
	ld	a, (hl)
	ldhl	sp,	#4
	ld	b, (hl)
	dec	hl
	dec	hl
	add	a, b
	ld	(hl), a
	ld	a, (de)
	ldhl	sp,	#5
	ld	b, (hl)
	dec	hl
	dec	hl
	add	a, b
	ld	(hl), a
;c:\gbdk\include\gb\gb.h:1877: OAM_item_t * itm = &shadow_OAM[nb];
	ld	de, #_shadow_OAM
	pop	hl
	push	hl
	add	hl, de
	ld	e, l
	ld	d, h
;c:\gbdk\include\gb\gb.h:1878: itm->y=y, itm->x=x;
	ldhl	sp,	#2
	ld	a, (hl+)
	ld	(de), a
	inc	de
	ld	a, (hl)
	ld	(de), a
;./sprites/sprite_generate.h:62: for (uint8_t i = 0; i < 16; i++) {
	inc	c
	jr	00105$
00107$:
;./sprites/sprite_generate.h:66: }
	add	sp, #6
	ret
;./sprites/sprite_generate.h:69: void render_static_metasprite(uint8_t base_x, uint8_t base_y) {
;	---------------------------------
; Function render_static_metasprite
; ---------------------------------
_render_static_metasprite::
	add	sp, #-6
	ldhl	sp,	#5
	ld	(hl), a
	ld	c, e
;./sprites/sprite_generate.h:70: set_sprite_data(0, 16, arche_32x32_normal_sprite); // Carga los 16 tiles en VRAM
	ld	de, #_arche_32x32_normal_sprite
	push	de
	ld	hl, #0x1000
	push	hl
	call	_set_sprite_data
	add	sp, #4
;c:\gbdk\include\gb\gb.h:1804: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 2)
	ld	(hl), #0x00
;c:\gbdk\include\gb\gb.h:1877: OAM_item_t * itm = &shadow_OAM[nb];
	ld	de, #_shadow_OAM+0
;c:\gbdk\include\gb\gb.h:1878: itm->y=y, itm->x=x;
	ld	a, c
	ld	(de), a
	inc	de
	ldhl	sp,	#5
	ld	a, (hl)
	ld	(de), a
;c:\gbdk\include\gb\gb.h:1804: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 6)
	ld	(hl), #0x01
;./sprites/sprite_generate.h:77: move_sprite(1, base_x, base_y + 8);
	ldhl	sp,	#4
	ld	(hl), c
	ld	a, (hl)
	add	a, #0x08
	ldhl	sp,	#0
	ld	(hl), a
	ld	e, (hl)
;c:\gbdk\include\gb\gb.h:1877: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 4)
;c:\gbdk\include\gb\gb.h:1878: itm->y=y, itm->x=x;
	ld	(hl), e
	ld	de, #(_shadow_OAM + 5)
	ldhl	sp,	#5
	ld	a, (hl)
	ld	(de), a
;c:\gbdk\include\gb\gb.h:1804: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 10)
	ld	(hl), #0x02
;./sprites/sprite_generate.h:80: move_sprite(2, base_x + 8, base_y);
	ldhl	sp,	#5
	ld	a, (hl)
	ldhl	sp,	#1
	ld	(hl), a
	ld	a, (hl)
	add	a, #0x08
	ld	b, a
	ld	e, b
;c:\gbdk\include\gb\gb.h:1877: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 8)
;c:\gbdk\include\gb\gb.h:1878: itm->y=y, itm->x=x;
	ld	a, c
	ld	(hl+), a
	ld	(hl), e
;c:\gbdk\include\gb\gb.h:1804: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 14)
	ld	(hl), #0x03
;c:\gbdk\include\gb\gb.h:1877: OAM_item_t * itm = &shadow_OAM[nb];
	ld	de, #_shadow_OAM+12
;c:\gbdk\include\gb\gb.h:1878: itm->y=y, itm->x=x;
	ldhl	sp,	#0
	ld	a, (hl)
	ld	(de), a
	inc	de
	ld	a, b
	ld	(de), a
;c:\gbdk\include\gb\gb.h:1804: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 18)
	ld	(hl), #0x04
;./sprites/sprite_generate.h:86: move_sprite(4, base_x, base_y + 16);
	ldhl	sp,	#4
	ld	a, (hl-)
	dec	hl
	add	a, #0x10
	ld	(hl), a
	ld	e, (hl)
;c:\gbdk\include\gb\gb.h:1877: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 16)
;c:\gbdk\include\gb\gb.h:1878: itm->y=y, itm->x=x;
	ld	(hl), e
	ld	de, #(_shadow_OAM + 17)
	ldhl	sp,	#5
	ld	a, (hl)
	ld	(de), a
;c:\gbdk\include\gb\gb.h:1804: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 22)
	ld	(hl), #0x05
;./sprites/sprite_generate.h:89: move_sprite(5, base_x, base_y + 24);
	ldhl	sp,	#4
	ld	a, (hl-)
	add	a, #0x18
	ld	(hl), a
	ld	e, (hl)
;c:\gbdk\include\gb\gb.h:1877: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 20)
;c:\gbdk\include\gb\gb.h:1878: itm->y=y, itm->x=x;
	ld	(hl), e
	ld	de, #(_shadow_OAM + 21)
	ldhl	sp,	#5
	ld	a, (hl)
	ld	(de), a
;c:\gbdk\include\gb\gb.h:1804: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 26)
	ld	(hl), #0x06
;c:\gbdk\include\gb\gb.h:1877: OAM_item_t * itm = &shadow_OAM[nb];
	ld	de, #_shadow_OAM+24
;c:\gbdk\include\gb\gb.h:1878: itm->y=y, itm->x=x;
	ldhl	sp,	#2
	ld	a, (hl)
	ld	(de), a
	inc	de
	ld	a, b
	ld	(de), a
;c:\gbdk\include\gb\gb.h:1804: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 30)
	ld	(hl), #0x07
;c:\gbdk\include\gb\gb.h:1877: OAM_item_t * itm = &shadow_OAM[nb];
	ld	de, #_shadow_OAM+28
;c:\gbdk\include\gb\gb.h:1878: itm->y=y, itm->x=x;
	ldhl	sp,	#3
	ld	a, (hl)
	ld	(de), a
	inc	de
	ld	a, b
	ld	(de), a
;c:\gbdk\include\gb\gb.h:1804: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 34)
	ld	(hl), #0x08
;./sprites/sprite_generate.h:98: move_sprite(8, base_x + 16, base_y);
	ldhl	sp,	#1
	ld	a, (hl)
	add	a, #0x10
	ldhl	sp,	#4
	ld	(hl), a
	ld	b, (hl)
;c:\gbdk\include\gb\gb.h:1877: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 32)
;c:\gbdk\include\gb\gb.h:1878: itm->y=y, itm->x=x;
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;c:\gbdk\include\gb\gb.h:1804: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 38)
	ld	(hl), #0x09
;c:\gbdk\include\gb\gb.h:1877: OAM_item_t * itm = &shadow_OAM[nb];
	ld	de, #_shadow_OAM+36
;c:\gbdk\include\gb\gb.h:1878: itm->y=y, itm->x=x;
	ldhl	sp,	#0
	ld	a, (hl)
	ld	(de), a
	inc	de
	ldhl	sp,	#4
	ld	a, (hl)
	ld	(de), a
;c:\gbdk\include\gb\gb.h:1804: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 42)
	ld	(hl), #0x0a
;./sprites/sprite_generate.h:104: move_sprite(10, base_x + 24, base_y);
	ldhl	sp,	#1
	ld	a, (hl)
	add	a, #0x18
	ld	b, a
	ld	e, b
;c:\gbdk\include\gb\gb.h:1877: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 40)
;c:\gbdk\include\gb\gb.h:1878: itm->y=y, itm->x=x;
	ld	a, c
	ld	(hl+), a
	ld	(hl), e
;c:\gbdk\include\gb\gb.h:1804: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 46)
	ld	(hl), #0x0b
;c:\gbdk\include\gb\gb.h:1877: OAM_item_t * itm = &shadow_OAM[nb];
	ld	de, #_shadow_OAM+44
;c:\gbdk\include\gb\gb.h:1878: itm->y=y, itm->x=x;
	ldhl	sp,	#0
	ld	a, (hl)
	ld	(de), a
	inc	de
	ld	a, b
	ld	(de), a
;c:\gbdk\include\gb\gb.h:1804: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 50)
	ld	(hl), #0x0c
;c:\gbdk\include\gb\gb.h:1877: OAM_item_t * itm = &shadow_OAM[nb];
	ld	de, #_shadow_OAM+48
;c:\gbdk\include\gb\gb.h:1878: itm->y=y, itm->x=x;
	ldhl	sp,	#2
	ld	a, (hl+)
	inc	hl
	ld	(de), a
	inc	de
	ld	a, (hl)
	ld	(de), a
;c:\gbdk\include\gb\gb.h:1804: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 54)
	ld	(hl), #0x0d
;c:\gbdk\include\gb\gb.h:1877: OAM_item_t * itm = &shadow_OAM[nb];
	ld	de, #_shadow_OAM+52
;c:\gbdk\include\gb\gb.h:1878: itm->y=y, itm->x=x;
	ldhl	sp,	#3
	ld	a, (hl+)
	ld	(de), a
	inc	de
	ld	a, (hl)
	ld	(de), a
;c:\gbdk\include\gb\gb.h:1804: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 58)
	ld	(hl), #0x0e
;c:\gbdk\include\gb\gb.h:1877: OAM_item_t * itm = &shadow_OAM[nb];
	ld	de, #_shadow_OAM+56
;c:\gbdk\include\gb\gb.h:1878: itm->y=y, itm->x=x;
	ldhl	sp,	#2
	ld	a, (hl)
	ld	(de), a
	inc	de
	ld	a, b
	ld	(de), a
;c:\gbdk\include\gb\gb.h:1804: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 62)
	ld	(hl), #0x0f
;c:\gbdk\include\gb\gb.h:1877: OAM_item_t * itm = &shadow_OAM[nb];
	ld	de, #_shadow_OAM+60
;c:\gbdk\include\gb\gb.h:1878: itm->y=y, itm->x=x;
	ldhl	sp,	#3
	ld	a, (hl)
	ld	(de), a
	inc	de
	ld	a, b
	ld	(de), a
;./sprites/sprite_generate.h:119: move_sprite(15, base_x + 24, base_y + 24);
;./sprites/sprite_generate.h:120: }
	add	sp, #6
	ret
;./sprites/sprite_generate.h:123: void init_metasprite(uint8_t x, uint8_t y) {
;	---------------------------------
; Function init_metasprite
; ---------------------------------
_init_metasprite::
	ld	c, a
	ld	b, e
;./sprites/sprite_generate.h:124: set_sprite_data(0, 4, arche_sprite_tiles); // Cargar los datos gráficos en VRAM
	ld	de, #_arche_sprite_tiles
	push	de
	ld	hl, #0x400
	push	hl
	call	_set_sprite_data
	add	sp, #4
;./sprites/sprite_generate.h:125: init_row(0, row1_offsets, 0, x, y, 4); // Inicializa la fila superior (sprites 0-3, tiles 0-3)
	push	bc
	ld	a, #0x04
	push	af
	inc	sp
	push	bc
	inc	sp
	ld	h, c
	ld	l, #0x00
	push	hl
	ld	de, #_row1_offsets
	xor	a, a
	call	_init_row
	pop	bc
;./sprites/sprite_generate.h:126: init_row(4, row2_offsets, 4, x, y, 4); // Inicializa la fila inferior (sprites 4-7, tiles 4-7)
	ld	a, #0x04
	push	af
	inc	sp
	push	bc
	inc	sp
	ld	h, c
	ld	l, #0x04
	push	hl
	ld	de, #_row2_offsets
	ld	a, #0x04
	call	_init_row
;./sprites/sprite_generate.h:127: hide_unused_sprites(4);   // Ocultar sprites no usados (a partir del ID 4)
	ld	a, #0x04
;./sprites/sprite_generate.h:128: }
	jp	_hide_unused_sprites
;./sprites/sprite_generate.h:131: void init_single_bullet(void) {
;	---------------------------------
; Function init_single_bullet
; ---------------------------------
_init_single_bullet::
;./sprites/sprite_generate.h:132: set_sprite_data(5, 1, bullet_tile); // Carga el tile del disparo en el índice 8
	ld	de, #_bullet_tile
	push	de
	ld	hl, #0x105
	push	hl
	call	_set_sprite_data
	add	sp, #4
;c:\gbdk\include\gb\gb.h:1877: OAM_item_t * itm = &shadow_OAM[nb];
	ld	bc, #_shadow_OAM+20
;c:\gbdk\include\gb\gb.h:1878: itm->y=y, itm->x=x;
	xor	a, a
	ld	(bc), a
	inc	bc
	xor	a, a
	ld	(bc), a
;./sprites/sprite_generate.h:133: move_sprite(5, 0, 0);               // Oculta el sprite del disparo fuera de la pantalla
;./sprites/sprite_generate.h:134: }
	ret
;./sprites/sprite_generate.h:137: void init_spread_bullets(void) {
;	---------------------------------
; Function init_spread_bullets
; ---------------------------------
_init_spread_bullets::
;./sprites/sprite_generate.h:138: set_sprite_data(5, 1, bullet_tile); // Carga el gráfico del disparo en el índice 5
	ld	de, #_bullet_tile
	push	de
	ld	hl, #0x105
	push	hl
	call	_set_sprite_data
	add	sp, #4
;./sprites/sprite_generate.h:141: for (uint8_t i = 0; i < 3; i++) {
	ld	c, #0x00
00105$:
;./sprites/sprite_generate.h:142: set_sprite_tile(5 + i, 5);  // Asignar el gráfico del disparo (tile 5) a cada sprite
	ld	a,c
	cp	a,#0x03
	ret	NC
	add	a, #0x05
	ld	e, a
	ld	b, e
;c:\gbdk\include\gb\gb.h:1804: shadow_OAM[nb].tile=tile;
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	ld	l, b
	add	hl, hl
	add	hl, hl
	push	de
	ld	de, #_shadow_OAM
	add	hl, de
	inc	hl
	inc	hl
	pop	de
	ld	(hl), #0x05
;./sprites/sprite_generate.h:143: move_sprite(5 + i, 0, 0);   // IDs de los sprites: 5, 6, 7
;c:\gbdk\include\gb\gb.h:1877: OAM_item_t * itm = &shadow_OAM[nb];
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	ld	l, e
	add	hl, hl
	add	hl, hl
	ld	de, #_shadow_OAM
	add	hl, de
;c:\gbdk\include\gb\gb.h:1878: itm->y=y, itm->x=x;
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
;./sprites/sprite_generate.h:141: for (uint8_t i = 0; i < 3; i++) {
	inc	c
;./sprites/sprite_generate.h:145: }
	jr	00105$
;./start/../animations/arche_big.h:18: void animate_levitation_start_screen(uint8_t base_x, uint8_t base_y) {
;	---------------------------------
; Function animate_levitation_start_screen
; ---------------------------------
_animate_levitation_start_screen::
	ld	c, a
	ld	b, e
;./start/../animations/arche_big.h:19: int8_t direction = 1; // Dirección del movimiento (1 = arriba, -1 = abajo)
;	spillPairReg hl
;	spillPairReg hl
;./start/../animations/arche_big.h:20: uint8_t y_offset = 0; // Desplazamiento vertical
	ld	hl, #0x1
;	spillPairReg hl
;	spillPairReg hl
;./start/../animations/arche_big.h:22: while (1) {
00105$:
;./start/../animations/arche_big.h:25: init_start_metasprite(base_x, base_y + y_offset); // Mueve el metasprite con el desplazamiento actual
	ld	a, b
	add	a, h
	ld	e, a
	push	hl
	push	bc
	ld	a, c
	call	_init_start_metasprite
	pop	bc
	pop	hl
;./start/../animations/arche_big.h:26: y_offset += direction; // Actualiza el desplazamiento vertical
	ld	a, h
	add	a, l
;	spillPairReg hl
;	spillPairReg hl
;./start/../animations/arche_big.h:29: if (y_offset >= 4 || y_offset <= 0) {
	ld	h, a
	sub	a, #0x04
	jr	NC, 00101$
	ld	a, h
	or	a, a
	jr	NZ, 00102$
00101$:
;./start/../animations/arche_big.h:30: direction = -direction;
	xor	a, a
	sub	a, l
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
00102$:
;./start/../animations/arche_big.h:32: wait_vbl_done(); // Sincroniza con el ciclo de renderizado
	push	hl
	call	_wait_vbl_done
	push	bc
	ld	de, #0x0064
	call	_delay
	pop	bc
	pop	hl
;./start/../animations/arche_big.h:35: }
	jr	00105$
;./start/../animations/arche_big.h:37: void animate_levitation_step(uint8_t base_x, uint8_t base_y) {
;	---------------------------------
; Function animate_levitation_step
; ---------------------------------
_animate_levitation_step::
	ld	c, a
	ld	a, e
;./start/../animations/arche_big.h:42: uint8_t new_y = base_y + y_offset;
	ld	hl, #_animate_levitation_step_y_offset_65536_487
	add	a, (hl)
	ld	e, a
;./start/../animations/arche_big.h:45: init_start_metasprite(base_x, new_y);
	ld	a, c
	call	_init_start_metasprite
;./start/../animations/arche_big.h:48: y_offset += direction;
	ld	a, (#_animate_levitation_step_y_offset_65536_487)
	ld	hl, #_animate_levitation_step_direction_65536_487
	add	a, (hl)
;./start/../animations/arche_big.h:51: if (y_offset >= 4) {
	ld	(#_animate_levitation_step_y_offset_65536_487),a
	xor	a, #0x80
	sub	a, #0x84
	jr	C, 00104$
;./start/../animations/arche_big.h:52: direction = -1; // Cambia a bajar
	ld	hl, #_animate_levitation_step_direction_65536_487
	ld	(hl), #0xff
	jp	_wait_vbl_done
00104$:
;./start/../animations/arche_big.h:53: } else if (y_offset <= 0) {
	ld	hl, #_animate_levitation_step_y_offset_65536_487
	ld	e, (hl)
	xor	a, a
	ld	d, a
	sub	a, (hl)
	bit	7, e
	jr	Z, 00122$
	bit	7, d
	jr	NZ, 00123$
	cp	a, a
	jr	00123$
00122$:
	bit	7, d
	jr	Z, 00123$
	scf
00123$:
	jp	C,_wait_vbl_done
;./start/../animations/arche_big.h:54: direction = 1; // Cambia a subir
	ld	hl, #_animate_levitation_step_direction_65536_487
	ld	(hl), #0x01
;./start/../animations/arche_big.h:58: wait_vbl_done();
;./start/../animations/arche_big.h:59: }
	jp	_wait_vbl_done
;./start/../animations/arche_big.h:62: void init_and_move_48x48_sprite(uint8_t base_sprite_id, uint8_t base_x, uint8_t base_y) {
;	---------------------------------
; Function init_and_move_48x48_sprite
; ---------------------------------
_init_and_move_48x48_sprite::
	add	sp, #-6
	ldhl	sp,	#5
	ld	(hl-), a
	ld	(hl), e
;./start/../animations/arche_big.h:63: for (uint8_t i = 0; i < 36; i++) {
	ld	c, #0x00
00105$:
	ld	a, c
	sub	a, #0x24
	jr	NC, 00107$
;./start/../animations/arche_big.h:64: uint8_t sprite_id = base_sprite_id + i;
	ldhl	sp,	#5
	ld	a, (hl)
	add	a, c
;c:\gbdk\include\gb\gb.h:1804: shadow_OAM[nb].tile=tile;
	ld	b, a
	ld	e, #0x00
	add	a, a
	rl	e
	add	a, a
	rl	e
	ldhl	sp,	#0
	ld	(hl+), a
	ld	(hl), e
	ld	de, #_shadow_OAM
	pop	hl
	push	hl
	add	hl, de
	inc	hl
	inc	hl
	ld	e, l
	ld	d, h
	ld	a, b
	ld	(de), a
;./start/../animations/arche_big.h:66: move_sprite(sprite_id, base_x + map_48_x_48_offsets[i][0], base_y + map_48_x_48_offsets[i][1]);
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	ld	a, l
	add	a, #<(_map_48_x_48_offsets)
	ld	e, a
	ld	a, h
	adc	a, #>(_map_48_x_48_offsets)
	ld	d, a
	ld	l, e
;	spillPairReg hl
;	spillPairReg hl
	ld	h, d
;	spillPairReg hl
;	spillPairReg hl
	inc	hl
	ld	a, (hl)
	ldhl	sp,	#8
	ld	b, (hl)
	add	a, b
	ldhl	sp,	#2
	ld	(hl+), a
	inc	hl
	ld	a, (de)
	ld	b, (hl)
	dec	hl
	add	a, b
	ld	(hl), a
;c:\gbdk\include\gb\gb.h:1877: OAM_item_t * itm = &shadow_OAM[nb];
	ld	de, #_shadow_OAM
	pop	hl
	push	hl
	add	hl, de
	ld	e, l
	ld	d, h
;c:\gbdk\include\gb\gb.h:1878: itm->y=y, itm->x=x;
	ldhl	sp,	#2
	ld	a, (hl+)
	ld	(de), a
	inc	de
	ld	a, (hl)
	ld	(de), a
;./start/../animations/arche_big.h:63: for (uint8_t i = 0; i < 36; i++) {
	inc	c
	jr	00105$
00107$:
;./start/../animations/arche_big.h:68: }
	add	sp, #6
	pop	hl
	inc	sp
	jp	(hl)
;./start/../animations/arche_big.h:71: void slide_metasprite_to_center(uint8_t base_sprite_id, uint8_t start_x, uint8_t start_y, uint8_t target_x, uint8_t target_y, uint8_t speed) {
;	---------------------------------
; Function slide_metasprite_to_center
; ---------------------------------
_slide_metasprite_to_center::
	add	sp, #-10
	ldhl	sp,	#7
	ld	(hl+), a
	ld	(hl), e
;./start/../animations/arche_big.h:73: uint8_t current_y = start_y;
	ldhl	sp,	#12
	ld	a, (hl)
	ldhl	sp,	#9
	ld	(hl), a
;./start/../animations/arche_big.h:76: while (current_x != target_x || current_y != target_y) {
00112$:
	ldhl	sp,	#13
	ld	a, (hl)
	ldhl	sp,	#8
	sub	a, (hl)
	jr	NZ, 00113$
	ldhl	sp,	#14
	ld	a, (hl)
	ldhl	sp,	#9
	sub	a, (hl)
	jp	Z,00115$
00113$:
;./start/../animations/arche_big.h:79: current_x += (current_x + speed > target_x) ? (target_x - current_x) : speed;
	ldhl	sp,	#15
	ld	a, (hl)
	ldhl	sp,	#0
	ld	(hl+), a
	ld	(hl), #0x00
	ldhl	sp,	#15
	ld	a, (hl)
	ldhl	sp,	#2
	ld	(hl), a
;./start/../animations/arche_big.h:78: if (current_x < target_x) {
	ldhl	sp,	#8
	ld	a, (hl)
	ldhl	sp,	#13
	sub	a, (hl)
	jr	NC, 00104$
;./start/../animations/arche_big.h:79: current_x += (current_x + speed > target_x) ? (target_x - current_x) : speed;
	ldhl	sp,	#8
	ld	a, (hl)
	ldhl	sp,	#3
	ld	(hl+), a
	xor	a, a
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	pop	hl
	push	hl
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#7
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#6
	ld	(hl), a
	ldhl	sp,	#13
	ld	c, (hl)
	ld	b, #0x00
	ldhl	sp,	#5
	ld	a, c
	sub	a, (hl)
	inc	hl
	ld	a, b
	sbc	a, (hl)
	ld	a, b
	ld	d, a
	bit	7, (hl)
	jr	Z, 00198$
	bit	7, d
	jr	NZ, 00199$
	cp	a, a
	jr	00199$
00198$:
	bit	7, d
	jr	Z, 00199$
	scf
00199$:
	jr	NC, 00117$
	ldhl	sp,	#13
	ld	a, (hl)
	ldhl	sp,	#8
	sub	a, (hl)
	jr	00118$
00117$:
	ldhl	sp,	#2
	ld	a, (hl)
00118$:
	ldhl	sp,	#8
	add	a, (hl)
	ld	(hl), a
	jr	00105$
00104$:
;./start/../animations/arche_big.h:81: else if (current_x > target_x) {
	ldhl	sp,	#13
	ld	a, (hl)
	ldhl	sp,	#8
	sub	a, (hl)
	jr	NC, 00105$
;./start/../animations/arche_big.h:82: current_x -= (current_x < speed) ? current_x : speed;
	ld	a, (hl)
	ldhl	sp,	#15
	sub	a, (hl)
	jr	NC, 00119$
	ldhl	sp,	#8
	ld	c, (hl)
	jr	00120$
00119$:
	ldhl	sp,	#2
	ld	c, (hl)
00120$:
	ldhl	sp,	#8
	ld	a, (hl)
	sub	a, c
	ld	(hl), a
00105$:
;./start/../animations/arche_big.h:86: if (current_y < target_y) {
	ldhl	sp,	#9
	ld	a, (hl)
	ldhl	sp,	#14
	sub	a, (hl)
	jr	NC, 00109$
;./start/../animations/arche_big.h:87: current_y += (current_y + speed > target_y) ? (target_y - current_y) : speed;
	ldhl	sp,	#9
	ld	c, (hl)
	ld	b, #0x00
	pop	hl
	push	hl
	add	hl, bc
	ld	c, l
	ld	b, h
	ldhl	sp,	#14
	ld	a, (hl)
	ldhl	sp,	#5
	ld	(hl+), a
	xor	a, a
	ld	(hl-), a
	ld	a, (hl+)
	sub	a, c
	ld	a, (hl)
	sbc	a, b
	ld	d, (hl)
	ld	a, b
	bit	7,a
	jr	Z, 00200$
	bit	7, d
	jr	NZ, 00201$
	cp	a, a
	jr	00201$
00200$:
	bit	7, d
	jr	Z, 00201$
	scf
00201$:
	jr	NC, 00121$
	ldhl	sp,	#14
	ld	a, (hl)
	ldhl	sp,	#9
	sub	a, (hl)
	jr	00122$
00121$:
	ldhl	sp,	#2
	ld	a, (hl)
00122$:
	ldhl	sp,	#9
	add	a, (hl)
	ld	(hl), a
	jr	00110$
00109$:
;./start/../animations/arche_big.h:89: else if (current_y > target_y) {
	ldhl	sp,	#14
	ld	a, (hl)
	ldhl	sp,	#9
	sub	a, (hl)
	jr	NC, 00110$
;./start/../animations/arche_big.h:90: current_y -= (current_y < speed) ? current_y : speed;
	ld	a, (hl)
	ldhl	sp,	#15
	sub	a, (hl)
	jr	NC, 00123$
	ldhl	sp,	#9
	ld	c, (hl)
	jr	00124$
00123$:
	ldhl	sp,	#2
	ld	c, (hl)
00124$:
	ldhl	sp,	#9
	ld	a, (hl)
	sub	a, c
	ld	(hl), a
00110$:
;./start/../animations/arche_big.h:94: init_and_move_48x48_sprite(base_sprite_id, current_x, current_y);
	ldhl	sp,	#9
	ld	a, (hl-)
	push	af
	inc	sp
	ld	a, (hl-)
	ld	e, a
	ld	a, (hl)
	call	_init_and_move_48x48_sprite
;./start/../animations/arche_big.h:97: wait_vbl_done();
	call	_wait_vbl_done
	jp	00112$
00115$:
;./start/../animations/arche_big.h:99: }
	add	sp, #10
	pop	hl
	add	sp, #4
	jp	(hl)
;./start/start_screen.h:35: void clear_background(void) {
;	---------------------------------
; Function clear_background
; ---------------------------------
_clear_background::
	ld	hl, #-272
	add	hl, sp
	ld	sp, hl
;./start/start_screen.h:36: const uint8_t white_tile[16] = {
	ldhl	sp,	#0
	ld	c, l
	ld	b, h
	xor	a, a
	ld	(bc), a
	ldhl	sp,	#1
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
;./start/start_screen.h:42: set_bkg_data(0, 1, white_tile);
	push	bc
	xor	a, a
	inc	a
	push	af
	call	_set_bkg_data
	add	sp, #4
;./start/start_screen.h:46: for (uint16_t i = 0; i < 256; i++) {
	ld	bc, #0x0000
00103$:
	ld	a, b
	sub	a, #0x01
	jr	NC, 00101$
;./start/start_screen.h:47: empty_screen[i] = 0; // Todo el fondo se llena con el tile vacío (índice 0)
	ld	hl, #16
	add	hl, sp
	add	hl, bc
	ld	(hl), #0x00
;./start/start_screen.h:46: for (uint16_t i = 0; i < 256; i++) {
	inc	bc
	jr	00103$
00101$:
;./start/start_screen.h:51: set_bkg_tiles(0, 0, 160, 144, empty_screen);
	ld	hl, #16
	add	hl, sp
	push	hl
	ld	hl, #0x90a0
	push	hl
	xor	a, a
	rrca
	push	af
	call	_set_bkg_tiles
	add	sp, #6
;./start/start_screen.h:52: }
	ld	hl, #272
	add	hl, sp
	ld	sp, hl
	ret
_start_screen_sprite:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x30	; 48	'0'
	.db #0x30	; 48	'0'
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x03	; 3
	.db #0x05	; 5
	.db #0x06	; 6
	.db #0x0b	; 11
	.db #0x0c	; 12
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x1b	; 27
	.db #0x1f	; 31
	.db #0x26	; 38
	.db #0x3e	; 62
	.db #0xdc	; 220
	.db #0xec	; 236
	.db #0x38	; 56	'8'
	.db #0xd8	; 216
	.db #0xf0	; 240
	.db #0x30	; 48	'0'
	.db #0xe0	; 224
	.db #0x60	; 96
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x0e	; 14
	.db #0x0e	; 14
	.db #0x0b	; 11
	.db #0x0d	; 13
	.db #0x05	; 5
	.db #0x06	; 6
	.db #0x02	; 2
	.db #0x03	; 3
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0xf0	; 240
	.db #0x70	; 112	'p'
	.db #0xff	; 255
	.db #0x0f	; 15
	.db #0x3f	; 63
	.db #0xc0	; 192
	.db #0xd0	; 208
	.db #0xe0	; 224
	.db #0x24	; 36
	.db #0x38	; 56	'8'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0xf4	; 244
	.db #0xf7	; 247
	.db #0xfe	; 254
	.db #0x0f	; 15
	.db #0x3f	; 63
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x1c	; 28
	.db #0x14	; 20
	.db #0x16	; 22
	.db #0x1a	; 26
	.db #0x0b	; 11
	.db #0x0d	; 13
	.db #0x0b	; 11
	.db #0x0c	; 12
	.db #0xcb	; 203
	.db #0xcc	; 204
	.db #0x35	; 53	'5'
	.db #0xf6	; 246
	.db #0x4c	; 76	'L'
	.db #0xbe	; 190
	.db #0xd5	; 213
	.db #0x2e	; 46
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0xc1	; 193
	.db #0x41	; 65	'A'
	.db #0xc3	; 195
	.db #0x43	; 67	'C'
	.db #0xe7	; 231
	.db #0x25	; 37
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x82	; 130
	.db #0x83	; 131
	.db #0x05	; 5
	.db #0x06	; 6
	.db #0x05	; 5
	.db #0x06	; 6
	.db #0x17	; 23
	.db #0x19	; 25
	.db #0x2f	; 47
	.db #0x33	; 51	'3'
	.db #0x5f	; 95
	.db #0x67	; 103	'g'
	.db #0xbe	; 190
	.db #0xcf	; 207
	.db #0x79	; 121	'y'
	.db #0x9e	; 158
	.db #0xd7	; 215
	.db #0x39	; 57	'9'
	.db #0xea	; 234
	.db #0x37	; 55	'7'
	.db #0xdb	; 219
	.db #0x6c	; 108	'l'
	.db #0x8c	; 140
	.db #0x8c	; 140
	.db #0x78	; 120	'x'
	.db #0x78	; 120	'x'
	.db #0xb0	; 176
	.db #0xf0	; 240
	.db #0x7f	; 127
	.db #0xff	; 255
	.db #0xe1	; 225
	.db #0xfe	; 254
	.db #0x30	; 48	'0'
	.db #0xc0	; 192
	.db #0xe0	; 224
	.db #0x00	; 0
	.db #0xe0	; 224
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xff	; 255
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xf8	; 248
	.db #0x38	; 56	'8'
	.db #0x3e	; 62
	.db #0x06	; 6
	.db #0x07	; 7
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x07	; 7
	.db #0x04	; 4
	.db #0x1e	; 30
	.db #0x18	; 24
	.db #0x38	; 56	'8'
	.db #0x20	; 32
	.db #0x70	; 112	'p'
	.db #0x40	; 64
	.db #0x1a	; 26
	.db #0x1c	; 28
	.db #0x1c	; 28
	.db #0x1f	; 31
	.db #0xff	; 255
	.db #0xe0	; 224
	.db #0xf0	; 240
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x20	; 32
	.db #0xc0	; 192
	.db #0xd0	; 208
	.db #0x20	; 32
	.db #0x18	; 24
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x29	; 41
	.db #0x16	; 22
	.db #0x05	; 5
	.db #0x0a	; 10
	.db #0x02	; 2
	.db #0x05	; 5
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x02	; 2
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x6d	; 109	'm'
	.db #0x2b	; 43
	.db #0x7b	; 123
	.db #0x37	; 55	'7'
	.db #0x7b	; 123
	.db #0x04	; 4
	.db #0x36	; 54	'6'
	.db #0x08	; 8
	.db #0x28	; 40
	.db #0x00	; 0
	.db #0x20	; 32
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x7b	; 123
	.db #0x7c	; 124
	.db #0xf0	; 240
	.db #0x8f	; 143
	.db #0xe3	; 227
	.db #0x00	; 0
	.db #0x1b	; 27
	.db #0x07	; 7
	.db #0x6b	; 107	'k'
	.db #0x1c	; 28
	.db #0xaf	; 175
	.db #0x70	; 112	'p'
	.db #0xeb	; 235
	.db #0x1c	; 28
	.db #0x1b	; 27
	.db #0x06	; 6
	.db #0x6f	; 111	'o'
	.db #0xd0	; 208
	.db #0x7f	; 127
	.db #0x80	; 128
	.db #0xef	; 239
	.db #0xf0	; 240
	.db #0x7f	; 127
	.db #0x80	; 128
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xfc	; 252
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xe0	; 224
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xc0	; 192
	.db #0x00	; 0
	.db #0xf0	; 240
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xc0	; 192
	.db #0x00	; 0
	.db #0xe0	; 224
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x78	; 120	'x'
	.db #0x00	; 0
	.db #0x1f	; 31
	.db #0x00	; 0
	.db #0x8f	; 143
	.db #0x70	; 112	'p'
	.db #0x37	; 55	'7'
	.db #0x0f	; 15
	.db #0x60	; 96
	.db #0xe0	; 224
	.db #0x58	; 88	'X'
	.db #0x38	; 56	'8'
	.db #0xe4	; 228
	.db #0x1c	; 28
	.db #0x7b	; 123
	.db #0x07	; 7
	.db #0x3c	; 60
	.db #0x03	; 3
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xbf	; 191
	.db #0xc0	; 192
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x60	; 96
	.db #0xe0	; 224
	.db #0x90	; 144
	.db #0x70	; 112	'p'
	.db #0xe8	; 232
	.db #0x18	; 24
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x03	; 3
	.db #0x02	; 2
	.db #0x06	; 6
	.db #0x04	; 4
	.db #0x0c	; 12
	.db #0x08	; 8
	.db #0x1c	; 28
	.db #0x10	; 16
	.db #0x19	; 25
	.db #0x10	; 16
	.db #0x32	; 50	'2'
	.db #0x21	; 33
	.db #0xc3	; 195
	.db #0x80	; 128
	.db #0x86	; 134
	.db #0x00	; 0
	.db #0x1c	; 28
	.db #0x00	; 0
	.db #0x30	; 48	'0'
	.db #0x08	; 8
	.db #0x60	; 96
	.db #0x10	; 16
	.db #0xc0	; 192
	.db #0x20	; 32
	.db #0xa0	; 160
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x08	; 8
	.db #0x00	; 0
	.db #0x30	; 48	'0'
	.db #0x08	; 8
	.db #0x68	; 104	'h'
	.db #0x10	; 16
	.db #0xe0	; 224
	.db #0x10	; 16
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x60	; 96
	.db #0x00	; 0
	.db #0x40	; 64
	.db #0x20	; 32
	.db #0x70	; 112	'p'
	.db #0x20	; 32
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x38	; 56	'8'
	.db #0x00	; 0
	.db #0xf6	; 246
	.db #0x18	; 24
	.db #0xf5	; 245
	.db #0x0e	; 14
	.db #0x7d	; 125
	.db #0x03	; 3
	.db #0x3e	; 62
	.db #0x01	; 1
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x80	; 128
	.db #0xff	; 255
	.db #0x40	; 64
	.db #0x7f	; 127
	.db #0x20	; 32
	.db #0x3f	; 63
	.db #0x10	; 16
	.db #0x87	; 135
	.db #0x18	; 24
	.db #0x5f	; 95
	.db #0x88	; 136
	.db #0xef	; 239
	.db #0xc4	; 196
	.db #0xf8	; 248
	.db #0x00	; 0
	.db #0xf8	; 248
	.db #0x00	; 0
	.db #0xe0	; 224
	.db #0x00	; 0
	.db #0xe0	; 224
	.db #0x00	; 0
	.db #0xf0	; 240
	.db #0x00	; 0
	.db #0xfc	; 252
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0xe0	; 224
	.db #0x00	; 0
	.db #0xbd	; 189
	.db #0x43	; 67	'C'
	.db #0x6e	; 110	'n'
	.db #0x1f	; 31
	.db #0x17	; 23
	.db #0x0f	; 15
	.db #0x01	; 1
	.db #0x07	; 7
	.db #0x06	; 6
	.db #0x01	; 1
	.db #0x3f	; 63
	.db #0x00	; 0
	.db #0x7f	; 127
	.db #0x00	; 0
	.db #0x4f	; 79	'O'
	.db #0x30	; 48	'0'
	.db #0xfb	; 251
	.db #0xfc	; 252
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x47	; 71	'G'
	.db #0xc7	; 199
	.db #0xe0	; 224
	.db #0xe0	; 224
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0x20	; 32
	.db #0xe0	; 224
	.db #0xd8	; 216
	.db #0x38	; 56	'8'
	.db #0xec	; 236
	.db #0x1c	; 28
	.db #0xf4	; 244
	.db #0x0c	; 12
	.db #0x7a	; 122	'z'
	.db #0x86	; 134
	.db #0xed	; 237
	.db #0xf3	; 243
	.db #0xfa	; 250
	.db #0xfd	; 253
	.db #0x1e	; 30
	.db #0x1f	; 31
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x40	; 64
	.db #0xc0	; 192
	.db #0xa0	; 160
	.db #0xe0	; 224
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0x78	; 120	'x'
	.db #0x78	; 120	'x'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x03	; 3
	.db #0x02	; 2
	.db #0x03	; 3
	.db #0x02	; 2
	.db #0x07	; 7
	.db #0x05	; 5
	.db #0x0f	; 15
	.db #0x0b	; 11
	.db #0x67	; 103	'g'
	.db #0x43	; 67	'C'
	.db #0xe7	; 231
	.db #0x8e	; 142
	.db #0xdf	; 223
	.db #0x9c	; 156
	.db #0xbe	; 190
	.db #0x3c	; 60
	.db #0x6e	; 110	'n'
	.db #0x68	; 104	'h'
	.db #0xcc	; 204
	.db #0xc8	; 200
	.db #0x9c	; 156
	.db #0x90	; 144
	.db #0x18	; 24
	.db #0x10	; 16
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x0c	; 12
	.db #0x00	; 0
	.db #0x14	; 20
	.db #0x08	; 8
	.db #0x30	; 48	'0'
	.db #0x08	; 8
	.db #0x38	; 56	'8'
	.db #0x10	; 16
	.db #0x78	; 120	'x'
	.db #0x10	; 16
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x00	; 0
	.db #0x0f	; 15
	.db #0x00	; 0
	.db #0x1f	; 31
	.db #0x00	; 0
	.db #0x1f	; 31
	.db #0x00	; 0
	.db #0x3f	; 63
	.db #0x00	; 0
	.db #0x7f	; 127
	.db #0x01	; 1
	.db #0x7d	; 125
	.db #0x03	; 3
	.db #0xd8	; 216
	.db #0x20	; 32
	.db #0xe8	; 232
	.db #0x20	; 32
	.db #0x80	; 128
	.db #0x68	; 104	'h'
	.db #0xfc	; 252
	.db #0x48	; 72	'H'
	.db #0x7c	; 124
	.db #0xc8	; 200
	.db #0xe0	; 224
	.db #0xdc	; 220
	.db #0x7a	; 122	'z'
	.db #0xd4	; 212
	.db #0xfa	; 250
	.db #0x54	; 84	'T'
	.db #0x70	; 112	'p'
	.db #0x20	; 32
	.db #0x48	; 72	'H'
	.db #0x30	; 48	'0'
	.db #0x79	; 121	'y'
	.db #0x10	; 16
	.db #0x74	; 116	't'
	.db #0x19	; 25
	.db #0x7d	; 125
	.db #0x18	; 24
	.db #0x2a	; 42
	.db #0x1c	; 28
	.db #0x3e	; 62
	.db #0x0c	; 12
	.db #0x3f	; 63
	.db #0x0a	; 10
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0xc0	; 192
	.db #0x80	; 128
	.db #0x60	; 96
	.db #0xc0	; 192
	.db #0xf0	; 240
	.db #0x60	; 96
	.db #0x10	; 16
	.db #0x70	; 112	'p'
	.db #0x3f	; 63
	.db #0x00	; 0
	.db #0x1f	; 31
	.db #0x00	; 0
	.db #0x1f	; 31
	.db #0x00	; 0
	.db #0x0f	; 15
	.db #0x00	; 0
	.db #0x0f	; 15
	.db #0x00	; 0
	.db #0x0f	; 15
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x00	; 0
	.db #0xb9	; 185
	.db #0xe6	; 230
	.db #0xff	; 255
	.db #0x52	; 82	'R'
	.db #0x9c	; 156
	.db #0x6b	; 107	'k'
	.db #0xff	; 255
	.db #0x25	; 37
	.db #0xfe	; 254
	.db #0x23	; 35
	.db #0xcf	; 207
	.db #0x31	; 49	'1'
	.db #0xff	; 255
	.db #0x10	; 16
	.db #0xff	; 255
	.db #0x10	; 16
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xfe	; 254
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x5f	; 95
	.db #0xa0	; 160
	.db #0xef	; 239
	.db #0x90	; 144
	.db #0xff	; 255
	.db #0x88	; 136
	.db #0xff	; 255
	.db #0x04	; 4
	.db #0xf8	; 248
	.db #0x00	; 0
	.db #0x36	; 54	'6'
	.db #0x08	; 8
	.db #0x1f	; 31
	.db #0x04	; 4
	.db #0x86	; 134
	.db #0x03	; 3
	.db #0xc0	; 192
	.db #0x01	; 1
	.db #0xe0	; 224
	.db #0x00	; 0
	.db #0xf0	; 240
	.db #0x00	; 0
	.db #0xf8	; 248
	.db #0x00	; 0
	.db #0x1f	; 31
	.db #0x08	; 8
	.db #0x0d	; 13
	.db #0x06	; 6
	.db #0x83	; 131
	.db #0x01	; 1
	.db #0xe1	; 225
	.db #0x00	; 0
	.db #0xf8	; 248
	.db #0x80	; 128
	.db #0xfc	; 252
	.db #0x40	; 64
	.db #0x7f	; 127
	.db #0x20	; 32
	.db #0x3f	; 63
	.db #0x10	; 16
	.db #0xfe	; 254
	.db #0x06	; 6
	.db #0xff	; 255
	.db #0x03	; 3
	.db #0xff	; 255
	.db #0x01	; 1
	.db #0xbf	; 191
	.db #0xc0	; 192
	.db #0x7f	; 127
	.db #0x20	; 32
	.db #0x3f	; 63
	.db #0x10	; 16
	.db #0x1b	; 27
	.db #0x0c	; 12
	.db #0x8f	; 143
	.db #0x06	; 6
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xe0	; 224
	.db #0x60	; 96
	.db #0xf0	; 240
	.db #0x30	; 48	'0'
	.db #0xd8	; 216
	.db #0x38	; 56	'8'
	.db #0xf8	; 248
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x0e	; 14
	.db #0x0e	; 14
	.db #0x1c	; 28
	.db #0x1c	; 28
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x18	; 24
	.db #0x10	; 16
	.db #0x38	; 56	'8'
	.db #0x20	; 32
	.db #0x31	; 49	'1'
	.db #0x20	; 32
	.db #0x33	; 51	'3'
	.db #0x20	; 32
	.db #0x33	; 51	'3'
	.db #0x20	; 32
	.db #0x76	; 118	'v'
	.db #0x41	; 65	'A'
	.db #0x67	; 103	'g'
	.db #0x41	; 65	'A'
	.db #0x6f	; 111	'o'
	.db #0x43	; 67	'C'
	.db #0xc0	; 192
	.db #0x30	; 48	'0'
	.db #0xf1	; 241
	.db #0x20	; 32
	.db #0xb1	; 177
	.db #0x60	; 96
	.db #0xc3	; 195
	.db #0x60	; 96
	.db #0x83	; 131
	.db #0xe0	; 224
	.db #0xa7	; 167
	.db #0xc0	; 192
	.db #0xa7	; 167
	.db #0xc0	; 192
	.db #0xa7	; 167
	.db #0xc0	; 192
	.db #0xff	; 255
	.db #0x02	; 2
	.db #0xfd	; 253
	.db #0x06	; 6
	.db #0xd6	; 214
	.db #0x2c	; 44
	.db #0x9a	; 154
	.db #0x6c	; 108	'l'
	.db #0xef	; 239
	.db #0x5b	; 91
	.db #0xff	; 255
	.db #0x5f	; 95
	.db #0x38	; 56	'8'
	.db #0xd0	; 208
	.db #0xd8	; 216
	.db #0xb0	; 176
	.db #0xf8	; 248
	.db #0x56	; 86	'V'
	.db #0x5d	; 93
	.db #0x72	; 114	'r'
	.db #0x3d	; 61
	.db #0x72	; 114	'r'
	.db #0x78	; 120	'x'
	.db #0x33	; 51	'3'
	.db #0xfa	; 250
	.db #0xf9	; 249
	.db #0xff	; 255
	.db #0xfe	; 254
	.db #0x1f	; 31
	.db #0x13	; 19
	.db #0x00	; 0
	.db #0xf8	; 248
	.db #0x38	; 56	'8'
	.db #0x0f	; 15
	.db #0x17	; 23
	.db #0x0d	; 13
	.db #0x1f	; 31
	.db #0x04	; 4
	.db #0x9e	; 158
	.db #0x04	; 4
	.db #0x9c	; 156
	.db #0x06	; 6
	.db #0x5c	; 92
	.db #0x86	; 134
	.db #0x0b	; 11
	.db #0xc7	; 199
	.db #0xae	; 174
	.db #0x42	; 66	'B'
	.db #0xe8	; 232
	.db #0x38	; 56	'8'
	.db #0x88	; 136
	.db #0x3c	; 60
	.db #0xfe	; 254
	.db #0x94	; 148
	.db #0xe7	; 231
	.db #0x5a	; 90	'Z'
	.db #0x7f	; 127
	.db #0x3f	; 63
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x9f	; 159
	.db #0x8c	; 140
	.db #0x40	; 64
	.db #0x3e	; 62
	.db #0x07	; 7
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x83	; 131
	.db #0x00	; 0
	.db #0x81	; 129
	.db #0x80	; 128
	.db #0xc1	; 193
	.db #0xc0	; 192
	.db #0xe1	; 225
	.db #0x40	; 64
	.db #0xff	; 255
	.db #0x10	; 16
	.db #0xe7	; 231
	.db #0x18	; 24
	.db #0xff	; 255
	.db #0x08	; 8
	.db #0xfe	; 254
	.db #0x09	; 9
	.db #0xff	; 255
	.db #0x09	; 9
	.db #0xfe	; 254
	.db #0x09	; 9
	.db #0xff	; 255
	.db #0x08	; 8
	.db #0xff	; 255
	.db #0x08	; 8
	.db #0xff	; 255
	.db #0x02	; 2
	.db #0xff	; 255
	.db #0x01	; 1
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x7f	; 127
	.db #0x80	; 128
	.db #0xff	; 255
	.db #0x80	; 128
	.db #0xff	; 255
	.db #0x80	; 128
	.db #0xfc	; 252
	.db #0x00	; 0
	.db #0xfe	; 254
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x80	; 128
	.db #0x7f	; 127
	.db #0xc0	; 192
	.db #0xbf	; 191
	.db #0x60	; 96
	.db #0xff	; 255
	.db #0x30	; 48	'0'
	.db #0x77	; 119	'w'
	.db #0x98	; 152
	.db #0xef	; 239
	.db #0x98	; 152
	.db #0x0f	; 15
	.db #0x08	; 8
	.db #0x07	; 7
	.db #0x04	; 4
	.db #0x03	; 3
	.db #0x02	; 2
	.db #0x81	; 129
	.db #0x01	; 1
	.db #0x81	; 129
	.db #0x00	; 0
	.db #0xc0	; 192
	.db #0x00	; 0
	.db #0xe0	; 224
	.db #0x00	; 0
	.db #0xe0	; 224
	.db #0x00	; 0
	.db #0xc7	; 199
	.db #0x03	; 3
	.db #0xe3	; 227
	.db #0x01	; 1
	.db #0xf1	; 241
	.db #0x00	; 0
	.db #0xf0	; 240
	.db #0x00	; 0
	.db #0xf8	; 248
	.db #0x80	; 128
	.db #0xfc	; 252
	.db #0x40	; 64
	.db #0x7c	; 124
	.db #0x20	; 32
	.db #0x0e	; 14
	.db #0x30	; 48	'0'
	.db #0xfc	; 252
	.db #0x0c	; 12
	.db #0xf6	; 246
	.db #0x8e	; 142
	.db #0xfe	; 254
	.db #0xc6	; 198
	.db #0xff	; 255
	.db #0x63	; 99	'c'
	.db #0x3d	; 61
	.db #0x73	; 115	's'
	.db #0x5f	; 95
	.db #0x39	; 57	'9'
	.db #0x2f	; 47
	.db #0x1c	; 28
	.db #0x0f	; 15
	.db #0x1e	; 30
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0x60	; 96
	.db #0xe0	; 224
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x6b	; 107	'k'
	.db #0x47	; 71	'G'
	.db #0x7e	; 126
	.db #0x46	; 70	'F'
	.db #0x7c	; 124
	.db #0x4c	; 76	'L'
	.db #0x6c	; 108	'l'
	.db #0x5c	; 92
	.db #0x78	; 120	'x'
	.db #0x58	; 88	'X'
	.db #0x50	; 80	'P'
	.db #0x70	; 112	'p'
	.db #0x70	; 112	'p'
	.db #0x70	; 112	'p'
	.db #0x60	; 96
	.db #0x60	; 96
	.db #0x87	; 135
	.db #0xc0	; 192
	.db #0x8f	; 143
	.db #0xc0	; 192
	.db #0x8e	; 142
	.db #0xc1	; 193
	.db #0x8f	; 143
	.db #0xc1	; 193
	.db #0xaf	; 175
	.db #0xc1	; 193
	.db #0xaf	; 175
	.db #0xc1	; 193
	.db #0xaf	; 175
	.db #0xc1	; 193
	.db #0x5f	; 95
	.db #0x61	; 97	'a'
	.db #0xe0	; 224
	.db #0xb1	; 177
	.db #0xf0	; 240
	.db #0xa3	; 163
	.db #0x21	; 33
	.db #0xee	; 238
	.db #0xc0	; 192
	.db #0x66	; 102	'f'
	.db #0xc4	; 196
	.db #0x60	; 96
	.db #0xd0	; 208
	.db #0x60	; 96
	.db #0xc0	; 192
	.db #0x70	; 112	'p'
	.db #0xe0	; 224
	.db #0x50	; 80	'P'
	.db #0x00	; 0
	.db #0xfc	; 252
	.db #0x88	; 136
	.db #0x06	; 6
	.db #0x4c	; 76	'L'
	.db #0x4b	; 75	'K'
	.db #0xdc	; 220
	.db #0xdc	; 220
	.db #0x78	; 120	'x'
	.db #0xfc	; 252
	.db #0x10	; 16
	.db #0xfc	; 252
	.db #0x48	; 72	'H'
	.db #0xb4	; 180
	.db #0x78	; 120	'x'
	.db #0x84	; 132
	.db #0x56	; 86	'V'
	.db #0x22	; 34
	.db #0x27	; 39
	.db #0x12	; 18
	.db #0x13	; 19
	.db #0x09	; 9
	.db #0x0b	; 11
	.db #0x05	; 5
	.db #0x05	; 5
	.db #0x03	; 3
	.db #0x02	; 2
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x7f	; 127
	.db #0x22	; 34
	.db #0xc1	; 193
	.db #0x65	; 101	'e'
	.db #0xa4	; 164
	.db #0x6e	; 110	'n'
	.db #0x6e	; 110	'n'
	.db #0x3c	; 60
	.db #0x7e	; 126
	.db #0x88	; 136
	.db #0xfe	; 254
	.db #0xa4	; 164
	.db #0xda	; 218
	.db #0x3c	; 60
	.db #0x42	; 66	'B'
	.db #0x71	; 113	'q'
	.db #0x20	; 32
	.db #0x51	; 81	'Q'
	.db #0xb0	; 176
	.db #0x19	; 25
	.db #0xf0	; 240
	.db #0x0d	; 13
	.db #0xd8	; 216
	.db #0x5d	; 93
	.db #0x08	; 8
	.db #0x1b	; 27
	.db #0x0c	; 12
	.db #0x07	; 7
	.db #0x1c	; 28
	.db #0x07	; 7
	.db #0x1c	; 28
	.db #0xff	; 255
	.db #0x08	; 8
	.db #0xff	; 255
	.db #0x08	; 8
	.db #0xef	; 239
	.db #0x18	; 24
	.db #0xff	; 255
	.db #0x18	; 24
	.db #0xff	; 255
	.db #0x18	; 24
	.db #0xff	; 255
	.db #0x18	; 24
	.db #0xff	; 255
	.db #0x18	; 24
	.db #0xcf	; 207
	.db #0x38	; 56	'8'
	.db #0xbf	; 191
	.db #0xc0	; 192
	.db #0x7a	; 122	'z'
	.db #0xc4	; 196
	.db #0x7e	; 126
	.db #0xc4	; 196
	.db #0xf8	; 248
	.db #0x46	; 70	'F'
	.db #0xdf	; 223
	.db #0x62	; 98	'b'
	.db #0xf7	; 247
	.db #0x6a	; 106	'j'
	.db #0xfc	; 252
	.db #0x6b	; 107	'k'
	.db #0xbf	; 191
	.db #0x69	; 105	'i'
	.db #0x3f	; 63
	.db #0xcc	; 204
	.db #0xff	; 255
	.db #0x46	; 70	'F'
	.db #0x9a	; 154
	.db #0x67	; 103	'g'
	.db #0x3f	; 63
	.db #0x63	; 99	'c'
	.db #0x6d	; 109	'm'
	.db #0x33	; 51	'3'
	.db #0x5f	; 95
	.db #0x31	; 49	'1'
	.db #0x1f	; 31
	.db #0x31	; 49	'1'
	.db #0x96	; 150
	.db #0x39	; 57	'9'
	.db #0xf0	; 240
	.db #0x00	; 0
	.db #0xf8	; 248
	.db #0x00	; 0
	.db #0xf8	; 248
	.db #0x00	; 0
	.db #0xfc	; 252
	.db #0x00	; 0
	.db #0xfe	; 254
	.db #0x80	; 128
	.db #0xbe	; 190
	.db #0xc0	; 192
	.db #0x7f	; 127
	.db #0xc0	; 192
	.db #0xdf	; 223
	.db #0xe0	; 224
	.db #0x1f	; 31
	.db #0x10	; 16
	.db #0x1f	; 31
	.db #0x08	; 8
	.db #0x0f	; 15
	.db #0x04	; 4
	.db #0x01	; 1
	.db #0x06	; 6
	.db #0x07	; 7
	.db #0x02	; 2
	.db #0x03	; 3
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x81	; 129
	.db #0x00	; 0
	.db #0x17	; 23
	.db #0x0f	; 15
	.db #0x05	; 5
	.db #0x0d	; 13
	.db #0x8b	; 139
	.db #0x07	; 7
	.db #0xca	; 202
	.db #0x06	; 6
	.db #0xc2	; 194
	.db #0x06	; 6
	.db #0xe5	; 229
	.db #0x03	; 3
	.db #0x71	; 113	'q'
	.db #0x83	; 131
	.db #0xf2	; 242
	.db #0x81	; 129
	.db #0xe0	; 224
	.db #0x60	; 96
	.db #0xb0	; 176
	.db #0xf0	; 240
	.db #0xb0	; 176
	.db #0xf0	; 240
	.db #0xd8	; 216
	.db #0xf8	; 248
	.db #0x78	; 120	'x'
	.db #0x78	; 120	'x'
	.db #0x3c	; 60
	.db #0x3c	; 60
	.db #0x3c	; 60
	.db #0x3c	; 60
	.db #0x9e	; 158
	.db #0x9e	; 158
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x20	; 32
	.db #0x20	; 32
	.db #0x20	; 32
	.db #0x20	; 32
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x5f	; 95
	.db #0x61	; 97	'a'
	.db #0x7f	; 127
	.db #0x61	; 97	'a'
	.db #0x6f	; 111	'o'
	.db #0x71	; 113	'q'
	.db #0x3e	; 62
	.db #0x31	; 49	'1'
	.db #0x36	; 54	'6'
	.db #0x39	; 57	'9'
	.db #0x1f	; 31
	.db #0x18	; 24
	.db #0x0f	; 15
	.db #0x0c	; 12
	.db #0x07	; 7
	.db #0x06	; 6
	.db #0x29	; 41
	.db #0xd0	; 208
	.db #0xe0	; 224
	.db #0x98	; 152
	.db #0xf0	; 240
	.db #0x88	; 136
	.db #0xf4	; 244
	.db #0x88	; 136
	.db #0xe0	; 224
	.db #0x8c	; 140
	.db #0xe0	; 224
	.db #0x8c	; 140
	.db #0xc0	; 192
	.db #0x8e	; 142
	.db #0x05	; 5
	.db #0xca	; 202
	.db #0x84	; 132
	.db #0x78	; 120	'x'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0x00	; 0
	.db #0x08	; 8
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x00	; 0
	.db #0x82	; 130
	.db #0x7c	; 124
	.db #0x00	; 0
	.db #0x82	; 130
	.db #0x00	; 0
	.db #0x82	; 130
	.db #0x43	; 67	'C'
	.db #0x3c	; 60
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x2f	; 47
	.db #0x14	; 20
	.db #0x09	; 9
	.db #0x36	; 54	'6'
	.db #0x0f	; 15
	.db #0x32	; 50	'2'
	.db #0x57	; 87	'W'
	.db #0x22	; 34
	.db #0x17	; 23
	.db #0x62	; 98	'b'
	.db #0x1b	; 27
	.db #0x62	; 98	'b'
	.db #0x3b	; 59
	.db #0xc3	; 195
	.db #0x2a	; 42
	.db #0xd3	; 211
	.db #0xff	; 255
	.db #0x28	; 40
	.db #0xff	; 255
	.db #0x28	; 40
	.db #0x9f	; 159
	.db #0x68	; 104	'h'
	.db #0xef	; 239
	.db #0x58	; 88	'X'
	.db #0x2f	; 47
	.db #0xd8	; 216
	.db #0xff	; 255
	.db #0x98	; 152
	.db #0xff	; 255
	.db #0x18	; 24
	.db #0xdf	; 223
	.db #0x38	; 56	'8'
	.db #0xb3	; 179
	.db #0x6d	; 109	'm'
	.db #0xaf	; 175
	.db #0x75	; 117	'u'
	.db #0xbe	; 190
	.db #0x75	; 117	'u'
	.db #0xbf	; 191
	.db #0x74	; 116	't'
	.db #0xb9	; 185
	.db #0x76	; 118	'v'
	.db #0xbf	; 191
	.db #0x72	; 114	'r'
	.db #0xb7	; 183
	.db #0x7a	; 122	'z'
	.db #0xb7	; 183
	.db #0x7a	; 122	'z'
	.db #0xaf	; 175
	.db #0x18	; 24
	.db #0xab	; 171
	.db #0x1c	; 28
	.db #0x2f	; 47
	.db #0x9c	; 156
	.db #0xcf	; 207
	.db #0x9c	; 156
	.db #0xcd	; 205
	.db #0x9e	; 158
	.db #0xcf	; 207
	.db #0x9e	; 158
	.db #0xd7	; 215
	.db #0x8e	; 142
	.db #0x16	; 22
	.db #0xcf	; 207
	.db #0xbf	; 191
	.db #0xe0	; 224
	.db #0xaf	; 175
	.db #0xf0	; 240
	.db #0x9f	; 159
	.db #0xf0	; 240
	.db #0x57	; 87	'W'
	.db #0xf8	; 248
	.db #0xdf	; 223
	.db #0x78	; 120	'x'
	.db #0xcb	; 203
	.db #0x7c	; 124
	.db #0xef	; 239
	.db #0x7c	; 124
	.db #0xed	; 237
	.db #0x7e	; 126
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0xc0	; 192
	.db #0x00	; 0
	.db #0xc0	; 192
	.db #0x00	; 0
	.db #0xe0	; 224
	.db #0x00	; 0
	.db #0xe0	; 224
	.db #0x00	; 0
	.db #0xe0	; 224
	.db #0x00	; 0
	.db #0xf0	; 240
	.db #0x00	; 0
	.db #0xf0	; 240
	.db #0x00	; 0
	.db #0xfa	; 250
	.db #0x41	; 65	'A'
	.db #0x18	; 24
	.db #0x61	; 97	'a'
	.db #0x7d	; 125
	.db #0x20	; 32
	.db #0x3d	; 61
	.db #0x10	; 16
	.db #0x26	; 38
	.db #0x18	; 24
	.db #0x1e	; 30
	.db #0x08	; 8
	.db #0x12	; 18
	.db #0x0c	; 12
	.db #0x0f	; 15
	.db #0x04	; 4
	.db #0x8e	; 142
	.db #0x8e	; 142
	.db #0x8f	; 143
	.db #0x8f	; 143
	.db #0x47	; 71	'G'
	.db #0xc7	; 199
	.db #0x47	; 71	'G'
	.db #0xc7	; 199
	.db #0x43	; 67	'C'
	.db #0xc3	; 195
	.db #0xa3	; 163
	.db #0x63	; 99	'c'
	.db #0xa1	; 161
	.db #0x61	; 97	'a'
	.db #0x21	; 33
	.db #0x61	; 97	'a'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xe0	; 224
	.db #0xe0	; 224
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x46	; 70	'F'
	.db #0xc9	; 201
	.db #0xe5	; 229
	.db #0xcb	; 203
	.db #0x92	; 146
	.db #0xee	; 238
	.db #0xf2	; 242
	.db #0x8e	; 142
	.db #0xd2	; 210
	.db #0x8e	; 142
	.db #0xc3	; 195
	.db #0x8f	; 143
	.db #0xc0	; 192
	.db #0x8f	; 143
	.db #0xc0	; 192
	.db #0x8c	; 140
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0xa0	; 160
	.db #0xc0	; 192
	.db #0x48	; 72	'H'
	.db #0x70	; 112	'p'
	.db #0xe2	; 226
	.db #0xfc	; 252
	.db #0x0c	; 12
	.db #0xe3	; 227
	.db #0x11	; 17
	.db #0x2e	; 46
	.db #0x00	; 0
	.db #0x27	; 39
	.db #0x44	; 68	'D'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x44	; 68	'D'
	.db #0x28	; 40
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x44	; 68	'D'
	.db #0x83	; 131
	.db #0x01	; 1
	.db #0xfe	; 254
	.db #0x7c	; 124
	.db #0x83	; 131
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x0b	; 11
	.db #0x07	; 7
	.db #0x24	; 36
	.db #0x1c	; 28
	.db #0x88	; 136
	.db #0x78	; 120	'x'
	.db #0x07	; 7
	.db #0xff	; 255
	.db #0x10	; 16
	.db #0xc7	; 199
	.db #0x20	; 32
	.db #0xc4	; 196
	.db #0xab	; 171
	.db #0x52	; 82	'R'
	.db #0xbb	; 187
	.db #0x52	; 82	'R'
	.db #0x3b	; 59
	.db #0xd2	; 210
	.db #0xbb	; 187
	.db #0xd2	; 210
	.db #0xbb	; 187
	.db #0xd2	; 210
	.db #0x4b	; 75	'K'
	.db #0xb2	; 178
	.db #0x5a	; 90	'Z'
	.db #0xa3	; 163
	.db #0x5b	; 91
	.db #0xa3	; 163
	.db #0xdf	; 223
	.db #0x38	; 56	'8'
	.db #0xff	; 255
	.db #0x38	; 56	'8'
	.db #0xbf	; 191
	.db #0x78	; 120	'x'
	.db #0xbf	; 191
	.db #0x78	; 120	'x'
	.db #0x7f	; 127
	.db #0xf8	; 248
	.db #0x7f	; 127
	.db #0xf8	; 248
	.db #0xdf	; 223
	.db #0xd8	; 216
	.db #0x9f	; 159
	.db #0x98	; 152
	.db #0xbf	; 191
	.db #0x7a	; 122	'z'
	.db #0xaf	; 175
	.db #0x7a	; 122	'z'
	.db #0x8c	; 140
	.db #0x7b	; 123
	.db #0x8c	; 140
	.db #0x7b	; 123
	.db #0xec	; 236
	.db #0x5b	; 91
	.db #0xeb	; 235
	.db #0x5d	; 93
	.db #0xeb	; 235
	.db #0x5d	; 93
	.db #0x2f	; 47
	.db #0xdd	; 221
	.db #0xd7	; 215
	.db #0x4f	; 79	'O'
	.db #0xd7	; 215
	.db #0x4f	; 79	'O'
	.db #0xe7	; 231
	.db #0x4f	; 79	'O'
	.db #0xa7	; 167
	.db #0x4f	; 79	'O'
	.db #0xa5	; 165
	.db #0x4d	; 77	'M'
	.db #0xe5	; 229
	.db #0x0d	; 13
	.db #0xe5	; 229
	.db #0x0d	; 13
	.db #0xe5	; 229
	.db #0x0d	; 13
	.db #0xa5	; 165
	.db #0x7e	; 126
	.db #0xb7	; 183
	.db #0x7e	; 126
	.db #0xf6	; 246
	.db #0x3f	; 63
	.db #0x76	; 118	'v'
	.db #0xbf	; 191
	.db #0x73	; 115	's'
	.db #0xbf	; 191
	.db #0x7b	; 123
	.db #0xbf	; 191
	.db #0x7b	; 123
	.db #0xbf	; 191
	.db #0x7b	; 123
	.db #0xbf	; 191
	.db #0xf0	; 240
	.db #0x00	; 0
	.db #0xf8	; 248
	.db #0x00	; 0
	.db #0xf8	; 248
	.db #0x00	; 0
	.db #0xf8	; 248
	.db #0x00	; 0
	.db #0xf8	; 248
	.db #0x00	; 0
	.db #0x7c	; 124
	.db #0x80	; 128
	.db #0x7c	; 124
	.db #0x80	; 128
	.db #0xfc	; 252
	.db #0x80	; 128
	.db #0x0d	; 13
	.db #0x06	; 6
	.db #0x03	; 3
	.db #0x06	; 6
	.db #0x07	; 7
	.db #0x02	; 2
	.db #0x06	; 6
	.db #0x03	; 3
	.db #0x05	; 5
	.db #0x03	; 3
	.db #0x01	; 1
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x01	; 1
	.db #0x50	; 80	'P'
	.db #0x30	; 48	'0'
	.db #0x50	; 80	'P'
	.db #0x30	; 48	'0'
	.db #0x90	; 144
	.db #0x30	; 48	'0'
	.db #0x90	; 144
	.db #0x30	; 48	'0'
	.db #0xa8	; 168
	.db #0x18	; 24
	.db #0xe8	; 232
	.db #0x18	; 24
	.db #0x48	; 72	'H'
	.db #0x98	; 152
	.db #0xc8	; 200
	.db #0x98	; 152
	.db #0xe0	; 224
	.db #0xe0	; 224
	.db #0xe0	; 224
	.db #0xe0	; 224
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0x70	; 112	'p'
	.db #0x70	; 112	'p'
	.db #0x70	; 112	'p'
	.db #0x70	; 112	'p'
	.db #0x70	; 112	'p'
	.db #0x70	; 112	'p'
	.db #0x38	; 56	'8'
	.db #0x38	; 56	'8'
	.db #0x38	; 56	'8'
	.db #0x38	; 56	'8'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x03	; 3
	.db #0x04	; 4
	.db #0x06	; 6
	.db #0x08	; 8
	.db #0x0c	; 12
	.db #0x10	; 16
	.db #0x1f	; 31
	.db #0x38	; 56	'8'
	.db #0x3c	; 60
	.db #0x10	; 16
	.db #0x18	; 24
	.db #0x20	; 32
	.db #0x30	; 48	'0'
	.db #0x20	; 32
	.db #0x30	; 48	'0'
	.db #0xc0	; 192
	.db #0x8c	; 140
	.db #0xc0	; 192
	.db #0x8e	; 142
	.db #0xc0	; 192
	.db #0x8e	; 142
	.db #0xc0	; 192
	.db #0x8e	; 142
	.db #0xc0	; 192
	.db #0x8e	; 142
	.db #0xe0	; 224
	.db #0x8b	; 139
	.db #0xa0	; 160
	.db #0xcb	; 203
	.db #0xe0	; 224
	.db #0x4b	; 75	'K'
	.db #0x10	; 16
	.db #0x2c	; 44
	.db #0x00	; 0
	.db #0x18	; 24
	.db #0x08	; 8
	.db #0x10	; 16
	.db #0x00	; 0
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0xfe	; 254
	.db #0x40	; 64
	.db #0x88	; 136
	.db #0x10	; 16
	.db #0x40	; 64
	.db #0x00	; 0
	.db #0x40	; 64
	.db #0x00	; 0
	.db #0xc0	; 192
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x01	; 1
	.db #0x80	; 128
	.db #0x02	; 2
	.db #0x01	; 1
	.db #0x28	; 40
	.db #0x44	; 68	'D'
	.db #0x20	; 32
	.db #0x48	; 72	'H'
	.db #0x40	; 64
	.db #0x11	; 17
	.db #0x60	; 96
	.db #0x11	; 17
	.db #0xc0	; 192
	.db #0x21	; 33
	.db #0x80	; 128
	.db #0x41	; 65	'A'
	.db #0x01	; 1
	.db #0x82	; 130
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x53	; 83	'S'
	.db #0xa3	; 163
	.db #0x12	; 18
	.db #0xe3	; 227
	.db #0x92	; 146
	.db #0x62	; 98	'b'
	.db #0x96	; 150
	.db #0x62	; 98	'b'
	.db #0x16	; 22
	.db #0xa2	; 162
	.db #0x16	; 22
	.db #0xa3	; 163
	.db #0x12	; 18
	.db #0xa6	; 166
	.db #0x36	; 54	'6'
	.db #0x44	; 68	'D'
	.db #0x9f	; 159
	.db #0x98	; 152
	.db #0x5f	; 95
	.db #0xd8	; 216
	.db #0x3f	; 63
	.db #0x78	; 120	'x'
	.db #0x17	; 23
	.db #0x38	; 56	'8'
	.db #0x96	; 150
	.db #0x79	; 121	'y'
	.db #0x0f	; 15
	.db #0x91	; 145
	.db #0x0f	; 15
	.db #0x11	; 17
	.db #0x04	; 4
	.db #0x0b	; 11
	.db #0x3f	; 63
	.db #0xdd	; 221
	.db #0xff	; 255
	.db #0x9d	; 157
	.db #0xff	; 255
	.db #0x9d	; 157
	.db #0xff	; 255
	.db #0x9d	; 157
	.db #0x7d	; 125
	.db #0x9f	; 159
	.db #0xdd	; 221
	.db #0x3f	; 63
	.db #0xfd	; 253
	.db #0x3f	; 63
	.db #0xf7	; 247
	.db #0x37	; 55	'7'
	.db #0xe5	; 229
	.db #0x0d	; 13
	.db #0xe5	; 229
	.db #0x0d	; 13
	.db #0xd5	; 213
	.db #0x0d	; 13
	.db #0xd5	; 213
	.db #0x0d	; 13
	.db #0xd5	; 213
	.db #0x0d	; 13
	.db #0xd5	; 213
	.db #0x0d	; 13
	.db #0xc9	; 201
	.db #0x19	; 25
	.db #0xe9	; 233
	.db #0x19	; 25
	.db #0x7b	; 123
	.db #0xbf	; 191
	.db #0x7b	; 123
	.db #0xbf	; 191
	.db #0x7b	; 123
	.db #0xbf	; 191
	.db #0x7b	; 123
	.db #0xbf	; 191
	.db #0x3b	; 59
	.db #0xff	; 255
	.db #0x3b	; 59
	.db #0xff	; 255
	.db #0x6b	; 107	'k'
	.db #0xef	; 239
	.db #0x6b	; 107	'k'
	.db #0xef	; 239
	.db #0xfc	; 252
	.db #0x80	; 128
	.db #0xbc	; 188
	.db #0xc0	; 192
	.db #0xbe	; 190
	.db #0xc0	; 192
	.db #0xfe	; 254
	.db #0xc0	; 192
	.db #0xfe	; 254
	.db #0xc0	; 192
	.db #0xfe	; 254
	.db #0xc0	; 192
	.db #0xfe	; 254
	.db #0xc0	; 192
	.db #0xde	; 222
	.db #0xe0	; 224
	.db #0x02	; 2
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x01	; 1
	.db #0xc8	; 200
	.db #0x98	; 152
	.db #0xa8	; 168
	.db #0xd8	; 216
	.db #0xb4	; 180
	.db #0xcc	; 204
	.db #0xf4	; 244
	.db #0xcc	; 204
	.db #0xf4	; 244
	.db #0xcc	; 204
	.db #0xf4	; 244
	.db #0xcc	; 204
	.db #0xd4	; 212
	.db #0xec	; 236
	.db #0xd4	; 212
	.db #0xec	; 236
	.db #0x38	; 56	'8'
	.db #0x38	; 56	'8'
	.db #0x38	; 56	'8'
	.db #0x38	; 56	'8'
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x03	; 3
	.db #0x04	; 4
	.db #0x06	; 6
	.db #0x08	; 8
	.db #0x0c	; 12
	.db #0x0a	; 10
	.db #0x0c	; 12
	.db #0x40	; 64
	.db #0x60	; 96
	.db #0x80	; 128
	.db #0xc0	; 192
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x60	; 96
	.db #0x49	; 73	'I'
	.db #0x48	; 72	'H'
	.db #0x65	; 101	'e'
	.db #0x78	; 120	'x'
	.db #0x27	; 39
	.db #0x30	; 48	'0'
	.db #0x24	; 36
	.db #0x18	; 24
	.db #0x34	; 52	'4'
	.db #0x18	; 24
	.db #0x34	; 52	'4'
	.db #0x0c	; 12
	.db #0x2a	; 42
	.db #0x68	; 104	'h'
	.db #0x0e	; 14
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0xc0	; 192
	.db #0x00	; 0
	.db #0x40	; 64
	.db #0x00	; 0
	.db #0x60	; 96
	.db #0x00	; 0
	.db #0x50	; 80	'P'
	.db #0x00	; 0
	.db #0x40	; 64
	.db #0x28	; 40
	.db #0x41	; 65	'A'
	.db #0x04	; 4
	.db #0x82	; 130
	.db #0x38	; 56	'8'
	.db #0x44	; 68	'D'
	.db #0x10	; 16
	.db #0x28	; 40
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0x00	; 0
	.db #0x3c	; 60
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x38	; 56	'8'
	.db #0xc7	; 199
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x06	; 6
	.db #0x00	; 0
	.db #0x06	; 6
	.db #0x00	; 0
	.db #0x0f	; 15
	.db #0x00	; 0
	.db #0x0c	; 12
	.db #0x00	; 0
	.db #0x14	; 20
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x28	; 40
	.db #0x84	; 132
	.db #0x2c	; 44
	.db #0x44	; 68	'D'
	.db #0x2e	; 46
	.db #0x44	; 68	'D'
	.db #0x24	; 36
	.db #0x4e	; 78	'N'
	.db #0x3c	; 60
	.db #0xca	; 202
	.db #0x7c	; 124
	.db #0x8a	; 138
	.db #0x68	; 104	'h'
	.db #0x9e	; 158
	.db #0x70	; 112	'p'
	.db #0x90	; 144
	.db #0x50	; 80	'P'
	.db #0xb0	; 176
	.db #0x03	; 3
	.db #0x06	; 6
	.db #0x01	; 1
	.db #0x06	; 6
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xf7	; 247
	.db #0x37	; 55	'7'
	.db #0xb7	; 183
	.db #0x77	; 119	'w'
	.db #0xe7	; 231
	.db #0x67	; 103	'g'
	.db #0xe7	; 231
	.db #0x67	; 103	'g'
	.db #0x66	; 102	'f'
	.db #0xe7	; 231
	.db #0xc6	; 198
	.db #0xc7	; 199
	.db #0x46	; 70	'F'
	.db #0xc7	; 199
	.db #0x46	; 70	'F'
	.db #0xc7	; 199
	.db #0xe9	; 233
	.db #0x19	; 25
	.db #0xe9	; 233
	.db #0x19	; 25
	.db #0xe9	; 233
	.db #0x19	; 25
	.db #0xd2	; 210
	.db #0x33	; 51	'3'
	.db #0xd2	; 210
	.db #0x33	; 51	'3'
	.db #0xf2	; 242
	.db #0x33	; 51	'3'
	.db #0xb2	; 178
	.db #0x73	; 115	's'
	.db #0xe2	; 226
	.db #0x63	; 99	'c'
	.db #0x6b	; 107	'k'
	.db #0xef	; 239
	.db #0x6b	; 107	'k'
	.db #0xef	; 239
	.db #0x76	; 118	'v'
	.db #0xfe	; 254
	.db #0x76	; 118	'v'
	.db #0xfe	; 254
	.db #0xd6	; 214
	.db #0xde	; 222
	.db #0xd6	; 214
	.db #0xde	; 222
	.db #0xec	; 236
	.db #0xfc	; 252
	.db #0xec	; 236
	.db #0xfc	; 252
	.db #0xde	; 222
	.db #0xe0	; 224
	.db #0xfe	; 254
	.db #0xe0	; 224
	.db #0xfe	; 254
	.db #0xe0	; 224
	.db #0xfe	; 254
	.db #0xe0	; 224
	.db #0x7f	; 127
	.db #0x60	; 96
	.db #0x7f	; 127
	.db #0x60	; 96
	.db #0x6f	; 111	'o'
	.db #0x70	; 112	'p'
	.db #0x6f	; 111	'o'
	.db #0x70	; 112	'p'
	.db #0x02	; 2
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x03	; 3
	.db #0x01	; 1
	.db #0x03	; 3
	.db #0x01	; 1
	.db #0x03	; 3
	.db #0x01	; 1
	.db #0x03	; 3
	.db #0x05	; 5
	.db #0x03	; 3
	.db #0xf4	; 244
	.db #0xec	; 236
	.db #0xf4	; 244
	.db #0xec	; 236
	.db #0xf4	; 244
	.db #0xec	; 236
	.db #0x7c	; 124
	.db #0x6c	; 108	'l'
	.db #0x6c	; 108	'l'
	.db #0x7c	; 124
	.db #0x6c	; 108	'l'
	.db #0x7c	; 124
	.db #0x3c	; 60
	.db #0x3c	; 60
	.db #0x3c	; 60
	.db #0x3c	; 60
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x11	; 17
	.db #0x18	; 24
	.db #0x22	; 34
	.db #0x3c	; 60
	.db #0x42	; 66	'B'
	.db #0x61	; 97	'a'
	.db #0x44	; 68	'D'
	.db #0x78	; 120	'x'
	.db #0x20	; 32
	.db #0x3e	; 62
	.db #0x14	; 20
	.db #0x1b	; 27
	.db #0x0b	; 11
	.db #0x0c	; 12
	.db #0x05	; 5
	.db #0x06	; 6
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xc0	; 192
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x20	; 32
	.db #0x58	; 88	'X'
	.db #0x80	; 128
	.db #0x68	; 104	'h'
	.db #0x04	; 4
	.db #0x80	; 128
	.db #0x12	; 18
	.db #0x05	; 5
	.db #0xc8	; 200
	.db #0x86	; 134
	.db #0x60	; 96
	.db #0x04	; 4
	.db #0x46	; 70	'F'
	.db #0x02	; 2
	.db #0x43	; 67	'C'
	.db #0x01	; 1
	.db #0x41	; 65	'A'
	.db #0x00	; 0
	.db #0x40	; 64
	.db #0x00	; 0
	.db #0x40	; 64
	.db #0x00	; 0
	.db #0x40	; 64
	.db #0xa0	; 160
	.db #0x40	; 64
	.db #0x80	; 128
	.db #0x60	; 96
	.db #0x14	; 20
	.db #0x42	; 66	'B'
	.db #0x00	; 0
	.db #0x4d	; 77	'M'
	.db #0x00	; 0
	.db #0x71	; 113	'q'
	.db #0x80	; 128
	.db #0xe1	; 225
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x7c	; 124
	.db #0x82	; 130
	.db #0x7c	; 124
	.db #0x83	; 131
	.db #0xfe	; 254
	.db #0x01	; 1
	.db #0xfe	; 254
	.db #0x01	; 1
	.db #0xfe	; 254
	.db #0x01	; 1
	.db #0x7c	; 124
	.db #0x83	; 131
	.db #0x39	; 57	'9'
	.db #0xc6	; 198
	.db #0x00	; 0
	.db #0xfe	; 254
	.db #0x30	; 48	'0'
	.db #0x45	; 69	'E'
	.db #0x00	; 0
	.db #0x35	; 53	'5'
	.db #0x01	; 1
	.db #0x0e	; 14
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x01	; 1
	.db #0x07	; 7
	.db #0x06	; 6
	.db #0x0e	; 14
	.db #0x08	; 8
	.db #0x18	; 24
	.db #0x00	; 0
	.db #0x20	; 32
	.db #0xe0	; 224
	.db #0x30	; 48	'0'
	.db #0xa0	; 160
	.db #0x70	; 112	'p'
	.db #0x40	; 64
	.db #0xd0	; 208
	.db #0x80	; 128
	.db #0x90	; 144
	.db #0x02	; 2
	.db #0x11	; 17
	.db #0x08	; 8
	.db #0x14	; 20
	.db #0x01	; 1
	.db #0x12	; 18
	.db #0x24	; 36
	.db #0x18	; 24
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x01	; 1
	.db #0x10	; 16
	.db #0x0c	; 12
	.db #0x80	; 128
	.db #0x63	; 99	'c'
	.db #0x04	; 4
	.db #0x18	; 24
	.db #0x22	; 34
	.db #0xc1	; 193
	.db #0x11	; 17
	.db #0x0e	; 14
	.db #0x8e	; 142
	.db #0x71	; 113	'q'
	.db #0x26	; 38
	.db #0x67	; 103	'g'
	.db #0x25	; 37
	.db #0xe6	; 230
	.db #0x15	; 21
	.db #0x76	; 118	'v'
	.db #0x95	; 149
	.db #0x36	; 54	'6'
	.db #0x54	; 84	'T'
	.db #0x37	; 55	'7'
	.db #0x29	; 41
	.db #0xef	; 239
	.db #0x49	; 73	'I'
	.db #0xcf	; 207
	.db #0x89	; 137
	.db #0x8f	; 143
	.db #0xe2	; 226
	.db #0x63	; 99	'c'
	.db #0x65	; 101	'e'
	.db #0xe7	; 231
	.db #0xc5	; 197
	.db #0xc7	; 199
	.db #0xc5	; 197
	.db #0xc7	; 199
	.db #0xc5	; 197
	.db #0xc7	; 199
	.db #0x8b	; 139
	.db #0x8f	; 143
	.db #0x8b	; 139
	.db #0x8f	; 143
	.db #0x8b	; 139
	.db #0x8f	; 143
	.db #0xec	; 236
	.db #0xfc	; 252
	.db #0xd8	; 216
	.db #0xf8	; 248
	.db #0xd8	; 216
	.db #0xf8	; 248
	.db #0xd8	; 216
	.db #0xf8	; 248
	.db #0xb0	; 176
	.db #0xf0	; 240
	.db #0xb0	; 176
	.db #0xf0	; 240
	.db #0xb0	; 176
	.db #0xf0	; 240
	.db #0x60	; 96
	.db #0xe0	; 224
	.db #0x6f	; 111	'o'
	.db #0x70	; 112	'p'
	.db #0x5f	; 95
	.db #0x70	; 112	'p'
	.db #0x5f	; 95
	.db #0x70	; 112	'p'
	.db #0x5f	; 95
	.db #0x70	; 112	'p'
	.db #0x5f	; 95
	.db #0x70	; 112	'p'
	.db #0x5f	; 95
	.db #0x70	; 112	'p'
	.db #0x5f	; 95
	.db #0x70	; 112	'p'
	.db #0x57	; 87	'W'
	.db #0x78	; 120	'x'
	.db #0x05	; 5
	.db #0x03	; 3
	.db #0x05	; 5
	.db #0x03	; 3
	.db #0x05	; 5
	.db #0x03	; 3
	.db #0x02	; 2
	.db #0x06	; 6
	.db #0x02	; 2
	.db #0x06	; 6
	.db #0x02	; 2
	.db #0x06	; 6
	.db #0x0a	; 10
	.db #0x06	; 6
	.db #0x0a	; 10
	.db #0x06	; 6
	.db #0x3c	; 60
	.db #0x3c	; 60
	.db #0x3c	; 60
	.db #0x3c	; 60
	.db #0x3c	; 60
	.db #0x3c	; 60
	.db #0x3c	; 60
	.db #0x3c	; 60
	.db #0x3c	; 60
	.db #0x3c	; 60
	.db #0x3c	; 60
	.db #0x3c	; 60
	.db #0x3c	; 60
	.db #0x3c	; 60
	.db #0x3c	; 60
	.db #0x3c	; 60
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x03	; 3
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xe8	; 232
	.db #0x11	; 17
	.db #0x70	; 112	'p'
	.db #0x8c	; 140
	.db #0xb8	; 184
	.db #0xc6	; 198
	.db #0x4c	; 76	'L'
	.db #0x73	; 115	's'
	.db #0xe1	; 225
	.db #0xfe	; 254
	.db #0x19	; 25
	.db #0xfe	; 254
	.db #0xaa	; 170
	.db #0xdc	; 220
	.db #0x41	; 65	'A'
	.db #0x6c	; 108	'l'
	.db #0x10	; 16
	.db #0x20	; 32
	.db #0x60	; 96
	.db #0x90	; 144
	.db #0x70	; 112	'p'
	.db #0x08	; 8
	.db #0x84	; 132
	.db #0x18	; 24
	.db #0x00	; 0
	.db #0xcc	; 204
	.db #0x91	; 145
	.db #0x66	; 102	'f'
	.db #0xe1	; 225
	.db #0x1e	; 30
	.db #0x4d	; 77	'M'
	.db #0x82	; 130
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x01	; 1
	.db #0xc1	; 193
	.db #0x26	; 38
	.db #0x00	; 0
	.db #0x3f	; 63
	.db #0x14	; 20
	.db #0x22	; 34
	.db #0xba	; 186
	.db #0x44	; 68	'D'
	.db #0x44	; 68	'D'
	.db #0x38	; 56	'8'
	.db #0x48	; 72	'H'
	.db #0x30	; 48	'0'
	.db #0x20	; 32
	.db #0xdc	; 220
	.db #0x00	; 0
	.db #0xe3	; 227
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x02	; 2
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x0f	; 15
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x81	; 129
	.db #0x3c	; 60
	.db #0x43	; 67	'C'
	.db #0x04	; 4
	.db #0xe0	; 224
	.db #0x02	; 2
	.db #0x31	; 49	'1'
	.db #0x48	; 72	'H'
	.db #0x27	; 39
	.db #0xa3	; 163
	.db #0x5c	; 92
	.db #0x0f	; 15
	.db #0xf0	; 240
	.db #0x3b	; 59
	.db #0xc4	; 196
	.db #0x49	; 73	'I'
	.db #0x86	; 134
	.db #0x81	; 129
	.db #0x0a	; 10
	.db #0x50	; 80	'P'
	.db #0x8b	; 139
	.db #0x7d	; 125
	.db #0x83	; 131
	.db #0x72	; 114	'r'
	.db #0x8e	; 142
	.db #0x6c	; 108	'l'
	.db #0x9c	; 156
	.db #0x13	; 19
	.db #0xf3	; 243
	.db #0x6d	; 109	'm'
	.db #0xef	; 239
	.db #0x72	; 114	'r'
	.db #0xfe	; 254
	.db #0x44	; 68	'D'
	.db #0xfc	; 252
	.db #0x28	; 40
	.db #0xd8	; 216
	.db #0x0b	; 11
	.db #0x0f	; 15
	.db #0x13	; 19
	.db #0x1f	; 31
	.db #0x16	; 22
	.db #0x1e	; 30
	.db #0x96	; 150
	.db #0x9e	; 158
	.db #0x2c	; 44
	.db #0x3c	; 60
	.db #0x38	; 56	'8'
	.db #0x38	; 56	'8'
	.db #0x58	; 88	'X'
	.db #0x78	; 120	'x'
	.db #0x70	; 112	'p'
	.db #0x70	; 112	'p'
	.db #0x17	; 23
	.db #0x1f	; 31
	.db #0x16	; 22
	.db #0x1f	; 31
	.db #0x1e	; 30
	.db #0x1f	; 31
	.db #0x2d	; 45
	.db #0x3f	; 63
	.db #0x3d	; 61
	.db #0x3f	; 63
	.db #0x5b	; 91
	.db #0x7f	; 127
	.db #0x7a	; 122	'z'
	.db #0x7e	; 126
	.db #0xb6	; 182
	.db #0xfe	; 254
	.db #0x60	; 96
	.db #0xe0	; 224
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x57	; 87	'W'
	.db #0x78	; 120	'x'
	.db #0x57	; 87	'W'
	.db #0x78	; 120	'x'
	.db #0x5f	; 95
	.db #0x78	; 120	'x'
	.db #0x5f	; 95
	.db #0x78	; 120	'x'
	.db #0x3f	; 63
	.db #0x58	; 88	'X'
	.db #0x3e	; 62
	.db #0x58	; 88	'X'
	.db #0x3e	; 62
	.db #0x58	; 88	'X'
	.db #0x1e	; 30
	.db #0x78	; 120	'x'
	.db #0x0a	; 10
	.db #0x06	; 6
	.db #0x04	; 4
	.db #0x0c	; 12
	.db #0x04	; 4
	.db #0x0c	; 12
	.db #0x04	; 4
	.db #0x0c	; 12
	.db #0x14	; 20
	.db #0x0c	; 12
	.db #0x14	; 20
	.db #0x0c	; 12
	.db #0x08	; 8
	.db #0x18	; 24
	.db #0x08	; 8
	.db #0x18	; 24
	.db #0x3c	; 60
	.db #0x3c	; 60
	.db #0x3c	; 60
	.db #0x3c	; 60
	.db #0x3c	; 60
	.db #0x3c	; 60
	.db #0x38	; 56	'8'
	.db #0x38	; 56	'8'
	.db #0x78	; 120	'x'
	.db #0x78	; 120	'x'
	.db #0x78	; 120	'x'
	.db #0x78	; 120	'x'
	.db #0x78	; 120	'x'
	.db #0x78	; 120	'x'
	.db #0x70	; 112	'p'
	.db #0x70	; 112	'p'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x52	; 82	'R'
	.db #0x65	; 101	'e'
	.db #0x21	; 33
	.db #0x32	; 50	'2'
	.db #0x28	; 40
	.db #0x32	; 50	'2'
	.db #0x12	; 18
	.db #0x18	; 24
	.db #0x10	; 16
	.db #0x18	; 24
	.db #0x10	; 16
	.db #0x18	; 24
	.db #0x10	; 16
	.db #0x18	; 24
	.db #0x10	; 16
	.db #0x18	; 24
	.db #0x04	; 4
	.db #0x42	; 66	'B'
	.db #0x28	; 40
	.db #0x46	; 70	'F'
	.db #0x50	; 80	'P'
	.db #0x2a	; 42
	.db #0x00	; 0
	.db #0x32	; 50	'2'
	.db #0x24	; 36
	.db #0x02	; 2
	.db #0x08	; 8
	.db #0x06	; 6
	.db #0x08	; 8
	.db #0x0e	; 14
	.db #0x14	; 20
	.db #0x09	; 9
	.db #0x00	; 0
	.db #0x24	; 36
	.db #0x68	; 104	'h'
	.db #0x04	; 4
	.db #0x20	; 32
	.db #0x48	; 72	'H'
	.db #0x20	; 32
	.db #0x48	; 72	'H'
	.db #0x30	; 48	'0'
	.db #0x48	; 72	'H'
	.db #0x30	; 48	'0'
	.db #0x48	; 72	'H'
	.db #0x30	; 48	'0'
	.db #0x78	; 120	'x'
	.db #0x05	; 5
	.db #0xc8	; 200
	.db #0x04	; 4
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x10	; 16
	.db #0x28	; 40
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x20	; 32
	.db #0x50	; 80	'P'
	.db #0x20	; 32
	.db #0x3f	; 63
	.db #0x40	; 64
	.db #0xbf	; 191
	.db #0x40	; 64
	.db #0x03	; 3
	.db #0xff	; 255
	.db #0x04	; 4
	.db #0x20	; 32
	.db #0x04	; 4
	.db #0x20	; 32
	.db #0x04	; 4
	.db #0x20	; 32
	.db #0x11	; 17
	.db #0x24	; 36
	.db #0x53	; 83	'S'
	.db #0x24	; 36
	.db #0xd3	; 211
	.db #0x25	; 37
	.db #0xd2	; 210
	.db #0x26	; 38
	.db #0xc0	; 192
	.db #0xfc	; 252
	.db #0x28	; 40
	.db #0xd3	; 211
	.db #0x02	; 2
	.db #0xb0	; 176
	.db #0x00	; 0
	.db #0x90	; 144
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x02	; 2
	.db #0x41	; 65	'A'
	.db #0x10	; 16
	.db #0x30	; 48	'0'
	.db #0x50	; 80	'P'
	.db #0x30	; 48	'0'
	.db #0x21	; 33
	.db #0x61	; 97	'a'
	.db #0x20	; 32
	.db #0x60	; 96
	.db #0x20	; 32
	.db #0x60	; 96
	.db #0x3f	; 63
	.db #0x7f	; 127
	.db #0x80	; 128
	.db #0x7f	; 127
	.db #0x31	; 49	'1'
	.db #0xc0	; 192
	.db #0xe0	; 224
	.db #0xe0	; 224
	.db #0xc1	; 193
	.db #0xc1	; 193
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x02	; 2
	.db #0x03	; 3
	.db #0x9d	; 157
	.db #0x9f	; 159
	.db #0x67	; 103	'g'
	.db #0xff	; 255
	.db #0x86	; 134
	.db #0x7e	; 126
	.db #0xec	; 236
	.db #0xfc	; 252
	.db #0xd8	; 216
	.db #0xf8	; 248
	.db #0xb0	; 176
	.db #0xf0	; 240
	.db #0x60	; 96
	.db #0xe0	; 224
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x3e	; 62
	.db #0x78	; 120	'x'
	.db #0x3e	; 62
	.db #0x78	; 120	'x'
	.db #0x3e	; 62
	.db #0x78	; 120	'x'
	.db #0x7e	; 126
	.db #0xb8	; 184
	.db #0x7e	; 126
	.db #0xb8	; 184
	.db #0x3e	; 62
	.db #0xf8	; 248
	.db #0x7e	; 126
	.db #0xf8	; 248
	.db #0x7c	; 124
	.db #0xf8	; 248
	.db #0x28	; 40
	.db #0x18	; 24
	.db #0x28	; 40
	.db #0x18	; 24
	.db #0x10	; 16
	.db #0x30	; 48	'0'
	.db #0x51	; 81	'Q'
	.db #0x31	; 49	'1'
	.db #0x51	; 81	'Q'
	.db #0x31	; 49	'1'
	.db #0x23	; 35
	.db #0x63	; 99	'c'
	.db #0xa2	; 162
	.db #0x62	; 98	'b'
	.db #0xa0	; 160
	.db #0x60	; 96
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0xe0	; 224
	.db #0xe0	; 224
	.db #0xe0	; 224
	.db #0xe0	; 224
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x03	; 3
	.db #0x0c	; 12
	.db #0x0f	; 15
	.db #0x13	; 19
	.db #0x1c	; 28
	.db #0x10	; 16
	.db #0x18	; 24
	.db #0x28	; 40
	.db #0x30	; 48	'0'
	.db #0x20	; 32
	.db #0x30	; 48	'0'
	.db #0x50	; 80	'P'
	.db #0x60	; 96
	.db #0x90	; 144
	.db #0xe0	; 224
	.db #0x40	; 64
	.db #0xa0	; 160
	.db #0xc0	; 192
	.db #0x20	; 32
	.db #0xa0	; 160
	.db #0x40	; 64
	.db #0x10	; 16
	.db #0x18	; 24
	.db #0x10	; 16
	.db #0x18	; 24
	.db #0x30	; 48	'0'
	.db #0x18	; 24
	.db #0x20	; 32
	.db #0x38	; 56	'8'
	.db #0x78	; 120	'x'
	.db #0x2d	; 45
	.db #0xfd	; 253
	.db #0x52	; 82	'R'
	.db #0xde	; 222
	.db #0xa4	; 164
	.db #0xf8	; 248
	.db #0x88	; 136
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x13	; 19
	.db #0x0c	; 12
	.db #0x0c	; 12
	.db #0x30	; 48	'0'
	.db #0xb0	; 176
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x66	; 102	'f'
	.db #0x81	; 129
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0x30	; 48	'0'
	.db #0x38	; 56	'8'
	.db #0x08	; 8
	.db #0x1c	; 28
	.db #0x04	; 4
	.db #0x0e	; 14
	.db #0x02	; 2
	.db #0x07	; 7
	.db #0x01	; 1
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x09	; 9
	.db #0x26	; 38
	.db #0x0e	; 14
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x10	; 16
	.db #0x30	; 48	'0'
	.db #0x20	; 32
	.db #0x60	; 96
	.db #0x40	; 64
	.db #0xf8	; 248
	.db #0x80	; 128
	.db #0xbe	; 190
	.db #0xc0	; 192
	.db #0x7f	; 127
	.db #0xc0	; 192
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x08	; 8
	.db #0x00	; 0
	.db #0x19	; 25
	.db #0x07	; 7
	.db #0x02	; 2
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x40	; 64
	.db #0xc0	; 192
	.db #0xa0	; 160
	.db #0x60	; 96
	.db #0x50	; 80	'P'
	.db #0x30	; 48	'0'
	.db #0x08	; 8
	.db #0x18	; 24
	.db #0x04	; 4
	.db #0x0c	; 12
	.db #0x02	; 2
	.db #0x06	; 6
	.db #0x01	; 1
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x03	; 3
	.db #0x01	; 1
	.db #0x03	; 3
	.db #0x01	; 1
	.db #0x03	; 3
	.db #0x75	; 117	'u'
	.db #0xf8	; 248
	.db #0x75	; 117	'u'
	.db #0xf8	; 248
	.db #0xfe	; 254
	.db #0xf1	; 241
	.db #0xfe	; 254
	.db #0xf1	; 241
	.db #0xfd	; 253
	.db #0xf3	; 243
	.db #0xbd	; 189
	.db #0xb3	; 179
	.db #0xba	; 186
	.db #0xb6	; 182
	.db #0xea	; 234
	.db #0xf6	; 246
	.db #0x40	; 64
	.db #0xc0	; 192
	.db #0x40	; 64
	.db #0xc0	; 192
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x03	; 3
	.db #0x05	; 5
	.db #0x06	; 6
	.db #0x0b	; 11
	.db #0x0c	; 12
	.db #0x17	; 23
	.db #0x18	; 24
	.db #0x27	; 39
	.db #0x38	; 56	'8'
	.db #0x5f	; 95
	.db #0x60	; 96
	.db #0xbf	; 191
	.db #0xc0	; 192
	.db #0x7f	; 127
	.db #0x80	; 128
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xa0	; 160
	.db #0x40	; 64
	.db #0x80	; 128
	.db #0x40	; 64
	.db #0x81	; 129
	.db #0x40	; 64
	.db #0x81	; 129
	.db #0x41	; 65	'A'
	.db #0x83	; 131
	.db #0x42	; 66	'B'
	.db #0x87	; 135
	.db #0x44	; 68	'D'
	.db #0x4e	; 78	'N'
	.db #0x89	; 137
	.db #0x1f	; 31
	.db #0x91	; 145
	.db #0xf8	; 248
	.db #0x90	; 144
	.db #0xf0	; 240
	.db #0xa0	; 160
	.db #0xc0	; 192
	.db #0xe0	; 224
	.db #0xe0	; 224
	.db #0xc0	; 192
	.db #0xb0	; 176
	.db #0xc0	; 192
	.db #0xf0	; 240
	.db #0x80	; 128
	.db #0x78	; 120	'x'
	.db #0x80	; 128
	.db #0xfe	; 254
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xdf	; 223
	.db #0x60	; 96
	.db #0xaf	; 175
	.db #0x70	; 112	'p'
	.db #0xe3	; 227
	.db #0x3c	; 60
	.db #0xd1	; 209
	.db #0x3e	; 62
	.db #0x70	; 112	'p'
	.db #0x1f	; 31
	.db #0x68	; 104	'h'
	.db #0x1f	; 31
	.db #0x38	; 56	'8'
	.db #0x0f	; 15
	.db #0x38	; 56	'8'
	.db #0x0f	; 15
	.db #0xc0	; 192
	.db #0x00	; 0
	.db #0xe0	; 224
	.db #0x00	; 0
	.db #0xf0	; 240
	.db #0x00	; 0
	.db #0xf8	; 248
	.db #0x00	; 0
	.db #0xfc	; 252
	.db #0x00	; 0
	.db #0x7e	; 126
	.db #0x80	; 128
	.db #0x3f	; 63
	.db #0xc0	; 192
	.db #0x1f	; 31
	.db #0xe0	; 224
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x83	; 131
	.db #0x87	; 135
	.db #0x43	; 67	'C'
	.db #0xc7	; 199
	.db #0x46	; 70	'F'
	.db #0xce	; 206
	.db #0xac	; 172
	.db #0x6c	; 108	'l'
	.db #0x58	; 88	'X'
	.db #0x38	; 56	'8'
	.db #0x50	; 80	'P'
	.db #0x30	; 48	'0'
	.db #0x29	; 41
	.db #0x19	; 25
	.db #0x29	; 41
	.db #0x19	; 25
	.db #0x74	; 116	't'
	.db #0x6c	; 108	'l'
	.db #0x74	; 116	't'
	.db #0x6c	; 108	'l'
	.db #0x68	; 104	'h'
	.db #0x78	; 120	'x'
	.db #0xc8	; 200
	.db #0xf8	; 248
	.db #0xd0	; 208
	.db #0xf0	; 240
	.db #0xa0	; 160
	.db #0xe0	; 224
	.db #0xa0	; 160
	.db #0xe0	; 224
	.db #0x40	; 64
	.db #0xc0	; 192
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
_start_chuck_screen_sprite:
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x3c	; 60
	.db #0x3f	; 63
	.db #0xed	; 237
	.db #0xfe	; 254
	.db #0xef	; 239
	.db #0xdf	; 223
	.db #0xaf	; 175
	.db #0xde	; 222
	.db #0x9b	; 155
	.db #0xfc	; 252
	.db #0xbf	; 191
	.db #0xf0	; 240
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0x50	; 80	'P'
	.db #0xf0	; 240
	.db #0x70	; 112	'p'
	.db #0xd0	; 208
	.db #0x58	; 88	'X'
	.db #0xb8	; 184
	.db #0xae	; 174
	.db #0x5e	; 94
	.db #0xee	; 238
	.db #0x1e	; 30
	.db #0xd6	; 214
	.db #0x2e	; 46
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x06	; 6
	.db #0x07	; 7
	.db #0x0f	; 15
	.db #0x0c	; 12
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x79	; 121	'y'
	.db #0x79	; 121	'y'
	.db #0xcf	; 207
	.db #0xff	; 255
	.db #0x79	; 121	'y'
	.db #0x87	; 135
	.db #0xcc	; 204
	.db #0x03	; 3
	.db #0xa6	; 166
	.db #0x19	; 25
	.db #0x0e	; 14
	.db #0x0e	; 14
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xe3	; 227
	.db #0xff	; 255
	.db #0x8f	; 143
	.db #0xb3	; 179
	.db #0xb1	; 177
	.db #0xce	; 206
	.db #0x50	; 80	'P'
	.db #0xae	; 174
	.db #0x68	; 104	'h'
	.db #0x96	; 150
	.db #0x00	; 0
	.db #0xfc	; 252
	.db #0xff	; 255
	.db #0xe0	; 224
	.db #0xf7	; 247
	.db #0xe8	; 232
	.db #0xab	; 171
	.db #0xd4	; 212
	.db #0xe1	; 225
	.db #0xfe	; 254
	.db #0x1a	; 26
	.db #0x1d	; 29
	.db #0x09	; 9
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0xf6	; 246
	.db #0x0e	; 14
	.db #0xee	; 238
	.db #0x1e	; 30
	.db #0xdf	; 223
	.db #0x3f	; 63
	.db #0x8f	; 143
	.db #0x7f	; 127
	.db #0x83	; 131
	.db #0xff	; 255
	.db #0x12	; 18
	.db #0xef	; 239
	.db #0x8c	; 140
	.db #0xff	; 255
	.db #0xcc	; 204
	.db #0xf3	; 243
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xe0	; 224
	.db #0xe0	; 224
	.db #0x60	; 96
	.db #0xe0	; 224
	.db #0xb0	; 176
	.db #0xf0	; 240
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x08	; 8
	.db #0x0c	; 12
	.db #0x0c	; 12
	.db #0x08	; 8
	.db #0x0c	; 12
	.db #0x08	; 8
	.db #0x0a	; 10
	.db #0x0d	; 13
	.db #0x7b	; 123
	.db #0x7c	; 124
	.db #0x7c	; 124
	.db #0x7f	; 127
	.db #0x74	; 116	't'
	.db #0x7f	; 127
	.db #0x4b	; 75	'K'
	.db #0x7f	; 127
	.db #0x01	; 1
	.db #0x7e	; 126
	.db #0x18	; 24
	.db #0xe6	; 230
	.db #0x25	; 37
	.db #0xda	; 218
	.db #0xea	; 234
	.db #0x1d	; 29
	.db #0x1f	; 31
	.db #0x00	; 0
	.db #0x45	; 69	'E'
	.db #0x02	; 2
	.db #0xe3	; 227
	.db #0x04	; 4
	.db #0x45	; 69	'E'
	.db #0x82	; 130
	.db #0x00	; 0
	.db #0x78	; 120	'x'
	.db #0x40	; 64
	.db #0x30	; 48	'0'
	.db #0x00	; 0
	.db #0x30	; 48	'0'
	.db #0x00	; 0
	.db #0xf8	; 248
	.db #0x68	; 104	'h'
	.db #0x98	; 152
	.db #0x00	; 0
	.db #0x98	; 152
	.db #0x80	; 128
	.db #0x18	; 24
	.db #0xe0	; 224
	.db #0x18	; 24
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xe0	; 224
	.db #0xff	; 255
	.db #0x6a	; 106	'j'
	.db #0x7d	; 125
	.db #0x72	; 114	'r'
	.db #0x7d	; 125
	.db #0x1d	; 29
	.db #0x1e	; 30
	.db #0x0e	; 14
	.db #0x0f	; 15
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x3c	; 60
	.db #0xfc	; 252
	.db #0x9e	; 158
	.db #0x7e	; 126
	.db #0x0f	; 15
	.db #0xff	; 255
	.db #0xdf	; 223
	.db #0x3f	; 63
	.db #0x21	; 33
	.db #0xff	; 255
	.db #0xd7	; 215
	.db #0xef	; 239
	.db #0xa2	; 162
	.db #0xdf	; 223
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xe0	; 224
	.db #0xe0	; 224
	.db #0x70	; 112	'p'
	.db #0xf0	; 240
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x30	; 48	'0'
	.db #0x30	; 48	'0'
	.db #0x70	; 112	'p'
	.db #0x78	; 120	'x'
	.db #0x48	; 72	'H'
	.db #0x78	; 120	'x'
	.db #0xe8	; 232
	.db #0xdc	; 220
	.db #0xec	; 236
	.db #0xdc	; 220
	.db #0xf6	; 246
	.db #0xce	; 206
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x0c	; 12
	.db #0x0f	; 15
	.db #0x0d	; 13
	.db #0x0f	; 15
	.db #0x3a	; 58
	.db #0x3f	; 63
	.db #0x7e	; 126
	.db #0x7f	; 127
	.db #0xf7	; 247
	.db #0xff	; 255
	.db #0xd0	; 208
	.db #0xff	; 255
	.db #0x86	; 134
	.db #0xff	; 255
	.db #0x81	; 129
	.db #0xff	; 255
	.db #0x02	; 2
	.db #0xfd	; 253
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x93	; 147
	.db #0xff	; 255
	.db #0x04	; 4
	.db #0xff	; 255
	.db #0x03	; 3
	.db #0xff	; 255
	.db #0x87	; 135
	.db #0xff	; 255
	.db #0x98	; 152
	.db #0xe0	; 224
	.db #0x6c	; 108	'l'
	.db #0xf1	; 241
	.db #0x94	; 148
	.db #0xff	; 255
	.db #0x70	; 112	'p'
	.db #0xf0	; 240
	.db #0x70	; 112	'p'
	.db #0xf0	; 240
	.db #0xe0	; 224
	.db #0xe0	; 224
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x70	; 112	'p'
	.db #0x00	; 0
	.db #0xe0	; 224
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xc0	; 192
	.db #0xff	; 255
	.db #0xe8	; 232
	.db #0xf7	; 247
	.db #0x76	; 118	'v'
	.db #0x79	; 121	'y'
	.db #0x3a	; 58
	.db #0x3d	; 61
	.db #0x18	; 24
	.db #0x1f	; 31
	.db #0x0c	; 12
	.db #0x0f	; 15
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x06	; 6
	.db #0x07	; 7
	.db #0x38	; 56	'8'
	.db #0xf8	; 248
	.db #0x1c	; 28
	.db #0xfc	; 252
	.db #0x4e	; 78	'N'
	.db #0xfe	; 254
	.db #0x0e	; 14
	.db #0xfe	; 254
	.db #0x67	; 103	'g'
	.db #0xff	; 255
	.db #0x43	; 67	'C'
	.db #0xff	; 255
	.db #0x05	; 5
	.db #0xff	; 255
	.db #0xb3	; 179
	.db #0xcf	; 207
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfe	; 254
	.db #0xfe	; 254
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x0e	; 14
	.db #0x0f	; 15
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc2	; 194
	.db #0xc2	; 194
	.db #0xff	; 255
	.db #0x7f	; 127
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xe0	; 224
	.db #0xe0	; 224
	.db #0x79	; 121	'y'
	.db #0x47	; 71	'G'
	.db #0x79	; 121	'y'
	.db #0x47	; 71	'G'
	.db #0x0a	; 10
	.db #0x65	; 101	'e'
	.db #0x15	; 21
	.db #0x22	; 34
	.db #0x13	; 19
	.db #0x20	; 32
	.db #0x0b	; 11
	.db #0x30	; 48	'0'
	.db #0x0b	; 11
	.db #0x33	; 51	'3'
	.db #0x07	; 7
	.db #0x1b	; 27
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0x60	; 96
	.db #0xe0	; 224
	.db #0xf8	; 248
	.db #0x78	; 120	'x'
	.db #0xff	; 255
	.db #0x7f	; 127
	.db #0xff	; 255
	.db #0x7f	; 127
	.db #0xbe	; 190
	.db #0xff	; 255
	.db #0xe7	; 231
	.db #0xfe	; 254
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xef	; 239
	.db #0xf7	; 247
	.db #0x7b	; 123
	.db #0xf7	; 247
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x0e	; 14
	.db #0x0f	; 15
	.db #0x1d	; 29
	.db #0x1f	; 31
	.db #0xba	; 186
	.db #0xbf	; 191
	.db #0xbe	; 190
	.db #0xbf	; 191
	.db #0xec	; 236
	.db #0xff	; 255
	.db #0xfe	; 254
	.db #0xff	; 255
	.db #0x20	; 32
	.db #0xff	; 255
	.db #0x60	; 96
	.db #0xff	; 255
	.db #0x80	; 128
	.db #0xff	; 255
	.db #0x83	; 131
	.db #0xfc	; 252
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x33	; 51	'3'
	.db #0xcf	; 207
	.db #0x38	; 56	'8'
	.db #0xc7	; 199
	.db #0x02	; 2
	.db #0xfe	; 254
	.db #0x84	; 132
	.db #0x7c	; 124
	.db #0x0c	; 12
	.db #0xfc	; 252
	.db #0x78	; 120	'x'
	.db #0xf8	; 248
	.db #0x30	; 48	'0'
	.db #0xf0	; 240
	.db #0x60	; 96
	.db #0xe0	; 224
	.db #0x40	; 64
	.db #0xc0	; 192
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x87	; 135
	.db #0xff	; 255
	.db #0xc0	; 192
	.db #0xff	; 255
	.db #0xcd	; 205
	.db #0xf3	; 243
	.db #0x46	; 70	'F'
	.db #0x7f	; 127
	.db #0x67	; 103	'g'
	.db #0x7e	; 126
	.db #0x7f	; 127
	.db #0x7c	; 124
	.db #0x3f	; 63
	.db #0x38	; 56	'8'
	.db #0x3f	; 63
	.db #0x30	; 48	'0'
	.db #0xe2	; 226
	.db #0xfe	; 254
	.db #0xd3	; 211
	.db #0xef	; 239
	.db #0xa4	; 164
	.db #0xdb	; 219
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xe0	; 224
	.db #0x1f	; 31
	.db #0xc0	; 192
	.db #0x3f	; 63
	.db #0x9d	; 157
	.db #0x62	; 98	'b'
	.db #0x27	; 39
	.db #0xd8	; 216
	.db #0x1d	; 29
	.db #0x1e	; 30
	.db #0xf7	; 247
	.db #0xf8	; 248
	.db #0x17	; 23
	.db #0xe8	; 232
	.db #0xf6	; 246
	.db #0x3f	; 63
	.db #0x77	; 119	'w'
	.db #0x9f	; 159
	.db #0x10	; 16
	.db #0xef	; 239
	.db #0xd9	; 217
	.db #0x26	; 38
	.db #0x07	; 7
	.db #0xf8	; 248
	.db #0xfc	; 252
	.db #0x7f	; 127
	.db #0x07	; 7
	.db #0xf8	; 248
	.db #0x7f	; 127
	.db #0x80	; 128
	.db #0xc0	; 192
	.db #0x3f	; 63
	.db #0x81	; 129
	.db #0x7f	; 127
	.db #0x81	; 129
	.db #0x7f	; 127
	.db #0x03	; 3
	.db #0xff	; 255
	.db #0x47	; 71	'G'
	.db #0xbf	; 191
	.db #0xf8	; 248
	.db #0xf8	; 248
	.db #0xec	; 236
	.db #0x1c	; 28
	.db #0x5c	; 92
	.db #0xbc	; 188
	.db #0x78	; 120	'x'
	.db #0xf8	; 248
	.db #0xe0	; 224
	.db #0xe0	; 224
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x1f	; 31
	.db #0x0e	; 14
	.db #0x0f	; 15
	.db #0x0e	; 14
	.db #0x0f	; 15
	.db #0x06	; 6
	.db #0x07	; 7
	.db #0x06	; 6
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x06	; 6
	.db #0x07	; 7
	.db #0x06	; 6
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0xf2	; 242
	.db #0xff	; 255
	.db #0x79	; 121	'y'
	.db #0xff	; 255
	.db #0x7c	; 124
	.db #0xff	; 255
	.db #0x3e	; 62
	.db #0xff	; 255
	.db #0x3e	; 62
	.db #0xff	; 255
	.db #0x3b	; 59
	.db #0xff	; 255
	.db #0xb9	; 185
	.db #0x7f	; 127
	.db #0x35	; 53	'5'
	.db #0xfb	; 251
	.db #0xf7	; 247
	.db #0x7b	; 123
	.db #0x4f	; 79	'O'
	.db #0xbb	; 187
	.db #0x85	; 133
	.db #0xfb	; 251
	.db #0xdf	; 223
	.db #0x7d	; 125
	.db #0x30	; 48	'0'
	.db #0xfd	; 253
	.db #0xd5	; 213
	.db #0xed	; 237
	.db #0x98	; 152
	.db #0xf5	; 245
	.db #0xc1	; 193
	.db #0xad	; 173
	.db #0xfa	; 250
	.db #0xff	; 255
	.db #0xfc	; 252
	.db #0xff	; 255
	.db #0x1f	; 31
	.db #0xfe	; 254
	.db #0xe7	; 231
	.db #0xdf	; 223
	.db #0x77	; 119	'w'
	.db #0xef	; 239
	.db #0xd3	; 211
	.db #0xbf	; 191
	.db #0x4b	; 75	'K'
	.db #0xbf	; 191
	.db #0x27	; 39
	.db #0xff	; 255
	.db #0x12	; 18
	.db #0xef	; 239
	.db #0xc3	; 195
	.db #0xbf	; 191
	.db #0x17	; 23
	.db #0xff	; 255
	.db #0x8e	; 142
	.db #0xfe	; 254
	.db #0x8c	; 140
	.db #0xfc	; 252
	.db #0x90	; 144
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0xe0	; 224
	.db #0xe0	; 224
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x22	; 34
	.db #0x3d	; 61
	.db #0x3e	; 62
	.db #0x39	; 57	'9'
	.db #0x3c	; 60
	.db #0x3b	; 59
	.db #0x1c	; 28
	.db #0x1b	; 27
	.db #0x34	; 52	'4'
	.db #0x3b	; 59
	.db #0xf4	; 244
	.db #0xfb	; 251
	.db #0xf4	; 244
	.db #0xfb	; 251
	.db #0xf2	; 242
	.db #0xfd	; 253
	.db #0x43	; 67	'C'
	.db #0xbc	; 188
	.db #0x47	; 71	'G'
	.db #0xb8	; 184
	.db #0x7d	; 125
	.db #0x82	; 130
	.db #0x7d	; 125
	.db #0x82	; 130
	.db #0x7f	; 127
	.db #0x84	; 132
	.db #0x5f	; 95
	.db #0xa0	; 160
	.db #0x3f	; 63
	.db #0xc0	; 192
	.db #0x3f	; 63
	.db #0xc0	; 192
	.db #0xe0	; 224
	.db #0x1f	; 31
	.db #0xd0	; 208
	.db #0x2f	; 47
	.db #0x77	; 119	'w'
	.db #0x8b	; 139
	.db #0xf2	; 242
	.db #0x0e	; 14
	.db #0xfe	; 254
	.db #0x06	; 6
	.db #0xf6	; 246
	.db #0x0e	; 14
	.db #0xf6	; 246
	.db #0x0e	; 14
	.db #0xc6	; 198
	.db #0x3e	; 62
	.db #0x0c	; 12
	.db #0xfc	; 252
	.db #0xcc	; 204
	.db #0xfc	; 252
	.db #0xcc	; 204
	.db #0xfc	; 252
	.db #0xc8	; 200
	.db #0xf8	; 248
	.db #0xc8	; 200
	.db #0xf8	; 248
	.db #0xcc	; 204
	.db #0xfc	; 252
	.db #0xcc	; 204
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xcc	; 204
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x06	; 6
	.db #0x07	; 7
	.db #0x0e	; 14
	.db #0x0f	; 15
	.db #0x0e	; 14
	.db #0x0f	; 15
	.db #0x0c	; 12
	.db #0x0f	; 15
	.db #0x0e	; 14
	.db #0x0d	; 13
	.db #0xfd	; 253
	.db #0xfb	; 251
	.db #0xff	; 255
	.db #0xf9	; 249
	.db #0xed	; 237
	.db #0xff	; 255
	.db #0x63	; 99	'c'
	.db #0xff	; 255
	.db #0x41	; 65	'A'
	.db #0xff	; 255
	.db #0x0f	; 15
	.db #0xff	; 255
	.db #0x97	; 151
	.db #0xf8	; 248
	.db #0x8b	; 139
	.db #0xf4	; 244
	.db #0xe0	; 224
	.db #0x87	; 135
	.db #0x38	; 56	'8'
	.db #0xc6	; 198
	.db #0x4b	; 75	'K'
	.db #0xb2	; 178
	.db #0x90	; 144
	.db #0xa1	; 161
	.db #0x90	; 144
	.db #0xa0	; 160
	.db #0xa0	; 160
	.db #0xd0	; 208
	.db #0xb3	; 179
	.db #0x4c	; 76	'L'
	.db #0x96	; 150
	.db #0x78	; 120	'x'
	.db #0xdf	; 223
	.db #0x3f	; 63
	.db #0xf9	; 249
	.db #0x04	; 4
	.db #0x08	; 8
	.db #0x17	; 23
	.db #0xbc	; 188
	.db #0xc6	; 198
	.db #0x3b	; 59
	.db #0x2f	; 47
	.db #0x6b	; 107	'k'
	.db #0x1f	; 31
	.db #0x59	; 89	'Y'
	.db #0xbf	; 191
	.db #0x9f	; 159
	.db #0x7f	; 127
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0xd0	; 208
	.db #0x30	; 48	'0'
	.db #0x00	; 0
	.db #0xf0	; 240
	.db #0xe0	; 224
	.db #0x30	; 48	'0'
	.db #0xd0	; 208
	.db #0x30	; 48	'0'
	.db #0x50	; 80	'P'
	.db #0xb0	; 176
	.db #0x80	; 128
	.db #0xb8	; 184
	.db #0xa0	; 160
	.db #0x98	; 152
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x06	; 6
	.db #0x07	; 7
	.db #0x04	; 4
	.db #0x07	; 7
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0xf7	; 247
	.db #0xff	; 255
	.db #0xde	; 222
	.db #0xe7	; 231
	.db #0xf8	; 248
	.db #0x07	; 7
	.db #0x0f	; 15
	.db #0xf7	; 247
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xf0	; 240
	.db #0xff	; 255
	.db #0x71	; 113	'q'
	.db #0xfe	; 254
	.db #0x77	; 119	'w'
	.db #0xfc	; 252
	.db #0x43	; 67	'C'
	.db #0xfc	; 252
	.db #0x43	; 67	'C'
	.db #0xfc	; 252
	.db #0x76	; 118	'v'
	.db #0xff	; 255
	.db #0xf7	; 247
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x0f	; 15
	.db #0xf0	; 240
	.db #0x80	; 128
	.db #0x7f	; 127
	.db #0x80	; 128
	.db #0x7f	; 127
	.db #0xc0	; 192
	.db #0x3f	; 63
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x70	; 112	'p'
	.db #0xbf	; 191
	.db #0xfc	; 252
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xc3	; 195
	.db #0x3f	; 63
	.db #0x01	; 1
	.db #0xff	; 255
	.db #0x01	; 1
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0xf0	; 240
	.db #0x0f	; 15
	.db #0x1e	; 30
	.db #0xe1	; 225
	.db #0x3f	; 63
	.db #0xc0	; 192
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x74	; 116	't'
	.db #0x4c	; 76	'L'
	.db #0x54	; 84	'T'
	.db #0x6c	; 108	'l'
	.db #0xa6	; 166
	.db #0xbe	; 190
	.db #0xf6	; 246
	.db #0xfe	; 254
	.db #0x73	; 115	's'
	.db #0xff	; 255
	.db #0x13	; 19
	.db #0xff	; 255
	.db #0x81	; 129
	.db #0x7f	; 127
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x81	; 129
	.db #0x81	; 129
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x0e	; 14
	.db #0x0d	; 13
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x1c	; 28
	.db #0x1f	; 31
	.db #0x38	; 56	'8'
	.db #0x3f	; 63
	.db #0x38	; 56	'8'
	.db #0x3f	; 63
	.db #0x60	; 96
	.db #0x7f	; 127
	.db #0xc0	; 192
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x8f	; 143
	.db #0xf0	; 240
	.db #0x17	; 23
	.db #0xe8	; 232
	.db #0x18	; 24
	.db #0xe0	; 224
	.db #0x31	; 49	'1'
	.db #0xc0	; 192
	.db #0x23	; 35
	.db #0xc0	; 192
	.db #0x3d	; 61
	.db #0xc0	; 192
	.db #0x59	; 89	'Y'
	.db #0x86	; 134
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x84	; 132
	.db #0x7b	; 123
	.db #0x90	; 144
	.db #0x6b	; 107	'k'
	.db #0x00	; 0
	.db #0x7b	; 123
	.db #0x44	; 68	'D'
	.db #0xbb	; 187
	.db #0x48	; 72	'H'
	.db #0x3f	; 63
	.db #0x2f	; 47
	.db #0xdf	; 223
	.db #0xff	; 255
	.db #0x3f	; 63
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x5e	; 94
	.db #0xff	; 255
	.db #0x9e	; 158
	.db #0xc1	; 193
	.db #0x97	; 151
	.db #0xef	; 239
	.db #0x5e	; 94
	.db #0xa7	; 167
	.db #0xc2	; 194
	.db #0xbf	; 191
	.db #0x9f	; 159
	.db #0xff	; 255
	.db #0xea	; 234
	.db #0xf5	; 245
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x60	; 96
	.db #0x98	; 152
	.db #0xd0	; 208
	.db #0x88	; 136
	.db #0xd0	; 208
	.db #0xc8	; 200
	.db #0xc0	; 192
	.db #0xcc	; 204
	.db #0xc0	; 192
	.db #0xcc	; 204
	.db #0xe0	; 224
	.db #0xcc	; 204
	.db #0x00	; 0
	.db #0xec	; 236
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x03	; 3
	.db #0xff	; 255
	.db #0x06	; 6
	.db #0xff	; 255
	.db #0x06	; 6
	.db #0xff	; 255
	.db #0x06	; 6
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x98	; 152
	.db #0xff	; 255
	.db #0x58	; 88	'X'
	.db #0xff	; 255
	.db #0x1e	; 30
	.db #0xff	; 255
	.db #0x1b	; 27
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x6c	; 108	'l'
	.db #0xff	; 255
	.db #0x6c	; 108	'l'
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x06	; 6
	.db #0xff	; 255
	.db #0x06	; 6
	.db #0xff	; 255
	.db #0x76	; 118	'v'
	.db #0xff	; 255
	.db #0xc6	; 198
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x06	; 6
	.db #0xff	; 255
	.db #0x06	; 6
	.db #0xff	; 255
	.db #0xcf	; 207
	.db #0xff	; 255
	.db #0xc9	; 201
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x30	; 48	'0'
	.db #0xff	; 255
	.db #0x36	; 54	'6'
	.db #0xff	; 255
	.db #0x06	; 6
	.db #0xff	; 255
	.db #0x36	; 54	'6'
	.db #0xff	; 255
	.db #0x36	; 54	'6'
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x73	; 115	's'
	.db #0xff	; 255
	.db #0xdb	; 219
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x9c	; 156
	.db #0xff	; 255
	.db #0x36	; 54	'6'
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0xf0	; 240
	.db #0xff	; 255
	.db #0xd8	; 216
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x1f	; 31
	.db #0xff	; 255
	.db #0x30	; 48	'0'
	.db #0xff	; 255
	.db #0x30	; 48	'0'
	.db #0xff	; 255
	.db #0x30	; 48	'0'
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x80	; 128
	.db #0xff	; 255
	.db #0x79	; 121	'y'
	.db #0xff	; 255
	.db #0x0d	; 13
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0xec	; 236
	.db #0xff	; 255
	.db #0xb6	; 182
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x38	; 56	'8'
	.db #0xff	; 255
	.db #0x6d	; 109	'm'
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0xe0	; 224
	.db #0xff	; 255
	.db #0x80	; 128
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x06	; 6
	.db #0xff	; 255
	.db #0x06	; 6
	.db #0xff	; 255
	.db #0x06	; 6
	.db #0xff	; 255
	.db #0x03	; 3
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x1b	; 27
	.db #0xff	; 255
	.db #0x1b	; 27
	.db #0xff	; 255
	.db #0x5b	; 91
	.db #0xff	; 255
	.db #0x9b	; 155
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x6c	; 108	'l'
	.db #0xff	; 255
	.db #0x6c	; 108	'l'
	.db #0xff	; 255
	.db #0x6c	; 108	'l'
	.db #0xff	; 255
	.db #0x3c	; 60
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0xc7	; 199
	.db #0xff	; 255
	.db #0xc7	; 199
	.db #0xff	; 255
	.db #0xc6	; 198
	.db #0xff	; 255
	.db #0x76	; 118	'v'
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x99	; 153
	.db #0xff	; 255
	.db #0x9f	; 159
	.db #0xff	; 255
	.db #0xd9	; 217
	.db #0xff	; 255
	.db #0xd9	; 217
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0xb6	; 182
	.db #0xff	; 255
	.db #0xb6	; 182
	.db #0xff	; 255
	.db #0xb6	; 182
	.db #0xff	; 255
	.db #0xb6	; 182
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0xfb	; 251
	.db #0xff	; 255
	.db #0xc3	; 195
	.db #0xff	; 255
	.db #0xc3	; 195
	.db #0xff	; 255
	.db #0x7b	; 123
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x36	; 54	'6'
	.db #0xff	; 255
	.db #0x36	; 54	'6'
	.db #0xff	; 255
	.db #0x36	; 54	'6'
	.db #0xff	; 255
	.db #0x1c	; 28
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0xd8	; 216
	.db #0xff	; 255
	.db #0xd8	; 216
	.db #0xff	; 255
	.db #0xd8	; 216
	.db #0xff	; 255
	.db #0xd8	; 216
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x33	; 51	'3'
	.db #0xff	; 255
	.db #0x31	; 49	'1'
	.db #0xff	; 255
	.db #0x31	; 49	'1'
	.db #0xff	; 255
	.db #0x1f	; 31
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0xbd	; 189
	.db #0xff	; 255
	.db #0xed	; 237
	.db #0xff	; 255
	.db #0xed	; 237
	.db #0xff	; 255
	.db #0x3d	; 61
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0xb6	; 182
	.db #0xff	; 255
	.db #0xb6	; 182
	.db #0xff	; 255
	.db #0xb6	; 182
	.db #0xff	; 255
	.db #0xb6	; 182
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x7d	; 125
	.db #0xff	; 255
	.db #0x60	; 96
	.db #0xff	; 255
	.db #0x60	; 96
	.db #0xff	; 255
	.db #0x3d	; 61
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0xc0	; 192
	.db #0xff	; 255
	.db #0xe0	; 224
	.db #0xff	; 255
	.db #0x60	; 96
	.db #0xff	; 255
	.db #0xc0	; 192
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x1d	; 29
	.db #0x1e	; 30
	.db #0x33	; 51	'3'
	.db #0x3c	; 60
	.db #0x36	; 54	'6'
	.db #0x39	; 57	'9'
	.db #0x6c	; 108	'l'
	.db #0x73	; 115	's'
	.db #0xcd	; 205
	.db #0xf2	; 242
	.db #0x90	; 144
	.db #0xec	; 236
	.db #0x34	; 52	'4'
	.db #0xc8	; 200
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x84	; 132
	.db #0x63	; 99	'c'
	.db #0x1e	; 30
	.db #0xc1	; 193
	.db #0x45	; 69	'E'
	.db #0x98	; 152
	.db #0xb2	; 178
	.db #0x01	; 1
	.db #0x06	; 6
	.db #0x00	; 0
	.db #0x0c	; 12
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0x08	; 8
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x7e	; 126
	.db #0x81	; 129
	.db #0x7f	; 127
	.db #0x80	; 128
	.db #0x3f	; 63
	.db #0x40	; 64
	.db #0x1f	; 31
	.db #0x20	; 32
	.db #0x0f	; 15
	.db #0x70	; 112	'p'
	.db #0x87	; 135
	.db #0x78	; 120	'x'
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xfc	; 252
	.db #0x0c	; 12
	.db #0xf6	; 246
	.db #0x0e	; 14
	.db #0x7e	; 126
	.db #0x86	; 134
	.db #0xbf	; 191
	.db #0x43	; 67	'C'
	.db #0xfe	; 254
	.db #0x01	; 1
	.db #0xcf	; 207
	.db #0x30	; 48	'0'
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0xe0	; 224
	.db #0xe0	; 224
	.db #0x60	; 96
	.db #0xe0	; 224
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x0e	; 14
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0e	; 14
	.db #0x18	; 24
	.db #0x1f	; 31
	.db #0x39	; 57	'9'
	.db #0x3e	; 62
	.db #0x63	; 99	'c'
	.db #0x7c	; 124
	.db #0xc6	; 198
	.db #0xf9	; 249
	.db #0x8d	; 141
	.db #0xf2	; 242
	.db #0x53	; 83	'S'
	.db #0xac	; 172
	.db #0xb7	; 183
	.db #0x48	; 72	'H'
	.db #0x68	; 104	'h'
	.db #0x90	; 144
	.db #0xd0	; 208
	.db #0x20	; 32
	.db #0xa3	; 163
	.db #0x40	; 64
	.db #0x02	; 2
	.db #0x81	; 129
	.db #0xfc	; 252
	.db #0x03	; 3
	.db #0xf8	; 248
	.db #0x06	; 6
	.db #0xf0	; 240
	.db #0x0c	; 12
	.db #0xe0	; 224
	.db #0x18	; 24
	.db #0x20	; 32
	.db #0x11	; 17
	.db #0xc0	; 192
	.db #0x23	; 35
	.db #0x84	; 132
	.db #0x43	; 67	'C'
	.db #0x08	; 8
	.db #0x86	; 134
	.db #0x10	; 16
	.db #0x0c	; 12
	.db #0x20	; 32
	.db #0x18	; 24
	.db #0x40	; 64
	.db #0x30	; 48	'0'
	.db #0x00	; 0
	.db #0x60	; 96
	.db #0x03	; 3
	.db #0xcc	; 204
	.db #0x01	; 1
	.db #0x86	; 134
	.db #0x01	; 1
	.db #0x82	; 130
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xf7	; 247
	.db #0x08	; 8
	.db #0xfb	; 251
	.db #0x04	; 4
	.db #0xfd	; 253
	.db #0x02	; 2
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x7e	; 126
	.db #0x81	; 129
	.db #0x3f	; 63
	.db #0xc0	; 192
	.db #0x1f	; 31
	.db #0x60	; 96
	.db #0x0f	; 15
	.db #0x30	; 48	'0'
	.db #0xb0	; 176
	.db #0x70	; 112	'p'
	.db #0xd8	; 216
	.db #0x38	; 56	'8'
	.db #0xfc	; 252
	.db #0x1c	; 28
	.db #0xfc	; 252
	.db #0x0c	; 12
	.db #0x3a	; 58
	.db #0xc6	; 198
	.db #0x13	; 19
	.db #0xef	; 239
	.db #0x81	; 129
	.db #0x7f	; 127
	.db #0xc0	; 192
	.db #0x3f	; 63
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x0e	; 14
	.db #0x0f	; 15
	.db #0x0e	; 14
	.db #0x0f	; 15
	.db #0x1c	; 28
	.db #0x1f	; 31
	.db #0x31	; 49	'1'
	.db #0x3e	; 62
	.db #0x63	; 99	'c'
	.db #0x7c	; 124
	.db #0x52	; 82	'R'
	.db #0x6d	; 109	'm'
	.db #0xcd	; 205
	.db #0xf2	; 242
	.db #0x83	; 131
	.db #0xfc	; 252
	.db #0x07	; 7
	.db #0xf8	; 248
	.db #0x0f	; 15
	.db #0xf0	; 240
	.db #0x6f	; 111	'o'
	.db #0x90	; 144
	.db #0xdf	; 223
	.db #0x20	; 32
	.db #0x3f	; 63
	.db #0xc0	; 192
	.db #0x7e	; 126
	.db #0x81	; 129
	.db #0xfe	; 254
	.db #0x01	; 1
	.db #0xfc	; 252
	.db #0x02	; 2
	.db #0xf8	; 248
	.db #0x04	; 4
	.db #0xf0	; 240
	.db #0x0c	; 12
	.db #0xc0	; 192
	.db #0x30	; 48	'0'
	.db #0x80	; 128
	.db #0x61	; 97	'a'
	.db #0x00	; 0
	.db #0xc3	; 195
	.db #0x04	; 4
	.db #0x83	; 131
	.db #0x80	; 128
	.db #0x0e	; 14
	.db #0x10	; 16
	.db #0x0c	; 12
	.db #0x20	; 32
	.db #0x18	; 24
	.db #0x00	; 0
	.db #0x30	; 48	'0'
	.db #0x80	; 128
	.db #0x40	; 64
	.db #0x00	; 0
	.db #0xc0	; 192
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x18	; 24
	.db #0x03	; 3
	.db #0x0c	; 12
	.db #0x01	; 1
	.db #0x06	; 6
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xe0	; 224
	.db #0x1f	; 31
	.db #0xf0	; 240
	.db #0x0f	; 15
	.db #0xf8	; 248
	.db #0x07	; 7
	.db #0xfc	; 252
	.db #0x03	; 3
	.db #0x7e	; 126
	.db #0x81	; 129
	.db #0x3e	; 62
	.db #0xc1	; 193
	.db #0x3f	; 63
	.db #0xc0	; 192
	.db #0x1f	; 31
	.db #0x60	; 96
	.db #0x70	; 112	'p'
	.db #0xf0	; 240
	.db #0x30	; 48	'0'
	.db #0xf0	; 240
	.db #0x38	; 56	'8'
	.db #0xd8	; 216
	.db #0x0c	; 12
	.db #0xfc	; 252
	.db #0x06	; 6
	.db #0xfe	; 254
	.db #0x03	; 3
	.db #0xff	; 255
	.db #0x01	; 1
	.db #0xff	; 255
	.db #0xc0	; 192
	.db #0x3f	; 63
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x0e	; 14
	.db #0x0f	; 15
	.db #0x1d	; 29
	.db #0x1e	; 30
	.db #0x18	; 24
	.db #0x1f	; 31
	.db #0x1c	; 28
	.db #0x1f	; 31
	.db #0x70	; 112	'p'
	.db #0x7f	; 127
	.db #0xe0	; 224
	.db #0xff	; 255
	.db #0xc0	; 192
	.db #0xff	; 255
	.db #0x31	; 49	'1'
	.db #0xce	; 206
	.db #0xc1	; 193
	.db #0x3e	; 62
	.db #0x03	; 3
	.db #0xfc	; 252
	.db #0x0b	; 11
	.db #0xf4	; 244
	.db #0x1f	; 31
	.db #0xe0	; 224
	.db #0x3f	; 63
	.db #0xc0	; 192
	.db #0x7f	; 127
	.db #0x80	; 128
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xfe	; 254
	.db #0x01	; 1
	.db #0xfc	; 252
	.db #0x03	; 3
	.db #0xfc	; 252
	.db #0x02	; 2
	.db #0xe0	; 224
	.db #0x18	; 24
	.db #0xd0	; 208
	.db #0x20	; 32
	.db #0xc1	; 193
	.db #0x20	; 32
	.db #0xa2	; 162
	.db #0x41	; 65	'A'
	.db #0x41	; 65	'A'
	.db #0x82	; 130
	.db #0x06	; 6
	.db #0x80	; 128
	.db #0x88	; 136
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x18	; 24
	.db #0x00	; 0
	.db #0x60	; 96
	.db #0xe0	; 224
	.db #0x00	; 0
	.db #0x40	; 64
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x38	; 56	'8'
	.db #0x07	; 7
	.db #0x18	; 24
	.db #0x03	; 3
	.db #0x0c	; 12
	.db #0x01	; 1
	.db #0x06	; 6
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xe0	; 224
	.db #0x1f	; 31
	.db #0xf0	; 240
	.db #0x0f	; 15
	.db #0xf8	; 248
	.db #0x07	; 7
	.db #0xf8	; 248
	.db #0x07	; 7
	.db #0x7e	; 126
	.db #0x81	; 129
	.db #0x3e	; 62
	.db #0xc1	; 193
	.db #0x1f	; 31
	.db #0x60	; 96
	.db #0x1f	; 31
	.db #0x20	; 32
	.db #0x60	; 96
	.db #0xe0	; 224
	.db #0x70	; 112	'p'
	.db #0xb0	; 176
	.db #0x18	; 24
	.db #0xf8	; 248
	.db #0x0c	; 12
	.db #0xfc	; 252
	.db #0x02	; 2
	.db #0xfe	; 254
	.db #0x03	; 3
	.db #0xff	; 255
	.db #0x01	; 1
	.db #0xff	; 255
	.db #0xc0	; 192
	.db #0x3f	; 63
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xe0	; 224
	.db #0xe0	; 224
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x06	; 6
	.db #0x07	; 7
	.db #0x04	; 4
	.db #0x07	; 7
	.db #0x30	; 48	'0'
	.db #0x3f	; 63
	.db #0x60	; 96
	.db #0x7f	; 127
	.db #0xc0	; 192
	.db #0xff	; 255
	.db #0x80	; 128
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x01	; 1
	.db #0xfe	; 254
	.db #0x13	; 19
	.db #0xec	; 236
	.db #0x35	; 53	'5'
	.db #0xca	; 202
	.db #0x08	; 8
	.db #0xd7	; 215
	.db #0x00	; 0
	.db #0xdf	; 223
	.db #0x70	; 112	'p'
	.db #0x8f	; 143
	.db #0x80	; 128
	.db #0x3e	; 62
	.db #0x6c	; 108	'l'
	.db #0x10	; 16
	.db #0x40	; 64
	.db #0x80	; 128
	.db #0x82	; 130
	.db #0x7c	; 124
	.db #0x04	; 4
	.db #0xf8	; 248
	.db #0x10	; 16
	.db #0xe0	; 224
	.db #0x20	; 32
	.db #0xc0	; 192
	.db #0x01	; 1
	.db #0x80	; 128
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x02	; 2
	.db #0x06	; 6
	.db #0x08	; 8
	.db #0x38	; 56	'8'
	.db #0x00	; 0
	.db #0x50	; 80	'P'
	.db #0x20	; 32
	.db #0x20	; 32
	.db #0x40	; 64
	.db #0x80	; 128
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x18	; 24
	.db #0x03	; 3
	.db #0x0c	; 12
	.db #0x01	; 1
	.db #0x06	; 6
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xe0	; 224
	.db #0x1f	; 31
	.db #0xf0	; 240
	.db #0x0f	; 15
	.db #0xf8	; 248
	.db #0x07	; 7
	.db #0xfe	; 254
	.db #0x01	; 1
	.db #0x7f	; 127
	.db #0x80	; 128
	.db #0x1f	; 31
	.db #0xe0	; 224
	.db #0x0f	; 15
	.db #0x30	; 48	'0'
	.db #0x07	; 7
	.db #0x38	; 56	'8'
	.db #0x30	; 48	'0'
	.db #0xf0	; 240
	.db #0x18	; 24
	.db #0xf8	; 248
	.db #0x06	; 6
	.db #0xfe	; 254
	.db #0x03	; 3
	.db #0xff	; 255
	.db #0x01	; 1
	.db #0xff	; 255
	.db #0x80	; 128
	.db #0x7f	; 127
	.db #0xe0	; 224
	.db #0x1f	; 31
	.db #0xf8	; 248
	.db #0x07	; 7
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0x60	; 96
	.db #0xe0	; 224
	.db #0x30	; 48	'0'
	.db #0xf0	; 240
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x0c	; 12
	.db #0x0f	; 15
	.db #0x08	; 8
	.db #0x0f	; 15
	.db #0x18	; 24
	.db #0x1f	; 31
	.db #0x10	; 16
	.db #0x1f	; 31
	.db #0x10	; 16
	.db #0x1f	; 31
	.db #0x10	; 16
	.db #0x1f	; 31
	.db #0x20	; 32
	.db #0x3f	; 63
	.db #0x20	; 32
	.db #0x3f	; 63
	.db #0x00	; 0
	.db #0xfe	; 254
	.db #0x02	; 2
	.db #0xfc	; 252
	.db #0x04	; 4
	.db #0xf8	; 248
	.db #0x00	; 0
	.db #0xf8	; 248
	.db #0x00	; 0
	.db #0xf0	; 240
	.db #0x00	; 0
	.db #0xe0	; 224
	.db #0x20	; 32
	.db #0xc0	; 192
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x01	; 1
	.db #0x04	; 4
	.db #0x02	; 2
	.db #0x18	; 24
	.db #0x00	; 0
	.db #0x20	; 32
	.db #0x10	; 16
	.db #0x00	; 0
	.db #0x20	; 32
	.db #0x20	; 32
	.db #0x40	; 64
	.db #0xe0	; 224
	.db #0x00	; 0
	.db #0x40	; 64
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x0c	; 12
	.db #0x01	; 1
	.db #0x06	; 6
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xfe	; 254
	.db #0x01	; 1
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x7f	; 127
	.db #0x80	; 128
	.db #0x3f	; 63
	.db #0xc0	; 192
	.db #0x0f	; 15
	.db #0x70	; 112	'p'
	.db #0x07	; 7
	.db #0x38	; 56	'8'
	.db #0x09	; 9
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x01	; 1
	.db #0x18	; 24
	.db #0xf8	; 248
	.db #0x0c	; 12
	.db #0xfc	; 252
	.db #0xc2	; 194
	.db #0x3e	; 62
	.db #0xf9	; 249
	.db #0x07	; 7
	.db #0xfe	; 254
	.db #0x01	; 1
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x7f	; 127
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0xe0	; 224
	.db #0x80	; 128
	.db #0x60	; 96
	.db #0xc0	; 192
	.db #0x38	; 56	'8'
	.db #0xf0	; 240
	.db #0x0e	; 14
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x20	; 32
	.db #0x3f	; 63
	.db #0x61	; 97	'a'
	.db #0x7e	; 126
	.db #0x62	; 98	'b'
	.db #0x7c	; 124
	.db #0x60	; 96
	.db #0x78	; 120	'x'
	.db #0xc0	; 192
	.db #0xf0	; 240
	.db #0xe7	; 231
	.db #0xc0	; 192
	.db #0xbc	; 188
	.db #0xc3	; 195
	.db #0x0c	; 12
	.db #0xf0	; 240
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x06	; 6
	.db #0x01	; 1
	.db #0x73	; 115	's'
	.db #0x0c	; 12
	.db #0x20	; 32
	.db #0xc0	; 192
	.db #0xe0	; 224
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x12	; 18
	.db #0x0c	; 12
	.db #0x2c	; 44
	.db #0x10	; 16
	.db #0x80	; 128
	.db #0x60	; 96
	.db #0xc0	; 192
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x73	; 115	's'
	.db #0x73	; 115	's'
	.db #0x14	; 20
	.db #0x14	; 20
	.db #0x34	; 52	'4'
	.db #0x34	; 52	'4'
	.db #0x44	; 68	'D'
	.db #0x44	; 68	'D'
	.db #0x73	; 115	's'
	.db #0x73	; 115	's'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x77	; 119	'w'
	.db #0x77	; 119	'w'
	.db #0x94	; 148
	.db #0x94	; 148
	.db #0xb7	; 183
	.db #0xb7	; 183
	.db #0xc1	; 193
	.db #0xc1	; 193
	.db #0x77	; 119	'w'
	.db #0x77	; 119	'w'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xbf	; 191
	.db #0x40	; 64
	.db #0x5f	; 95
	.db #0x20	; 32
	.db #0x3f	; 63
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xfc	; 252
	.db #0x03	; 3
	.db #0xfe	; 254
	.db #0x01	; 1
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x3f	; 63
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0xe0	; 224
	.db #0xc0	; 192
	.db #0x38	; 56	'8'
	.db #0xf0	; 240
	.db #0x0e	; 14
	.db #0xfe	; 254
	.db #0x01	; 1
	.db #0xf6	; 246
	.db #0x09	; 9
	.db #0xff	; 255
	.db #0x00	; 0
_start_title_screen_sprite:
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xc0	; 192
	.db #0x00	; 0
	.db #0x7f	; 127
	.db #0x00	; 0
	.db #0x1f	; 31
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xfc	; 252
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x3f	; 63
	.db #0x00	; 0
	.db #0x0f	; 15
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xf8	; 248
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xe0	; 224
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xfc	; 252
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x7f	; 127
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x0f	; 15
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x3f	; 63
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x7f	; 127
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xfe	; 254
	.db #0x00	; 0
	.db #0xf8	; 248
	.db #0x00	; 0
	.db #0xe0	; 224
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x00	; 0
	.db #0xfc	; 252
	.db #0x00	; 0
	.db #0xf0	; 240
	.db #0x00	; 0
	.db #0xc0	; 192
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x70	; 112	'p'
	.db #0x70	; 112	'p'
	.db #0xe1	; 225
	.db #0xe1	; 225
	.db #0xc1	; 193
	.db #0xc1	; 193
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x1f	; 31
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x00	; 0
	.db #0xc1	; 193
	.db #0xc0	; 192
	.db #0xe0	; 224
	.db #0xe0	; 224
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x87	; 135
	.db #0x80	; 128
	.db #0xff	; 255
	.db #0x80	; 128
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x7f	; 127
	.db #0x00	; 0
	.db #0x1f	; 31
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x0c	; 12
	.db #0xff	; 255
	.db #0x1e	; 30
	.db #0xff	; 255
	.db #0x36	; 54	'6'
	.db #0xff	; 255
	.db #0x36	; 54	'6'
	.db #0xff	; 255
	.db #0x64	; 100	'd'
	.db #0xff	; 255
	.db #0x6c	; 108	'l'
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x01	; 1
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x01	; 1
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xf0	; 240
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x28	; 40
	.db #0xff	; 255
	.db #0x28	; 40
	.db #0xff	; 255
	.db #0x80	; 128
	.db #0xff	; 255
	.db #0x18	; 24
	.db #0xff	; 255
	.db #0xbd	; 189
	.db #0xff	; 255
	.db #0x3f	; 63
	.db #0x1f	; 31
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0xc0	; 192
	.db #0xff	; 255
	.db #0xe0	; 224
	.db #0xff	; 255
	.db #0xe0	; 224
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x01	; 1
	.db #0xff	; 255
	.db #0x03	; 3
	.db #0xff	; 255
	.db #0x0f	; 15
	.db #0xff	; 255
	.db #0x0c	; 12
	.db #0xff	; 255
	.db #0x1c	; 28
	.db #0xfe	; 254
	.db #0x00	; 0
	.db #0xf0	; 240
	.db #0x00	; 0
	.db #0xc0	; 192
	.db #0x00	; 0
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfe	; 254
	.db #0xfe	; 254
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0xd8	; 216
	.db #0x18	; 24
	.db #0xff	; 255
	.db #0x39	; 57	'9'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x31	; 49	'1'
	.db #0x31	; 49	'1'
	.db #0x7b	; 123
	.db #0x7b	; 123
	.db #0xdb	; 219
	.db #0xdb	; 219
	.db #0xde	; 222
	.db #0xde	; 222
	.db #0xde	; 222
	.db #0xde	; 222
	.db #0x9e	; 158
	.db #0x9e	; 158
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x0f	; 15
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x7f	; 127
	.db #0x00	; 0
	.db #0x3f	; 63
	.db #0x00	; 0
	.db #0x3f	; 63
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x3f	; 63
	.db #0x03	; 3
	.db #0xff	; 255
	.db #0x03	; 3
	.db #0xff	; 255
	.db #0x03	; 3
	.db #0xff	; 255
	.db #0x03	; 3
	.db #0xff	; 255
	.db #0x03	; 3
	.db #0xff	; 255
	.db #0x03	; 3
	.db #0xff	; 255
	.db #0x03	; 3
	.db #0xff	; 255
	.db #0x83	; 131
	.db #0xff	; 255
	.db #0x83	; 131
	.db #0xff	; 255
	.db #0x03	; 3
	.db #0xff	; 255
	.db #0x03	; 3
	.db #0xff	; 255
	.db #0x07	; 7
	.db #0xff	; 255
	.db #0x07	; 7
	.db #0xff	; 255
	.db #0x0f	; 15
	.db #0xff	; 255
	.db #0x8f	; 143
	.db #0xff	; 255
	.db #0x80	; 128
	.db #0xff	; 255
	.db #0x80	; 128
	.db #0xff	; 255
	.db #0x19	; 25
	.db #0xff	; 255
	.db #0x1b	; 27
	.db #0xff	; 255
	.db #0x1f	; 31
	.db #0xff	; 255
	.db #0x1d	; 29
	.db #0xff	; 255
	.db #0x1d	; 29
	.db #0xff	; 255
	.db #0x38	; 56	'8'
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x8e	; 142
	.db #0xff	; 255
	.db #0xdf	; 223
	.db #0xff	; 255
	.db #0xbb	; 187
	.db #0xff	; 255
	.db #0xb2	; 178
	.db #0xff	; 255
	.db #0xf0	; 240
	.db #0xff	; 255
	.db #0xf8	; 248
	.db #0xff	; 255
	.db #0x6c	; 108	'l'
	.db #0xff	; 255
	.db #0x78	; 120	'x'
	.db #0xff	; 255
	.db #0x76	; 118	'v'
	.db #0xff	; 255
	.db #0x6e	; 110	'n'
	.db #0xff	; 255
	.db #0xfe	; 254
	.db #0xff	; 255
	.db #0xf6	; 246
	.db #0xff	; 255
	.db #0xf6	; 246
	.db #0xff	; 255
	.db #0xe6	; 230
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x01	; 1
	.db #0xff	; 255
	.db #0x1c	; 28
	.db #0xff	; 255
	.db #0x7c	; 124
	.db #0xff	; 255
	.db #0x66	; 102	'f'
	.db #0xff	; 255
	.db #0x6c	; 108	'l'
	.db #0xff	; 255
	.db #0x78	; 120	'x'
	.db #0xff	; 255
	.db #0xe2	; 226
	.db #0xff	; 255
	.db #0xbf	; 191
	.db #0xff	; 255
	.db #0x1f	; 31
	.db #0xff	; 255
	.db #0x1f	; 31
	.db #0xff	; 255
	.db #0x0f	; 15
	.db #0xff	; 255
	.db #0x07	; 7
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0xe0	; 224
	.db #0xff	; 255
	.db #0xc0	; 192
	.db #0xff	; 255
	.db #0xce	; 206
	.db #0xff	; 255
	.db #0x9f	; 159
	.db #0xff	; 255
	.db #0x33	; 51	'3'
	.db #0xff	; 255
	.db #0x36	; 54	'6'
	.db #0xff	; 255
	.db #0x3c	; 60
	.db #0xff	; 255
	.db #0x38	; 56	'8'
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x37	; 55	'7'
	.db #0xff	; 255
	.db #0x6f	; 111	'o'
	.db #0xff	; 255
	.db #0x7f	; 127
	.db #0xff	; 255
	.db #0x77	; 119	'w'
	.db #0xff	; 255
	.db #0x77	; 119	'w'
	.db #0xff	; 255
	.db #0xf7	; 247
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x30	; 48	'0'
	.db #0xff	; 255
	.db #0x70	; 112	'p'
	.db #0xff	; 255
	.db #0xf0	; 240
	.db #0xff	; 255
	.db #0xb0	; 176
	.db #0xff	; 255
	.db #0x30	; 48	'0'
	.db #0xff	; 255
	.db #0x70	; 112	'p'
	.db #0xff	; 255
	.db #0x38	; 56	'8'
	.db #0xff	; 255
	.db #0x38	; 56	'8'
	.db #0xff	; 255
	.db #0x30	; 48	'0'
	.db #0xff	; 255
	.db #0x30	; 48	'0'
	.db #0xff	; 255
	.db #0x70	; 112	'p'
	.db #0xff	; 255
	.db #0x70	; 112	'p'
	.db #0xff	; 255
	.db #0x30	; 48	'0'
	.db #0xff	; 255
	.db #0x39	; 57	'9'
	.db #0xff	; 255
	.db #0x39	; 57	'9'
	.db #0xff	; 255
	.db #0x31	; 49	'1'
	.db #0xff	; 255
	.db #0x31	; 49	'1'
	.db #0xff	; 255
	.db #0x71	; 113	'q'
	.db #0xff	; 255
	.db #0x71	; 113	'q'
	.db #0xff	; 255
	.db #0x71	; 113	'q'
	.db #0xff	; 255
	.db #0xf1	; 241
	.db #0xff	; 255
	.db #0xf3	; 243
	.db #0xfe	; 254
	.db #0x9c	; 156
	.db #0xff	; 255
	.db #0xbc	; 188
	.db #0xff	; 255
	.db #0xbd	; 189
	.db #0xff	; 255
	.db #0xef	; 239
	.db #0xff	; 255
	.db #0xcf	; 207
	.db #0xff	; 255
	.db #0xce	; 206
	.db #0xff	; 255
	.db #0x8c	; 140
	.db #0xff	; 255
	.db #0x9c	; 156
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xf8	; 248
	.db #0x80	; 128
	.db #0xff	; 255
	.db #0x80	; 128
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xe0	; 224
	.db #0x00	; 0
	.db #0xfe	; 254
	.db #0x00	; 0
	.db #0xfe	; 254
	.db #0x00	; 0
	.db #0xfc	; 252
	.db #0x00	; 0
	.db #0xf8	; 248
	.db #0x00	; 0
	.db #0xf8	; 248
	.db #0x00	; 0
	.db #0x1f	; 31
	.db #0x00	; 0
	.db #0x1f	; 31
	.db #0x00	; 0
	.db #0x0f	; 15
	.db #0x00	; 0
	.db #0x0f	; 15
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x01	; 1
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0xfb	; 251
	.db #0xff	; 255
	.db #0xf1	; 241
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0xf8	; 248
	.db #0xff	; 255
	.db #0xd8	; 216
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x1f	; 31
	.db #0xff	; 255
	.db #0x0f	; 15
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0xe7	; 231
	.db #0xff	; 255
	.db #0x47	; 71	'G'
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0xfe	; 254
	.db #0xff	; 255
	.db #0x3c	; 60
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xfc	; 252
	.db #0x00	; 0
	.db #0xf0	; 240
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xfe	; 254
	.db #0x00	; 0
	.db #0xf8	; 248
	.db #0x00	; 0
	.db #0xc0	; 192
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x3f	; 63
	.db #0xff	; 255
	.db #0x1f	; 31
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x3f	; 63
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0xe6	; 230
	.db #0xff	; 255
	.db #0x66	; 102	'f'
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x01	; 1
	.db #0xfe	; 254
	.db #0x03	; 3
	.db #0x7d	; 125
	.db #0x0e	; 14
	.db #0x13	; 19
	.db #0x1d	; 29
	.db #0xff	; 255
	.db #0x70	; 112	'p'
	.db #0xff	; 255
	.db #0x60	; 96
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x78	; 120	'x'
	.db #0xbf	; 191
	.db #0xf0	; 240
	.db #0x7f	; 127
	.db #0xe0	; 224
	.db #0xff	; 255
	.db #0xc0	; 192
	.db #0xff	; 255
	.db #0x80	; 128
	.db #0xff	; 255
	.db #0x1f	; 31
	.db #0xff	; 255
	.db #0x0e	; 14
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0xbf	; 191
	.db #0xff	; 255
	.db #0x3c	; 60
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xe7	; 231
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0xc0	; 192
	.db #0xff	; 255
	.db #0x80	; 128
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xf0	; 240
	.db #0x00	; 0
	.db #0xf0	; 240
	.db #0x00	; 0
	.db #0xe0	; 224
	.db #0x00	; 0
	.db #0xe0	; 224
	.db #0x00	; 0
	.db #0xc0	; 192
	.db #0x00	; 0
	.db #0xc0	; 192
	.db #0x00	; 0
	.db #0xc0	; 192
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x7f	; 127
	.db #0x00	; 0
	.db #0x7f	; 127
	.db #0x00	; 0
	.db #0x7f	; 127
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x01	; 1
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x80	; 128
	.db #0xff	; 255
	.db #0xe0	; 224
	.db #0xbf	; 191
	.db #0xd8	; 216
	.db #0xdf	; 223
	.db #0x67	; 103	'g'
	.db #0xef	; 239
	.db #0x30	; 48	'0'
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xfd	; 253
	.db #0x01	; 1
	.db #0xf0	; 240
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x03	; 3
	.db #0xf9	; 249
	.db #0x01	; 1
	.db #0xe1	; 225
	.db #0x01	; 1
	.db #0x81	; 129
	.db #0x01	; 1
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0x4c	; 76	'L'
	.db #0x7c	; 124
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0xc0	; 192
	.db #0x40	; 64
	.db #0x60	; 96
	.db #0xa0	; 160
	.db #0xb0	; 176
	.db #0xd0	; 208
	.db #0xb8	; 184
	.db #0xc8	; 200
	.db #0xb8	; 184
	.db #0xc8	; 200
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x03	; 3
	.db #0x05	; 5
	.db #0x06	; 6
	.db #0x0b	; 11
	.db #0x0c	; 12
	.db #0x17	; 23
	.db #0x19	; 25
	.db #0x2f	; 47
	.db #0x33	; 51	'3'
	.db #0x5e	; 94
	.db #0x66	; 102	'f'
	.db #0xbc	; 188
	.db #0xcc	; 204
	.db #0x78	; 120	'x'
	.db #0x98	; 152
	.db #0xf7	; 247
	.db #0x37	; 55	'7'
	.db #0xfb	; 251
	.db #0x7f	; 127
	.db #0xe7	; 231
	.db #0xff	; 255
	.db #0x9e	; 158
	.db #0xef	; 239
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x3f	; 63
	.db #0x00	; 0
	.db #0xcf	; 207
	.db #0xc0	; 192
	.db #0x83	; 131
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x1f	; 31
	.db #0xe0	; 224
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x7f	; 127
	.db #0x00	; 0
	.db #0xdf	; 223
	.db #0xc0	; 192
	.db #0xff	; 255
	.db #0x3c	; 60
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xfe	; 254
	.db #0x00	; 0
	.db #0xfe	; 254
	.db #0x00	; 0
	.db #0xfc	; 252
	.db #0x00	; 0
	.db #0xfc	; 252
	.db #0x00	; 0
	.db #0xfc	; 252
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x3f	; 63
	.db #0x00	; 0
	.db #0x3f	; 63
	.db #0x00	; 0
	.db #0x1f	; 31
	.db #0x00	; 0
	.db #0x1f	; 31
	.db #0x00	; 0
	.db #0x0f	; 15
	.db #0x00	; 0
	.db #0x0f	; 15
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xfe	; 254
	.db #0x00	; 0
	.db #0xf8	; 248
	.db #0x00	; 0
	.db #0xc0	; 192
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xf3	; 243
	.db #0x1c	; 28
	.db #0xfd	; 253
	.db #0x0e	; 14
	.db #0xe2	; 226
	.db #0x03	; 3
	.db #0x81	; 129
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x0f	; 15
	.db #0x0e	; 14
	.db #0x3f	; 63
	.db #0x30	; 48	'0'
	.db #0x78	; 120	'x'
	.db #0x40	; 64
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x40	; 64
	.db #0x80	; 128
	.db #0xa0	; 160
	.db #0xc0	; 192
	.db #0xc8	; 200
	.db #0xf0	; 240
	.db #0xf2	; 242
	.db #0x0c	; 12
	.db #0x0d	; 13
	.db #0x02	; 2
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0xe3	; 227
	.db #0xff	; 255
	.db #0xf4	; 244
	.db #0x0b	; 11
	.db #0x1d	; 29
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x5c	; 92
	.db #0x64	; 100	'd'
	.db #0xcc	; 204
	.db #0xe4	; 228
	.db #0x5e	; 94
	.db #0xe2	; 226
	.db #0x96	; 150
	.db #0x62	; 98	'b'
	.db #0x57	; 87	'W'
	.db #0xa3	; 163
	.db #0x27	; 39
	.db #0x50	; 80	'P'
	.db #0x03	; 3
	.db #0x30	; 48	'0'
	.db #0x22	; 34
	.db #0x10	; 16
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x30	; 48	'0'
	.db #0x30	; 48	'0'
	.db #0x70	; 112	'p'
	.db #0x50	; 80	'P'
	.db #0xd7	; 215
	.db #0xb7	; 183
	.db #0xbf	; 191
	.db #0x78	; 120	'x'
	.db #0xbe	; 190
	.db #0x40	; 64
	.db #0x61	; 97	'a'
	.db #0x80	; 128
	.db #0x86	; 134
	.db #0x01	; 1
	.db #0x2d	; 45
	.db #0x33	; 51	'3'
	.db #0x5e	; 94
	.db #0x63	; 99	'c'
	.db #0x5d	; 93
	.db #0x66	; 102	'f'
	.db #0xb6	; 182
	.db #0xcd	; 205
	.db #0x07	; 7
	.db #0xf8	; 248
	.db #0x3e	; 62
	.db #0x0f	; 15
	.db #0xb7	; 183
	.db #0x78	; 120	'x'
	.db #0xbf	; 191
	.db #0xc0	; 192
	.db #0x73	; 115	's'
	.db #0x9c	; 156
	.db #0xae	; 174
	.db #0x70	; 112	'p'
	.db #0xbe	; 190
	.db #0xc0	; 192
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xfe	; 254
	.db #0x00	; 0
	.db #0xf8	; 248
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xc0	; 192
	.db #0x00	; 0
	.db #0xfc	; 252
	.db #0x00	; 0
	.db #0xfe	; 254
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x3f	; 63
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x18	; 24
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x80	; 128
	.db #0xff	; 255
	.db #0x60	; 96
	.db #0x7f	; 127
	.db #0x18	; 24
	.db #0x17	; 23
	.db #0x0e	; 14
	.db #0x05	; 5
	.db #0x03	; 3
	.db #0x0e	; 14
	.db #0x01	; 1
	.db #0x07	; 7
	.db #0x00	; 0
	.db #0x83	; 131
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x80	; 128
	.db #0x7f	; 127
	.db #0xc0	; 192
	.db #0xb7	; 183
	.db #0x70	; 112	'p'
	.db #0xc9	; 201
	.db #0x38	; 56	'8'
	.db #0xf8	; 248
	.db #0x00	; 0
	.db #0xf8	; 248
	.db #0x00	; 0
	.db #0xf0	; 240
	.db #0x00	; 0
	.db #0xf0	; 240
	.db #0x00	; 0
	.db #0xe0	; 224
	.db #0x00	; 0
	.db #0xe0	; 224
	.db #0x00	; 0
	.db #0xc0	; 192
	.db #0x00	; 0
	.db #0xc0	; 192
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x03	; 3
	.db #0x02	; 2
	.db #0x07	; 7
	.db #0x04	; 4
	.db #0x0c	; 12
	.db #0x08	; 8
	.db #0x18	; 24
	.db #0x10	; 16
	.db #0x31	; 49	'1'
	.db #0x20	; 32
	.db #0x63	; 99	'c'
	.db #0x40	; 64
	.db #0xc6	; 198
	.db #0x81	; 129
	.db #0xe0	; 224
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x30	; 48	'0'
	.db #0x00	; 0
	.db #0x60	; 96
	.db #0x00	; 0
	.db #0xc0	; 192
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x12	; 18
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x0a	; 10
	.db #0x07	; 7
	.db #0x1e	; 30
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x0f	; 15
	.db #0x01	; 1
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xbf	; 191
	.db #0xc0	; 192
	.db #0xbf	; 191
	.db #0x60	; 96
	.db #0x7f	; 127
	.db #0x10	; 16
	.db #0x1f	; 31
	.db #0x08	; 8
	.db #0x0f	; 15
	.db #0x04	; 4
	.db #0x87	; 135
	.db #0x02	; 2
	.db #0x63	; 99	'c'
	.db #0x81	; 129
	.db #0xf0	; 240
	.db #0x00	; 0
	.db #0xfc	; 252
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xfe	; 254
	.db #0x00	; 0
	.db #0xfe	; 254
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x18	; 24
	.db #0x07	; 7
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x1b	; 27
	.db #0x04	; 4
	.db #0x06	; 6
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x7b	; 123
	.db #0xfc	; 252
	.db #0xdf	; 223
	.db #0x3f	; 63
	.db #0xef	; 239
	.db #0xff	; 255
	.db #0x74	; 116	't'
	.db #0xfc	; 252
	.db #0x1e	; 30
	.db #0x7e	; 126
	.db #0x6c	; 108	'l'
	.db #0x1c	; 28
	.db #0xf6	; 246
	.db #0x0e	; 14
	.db #0xf9	; 249
	.db #0x07	; 7
	.db #0xfe	; 254
	.db #0x01	; 1
	.db #0xbf	; 191
	.db #0xc0	; 192
	.db #0xf7	; 247
	.db #0xf8	; 248
	.db #0x7e	; 126
	.db #0x7f	; 127
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x40	; 64
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x40	; 64
	.db #0xc0	; 192
	.db #0xa0	; 160
	.db #0x60	; 96
	.db #0xd0	; 208
	.db #0x30	; 48	'0'
	.db #0xa8	; 168
	.db #0xd8	; 216
	.db #0xe4	; 228
	.db #0xfc	; 252
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x03	; 3
	.db #0x02	; 2
	.db #0x06	; 6
	.db #0x04	; 4
	.db #0x0e	; 14
	.db #0x08	; 8
	.db #0x0d	; 13
	.db #0x09	; 9
	.db #0x1b	; 27
	.db #0x13	; 19
	.db #0x36	; 54	'6'
	.db #0x26	; 38
	.db #0xcc	; 204
	.db #0x02	; 2
	.db #0x9a	; 154
	.db #0x04	; 4
	.db #0x24	; 36
	.db #0x18	; 24
	.db #0x78	; 120	'x'
	.db #0x30	; 48	'0'
	.db #0x70	; 112	'p'
	.db #0xe0	; 224
	.db #0xf0	; 240
	.db #0xc0	; 192
	.db #0xe0	; 224
	.db #0xc0	; 192
	.db #0xe1	; 225
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x40	; 64
	.db #0x00	; 0
	.db #0xc1	; 193
	.db #0x00	; 0
	.db #0x41	; 65	'A'
	.db #0x80	; 128
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x06	; 6
	.db #0x01	; 1
	.db #0x1e	; 30
	.db #0x01	; 1
	.db #0x3d	; 61
	.db #0x02	; 2
	.db #0x7e	; 126
	.db #0x02	; 2
	.db #0xf8	; 248
	.db #0x06	; 6
	.db #0xff	; 255
	.db #0x04	; 4
	.db #0xf7	; 247
	.db #0x0c	; 12
	.db #0x06	; 6
	.db #0x80	; 128
	.db #0x84	; 132
	.db #0x02	; 2
	.db #0x07	; 7
	.db #0x02	; 2
	.db #0x87	; 135
	.db #0x02	; 2
	.db #0x84	; 132
	.db #0x03	; 3
	.db #0x07	; 7
	.db #0x81	; 129
	.db #0xc7	; 199
	.db #0x81	; 129
	.db #0xc7	; 199
	.db #0x81	; 129
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x90	; 144
	.db #0x00	; 0
	.db #0x48	; 72	'H'
	.db #0x90	; 144
	.db #0xdc	; 220
	.db #0x88	; 136
	.db #0x0f	; 15
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x58	; 88	'X'
	.db #0xe1	; 225
	.db #0xd5	; 213
	.db #0x38	; 56	'8'
	.db #0xee	; 238
	.db #0x1c	; 28
	.db #0xfb	; 251
	.db #0x0e	; 14
	.db #0xff	; 255
	.db #0x05	; 5
	.db #0xf9	; 249
	.db #0x06	; 6
	.db #0xff	; 255
	.db #0x02	; 2
	.db #0xff	; 255
	.db #0x02	; 2
	.db #0x7f	; 127
	.db #0x80	; 128
	.db #0xff	; 255
	.db #0x80	; 128
	.db #0xff	; 255
	.db #0x40	; 64
	.db #0x9f	; 159
	.db #0x60	; 96
	.db #0xff	; 255
	.db #0x20	; 32
	.db #0xcf	; 207
	.db #0xb0	; 176
	.db #0xff	; 255
	.db #0x50	; 80	'P'
	.db #0xe5	; 229
	.db #0x3a	; 58
	.db #0xc0	; 192
	.db #0x00	; 0
	.db #0xf8	; 248
	.db #0x00	; 0
	.db #0xfe	; 254
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xe3	; 227
	.db #0x00	; 0
	.db #0xf1	; 241
	.db #0x00	; 0
	.db #0xf8	; 248
	.db #0x00	; 0
	.db #0xfc	; 252
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x03	; 3
	.db #0x81	; 129
	.db #0x00	; 0
	.db #0x60	; 96
	.db #0x80	; 128
	.db #0xf8	; 248
	.db #0x40	; 64
	.db #0x6e	; 110	'n'
	.db #0x30	; 48	'0'
	.db #0x0f	; 15
	.db #0x18	; 24
	.db #0xf2	; 242
	.db #0x0e	; 14
	.db #0xfd	; 253
	.db #0x03	; 3
	.db #0xfe	; 254
	.db #0x01	; 1
	.db #0xff	; 255
	.db #0x80	; 128
	.db #0xdf	; 223
	.db #0x60	; 96
	.db #0x3f	; 63
	.db #0x10	; 16
	.db #0x1b	; 27
	.db #0x0c	; 12
	.db #0x87	; 135
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xe0	; 224
	.db #0x60	; 96
	.db #0xf0	; 240
	.db #0x30	; 48	'0'
	.db #0xf8	; 248
	.db #0x18	; 24
	.db #0xfc	; 252
	.db #0x0c	; 12
	.db #0xfe	; 254
	.db #0x06	; 6
	.db #0x7a	; 122	'z'
	.db #0x7e	; 126
	.db #0x1f	; 31
	.db #0x1f	; 31
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x3c	; 60
	.db #0x2c	; 44
	.db #0x79	; 121	'y'
	.db #0x59	; 89	'Y'
	.db #0xf1	; 241
	.db #0xb1	; 177
	.db #0xe1	; 225
	.db #0xe1	; 225
	.db #0xc3	; 195
	.db #0xc2	; 194
	.db #0x83	; 131
	.db #0x82	; 130
	.db #0x03	; 3
	.db #0x02	; 2
	.db #0x03	; 3
	.db #0x02	; 2
	.db #0xc3	; 195
	.db #0x80	; 128
	.db #0xc3	; 195
	.db #0x01	; 1
	.db #0x87	; 135
	.db #0x01	; 1
	.db #0x8c	; 140
	.db #0x03	; 3
	.db #0x8f	; 143
	.db #0x02	; 2
	.db #0x1b	; 27
	.db #0x06	; 6
	.db #0x3c	; 60
	.db #0x06	; 6
	.db #0x38	; 56	'8'
	.db #0x0e	; 14
	.db #0x03	; 3
	.db #0x80	; 128
	.db #0x87	; 135
	.db #0x00	; 0
	.db #0x87	; 135
	.db #0x00	; 0
	.db #0x0f	; 15
	.db #0x00	; 0
	.db #0x1f	; 31
	.db #0x00	; 0
	.db #0x1d	; 29
	.db #0x02	; 2
	.db #0x39	; 57	'9'
	.db #0x06	; 6
	.db #0x3e	; 62
	.db #0x05	; 5
	.db #0xfe	; 254
	.db #0x0d	; 13
	.db #0xf7	; 247
	.db #0x1d	; 29
	.db #0xdf	; 223
	.db #0x35	; 53	'5'
	.db #0xff	; 255
	.db #0x25	; 37
	.db #0xd5	; 213
	.db #0x67	; 103	'g'
	.db #0x63	; 99	'c'
	.db #0xc7	; 199
	.db #0xa7	; 167
	.db #0xc3	; 195
	.db #0xff	; 255
	.db #0xbf	; 191
	.db #0x02	; 2
	.db #0xc1	; 193
	.db #0xa3	; 163
	.db #0x40	; 64
	.db #0xa3	; 163
	.db #0x40	; 64
	.db #0x83	; 131
	.db #0x60	; 96
	.db #0xd1	; 209
	.db #0x20	; 32
	.db #0xd1	; 209
	.db #0x20	; 32
	.db #0x89	; 137
	.db #0x30	; 48	'0'
	.db #0xa9	; 169
	.db #0x90	; 144
	.db #0xa6	; 166
	.db #0xcc	; 204
	.db #0xef	; 239
	.db #0xc6	; 198
	.db #0xf1	; 241
	.db #0xa7	; 167
	.db #0x8e	; 142
	.db #0xf3	; 243
	.db #0x78	; 120	'x'
	.db #0xd3	; 211
	.db #0xff	; 255
	.db #0x49	; 73	'I'
	.db #0xee	; 238
	.db #0x45	; 69	'E'
	.db #0xc7	; 199
	.db #0x63	; 99	'c'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0xc0	; 192
	.db #0xe0	; 224
	.db #0x40	; 64
	.db #0x70	; 112	'p'
	.db #0xa0	; 160
	.db #0xf8	; 248
	.db #0xf0	; 240
	.db #0xfc	; 252
	.db #0x03	; 3
	.db #0x7f	; 127
	.db #0x01	; 1
	.db #0x7f	; 127
	.db #0x01	; 1
	.db #0x7f	; 127
	.db #0x01	; 1
	.db #0x3e	; 62
	.db #0x01	; 1
	.db #0x3f	; 63
	.db #0x00	; 0
	.db #0x3f	; 63
	.db #0x00	; 0
	.db #0x3f	; 63
	.db #0x00	; 0
	.db #0xfe	; 254
	.db #0x19	; 25
	.db #0xff	; 255
	.db #0x08	; 8
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x7f	; 127
	.db #0x80	; 128
	.db #0xff	; 255
	.db #0x80	; 128
	.db #0xef	; 239
	.db #0x90	; 144
	.db #0xff	; 255
	.db #0x90	; 144
	.db #0xfe	; 254
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x80	; 128
	.db #0xff	; 255
	.db #0x40	; 64
	.db #0xff	; 255
	.db #0x20	; 32
	.db #0xff	; 255
	.db #0x10	; 16
	.db #0xff	; 255
	.db #0x08	; 8
	.db #0xf7	; 247
	.db #0x0c	; 12
	.db #0xfb	; 251
	.db #0x06	; 6
	.db #0x0f	; 15
	.db #0x04	; 4
	.db #0x07	; 7
	.db #0x02	; 2
	.db #0x83	; 131
	.db #0x01	; 1
	.db #0xc0	; 192
	.db #0x00	; 0
	.db #0xe0	; 224
	.db #0x00	; 0
	.db #0xf0	; 240
	.db #0x00	; 0
	.db #0xf8	; 248
	.db #0x00	; 0
	.db #0xf8	; 248
	.db #0x00	; 0
	.db #0xc3	; 195
	.db #0x01	; 1
	.db #0xf1	; 241
	.db #0x00	; 0
	.db #0xf8	; 248
	.db #0x00	; 0
	.db #0xfc	; 252
	.db #0x80	; 128
	.db #0x7e	; 126
	.db #0x40	; 64
	.db #0x3f	; 63
	.db #0x20	; 32
	.db #0x1f	; 31
	.db #0x10	; 16
	.db #0x1f	; 31
	.db #0x08	; 8
	.db #0xff	; 255
	.db #0x03	; 3
	.db #0xbd	; 189
	.db #0xc3	; 195
	.db #0xff	; 255
	.db #0x61	; 97	'a'
	.db #0x7f	; 127
	.db #0x30	; 48	'0'
	.db #0x3f	; 63
	.db #0x18	; 24
	.db #0x1f	; 31
	.db #0x0c	; 12
	.db #0x0f	; 15
	.db #0x06	; 6
	.db #0x83	; 131
	.db #0x07	; 7
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0x60	; 96
	.db #0xe0	; 224
	.db #0xe0	; 224
	.db #0x60	; 96
	.db #0xf0	; 240
	.db #0x30	; 48	'0'
	.db #0xd8	; 216
	.db #0x38	; 56	'8'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x04	; 4
	.db #0x06	; 6
	.db #0x04	; 4
	.db #0x06	; 6
	.db #0x04	; 4
	.db #0x06	; 6
	.db #0x04	; 4
	.db #0x07	; 7
	.db #0x04	; 4
	.db #0x07	; 7
	.db #0x04	; 4
	.db #0x06	; 6
	.db #0x05	; 5
	.db #0x07	; 7
	.db #0x05	; 5
	.db #0x6a	; 106	'j'
	.db #0x1c	; 28
	.db #0x7a	; 122	'z'
	.db #0x1c	; 28
	.db #0xfa	; 250
	.db #0x3c	; 60
	.db #0xb8	; 184
	.db #0x7c	; 124
	.db #0xe8	; 232
	.db #0x6c	; 108	'l'
	.db #0xc8	; 200
	.db #0xcc	; 204
	.db #0xc8	; 200
	.db #0xcc	; 204
	.db #0x8a	; 138
	.db #0x8c	; 140
	.db #0x7f	; 127
	.db #0x05	; 5
	.db #0x73	; 115	's'
	.db #0x0d	; 13
	.db #0x7d	; 125
	.db #0x0b	; 11
	.db #0x7e	; 126
	.db #0x0b	; 11
	.db #0xff	; 255
	.db #0x0a	; 10
	.db #0xe2	; 226
	.db #0x1e	; 30
	.db #0xfc	; 252
	.db #0x16	; 22
	.db #0xfc	; 252
	.db #0x16	; 22
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x81	; 129
	.db #0x01	; 1
	.db #0x80	; 128
	.db #0x0f	; 15
	.db #0x00	; 0
	.db #0x1f	; 31
	.db #0x08	; 8
	.db #0x30	; 48	'0'
	.db #0x14	; 20
	.db #0xe4	; 228
	.db #0x0d	; 13
	.db #0x6d	; 109	'm'
	.db #0x47	; 71	'G'
	.db #0x0f	; 15
	.db #0xf5	; 245
	.db #0xe8	; 232
	.db #0xf0	; 240
	.db #0x3c	; 60
	.db #0x0a	; 10
	.db #0x84	; 132
	.db #0x05	; 5
	.db #0xc2	; 194
	.db #0x82	; 130
	.db #0x61	; 97	'a'
	.db #0xc1	; 193
	.db #0xb0	; 176
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0x80	; 128
	.db #0xc0	; 192
	.db #0xcf	; 207
	.db #0x6f	; 111	'o'
	.db #0xb9	; 185
	.db #0x78	; 120	'x'
	.db #0xe4	; 228
	.db #0x23	; 35
	.db #0x68	; 104	'h'
	.db #0x27	; 39
	.db #0x72	; 114	'r'
	.db #0x2c	; 44
	.db #0x36	; 54	'6'
	.db #0x9a	; 154
	.db #0xb6	; 182
	.db #0x56	; 86	'V'
	.db #0x53	; 83	'S'
	.db #0x37	; 55	'7'
	.db #0xf8	; 248
	.db #0xf8	; 248
	.db #0xfc	; 252
	.db #0xcc	; 204
	.db #0x0e	; 14
	.db #0xe4	; 228
	.db #0x07	; 7
	.db #0xf2	; 242
	.db #0x25	; 37
	.db #0x1b	; 27
	.db #0x51	; 81	'Q'
	.db #0x4f	; 79	'O'
	.db #0xe0	; 224
	.db #0xed	; 237
	.db #0xc5	; 197
	.db #0xe0	; 224
	.db #0x1f	; 31
	.db #0x00	; 0
	.db #0x1f	; 31
	.db #0x00	; 0
	.db #0x1f	; 31
	.db #0x00	; 0
	.db #0x1f	; 31
	.db #0x00	; 0
	.db #0x1f	; 31
	.db #0x00	; 0
	.db #0x9e	; 158
	.db #0x01	; 1
	.db #0xdf	; 223
	.db #0x81	; 129
	.db #0xdf	; 223
	.db #0x81	; 129
	.db #0xe7	; 231
	.db #0x98	; 152
	.db #0xff	; 255
	.db #0x88	; 136
	.db #0xff	; 255
	.db #0x88	; 136
	.db #0xfb	; 251
	.db #0x8c	; 140
	.db #0xf7	; 247
	.db #0x8c	; 140
	.db #0xf7	; 247
	.db #0x8c	; 140
	.db #0xff	; 255
	.db #0x84	; 132
	.db #0xfd	; 253
	.db #0x86	; 134
	.db #0xff	; 255
	.db #0x03	; 3
	.db #0xf7	; 247
	.db #0x09	; 9
	.db #0xfe	; 254
	.db #0x09	; 9
	.db #0xf3	; 243
	.db #0x0c	; 12
	.db #0xaf	; 175
	.db #0x44	; 68	'D'
	.db #0xe9	; 233
	.db #0x46	; 70	'F'
	.db #0x83	; 131
	.db #0x66	; 102	'f'
	.db #0xf6	; 246
	.db #0x23	; 35
	.db #0xfc	; 252
	.db #0x00	; 0
	.db #0x7e	; 126
	.db #0x80	; 128
	.db #0xfe	; 254
	.db #0x80	; 128
	.db #0xff	; 255
	.db #0xc0	; 192
	.db #0xff	; 255
	.db #0x60	; 96
	.db #0xaf	; 175
	.db #0x70	; 112	'p'
	.db #0xff	; 255
	.db #0x30	; 48	'0'
	.db #0xdf	; 223
	.db #0x38	; 56	'8'
	.db #0x0f	; 15
	.db #0x04	; 4
	.db #0x07	; 7
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x81	; 129
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0xc0	; 192
	.db #0x00	; 0
	.db #0xe0	; 224
	.db #0x00	; 0
	.db #0xc5	; 197
	.db #0x03	; 3
	.db #0xc2	; 194
	.db #0x01	; 1
	.db #0xe0	; 224
	.db #0x01	; 1
	.db #0xf1	; 241
	.db #0x00	; 0
	.db #0xf0	; 240
	.db #0x80	; 128
	.db #0xf8	; 248
	.db #0x40	; 64
	.db #0x1c	; 28
	.db #0x60	; 96
	.db #0x7c	; 124
	.db #0x20	; 32
	.db #0xf8	; 248
	.db #0x98	; 152
	.db #0xfc	; 252
	.db #0xcc	; 204
	.db #0xf6	; 246
	.db #0xee	; 238
	.db #0x7e	; 126
	.db #0xf6	; 246
	.db #0x5b	; 91
	.db #0xdf	; 223
	.db #0xbb	; 187
	.db #0x7f	; 127
	.db #0xad	; 173
	.db #0x6f	; 111	'o'
	.db #0x27	; 39
	.db #0x67	; 103	'g'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x05	; 5
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x0a	; 10
	.db #0x0c	; 12
	.db #0x0a	; 10
	.db #0x0c	; 12
	.db #0x05	; 5
	.db #0x06	; 6
	.db #0x05	; 5
	.db #0x06	; 6
	.db #0x07	; 7
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x07	; 7
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0xfd	; 253
	.db #0x16	; 22
	.db #0xfc	; 252
	.db #0x17	; 23
	.db #0xfe	; 254
	.db #0x15	; 21
	.db #0xf2	; 242
	.db #0x1d	; 29
	.db #0xfe	; 254
	.db #0x19	; 25
	.db #0xff	; 255
	.db #0x18	; 24
	.db #0xef	; 239
	.db #0x18	; 24
	.db #0x6e	; 110	'n'
	.db #0x98	; 152
	.db #0x01	; 1
	.db #0x0f	; 15
	.db #0x04	; 4
	.db #0x0b	; 11
	.db #0x07	; 7
	.db #0x08	; 8
	.db #0x98	; 152
	.db #0x07	; 7
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x40	; 64
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0xc0	; 192
	.db #0x00	; 0
	.db #0xc0	; 192
	.db #0x80	; 128
	.db #0x40	; 64
	.db #0x80	; 128
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x28	; 40
	.db #0x1f	; 31
	.db #0x1a	; 26
	.db #0x0d	; 13
	.db #0x03	; 3
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x81	; 129
	.db #0xe0	; 224
	.db #0x40	; 64
	.db #0xa1	; 161
	.db #0xc0	; 192
	.db #0x21	; 33
	.db #0x32	; 50	'2'
	.db #0xc1	; 193
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x05	; 5
	.db #0x02	; 2
	.db #0x01	; 1
	.db #0x06	; 6
	.db #0xbf	; 191
	.db #0xc1	; 193
	.db #0x7f	; 127
	.db #0xc1	; 193
	.db #0x7c	; 124
	.db #0xc3	; 195
	.db #0xff	; 255
	.db #0x42	; 66	'B'
	.db #0x9f	; 159
	.db #0x62	; 98	'b'
	.db #0xf9	; 249
	.db #0x26	; 38
	.db #0x7e	; 126
	.db #0x25	; 37
	.db #0x72	; 114	'r'
	.db #0x2d	; 45
	.db #0xff	; 255
	.db #0x86	; 134
	.db #0xff	; 255
	.db #0x86	; 134
	.db #0xfb	; 251
	.db #0x86	; 134
	.db #0xfb	; 251
	.db #0x86	; 134
	.db #0xfa	; 250
	.db #0x87	; 135
	.db #0xfb	; 251
	.db #0x87	; 135
	.db #0xfb	; 251
	.db #0x87	; 135
	.db #0xfb	; 251
	.db #0x87	; 135
	.db #0x75	; 117	'u'
	.db #0xa3	; 163
	.db #0xc1	; 193
	.db #0xb3	; 179
	.db #0xf9	; 249
	.db #0x93	; 147
	.db #0x3a	; 58
	.db #0xd1	; 209
	.db #0xfa	; 250
	.db #0x51	; 81	'Q'
	.db #0xe2	; 226
	.db #0x59	; 89	'Y'
	.db #0xfc	; 252
	.db #0x49	; 73	'I'
	.db #0x9c	; 156
	.db #0x69	; 105	'i'
	.db #0xfb	; 251
	.db #0x1c	; 28
	.db #0xf7	; 247
	.db #0x1c	; 28
	.db #0x6d	; 109	'm'
	.db #0x9e	; 158
	.db #0xfb	; 251
	.db #0x8e	; 142
	.db #0xba	; 186
	.db #0xcf	; 207
	.db #0xf9	; 249
	.db #0xcf	; 207
	.db #0xf5	; 245
	.db #0xcf	; 207
	.db #0xdd	; 221
	.db #0xe7	; 231
	.db #0xe0	; 224
	.db #0x00	; 0
	.db #0xf0	; 240
	.db #0x00	; 0
	.db #0xf8	; 248
	.db #0x00	; 0
	.db #0xf8	; 248
	.db #0x00	; 0
	.db #0xfc	; 252
	.db #0x00	; 0
	.db #0xfc	; 252
	.db #0x00	; 0
	.db #0x7e	; 126
	.db #0x80	; 128
	.db #0xfe	; 254
	.db #0x80	; 128
	.db #0x3e	; 62
	.db #0x10	; 16
	.db #0x07	; 7
	.db #0x18	; 24
	.db #0x1f	; 31
	.db #0x08	; 8
	.db #0x0f	; 15
	.db #0x04	; 4
	.db #0x01	; 1
	.db #0x06	; 6
	.db #0x07	; 7
	.db #0x02	; 2
	.db #0x03	; 3
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x01	; 1
	.db #0x53	; 83	'S'
	.db #0x33	; 51	'3'
	.db #0x13	; 19
	.db #0x33	; 51	'3'
	.db #0x29	; 41
	.db #0x19	; 25
	.db #0xa8	; 168
	.db #0x18	; 24
	.db #0x88	; 136
	.db #0x18	; 24
	.db #0xd4	; 212
	.db #0x0c	; 12
	.db #0xd4	; 212
	.db #0x0c	; 12
	.db #0x64	; 100	'd'
	.db #0x8c	; 140
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xe0	; 224
	.db #0xe0	; 224
	.db #0xe0	; 224
	.db #0xe0	; 224
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0x70	; 112	'p'
	.db #0x70	; 112	'p'
	.db #0x78	; 120	'x'
	.db #0x78	; 120	'x'
	.db #0x38	; 56	'8'
	.db #0x38	; 56	'8'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xfe	; 254
	.db #0x88	; 136
	.db #0xfc	; 252
	.db #0xc8	; 200
	.db #0x70	; 112	'p'
	.db #0x6c	; 108	'l'
	.db #0x34	; 52	'4'
	.db #0x3c	; 60
	.db #0x1e	; 30
	.db #0x1c	; 28
	.db #0x19	; 25
	.db #0x1e	; 30
	.db #0x1f	; 31
	.db #0x18	; 24
	.db #0x1d	; 29
	.db #0x18	; 24
	.db #0x00	; 0
	.db #0xc0	; 192
	.db #0x00	; 0
	.db #0xe0	; 224
	.db #0x50	; 80	'P'
	.db #0xa0	; 160
	.db #0x60	; 96
	.db #0x90	; 144
	.db #0x50	; 80	'P'
	.db #0xb8	; 184
	.db #0x2a	; 42
	.db #0xec	; 236
	.db #0x24	; 36
	.db #0xe7	; 231
	.db #0x2e	; 46
	.db #0xef	; 239
	.db #0x08	; 8
	.db #0x07	; 7
	.db #0x00	; 0
	.db #0x08	; 8
	.db #0x00	; 0
	.db #0x08	; 8
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x20	; 32
	.db #0xc0	; 192
	.db #0x20	; 32
	.db #0xc0	; 192
	.db #0x00	; 0
	.db #0x20	; 32
	.db #0x00	; 0
	.db #0x20	; 32
	.db #0x40	; 64
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x40	; 64
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x01	; 1
	.db #0x08	; 8
	.db #0x07	; 7
	.db #0x01	; 1
	.db #0x06	; 6
	.db #0x03	; 3
	.db #0x0c	; 12
	.db #0x12	; 18
	.db #0x0d	; 13
	.db #0x0a	; 10
	.db #0x15	; 21
	.db #0x0b	; 11
	.db #0x35	; 53	'5'
	.db #0xb3	; 179
	.db #0x7d	; 125
	.db #0x4b	; 75	'K'
	.db #0xcd	; 205
	.db #0x8b	; 139
	.db #0x8d	; 141
	.db #0xbf	; 191
	.db #0x29	; 41
	.db #0xbf	; 191
	.db #0x31	; 49	'1'
	.db #0xad	; 173
	.db #0x33	; 51	'3'
	.db #0xbd	; 189
	.db #0x23	; 35
	.db #0xbf	; 191
	.db #0x23	; 35
	.db #0xbb	; 187
	.db #0x27	; 39
	.db #0xbb	; 187
	.db #0x27	; 39
	.db #0xb7	; 183
	.db #0x2f	; 47
	.db #0xfb	; 251
	.db #0x87	; 135
	.db #0xfb	; 251
	.db #0x87	; 135
	.db #0xfb	; 251
	.db #0x87	; 135
	.db #0xfb	; 251
	.db #0x87	; 135
	.db #0xfa	; 250
	.db #0x87	; 135
	.db #0xf8	; 248
	.db #0x87	; 135
	.db #0xf8	; 248
	.db #0x87	; 135
	.db #0xfe	; 254
	.db #0x85	; 133
	.db #0xfc	; 252
	.db #0x29	; 41
	.db #0x7d	; 125
	.db #0xa8	; 168
	.db #0x71	; 113	'q'
	.db #0xac	; 172
	.db #0xfd	; 253
	.db #0xa4	; 164
	.db #0xfd	; 253
	.db #0xa4	; 164
	.db #0xce	; 206
	.db #0xb4	; 180
	.db #0xca	; 202
	.db #0xb4	; 180
	.db #0xca	; 202
	.db #0xb4	; 180
	.db #0xfc	; 252
	.db #0xe7	; 231
	.db #0x7e	; 126
	.db #0xe7	; 231
	.db #0x6e	; 110	'n'
	.db #0xf7	; 247
	.db #0x7a	; 122	'z'
	.db #0xf7	; 247
	.db #0x7b	; 123
	.db #0xf7	; 247
	.db #0x7f	; 127
	.db #0xf3	; 243
	.db #0x77	; 119	'w'
	.db #0xfb	; 251
	.db #0x57	; 87	'W'
	.db #0xdb	; 219
	.db #0xbe	; 190
	.db #0xc0	; 192
	.db #0xff	; 255
	.db #0xc0	; 192
	.db #0xdf	; 223
	.db #0xe0	; 224
	.db #0x5f	; 95
	.db #0xe0	; 224
	.db #0x7f	; 127
	.db #0xe0	; 224
	.db #0x6f	; 111	'o'
	.db #0xf0	; 240
	.db #0x6f	; 111	'o'
	.db #0xf0	; 240
	.db #0x3f	; 63
	.db #0xf0	; 240
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0xea	; 234
	.db #0x86	; 134
	.db #0x2a	; 42
	.db #0xc6	; 198
	.db #0xf2	; 242
	.db #0x46	; 70	'F'
	.db #0xd5	; 213
	.db #0x63	; 99	'c'
	.db #0x35	; 53	'5'
	.db #0x63	; 99	'c'
	.db #0x79	; 121	'y'
	.db #0x23	; 35
	.db #0x69	; 105	'i'
	.db #0x33	; 51	'3'
	.db #0x5a	; 90	'Z'
	.db #0x31	; 49	'1'
	.db #0x3c	; 60
	.db #0x3c	; 60
	.db #0x1c	; 28
	.db #0x1c	; 28
	.db #0x1e	; 30
	.db #0x1e	; 30
	.db #0x0e	; 14
	.db #0x0e	; 14
	.db #0x0e	; 14
	.db #0x0e	; 14
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x87	; 135
	.db #0x87	; 135
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x1c	; 28
	.db #0x18	; 24
	.db #0x1c	; 28
	.db #0x18	; 24
	.db #0x1c	; 28
	.db #0x18	; 24
	.db #0x2c	; 44
	.db #0x38	; 56	'8'
	.db #0x4c	; 76	'L'
	.db #0x68	; 104	'h'
	.db #0x8c	; 140
	.db #0xc8	; 200
	.db #0x0c	; 12
	.db #0xf8	; 248
	.db #0x8c	; 140
	.db #0xc8	; 200
	.db #0x30	; 48	'0'
	.db #0xfe	; 254
	.db #0x01	; 1
	.db #0xf2	; 242
	.db #0x00	; 0
	.db #0xc2	; 194
	.db #0x01	; 1
	.db #0xc2	; 194
	.db #0x00	; 0
	.db #0xe1	; 225
	.db #0x00	; 0
	.db #0xe1	; 225
	.db #0x00	; 0
	.db #0xe0	; 224
	.db #0x00	; 0
	.db #0xe0	; 224
	.db #0xc4	; 196
	.db #0x38	; 56	'8'
	.db #0x10	; 16
	.db #0xef	; 239
	.db #0x07	; 7
	.db #0x78	; 120	'x'
	.db #0x00	; 0
	.db #0xcf	; 207
	.db #0x04	; 4
	.db #0x88	; 136
	.db #0x81	; 129
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x84	; 132
	.db #0x80	; 128
	.db #0x4c	; 76	'L'
	.db #0x40	; 64
	.db #0x3f	; 63
	.db #0x11	; 17
	.db #0xec	; 236
	.db #0xc2	; 194
	.db #0x3c	; 60
	.db #0x02	; 2
	.db #0xe4	; 228
	.db #0x02	; 2
	.db #0x84	; 132
	.db #0x04	; 4
	.db #0x01	; 1
	.db #0x06	; 6
	.db #0x01	; 1
	.db #0x0c	; 12
	.db #0x02	; 2
	.db #0x74	; 116	't'
	.db #0xfb	; 251
	.db #0x05	; 5
	.db #0x7a	; 122	'z'
	.db #0x05	; 5
	.db #0x4a	; 74	'J'
	.db #0x85	; 133
	.db #0x4a	; 74	'J'
	.db #0x01	; 1
	.db #0x8e	; 142
	.db #0x09	; 9
	.db #0x16	; 22
	.db #0x09	; 9
	.db #0x16	; 22
	.db #0x01	; 1
	.db #0x1a	; 26
	.db #0xb7	; 183
	.db #0x2f	; 47
	.db #0xad	; 173
	.db #0x3d	; 61
	.db #0xb9	; 185
	.db #0x39	; 57	'9'
	.db #0x39	; 57	'9'
	.db #0x39	; 57	'9'
	.db #0x25	; 37
	.db #0x3d	; 61
	.db #0x23	; 35
	.db #0x27	; 39
	.db #0x61	; 97	'a'
	.db #0x23	; 35
	.db #0x69	; 105	'i'
	.db #0x27	; 39
	.db #0xfe	; 254
	.db #0x85	; 133
	.db #0xfe	; 254
	.db #0x85	; 133
	.db #0xf2	; 242
	.db #0x8d	; 141
	.db #0xf3	; 243
	.db #0x8d	; 141
	.db #0xff	; 255
	.db #0x89	; 137
	.db #0xff	; 255
	.db #0x89	; 137
	.db #0x7f	; 127
	.db #0x89	; 137
	.db #0x67	; 103	'g'
	.db #0x99	; 153
	.db #0xbe	; 190
	.db #0xd0	; 208
	.db #0xbe	; 190
	.db #0xd0	; 208
	.db #0xfe	; 254
	.db #0xd0	; 208
	.db #0xfe	; 254
	.db #0xd0	; 208
	.db #0xfe	; 254
	.db #0xd0	; 208
	.db #0xfd	; 253
	.db #0xd0	; 208
	.db #0xfd	; 253
	.db #0xd0	; 208
	.db #0xdd	; 221
	.db #0xf0	; 240
	.db #0x57	; 87	'W'
	.db #0xdb	; 219
	.db #0x57	; 87	'W'
	.db #0xdb	; 219
	.db #0x57	; 87	'W'
	.db #0xdb	; 219
	.db #0x57	; 87	'W'
	.db #0xdb	; 219
	.db #0x57	; 87	'W'
	.db #0xdb	; 219
	.db #0x57	; 87	'W'
	.db #0xdb	; 219
	.db #0x57	; 87	'W'
	.db #0xdb	; 219
	.db #0x53	; 83	'S'
	.db #0xdf	; 223
	.db #0xb7	; 183
	.db #0xf8	; 248
	.db #0xb7	; 183
	.db #0xf8	; 248
	.db #0xbf	; 191
	.db #0xf8	; 248
	.db #0xbf	; 191
	.db #0xf8	; 248
	.db #0xbb	; 187
	.db #0xfc	; 252
	.db #0xbb	; 187
	.db #0xfc	; 252
	.db #0xbf	; 191
	.db #0xfc	; 252
	.db #0xbf	; 191
	.db #0xfc	; 252
	.db #0xc0	; 192
	.db #0x00	; 0
	.db #0xc0	; 192
	.db #0x00	; 0
	.db #0xc0	; 192
	.db #0x00	; 0
	.db #0xc0	; 192
	.db #0x00	; 0
	.db #0xc0	; 192
	.db #0x00	; 0
	.db #0xe0	; 224
	.db #0x00	; 0
	.db #0xe0	; 224
	.db #0x00	; 0
	.db #0xe0	; 224
	.db #0x00	; 0
	.db #0x1e	; 30
	.db #0x31	; 49	'1'
	.db #0x34	; 52	'4'
	.db #0x19	; 25
	.db #0x2c	; 44
	.db #0x19	; 25
	.db #0x2c	; 44
	.db #0x19	; 25
	.db #0x2a	; 42
	.db #0x1d	; 29
	.db #0x2b	; 43
	.db #0x1c	; 28
	.db #0x2f	; 47
	.db #0x1c	; 28
	.db #0x2f	; 47
	.db #0x1c	; 28
	.db #0x87	; 135
	.db #0x87	; 135
	.db #0x83	; 131
	.db #0x83	; 131
	.db #0x83	; 131
	.db #0x83	; 131
	.db #0x83	; 131
	.db #0x83	; 131
	.db #0x83	; 131
	.db #0x83	; 131
	.db #0x41	; 65	'A'
	.db #0xc1	; 193
	.db #0x41	; 65	'A'
	.db #0xc1	; 193
	.db #0x41	; 65	'A'
	.db #0xc1	; 193
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x03	; 3
	.db #0x02	; 2
	.db #0x03	; 3
	.db #0x04	; 4
	.db #0x06	; 6
	.db #0x08	; 8
	.db #0x0c	; 12
	.db #0x10	; 16
	.db #0x18	; 24
	.db #0x10	; 16
	.db #0x18	; 24
	.db #0x20	; 32
	.db #0x30	; 48	'0'
	.db #0x0e	; 14
	.db #0x88	; 136
	.db #0x0a	; 10
	.db #0x0c	; 12
	.db #0x0e	; 14
	.db #0x04	; 4
	.db #0x06	; 6
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x06	; 6
	.db #0x07	; 7
	.db #0x02	; 2
	.db #0x03	; 3
	.db #0x02	; 2
	.db #0x01	; 1
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0xb0	; 176
	.db #0x00	; 0
	.db #0xb0	; 176
	.db #0x00	; 0
	.db #0xb0	; 176
	.db #0x00	; 0
	.db #0x98	; 152
	.db #0x80	; 128
	.db #0x58	; 88	'X'
	.db #0x80	; 128
	.db #0x7c	; 124
	.db #0x00	; 0
	.db #0x44	; 68	'D'
	.db #0x80	; 128
	.db #0x46	; 70	'F'
	.db #0x00	; 0
	.db #0x48	; 72	'H'
	.db #0x00	; 0
	.db #0x38	; 56	'8'
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0x00	; 0
	.db #0x08	; 8
	.db #0x03	; 3
	.db #0x04	; 4
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x08	; 8
	.db #0x04	; 4
	.db #0x10	; 16
	.db #0x08	; 8
	.db #0x20	; 32
	.db #0x10	; 16
	.db #0x40	; 64
	.db #0x20	; 32
	.db #0x80	; 128
	.db #0x40	; 64
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x1a	; 26
	.db #0x11	; 17
	.db #0x2a	; 42
	.db #0x03	; 3
	.db #0x34	; 52	'4'
	.db #0x02	; 2
	.db #0x34	; 52	'4'
	.db #0x02	; 2
	.db #0x64	; 100	'd'
	.db #0x02	; 2
	.db #0x64	; 100	'd'
	.db #0x03	; 3
	.db #0xfc	; 252
	.db #0x07	; 7
	.db #0xc8	; 200
	.db #0x60	; 96
	.db #0x39	; 57	'9'
	.db #0x20	; 32
	.db #0x61	; 97	'a'
	.db #0x60	; 96
	.db #0x40	; 64
	.db #0xc0	; 192
	.db #0x40	; 64
	.db #0xe0	; 224
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0xe0	; 224
	.db #0xc0	; 192
	.db #0xa0	; 160
	.db #0xc0	; 192
	.db #0xa0	; 160
	.db #0xfd	; 253
	.db #0x13	; 19
	.db #0xff	; 255
	.db #0x13	; 19
	.db #0x4f	; 79	'O'
	.db #0xb3	; 179
	.db #0x3f	; 63
	.db #0x63	; 99	'c'
	.db #0x1b	; 27
	.db #0x67	; 103	'g'
	.db #0x1e	; 30
	.db #0x26	; 38
	.db #0x1e	; 30
	.db #0x26	; 38
	.db #0x06	; 6
	.db #0x1e	; 30
	.db #0xdd	; 221
	.db #0xf0	; 240
	.db #0xdc	; 220
	.db #0xf1	; 241
	.db #0x7e	; 126
	.db #0x71	; 113	'q'
	.db #0x7e	; 126
	.db #0x71	; 113	'q'
	.db #0x7e	; 126
	.db #0x71	; 113	'q'
	.db #0x7e	; 126
	.db #0x71	; 113	'q'
	.db #0x7d	; 125
	.db #0x73	; 115	's'
	.db #0x6d	; 109	'm'
	.db #0x73	; 115	's'
	.db #0x53	; 83	'S'
	.db #0xdf	; 223
	.db #0x96	; 150
	.db #0x9e	; 158
	.db #0x96	; 150
	.db #0x9e	; 158
	.db #0x96	; 150
	.db #0x9e	; 158
	.db #0x96	; 150
	.db #0x9e	; 158
	.db #0x97	; 151
	.db #0x9f	; 159
	.db #0x27	; 39
	.db #0x3f	; 63
	.db #0x2d	; 45
	.db #0x3d	; 61
	.db #0xbf	; 191
	.db #0xfc	; 252
	.db #0xbf	; 191
	.db #0xfc	; 252
	.db #0xbd	; 189
	.db #0xfe	; 254
	.db #0xbd	; 189
	.db #0xfe	; 254
	.db #0xbf	; 191
	.db #0xfe	; 254
	.db #0x6f	; 111	'o'
	.db #0xee	; 238
	.db #0x6f	; 111	'o'
	.db #0xee	; 238
	.db #0x67	; 103	'g'
	.db #0xe6	; 230
	.db #0xe0	; 224
	.db #0x00	; 0
	.db #0xe0	; 224
	.db #0x00	; 0
	.db #0xe0	; 224
	.db #0x00	; 0
	.db #0xe0	; 224
	.db #0x00	; 0
	.db #0xe0	; 224
	.db #0x00	; 0
	.db #0xe0	; 224
	.db #0x00	; 0
	.db #0xe0	; 224
	.db #0x00	; 0
	.db #0xf0	; 240
	.db #0x00	; 0
	.db #0x2f	; 47
	.db #0x1c	; 28
	.db #0x2d	; 45
	.db #0x1e	; 30
	.db #0x2d	; 45
	.db #0x1e	; 30
	.db #0x2f	; 47
	.db #0x1e	; 30
	.db #0x2f	; 47
	.db #0x1e	; 30
	.db #0x2f	; 47
	.db #0x1e	; 30
	.db #0x17	; 23
	.db #0x36	; 54	'6'
	.db #0x16	; 22
	.db #0x37	; 55	'7'
	.db #0x41	; 65	'A'
	.db #0xc1	; 193
	.db #0x41	; 65	'A'
	.db #0xc1	; 193
	.db #0x41	; 65	'A'
	.db #0xc1	; 193
	.db #0x40	; 64
	.db #0xc0	; 192
	.db #0x40	; 64
	.db #0xc0	; 192
	.db #0x40	; 64
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x03	; 3
	.db #0x04	; 4
	.db #0x06	; 6
	.db #0x04	; 4
	.db #0x07	; 7
	.db #0x02	; 2
	.db #0x03	; 3
	.db #0x40	; 64
	.db #0x60	; 96
	.db #0x80	; 128
	.db #0xc0	; 192
	.db #0xa0	; 160
	.db #0xc0	; 192
	.db #0x10	; 16
	.db #0x80	; 128
	.db #0x2c	; 44
	.db #0xc0	; 192
	.db #0x20	; 32
	.db #0x12	; 18
	.db #0x45	; 69	'E'
	.db #0x88	; 136
	.db #0x06	; 6
	.db #0xe0	; 224
	.db #0x01	; 1
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x06	; 6
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x80	; 128
	.db #0x04	; 4
	.db #0x80	; 128
	.db #0x44	; 68	'D'
	.db #0x80	; 128
	.db #0x45	; 69	'E'
	.db #0xc0	; 192
	.db #0xa4	; 164
	.db #0x82	; 130
	.db #0xe4	; 228
	.db #0x41	; 65	'A'
	.db #0x64	; 100	'd'
	.db #0x20	; 32
	.db #0x34	; 52	'4'
	.db #0x10	; 16
	.db #0x17	; 23
	.db #0x08	; 8
	.db #0x0e	; 14
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x0f	; 15
	.db #0x83	; 131
	.db #0x1c	; 28
	.db #0x47	; 71	'G'
	.db #0x28	; 40
	.db #0x07	; 7
	.db #0xd8	; 216
	.db #0x0f	; 15
	.db #0x10	; 16
	.db #0x0f	; 15
	.db #0x10	; 16
	.db #0x0f	; 15
	.db #0x10	; 16
	.db #0x00	; 0
	.db #0xc1	; 193
	.db #0x00	; 0
	.db #0xf0	; 240
	.db #0x82	; 130
	.db #0x78	; 120	'x'
	.db #0xc3	; 195
	.db #0x24	; 36
	.db #0xc0	; 192
	.db #0x33	; 51	'3'
	.db #0xe0	; 224
	.db #0x10	; 16
	.db #0xe0	; 224
	.db #0x10	; 16
	.db #0xe0	; 224
	.db #0x10	; 16
	.db #0x06	; 6
	.db #0x49	; 73	'I'
	.db #0x07	; 7
	.db #0x49	; 73	'I'
	.db #0x85	; 133
	.db #0x4b	; 75	'K'
	.db #0x0e	; 14
	.db #0x53	; 83	'S'
	.db #0x0a	; 10
	.db #0x57	; 87	'W'
	.db #0x14	; 20
	.db #0xed	; 237
	.db #0x08	; 8
	.db #0x79	; 121	'y'
	.db #0x10	; 16
	.db #0x71	; 113	'q'
	.db #0x80	; 128
	.db #0xe0	; 224
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x08	; 8
	.db #0x06	; 6
	.db #0x20	; 32
	.db #0x11	; 17
	.db #0x0c	; 12
	.db #0x1c	; 28
	.db #0x04	; 4
	.db #0x0c	; 12
	.db #0x04	; 4
	.db #0x0c	; 12
	.db #0x02	; 2
	.db #0x06	; 6
	.db #0x22	; 34
	.db #0x1e	; 30
	.db #0x01	; 1
	.db #0xc7	; 199
	.db #0x09	; 9
	.db #0x33	; 51	'3'
	.db #0x45	; 69	'E'
	.db #0x83	; 131
	.db #0x6f	; 111	'o'
	.db #0x73	; 115	's'
	.db #0x6b	; 107	'k'
	.db #0x77	; 119	'w'
	.db #0x6e	; 110	'n'
	.db #0x76	; 118	'v'
	.db #0x6e	; 110	'n'
	.db #0x76	; 118	'v'
	.db #0x56	; 86	'V'
	.db #0x6e	; 110	'n'
	.db #0x5c	; 92
	.db #0x6c	; 108	'l'
	.db #0x5c	; 92
	.db #0x6c	; 108	'l'
	.db #0x4c	; 76	'L'
	.db #0x7c	; 124
	.db #0x2d	; 45
	.db #0x3d	; 61
	.db #0x2e	; 46
	.db #0x3f	; 63
	.db #0x2e	; 46
	.db #0x3f	; 63
	.db #0x2e	; 46
	.db #0x3f	; 63
	.db #0x5d	; 93
	.db #0x7f	; 127
	.db #0x5d	; 93
	.db #0x7f	; 127
	.db #0x5d	; 93
	.db #0x7f	; 127
	.db #0x5b	; 91
	.db #0x7f	; 127
	.db #0x67	; 103	'g'
	.db #0xe6	; 230
	.db #0xc6	; 198
	.db #0xc7	; 199
	.db #0xc6	; 198
	.db #0xc7	; 199
	.db #0xc6	; 198
	.db #0xc7	; 199
	.db #0x85	; 133
	.db #0x87	; 135
	.db #0x85	; 133
	.db #0x87	; 135
	.db #0x85	; 133
	.db #0x87	; 135
	.db #0x05	; 5
	.db #0x07	; 7
	.db #0xf0	; 240
	.db #0x00	; 0
	.db #0xf0	; 240
	.db #0x00	; 0
	.db #0xf0	; 240
	.db #0x00	; 0
	.db #0xf0	; 240
	.db #0x00	; 0
	.db #0xf0	; 240
	.db #0x00	; 0
	.db #0xf0	; 240
	.db #0x00	; 0
	.db #0xf0	; 240
	.db #0x00	; 0
	.db #0xf0	; 240
	.db #0x00	; 0
	.db #0x16	; 22
	.db #0x37	; 55	'7'
	.db #0x13	; 19
	.db #0x33	; 51	'3'
	.db #0x53	; 83	'S'
	.db #0x33	; 51	'3'
	.db #0x53	; 83	'S'
	.db #0x33	; 51	'3'
	.db #0x53	; 83	'S'
	.db #0x33	; 51	'3'
	.db #0x53	; 83	'S'
	.db #0x33	; 51	'3'
	.db #0x23	; 35
	.db #0x63	; 99	'c'
	.db #0x23	; 35
	.db #0x63	; 99	'c'
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x48	; 72	'H'
	.db #0xb1	; 177
	.db #0xb0	; 176
	.db #0xcc	; 204
	.db #0x58	; 88	'X'
	.db #0x66	; 102	'f'
	.db #0x2e	; 46
	.db #0x31	; 49	'1'
	.db #0x17	; 23
	.db #0x18	; 24
	.db #0x0b	; 11
	.db #0x0c	; 12
	.db #0x04	; 4
	.db #0x07	; 7
	.db #0x3e	; 62
	.db #0x3f	; 63
	.db #0x00	; 0
	.db #0x24	; 36
	.db #0x5a	; 90	'Z'
	.db #0x84	; 132
	.db #0x68	; 104	'h'
	.db #0x06	; 6
	.db #0x81	; 129
	.db #0x12	; 18
	.db #0x06	; 6
	.db #0xc9	; 201
	.db #0x87	; 135
	.db #0x60	; 96
	.db #0xc8	; 200
	.db #0x31	; 49	'1'
	.db #0x10	; 16
	.db #0xec	; 236
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x40	; 64
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0xc0	; 192
	.db #0x07	; 7
	.db #0x18	; 24
	.db #0x13	; 19
	.db #0x0c	; 12
	.db #0x00	; 0
	.db #0x0f	; 15
	.db #0x0b	; 11
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x03	; 3
	.db #0x04	; 4
	.db #0x03	; 3
	.db #0x02	; 2
	.db #0x0d	; 13
	.db #0x20	; 32
	.db #0x1e	; 30
	.db #0xc0	; 192
	.db #0x30	; 48	'0'
	.db #0x90	; 144
	.db #0x61	; 97	'a'
	.db #0x00	; 0
	.db #0xe2	; 226
	.db #0xa0	; 160
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xc0	; 192
	.db #0x00	; 0
	.db #0x30	; 48	'0'
	.db #0x60	; 96
	.db #0xe1	; 225
	.db #0x80	; 128
	.db #0x81	; 129
	.db #0x02	; 2
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x04	; 4
	.db #0x02	; 2
	.db #0x0a	; 10
	.db #0x05	; 5
	.db #0x00	; 0
	.db #0x0f	; 15
	.db #0x13	; 19
	.db #0x0c	; 12
	.db #0x82	; 130
	.db #0x4c	; 76	'L'
	.db #0x11	; 17
	.db #0x20	; 32
	.db #0x48	; 72	'H'
	.db #0x87	; 135
	.db #0x27	; 39
	.db #0x18	; 24
	.db #0x87	; 135
	.db #0x78	; 120	'x'
	.db #0x36	; 54	'6'
	.db #0xc9	; 201
	.db #0xf1	; 241
	.db #0x0f	; 15
	.db #0xb6	; 182
	.db #0x4e	; 78	'N'
	.db #0x22	; 34
	.db #0x1e	; 30
	.db #0x14	; 20
	.db #0xec	; 236
	.db #0xe8	; 232
	.db #0x18	; 24
	.db #0xd0	; 208
	.db #0x30	; 48	'0'
	.db #0x21	; 33
	.db #0xe1	; 225
	.db #0xc1	; 193
	.db #0xc1	; 193
	.db #0x39	; 57	'9'
	.db #0x39	; 57	'9'
	.db #0xd2	; 210
	.db #0xf3	; 243
	.db #0x98	; 152
	.db #0xf8	; 248
	.db #0x98	; 152
	.db #0xf8	; 248
	.db #0x98	; 152
	.db #0xf8	; 248
	.db #0xb1	; 177
	.db #0xf1	; 241
	.db #0x31	; 49	'1'
	.db #0xf1	; 241
	.db #0x61	; 97	'a'
	.db #0xe1	; 225
	.db #0x62	; 98	'b'
	.db #0xe3	; 227
	.db #0xc3	; 195
	.db #0xc3	; 195
	.db #0xbb	; 187
	.db #0xff	; 255
	.db #0xbb	; 187
	.db #0xff	; 255
	.db #0xb6	; 182
	.db #0xfe	; 254
	.db #0x76	; 118	'v'
	.db #0xfe	; 254
	.db #0x6c	; 108	'l'
	.db #0xfc	; 252
	.db #0xec	; 236
	.db #0xfc	; 252
	.db #0xd8	; 216
	.db #0xf8	; 248
	.db #0xd8	; 216
	.db #0xf8	; 248
	.db #0x05	; 5
	.db #0x07	; 7
	.db #0x05	; 5
	.db #0x07	; 7
	.db #0x05	; 5
	.db #0x07	; 7
	.db #0x05	; 5
	.db #0x07	; 7
	.db #0x05	; 5
	.db #0x07	; 7
	.db #0x05	; 5
	.db #0x07	; 7
	.db #0x05	; 5
	.db #0x07	; 7
	.db #0x03	; 3
	.db #0x05	; 5
	.db #0xf0	; 240
	.db #0x00	; 0
	.db #0xf0	; 240
	.db #0x00	; 0
	.db #0x70	; 112	'p'
	.db #0x80	; 128
	.db #0x70	; 112	'p'
	.db #0x80	; 128
	.db #0x70	; 112	'p'
	.db #0x80	; 128
	.db #0xf0	; 240
	.db #0x80	; 128
	.db #0xf0	; 240
	.db #0x80	; 128
	.db #0xf1	; 241
	.db #0x80	; 128
	.db #0x23	; 35
	.db #0x63	; 99	'c'
	.db #0xa3	; 163
	.db #0x63	; 99	'c'
	.db #0xa3	; 163
	.db #0x63	; 99	'c'
	.db #0xa3	; 163
	.db #0x63	; 99	'c'
	.db #0x43	; 67	'C'
	.db #0xc3	; 195
	.db #0x43	; 67	'C'
	.db #0xc3	; 195
	.db #0x43	; 67	'C'
	.db #0xc3	; 195
	.db #0x47	; 71	'G'
	.db #0xc7	; 199
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
_start_screen_128_x_128_offsets:
	.db #0x00	;  0
	.db #0x00	;  0
	.db #0x00	;  0
	.db #0x08	;  8
	.db #0x00	;  0
	.db #0x10	;  16
	.db #0x00	;  0
	.db #0x18	;  24
	.db #0x00	;  0
	.db #0x20	;  32
	.db #0x00	;  0
	.db #0x28	;  40
	.db #0x00	;  0
	.db #0x30	;  48	'0'
	.db #0x00	;  0
	.db #0x38	;  56	'8'
	.db #0x00	;  0
	.db #0x40	;  64
	.db #0x00	;  0
	.db #0x48	;  72	'H'
	.db #0x00	;  0
	.db #0x50	;  80	'P'
	.db #0x00	;  0
	.db #0x58	;  88	'X'
	.db #0x00	;  0
	.db #0x60	;  96
	.db #0x00	;  0
	.db #0x68	;  104	'h'
	.db #0x00	;  0
	.db #0x70	;  112	'p'
	.db #0x00	;  0
	.db #0x78	;  120	'x'
	.db #0x08	;  8
	.db #0x00	;  0
	.db #0x08	;  8
	.db #0x08	;  8
	.db #0x08	;  8
	.db #0x10	;  16
	.db #0x08	;  8
	.db #0x18	;  24
	.db #0x08	;  8
	.db #0x20	;  32
	.db #0x08	;  8
	.db #0x28	;  40
	.db #0x08	;  8
	.db #0x30	;  48	'0'
	.db #0x08	;  8
	.db #0x38	;  56	'8'
	.db #0x08	;  8
	.db #0x40	;  64
	.db #0x08	;  8
	.db #0x48	;  72	'H'
	.db #0x08	;  8
	.db #0x50	;  80	'P'
	.db #0x08	;  8
	.db #0x58	;  88	'X'
	.db #0x08	;  8
	.db #0x60	;  96
	.db #0x08	;  8
	.db #0x68	;  104	'h'
	.db #0x08	;  8
	.db #0x70	;  112	'p'
	.db #0x08	;  8
	.db #0x78	;  120	'x'
	.db #0x10	;  16
	.db #0x00	;  0
	.db #0x10	;  16
	.db #0x08	;  8
	.db #0x10	;  16
	.db #0x10	;  16
	.db #0x10	;  16
	.db #0x18	;  24
	.db #0x10	;  16
	.db #0x20	;  32
	.db #0x10	;  16
	.db #0x28	;  40
	.db #0x10	;  16
	.db #0x30	;  48	'0'
	.db #0x10	;  16
	.db #0x38	;  56	'8'
	.db #0x10	;  16
	.db #0x40	;  64
	.db #0x10	;  16
	.db #0x48	;  72	'H'
	.db #0x10	;  16
	.db #0x50	;  80	'P'
	.db #0x10	;  16
	.db #0x58	;  88	'X'
	.db #0x10	;  16
	.db #0x60	;  96
	.db #0x10	;  16
	.db #0x68	;  104	'h'
	.db #0x10	;  16
	.db #0x70	;  112	'p'
	.db #0x10	;  16
	.db #0x78	;  120	'x'
	.db #0x18	;  24
	.db #0x00	;  0
	.db #0x18	;  24
	.db #0x08	;  8
	.db #0x18	;  24
	.db #0x10	;  16
	.db #0x18	;  24
	.db #0x18	;  24
	.db #0x18	;  24
	.db #0x20	;  32
	.db #0x18	;  24
	.db #0x28	;  40
	.db #0x18	;  24
	.db #0x30	;  48	'0'
	.db #0x18	;  24
	.db #0x38	;  56	'8'
	.db #0x18	;  24
	.db #0x40	;  64
	.db #0x18	;  24
	.db #0x48	;  72	'H'
	.db #0x18	;  24
	.db #0x50	;  80	'P'
	.db #0x18	;  24
	.db #0x58	;  88	'X'
	.db #0x18	;  24
	.db #0x60	;  96
	.db #0x18	;  24
	.db #0x68	;  104	'h'
	.db #0x18	;  24
	.db #0x70	;  112	'p'
	.db #0x18	;  24
	.db #0x78	;  120	'x'
	.db #0x20	;  32
	.db #0x00	;  0
	.db #0x20	;  32
	.db #0x08	;  8
	.db #0x20	;  32
	.db #0x10	;  16
	.db #0x20	;  32
	.db #0x18	;  24
	.db #0x20	;  32
	.db #0x20	;  32
	.db #0x20	;  32
	.db #0x28	;  40
	.db #0x20	;  32
	.db #0x30	;  48	'0'
	.db #0x20	;  32
	.db #0x38	;  56	'8'
	.db #0x20	;  32
	.db #0x40	;  64
	.db #0x20	;  32
	.db #0x48	;  72	'H'
	.db #0x20	;  32
	.db #0x50	;  80	'P'
	.db #0x20	;  32
	.db #0x58	;  88	'X'
	.db #0x20	;  32
	.db #0x60	;  96
	.db #0x20	;  32
	.db #0x68	;  104	'h'
	.db #0x20	;  32
	.db #0x70	;  112	'p'
	.db #0x20	;  32
	.db #0x78	;  120	'x'
	.db #0x28	;  40
	.db #0x00	;  0
	.db #0x28	;  40
	.db #0x08	;  8
	.db #0x28	;  40
	.db #0x10	;  16
	.db #0x28	;  40
	.db #0x18	;  24
	.db #0x28	;  40
	.db #0x20	;  32
	.db #0x28	;  40
	.db #0x28	;  40
	.db #0x28	;  40
	.db #0x30	;  48	'0'
	.db #0x28	;  40
	.db #0x38	;  56	'8'
	.db #0x28	;  40
	.db #0x40	;  64
	.db #0x28	;  40
	.db #0x48	;  72	'H'
	.db #0x28	;  40
	.db #0x50	;  80	'P'
	.db #0x28	;  40
	.db #0x58	;  88	'X'
	.db #0x28	;  40
	.db #0x60	;  96
	.db #0x28	;  40
	.db #0x68	;  104	'h'
	.db #0x28	;  40
	.db #0x70	;  112	'p'
	.db #0x28	;  40
	.db #0x78	;  120	'x'
	.db #0x30	;  48	'0'
	.db #0x00	;  0
	.db #0x30	;  48	'0'
	.db #0x08	;  8
	.db #0x30	;  48	'0'
	.db #0x10	;  16
	.db #0x30	;  48	'0'
	.db #0x18	;  24
	.db #0x30	;  48	'0'
	.db #0x20	;  32
	.db #0x30	;  48	'0'
	.db #0x28	;  40
	.db #0x30	;  48	'0'
	.db #0x30	;  48	'0'
	.db #0x30	;  48	'0'
	.db #0x38	;  56	'8'
	.db #0x30	;  48	'0'
	.db #0x40	;  64
	.db #0x30	;  48	'0'
	.db #0x48	;  72	'H'
	.db #0x30	;  48	'0'
	.db #0x50	;  80	'P'
	.db #0x30	;  48	'0'
	.db #0x58	;  88	'X'
	.db #0x30	;  48	'0'
	.db #0x60	;  96
	.db #0x30	;  48	'0'
	.db #0x68	;  104	'h'
	.db #0x30	;  48	'0'
	.db #0x70	;  112	'p'
	.db #0x30	;  48	'0'
	.db #0x78	;  120	'x'
	.db #0x38	;  56	'8'
	.db #0x00	;  0
	.db #0x38	;  56	'8'
	.db #0x08	;  8
	.db #0x38	;  56	'8'
	.db #0x10	;  16
	.db #0x38	;  56	'8'
	.db #0x18	;  24
	.db #0x38	;  56	'8'
	.db #0x20	;  32
	.db #0x38	;  56	'8'
	.db #0x28	;  40
	.db #0x38	;  56	'8'
	.db #0x30	;  48	'0'
	.db #0x38	;  56	'8'
	.db #0x38	;  56	'8'
	.db #0x38	;  56	'8'
	.db #0x40	;  64
	.db #0x38	;  56	'8'
	.db #0x48	;  72	'H'
	.db #0x38	;  56	'8'
	.db #0x50	;  80	'P'
	.db #0x38	;  56	'8'
	.db #0x58	;  88	'X'
	.db #0x38	;  56	'8'
	.db #0x60	;  96
	.db #0x38	;  56	'8'
	.db #0x68	;  104	'h'
	.db #0x38	;  56	'8'
	.db #0x70	;  112	'p'
	.db #0x38	;  56	'8'
	.db #0x78	;  120	'x'
	.db #0x40	;  64
	.db #0x00	;  0
	.db #0x40	;  64
	.db #0x08	;  8
	.db #0x40	;  64
	.db #0x10	;  16
	.db #0x40	;  64
	.db #0x18	;  24
	.db #0x40	;  64
	.db #0x20	;  32
	.db #0x40	;  64
	.db #0x28	;  40
	.db #0x40	;  64
	.db #0x30	;  48	'0'
	.db #0x40	;  64
	.db #0x38	;  56	'8'
	.db #0x40	;  64
	.db #0x40	;  64
	.db #0x40	;  64
	.db #0x48	;  72	'H'
	.db #0x40	;  64
	.db #0x50	;  80	'P'
	.db #0x40	;  64
	.db #0x58	;  88	'X'
	.db #0x40	;  64
	.db #0x60	;  96
	.db #0x40	;  64
	.db #0x68	;  104	'h'
	.db #0x40	;  64
	.db #0x70	;  112	'p'
	.db #0x40	;  64
	.db #0x78	;  120	'x'
	.db #0x48	;  72	'H'
	.db #0x00	;  0
	.db #0x48	;  72	'H'
	.db #0x08	;  8
	.db #0x48	;  72	'H'
	.db #0x10	;  16
	.db #0x48	;  72	'H'
	.db #0x18	;  24
	.db #0x48	;  72	'H'
	.db #0x20	;  32
	.db #0x48	;  72	'H'
	.db #0x28	;  40
	.db #0x48	;  72	'H'
	.db #0x30	;  48	'0'
	.db #0x48	;  72	'H'
	.db #0x38	;  56	'8'
	.db #0x48	;  72	'H'
	.db #0x40	;  64
	.db #0x48	;  72	'H'
	.db #0x48	;  72	'H'
	.db #0x48	;  72	'H'
	.db #0x50	;  80	'P'
	.db #0x48	;  72	'H'
	.db #0x58	;  88	'X'
	.db #0x48	;  72	'H'
	.db #0x60	;  96
	.db #0x48	;  72	'H'
	.db #0x68	;  104	'h'
	.db #0x48	;  72	'H'
	.db #0x70	;  112	'p'
	.db #0x48	;  72	'H'
	.db #0x78	;  120	'x'
	.db #0x50	;  80	'P'
	.db #0x00	;  0
	.db #0x50	;  80	'P'
	.db #0x08	;  8
	.db #0x50	;  80	'P'
	.db #0x10	;  16
	.db #0x50	;  80	'P'
	.db #0x18	;  24
	.db #0x50	;  80	'P'
	.db #0x20	;  32
	.db #0x50	;  80	'P'
	.db #0x28	;  40
	.db #0x50	;  80	'P'
	.db #0x30	;  48	'0'
	.db #0x50	;  80	'P'
	.db #0x38	;  56	'8'
	.db #0x50	;  80	'P'
	.db #0x40	;  64
	.db #0x50	;  80	'P'
	.db #0x48	;  72	'H'
	.db #0x50	;  80	'P'
	.db #0x50	;  80	'P'
	.db #0x50	;  80	'P'
	.db #0x58	;  88	'X'
	.db #0x50	;  80	'P'
	.db #0x60	;  96
	.db #0x50	;  80	'P'
	.db #0x68	;  104	'h'
	.db #0x50	;  80	'P'
	.db #0x70	;  112	'p'
	.db #0x50	;  80	'P'
	.db #0x78	;  120	'x'
	.db #0x58	;  88	'X'
	.db #0x00	;  0
	.db #0x58	;  88	'X'
	.db #0x08	;  8
	.db #0x58	;  88	'X'
	.db #0x10	;  16
	.db #0x58	;  88	'X'
	.db #0x18	;  24
	.db #0x58	;  88	'X'
	.db #0x20	;  32
	.db #0x58	;  88	'X'
	.db #0x28	;  40
	.db #0x58	;  88	'X'
	.db #0x30	;  48	'0'
	.db #0x58	;  88	'X'
	.db #0x38	;  56	'8'
	.db #0x58	;  88	'X'
	.db #0x40	;  64
	.db #0x58	;  88	'X'
	.db #0x48	;  72	'H'
	.db #0x58	;  88	'X'
	.db #0x50	;  80	'P'
	.db #0x58	;  88	'X'
	.db #0x58	;  88	'X'
	.db #0x58	;  88	'X'
	.db #0x60	;  96
	.db #0x58	;  88	'X'
	.db #0x68	;  104	'h'
	.db #0x58	;  88	'X'
	.db #0x70	;  112	'p'
	.db #0x58	;  88	'X'
	.db #0x78	;  120	'x'
	.db #0x60	;  96
	.db #0x00	;  0
	.db #0x60	;  96
	.db #0x08	;  8
	.db #0x60	;  96
	.db #0x10	;  16
	.db #0x60	;  96
	.db #0x18	;  24
	.db #0x60	;  96
	.db #0x20	;  32
	.db #0x60	;  96
	.db #0x28	;  40
	.db #0x60	;  96
	.db #0x30	;  48	'0'
	.db #0x60	;  96
	.db #0x38	;  56	'8'
	.db #0x60	;  96
	.db #0x40	;  64
	.db #0x60	;  96
	.db #0x48	;  72	'H'
	.db #0x60	;  96
	.db #0x50	;  80	'P'
	.db #0x60	;  96
	.db #0x58	;  88	'X'
	.db #0x60	;  96
	.db #0x60	;  96
	.db #0x60	;  96
	.db #0x68	;  104	'h'
	.db #0x60	;  96
	.db #0x70	;  112	'p'
	.db #0x60	;  96
	.db #0x78	;  120	'x'
	.db #0x68	;  104	'h'
	.db #0x00	;  0
	.db #0x68	;  104	'h'
	.db #0x08	;  8
	.db #0x68	;  104	'h'
	.db #0x10	;  16
	.db #0x68	;  104	'h'
	.db #0x18	;  24
	.db #0x68	;  104	'h'
	.db #0x20	;  32
	.db #0x68	;  104	'h'
	.db #0x28	;  40
	.db #0x68	;  104	'h'
	.db #0x30	;  48	'0'
	.db #0x68	;  104	'h'
	.db #0x38	;  56	'8'
	.db #0x68	;  104	'h'
	.db #0x40	;  64
	.db #0x68	;  104	'h'
	.db #0x48	;  72	'H'
	.db #0x68	;  104	'h'
	.db #0x50	;  80	'P'
	.db #0x68	;  104	'h'
	.db #0x58	;  88	'X'
	.db #0x68	;  104	'h'
	.db #0x60	;  96
	.db #0x68	;  104	'h'
	.db #0x68	;  104	'h'
	.db #0x68	;  104	'h'
	.db #0x70	;  112	'p'
	.db #0x68	;  104	'h'
	.db #0x78	;  120	'x'
	.db #0x70	;  112	'p'
	.db #0x00	;  0
	.db #0x70	;  112	'p'
	.db #0x08	;  8
	.db #0x70	;  112	'p'
	.db #0x10	;  16
	.db #0x70	;  112	'p'
	.db #0x18	;  24
	.db #0x70	;  112	'p'
	.db #0x20	;  32
	.db #0x70	;  112	'p'
	.db #0x28	;  40
	.db #0x70	;  112	'p'
	.db #0x30	;  48	'0'
	.db #0x70	;  112	'p'
	.db #0x38	;  56	'8'
	.db #0x70	;  112	'p'
	.db #0x40	;  64
	.db #0x70	;  112	'p'
	.db #0x48	;  72	'H'
	.db #0x70	;  112	'p'
	.db #0x50	;  80	'P'
	.db #0x70	;  112	'p'
	.db #0x58	;  88	'X'
	.db #0x70	;  112	'p'
	.db #0x60	;  96
	.db #0x70	;  112	'p'
	.db #0x68	;  104	'h'
	.db #0x70	;  112	'p'
	.db #0x70	;  112	'p'
	.db #0x70	;  112	'p'
	.db #0x78	;  120	'x'
	.db #0x78	;  120	'x'
	.db #0x00	;  0
	.db #0x78	;  120	'x'
	.db #0x08	;  8
	.db #0x78	;  120	'x'
	.db #0x10	;  16
	.db #0x78	;  120	'x'
	.db #0x18	;  24
	.db #0x78	;  120	'x'
	.db #0x20	;  32
	.db #0x78	;  120	'x'
	.db #0x28	;  40
	.db #0x78	;  120	'x'
	.db #0x30	;  48	'0'
	.db #0x78	;  120	'x'
	.db #0x38	;  56	'8'
	.db #0x78	;  120	'x'
	.db #0x40	;  64
	.db #0x78	;  120	'x'
	.db #0x48	;  72	'H'
	.db #0x78	;  120	'x'
	.db #0x50	;  80	'P'
	.db #0x78	;  120	'x'
	.db #0x58	;  88	'X'
	.db #0x78	;  120	'x'
	.db #0x60	;  96
	.db #0x78	;  120	'x'
	.db #0x68	;  104	'h'
	.db #0x78	;  120	'x'
	.db #0x70	;  112	'p'
	.db #0x78	;  120	'x'
	.db #0x78	;  120	'x'
_start_full_screen_offsets:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x08	; 8
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0x00	; 0
	.db #0x18	; 24
	.db #0x00	; 0
	.db #0x20	; 32
	.db #0x00	; 0
	.db #0x28	; 40
	.db #0x00	; 0
	.db #0x30	; 48	'0'
	.db #0x00	; 0
	.db #0x38	; 56	'8'
	.db #0x00	; 0
	.db #0x40	; 64
	.db #0x00	; 0
	.db #0x48	; 72	'H'
	.db #0x00	; 0
	.db #0x50	; 80	'P'
	.db #0x00	; 0
	.db #0x58	; 88	'X'
	.db #0x00	; 0
	.db #0x60	; 96
	.db #0x00	; 0
	.db #0x68	; 104	'h'
	.db #0x00	; 0
	.db #0x70	; 112	'p'
	.db #0x00	; 0
	.db #0x78	; 120	'x'
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x88	; 136
	.db #0x00	; 0
	.db #0x90	; 144
	.db #0x00	; 0
	.db #0x98	; 152
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x10	; 16
	.db #0x08	; 8
	.db #0x18	; 24
	.db #0x08	; 8
	.db #0x20	; 32
	.db #0x08	; 8
	.db #0x28	; 40
	.db #0x08	; 8
	.db #0x30	; 48	'0'
	.db #0x08	; 8
	.db #0x38	; 56	'8'
	.db #0x08	; 8
	.db #0x40	; 64
	.db #0x08	; 8
	.db #0x48	; 72	'H'
	.db #0x08	; 8
	.db #0x50	; 80	'P'
	.db #0x08	; 8
	.db #0x58	; 88	'X'
	.db #0x08	; 8
	.db #0x60	; 96
	.db #0x08	; 8
	.db #0x68	; 104	'h'
	.db #0x08	; 8
	.db #0x70	; 112	'p'
	.db #0x08	; 8
	.db #0x78	; 120	'x'
	.db #0x08	; 8
	.db #0x80	; 128
	.db #0x08	; 8
	.db #0x88	; 136
	.db #0x08	; 8
	.db #0x90	; 144
	.db #0x08	; 8
	.db #0x98	; 152
	.db #0x08	; 8
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0x08	; 8
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x18	; 24
	.db #0x10	; 16
	.db #0x20	; 32
	.db #0x10	; 16
	.db #0x28	; 40
	.db #0x10	; 16
	.db #0x30	; 48	'0'
	.db #0x10	; 16
	.db #0x38	; 56	'8'
	.db #0x10	; 16
	.db #0x40	; 64
	.db #0x10	; 16
	.db #0x48	; 72	'H'
	.db #0x10	; 16
	.db #0x50	; 80	'P'
	.db #0x10	; 16
	.db #0x58	; 88	'X'
	.db #0x10	; 16
	.db #0x60	; 96
	.db #0x10	; 16
	.db #0x68	; 104	'h'
	.db #0x10	; 16
	.db #0x70	; 112	'p'
	.db #0x10	; 16
	.db #0x78	; 120	'x'
	.db #0x10	; 16
	.db #0x80	; 128
	.db #0x10	; 16
	.db #0x88	; 136
	.db #0x10	; 16
	.db #0x90	; 144
	.db #0x10	; 16
	.db #0x98	; 152
	.db #0x10	; 16
	.db #0x00	; 0
	.db #0x18	; 24
	.db #0x08	; 8
	.db #0x18	; 24
	.db #0x10	; 16
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x20	; 32
	.db #0x18	; 24
	.db #0x28	; 40
	.db #0x18	; 24
	.db #0x30	; 48	'0'
	.db #0x18	; 24
	.db #0x38	; 56	'8'
	.db #0x18	; 24
	.db #0x40	; 64
	.db #0x18	; 24
	.db #0x48	; 72	'H'
	.db #0x18	; 24
	.db #0x50	; 80	'P'
	.db #0x18	; 24
	.db #0x58	; 88	'X'
	.db #0x18	; 24
	.db #0x60	; 96
	.db #0x18	; 24
	.db #0x68	; 104	'h'
	.db #0x18	; 24
	.db #0x70	; 112	'p'
	.db #0x18	; 24
	.db #0x78	; 120	'x'
	.db #0x18	; 24
	.db #0x80	; 128
	.db #0x18	; 24
	.db #0x88	; 136
	.db #0x18	; 24
	.db #0x90	; 144
	.db #0x18	; 24
	.db #0x98	; 152
	.db #0x18	; 24
	.db #0x00	; 0
	.db #0x20	; 32
	.db #0x08	; 8
	.db #0x20	; 32
	.db #0x10	; 16
	.db #0x20	; 32
	.db #0x18	; 24
	.db #0x20	; 32
	.db #0x20	; 32
	.db #0x20	; 32
	.db #0x28	; 40
	.db #0x20	; 32
	.db #0x30	; 48	'0'
	.db #0x20	; 32
	.db #0x38	; 56	'8'
	.db #0x20	; 32
	.db #0x40	; 64
	.db #0x20	; 32
	.db #0x48	; 72	'H'
	.db #0x20	; 32
	.db #0x50	; 80	'P'
	.db #0x20	; 32
	.db #0x58	; 88	'X'
	.db #0x20	; 32
	.db #0x60	; 96
	.db #0x20	; 32
	.db #0x68	; 104	'h'
	.db #0x20	; 32
	.db #0x70	; 112	'p'
	.db #0x20	; 32
	.db #0x78	; 120	'x'
	.db #0x20	; 32
	.db #0x80	; 128
	.db #0x20	; 32
	.db #0x88	; 136
	.db #0x20	; 32
	.db #0x90	; 144
	.db #0x20	; 32
	.db #0x98	; 152
	.db #0x20	; 32
	.db #0x00	; 0
	.db #0x28	; 40
	.db #0x08	; 8
	.db #0x28	; 40
	.db #0x10	; 16
	.db #0x28	; 40
	.db #0x18	; 24
	.db #0x28	; 40
	.db #0x20	; 32
	.db #0x28	; 40
	.db #0x28	; 40
	.db #0x28	; 40
	.db #0x30	; 48	'0'
	.db #0x28	; 40
	.db #0x38	; 56	'8'
	.db #0x28	; 40
	.db #0x40	; 64
	.db #0x28	; 40
	.db #0x48	; 72	'H'
	.db #0x28	; 40
	.db #0x50	; 80	'P'
	.db #0x28	; 40
	.db #0x58	; 88	'X'
	.db #0x28	; 40
	.db #0x60	; 96
	.db #0x28	; 40
	.db #0x68	; 104	'h'
	.db #0x28	; 40
	.db #0x70	; 112	'p'
	.db #0x28	; 40
	.db #0x78	; 120	'x'
	.db #0x28	; 40
	.db #0x80	; 128
	.db #0x28	; 40
	.db #0x88	; 136
	.db #0x28	; 40
	.db #0x90	; 144
	.db #0x28	; 40
	.db #0x98	; 152
	.db #0x28	; 40
	.db #0x00	; 0
	.db #0x30	; 48	'0'
	.db #0x08	; 8
	.db #0x30	; 48	'0'
	.db #0x10	; 16
	.db #0x30	; 48	'0'
	.db #0x18	; 24
	.db #0x30	; 48	'0'
	.db #0x20	; 32
	.db #0x30	; 48	'0'
	.db #0x28	; 40
	.db #0x30	; 48	'0'
	.db #0x30	; 48	'0'
	.db #0x30	; 48	'0'
	.db #0x38	; 56	'8'
	.db #0x30	; 48	'0'
	.db #0x40	; 64
	.db #0x30	; 48	'0'
	.db #0x48	; 72	'H'
	.db #0x30	; 48	'0'
	.db #0x50	; 80	'P'
	.db #0x30	; 48	'0'
	.db #0x58	; 88	'X'
	.db #0x30	; 48	'0'
	.db #0x60	; 96
	.db #0x30	; 48	'0'
	.db #0x68	; 104	'h'
	.db #0x30	; 48	'0'
	.db #0x70	; 112	'p'
	.db #0x30	; 48	'0'
	.db #0x78	; 120	'x'
	.db #0x30	; 48	'0'
	.db #0x80	; 128
	.db #0x30	; 48	'0'
	.db #0x88	; 136
	.db #0x30	; 48	'0'
	.db #0x90	; 144
	.db #0x30	; 48	'0'
	.db #0x98	; 152
	.db #0x30	; 48	'0'
	.db #0x00	; 0
	.db #0x38	; 56	'8'
	.db #0x08	; 8
	.db #0x38	; 56	'8'
	.db #0x10	; 16
	.db #0x38	; 56	'8'
	.db #0x18	; 24
	.db #0x38	; 56	'8'
	.db #0x20	; 32
	.db #0x38	; 56	'8'
	.db #0x28	; 40
	.db #0x38	; 56	'8'
	.db #0x30	; 48	'0'
	.db #0x38	; 56	'8'
	.db #0x38	; 56	'8'
	.db #0x38	; 56	'8'
	.db #0x40	; 64
	.db #0x38	; 56	'8'
	.db #0x48	; 72	'H'
	.db #0x38	; 56	'8'
	.db #0x50	; 80	'P'
	.db #0x38	; 56	'8'
	.db #0x58	; 88	'X'
	.db #0x38	; 56	'8'
	.db #0x60	; 96
	.db #0x38	; 56	'8'
	.db #0x68	; 104	'h'
	.db #0x38	; 56	'8'
	.db #0x70	; 112	'p'
	.db #0x38	; 56	'8'
	.db #0x78	; 120	'x'
	.db #0x38	; 56	'8'
	.db #0x80	; 128
	.db #0x38	; 56	'8'
	.db #0x88	; 136
	.db #0x38	; 56	'8'
	.db #0x90	; 144
	.db #0x38	; 56	'8'
	.db #0x98	; 152
	.db #0x38	; 56	'8'
	.db #0x00	; 0
	.db #0x40	; 64
	.db #0x08	; 8
	.db #0x40	; 64
	.db #0x10	; 16
	.db #0x40	; 64
	.db #0x18	; 24
	.db #0x40	; 64
	.db #0x20	; 32
	.db #0x40	; 64
	.db #0x28	; 40
	.db #0x40	; 64
	.db #0x30	; 48	'0'
	.db #0x40	; 64
	.db #0x38	; 56	'8'
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x48	; 72	'H'
	.db #0x40	; 64
	.db #0x50	; 80	'P'
	.db #0x40	; 64
	.db #0x58	; 88	'X'
	.db #0x40	; 64
	.db #0x60	; 96
	.db #0x40	; 64
	.db #0x68	; 104	'h'
	.db #0x40	; 64
	.db #0x70	; 112	'p'
	.db #0x40	; 64
	.db #0x78	; 120	'x'
	.db #0x40	; 64
	.db #0x80	; 128
	.db #0x40	; 64
	.db #0x88	; 136
	.db #0x40	; 64
	.db #0x90	; 144
	.db #0x40	; 64
	.db #0x98	; 152
	.db #0x40	; 64
	.db #0x00	; 0
	.db #0x48	; 72	'H'
	.db #0x08	; 8
	.db #0x48	; 72	'H'
	.db #0x10	; 16
	.db #0x48	; 72	'H'
	.db #0x18	; 24
	.db #0x48	; 72	'H'
	.db #0x20	; 32
	.db #0x48	; 72	'H'
	.db #0x28	; 40
	.db #0x48	; 72	'H'
	.db #0x30	; 48	'0'
	.db #0x48	; 72	'H'
	.db #0x38	; 56	'8'
	.db #0x48	; 72	'H'
	.db #0x40	; 64
	.db #0x48	; 72	'H'
	.db #0x48	; 72	'H'
	.db #0x48	; 72	'H'
	.db #0x50	; 80	'P'
	.db #0x48	; 72	'H'
	.db #0x58	; 88	'X'
	.db #0x48	; 72	'H'
	.db #0x60	; 96
	.db #0x48	; 72	'H'
	.db #0x68	; 104	'h'
	.db #0x48	; 72	'H'
	.db #0x70	; 112	'p'
	.db #0x48	; 72	'H'
	.db #0x78	; 120	'x'
	.db #0x48	; 72	'H'
	.db #0x80	; 128
	.db #0x48	; 72	'H'
	.db #0x88	; 136
	.db #0x48	; 72	'H'
	.db #0x90	; 144
	.db #0x48	; 72	'H'
	.db #0x98	; 152
	.db #0x48	; 72	'H'
	.db #0x00	; 0
	.db #0x50	; 80	'P'
	.db #0x08	; 8
	.db #0x50	; 80	'P'
	.db #0x10	; 16
	.db #0x50	; 80	'P'
	.db #0x18	; 24
	.db #0x50	; 80	'P'
	.db #0x20	; 32
	.db #0x50	; 80	'P'
	.db #0x28	; 40
	.db #0x50	; 80	'P'
	.db #0x30	; 48	'0'
	.db #0x50	; 80	'P'
	.db #0x38	; 56	'8'
	.db #0x50	; 80	'P'
	.db #0x40	; 64
	.db #0x50	; 80	'P'
	.db #0x48	; 72	'H'
	.db #0x50	; 80	'P'
	.db #0x50	; 80	'P'
	.db #0x50	; 80	'P'
	.db #0x58	; 88	'X'
	.db #0x50	; 80	'P'
	.db #0x60	; 96
	.db #0x50	; 80	'P'
	.db #0x68	; 104	'h'
	.db #0x50	; 80	'P'
	.db #0x70	; 112	'p'
	.db #0x50	; 80	'P'
	.db #0x78	; 120	'x'
	.db #0x50	; 80	'P'
	.db #0x80	; 128
	.db #0x50	; 80	'P'
	.db #0x88	; 136
	.db #0x50	; 80	'P'
	.db #0x90	; 144
	.db #0x50	; 80	'P'
	.db #0x98	; 152
	.db #0x50	; 80	'P'
	.db #0x00	; 0
	.db #0x58	; 88	'X'
	.db #0x08	; 8
	.db #0x58	; 88	'X'
	.db #0x10	; 16
	.db #0x58	; 88	'X'
	.db #0x18	; 24
	.db #0x58	; 88	'X'
	.db #0x20	; 32
	.db #0x58	; 88	'X'
	.db #0x28	; 40
	.db #0x58	; 88	'X'
	.db #0x30	; 48	'0'
	.db #0x58	; 88	'X'
	.db #0x38	; 56	'8'
	.db #0x58	; 88	'X'
	.db #0x40	; 64
	.db #0x58	; 88	'X'
	.db #0x48	; 72	'H'
	.db #0x58	; 88	'X'
	.db #0x50	; 80	'P'
	.db #0x58	; 88	'X'
	.db #0x58	; 88	'X'
	.db #0x58	; 88	'X'
	.db #0x60	; 96
	.db #0x58	; 88	'X'
	.db #0x68	; 104	'h'
	.db #0x58	; 88	'X'
	.db #0x70	; 112	'p'
	.db #0x58	; 88	'X'
	.db #0x78	; 120	'x'
	.db #0x58	; 88	'X'
	.db #0x80	; 128
	.db #0x58	; 88	'X'
	.db #0x88	; 136
	.db #0x58	; 88	'X'
	.db #0x90	; 144
	.db #0x58	; 88	'X'
	.db #0x98	; 152
	.db #0x58	; 88	'X'
	.db #0x00	; 0
	.db #0x60	; 96
	.db #0x08	; 8
	.db #0x60	; 96
	.db #0x10	; 16
	.db #0x60	; 96
	.db #0x18	; 24
	.db #0x60	; 96
	.db #0x20	; 32
	.db #0x60	; 96
	.db #0x28	; 40
	.db #0x60	; 96
	.db #0x30	; 48	'0'
	.db #0x60	; 96
	.db #0x38	; 56	'8'
	.db #0x60	; 96
	.db #0x40	; 64
	.db #0x60	; 96
	.db #0x48	; 72	'H'
	.db #0x60	; 96
	.db #0x50	; 80	'P'
	.db #0x60	; 96
	.db #0x58	; 88	'X'
	.db #0x60	; 96
	.db #0x60	; 96
	.db #0x60	; 96
	.db #0x68	; 104	'h'
	.db #0x60	; 96
	.db #0x70	; 112	'p'
	.db #0x60	; 96
	.db #0x78	; 120	'x'
	.db #0x60	; 96
	.db #0x80	; 128
	.db #0x60	; 96
	.db #0x88	; 136
	.db #0x60	; 96
	.db #0x90	; 144
	.db #0x60	; 96
	.db #0x98	; 152
	.db #0x60	; 96
	.db #0x00	; 0
	.db #0x68	; 104	'h'
	.db #0x08	; 8
	.db #0x68	; 104	'h'
	.db #0x10	; 16
	.db #0x68	; 104	'h'
	.db #0x18	; 24
	.db #0x68	; 104	'h'
	.db #0x20	; 32
	.db #0x68	; 104	'h'
	.db #0x28	; 40
	.db #0x68	; 104	'h'
	.db #0x30	; 48	'0'
	.db #0x68	; 104	'h'
	.db #0x38	; 56	'8'
	.db #0x68	; 104	'h'
	.db #0x40	; 64
	.db #0x68	; 104	'h'
	.db #0x48	; 72	'H'
	.db #0x68	; 104	'h'
	.db #0x50	; 80	'P'
	.db #0x68	; 104	'h'
	.db #0x58	; 88	'X'
	.db #0x68	; 104	'h'
	.db #0x60	; 96
	.db #0x68	; 104	'h'
	.db #0x68	; 104	'h'
	.db #0x68	; 104	'h'
	.db #0x70	; 112	'p'
	.db #0x68	; 104	'h'
	.db #0x78	; 120	'x'
	.db #0x68	; 104	'h'
	.db #0x80	; 128
	.db #0x68	; 104	'h'
	.db #0x88	; 136
	.db #0x68	; 104	'h'
	.db #0x90	; 144
	.db #0x68	; 104	'h'
	.db #0x98	; 152
	.db #0x68	; 104	'h'
	.db #0x00	; 0
	.db #0x70	; 112	'p'
	.db #0x08	; 8
	.db #0x70	; 112	'p'
	.db #0x10	; 16
	.db #0x70	; 112	'p'
	.db #0x18	; 24
	.db #0x70	; 112	'p'
	.db #0x20	; 32
	.db #0x70	; 112	'p'
	.db #0x28	; 40
	.db #0x70	; 112	'p'
	.db #0x30	; 48	'0'
	.db #0x70	; 112	'p'
	.db #0x38	; 56	'8'
	.db #0x70	; 112	'p'
	.db #0x40	; 64
	.db #0x70	; 112	'p'
	.db #0x48	; 72	'H'
	.db #0x70	; 112	'p'
	.db #0x50	; 80	'P'
	.db #0x70	; 112	'p'
	.db #0x58	; 88	'X'
	.db #0x70	; 112	'p'
	.db #0x60	; 96
	.db #0x70	; 112	'p'
	.db #0x68	; 104	'h'
	.db #0x70	; 112	'p'
	.db #0x70	; 112	'p'
	.db #0x70	; 112	'p'
	.db #0x78	; 120	'x'
	.db #0x70	; 112	'p'
	.db #0x80	; 128
	.db #0x70	; 112	'p'
	.db #0x88	; 136
	.db #0x70	; 112	'p'
	.db #0x90	; 144
	.db #0x70	; 112	'p'
	.db #0x98	; 152
	.db #0x70	; 112	'p'
	.db #0x00	; 0
	.db #0x78	; 120	'x'
	.db #0x08	; 8
	.db #0x78	; 120	'x'
	.db #0x10	; 16
	.db #0x78	; 120	'x'
	.db #0x18	; 24
	.db #0x78	; 120	'x'
	.db #0x20	; 32
	.db #0x78	; 120	'x'
	.db #0x28	; 40
	.db #0x78	; 120	'x'
	.db #0x30	; 48	'0'
	.db #0x78	; 120	'x'
	.db #0x38	; 56	'8'
	.db #0x78	; 120	'x'
	.db #0x40	; 64
	.db #0x78	; 120	'x'
	.db #0x48	; 72	'H'
	.db #0x78	; 120	'x'
	.db #0x50	; 80	'P'
	.db #0x78	; 120	'x'
	.db #0x58	; 88	'X'
	.db #0x78	; 120	'x'
	.db #0x60	; 96
	.db #0x78	; 120	'x'
	.db #0x68	; 104	'h'
	.db #0x78	; 120	'x'
	.db #0x70	; 112	'p'
	.db #0x78	; 120	'x'
	.db #0x78	; 120	'x'
	.db #0x78	; 120	'x'
	.db #0x80	; 128
	.db #0x78	; 120	'x'
	.db #0x88	; 136
	.db #0x78	; 120	'x'
	.db #0x90	; 144
	.db #0x78	; 120	'x'
	.db #0x98	; 152
	.db #0x78	; 120	'x'
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x08	; 8
	.db #0x80	; 128
	.db #0x10	; 16
	.db #0x80	; 128
	.db #0x18	; 24
	.db #0x80	; 128
	.db #0x20	; 32
	.db #0x80	; 128
	.db #0x28	; 40
	.db #0x80	; 128
	.db #0x30	; 48	'0'
	.db #0x80	; 128
	.db #0x38	; 56	'8'
	.db #0x80	; 128
	.db #0x40	; 64
	.db #0x80	; 128
	.db #0x48	; 72	'H'
	.db #0x80	; 128
	.db #0x50	; 80	'P'
	.db #0x80	; 128
	.db #0x58	; 88	'X'
	.db #0x80	; 128
	.db #0x60	; 96
	.db #0x80	; 128
	.db #0x68	; 104	'h'
	.db #0x80	; 128
	.db #0x70	; 112	'p'
	.db #0x80	; 128
	.db #0x78	; 120	'x'
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x88	; 136
	.db #0x80	; 128
	.db #0x90	; 144
	.db #0x80	; 128
	.db #0x98	; 152
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x88	; 136
	.db #0x08	; 8
	.db #0x88	; 136
	.db #0x10	; 16
	.db #0x88	; 136
	.db #0x18	; 24
	.db #0x88	; 136
	.db #0x20	; 32
	.db #0x88	; 136
	.db #0x28	; 40
	.db #0x88	; 136
	.db #0x30	; 48	'0'
	.db #0x88	; 136
	.db #0x38	; 56	'8'
	.db #0x88	; 136
	.db #0x40	; 64
	.db #0x88	; 136
	.db #0x48	; 72	'H'
	.db #0x88	; 136
	.db #0x50	; 80	'P'
	.db #0x88	; 136
	.db #0x58	; 88	'X'
	.db #0x88	; 136
	.db #0x60	; 96
	.db #0x88	; 136
	.db #0x68	; 104	'h'
	.db #0x88	; 136
	.db #0x70	; 112	'p'
	.db #0x88	; 136
	.db #0x78	; 120	'x'
	.db #0x88	; 136
	.db #0x80	; 128
	.db #0x88	; 136
	.db #0x88	; 136
	.db #0x88	; 136
	.db #0x90	; 144
	.db #0x88	; 136
	.db #0x98	; 152
	.db #0x88	; 136
_press_start_tiles:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xf3	; 243
	.db #0x00	; 0
	.db #0xfb	; 251
	.db #0x00	; 0
	.db #0x1b	; 27
	.db #0x00	; 0
	.db #0x1b	; 27
	.db #0x00	; 0
	.db #0x1b	; 27
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xf1	; 241
	.db #0x00	; 0
	.db #0xf9	; 249
	.db #0x00	; 0
	.db #0x19	; 25
	.db #0x00	; 0
	.db #0x19	; 25
	.db #0x00	; 0
	.db #0xf1	; 241
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xf8	; 248
	.db #0x00	; 0
	.db #0xf9	; 249
	.db #0x00	; 0
	.db #0x81	; 129
	.db #0x00	; 0
	.db #0x81	; 129
	.db #0x00	; 0
	.db #0xf1	; 241
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xf1	; 241
	.db #0x00	; 0
	.db #0xfb	; 251
	.db #0x00	; 0
	.db #0x8b	; 139
	.db #0x00	; 0
	.db #0x83	; 131
	.db #0x00	; 0
	.db #0xf3	; 243
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xe0	; 224
	.db #0x00	; 0
	.db #0xf0	; 240
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xe0	; 224
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x1e	; 30
	.db #0x00	; 0
	.db #0x3f	; 63
	.db #0x00	; 0
	.db #0x31	; 49	'1'
	.db #0x00	; 0
	.db #0x30	; 48	'0'
	.db #0x00	; 0
	.db #0x3e	; 62
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x18	; 24
	.db #0x00	; 0
	.db #0x18	; 24
	.db #0x00	; 0
	.db #0x18	; 24
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x0c	; 12
	.db #0x00	; 0
	.db #0x1e	; 30
	.db #0x00	; 0
	.db #0x1e	; 30
	.db #0x00	; 0
	.db #0x33	; 51	'3'
	.db #0x00	; 0
	.db #0x33	; 51	'3'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x1f	; 31
	.db #0x00	; 0
	.db #0x1f	; 31
	.db #0x00	; 0
	.db #0x18	; 24
	.db #0x00	; 0
	.db #0x18	; 24
	.db #0x00	; 0
	.db #0x1f	; 31
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x9f	; 159
	.db #0x00	; 0
	.db #0xdf	; 223
	.db #0x00	; 0
	.db #0xc3	; 195
	.db #0x00	; 0
	.db #0xc3	; 195
	.db #0x00	; 0
	.db #0x83	; 131
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xe0	; 224
	.db #0x00	; 0
	.db #0xe0	; 224
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xfb	; 251
	.db #0x00	; 0
	.db #0xf3	; 243
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xe1	; 225
	.db #0x00	; 0
	.db #0x31	; 49	'1'
	.db #0x00	; 0
	.db #0x31	; 49	'1'
	.db #0x00	; 0
	.db #0x19	; 25
	.db #0x00	; 0
	.db #0x19	; 25
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xf0	; 240
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x81	; 129
	.db #0x00	; 0
	.db #0xf9	; 249
	.db #0x00	; 0
	.db #0xf8	; 248
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xf9	; 249
	.db #0x00	; 0
	.db #0x18	; 24
	.db #0x00	; 0
	.db #0x1a	; 26
	.db #0x00	; 0
	.db #0xfb	; 251
	.db #0x00	; 0
	.db #0xf1	; 241
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xf0	; 240
	.db #0x00	; 0
	.db #0x30	; 48	'0'
	.db #0x00	; 0
	.db #0x30	; 48	'0'
	.db #0x00	; 0
	.db #0xf0	; 240
	.db #0x00	; 0
	.db #0xe0	; 224
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x1f	; 31
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x23	; 35
	.db #0x00	; 0
	.db #0x3f	; 63
	.db #0x00	; 0
	.db #0x1e	; 30
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x18	; 24
	.db #0x00	; 0
	.db #0x18	; 24
	.db #0x00	; 0
	.db #0x18	; 24
	.db #0x00	; 0
	.db #0x18	; 24
	.db #0x00	; 0
	.db #0x18	; 24
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x61	; 97	'a'
	.db #0x00	; 0
	.db #0x7f	; 127
	.db #0x00	; 0
	.db #0x7f	; 127
	.db #0x00	; 0
	.db #0xc0	; 192
	.db #0x00	; 0
	.db #0xc0	; 192
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x9f	; 159
	.db #0x00	; 0
	.db #0x99	; 153
	.db #0x00	; 0
	.db #0x99	; 153
	.db #0x00	; 0
	.db #0xd8	; 216
	.db #0x00	; 0
	.db #0xd8	; 216
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x83	; 131
	.db #0x00	; 0
	.db #0x83	; 131
	.db #0x00	; 0
	.db #0xc3	; 195
	.db #0x00	; 0
	.db #0xc3	; 195
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
_press_start_88x16_tiles:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x3f	; 63
	.db #0x00	; 0
	.db #0x3f	; 63
	.db #0x00	; 0
	.db #0x31	; 49	'1'
	.db #0x00	; 0
	.db #0x31	; 49	'1'
	.db #0x00	; 0
	.db #0x31	; 49	'1'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x3f	; 63
	.db #0x00	; 0
	.db #0xbf	; 191
	.db #0x00	; 0
	.db #0xb1	; 177
	.db #0x00	; 0
	.db #0xb1	; 177
	.db #0x00	; 0
	.db #0xbf	; 191
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x1f	; 31
	.db #0x00	; 0
	.db #0x9f	; 159
	.db #0x00	; 0
	.db #0x98	; 152
	.db #0x00	; 0
	.db #0x98	; 152
	.db #0x00	; 0
	.db #0x1f	; 31
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x8f	; 143
	.db #0x00	; 0
	.db #0x9f	; 159
	.db #0x00	; 0
	.db #0x18	; 24
	.db #0x00	; 0
	.db #0x18	; 24
	.db #0x00	; 0
	.db #0x1f	; 31
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x1e	; 30
	.db #0x00	; 0
	.db #0xbf	; 191
	.db #0x00	; 0
	.db #0xb1	; 177
	.db #0x00	; 0
	.db #0x30	; 48	'0'
	.db #0x00	; 0
	.db #0x3e	; 62
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xef	; 239
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x11	; 17
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0xe1	; 225
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xf0	; 240
	.db #0x00	; 0
	.db #0xf1	; 241
	.db #0x00	; 0
	.db #0x81	; 129
	.db #0x00	; 0
	.db #0x83	; 131
	.db #0x00	; 0
	.db #0x83	; 131
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xc1	; 193
	.db #0x00	; 0
	.db #0xe1	; 225
	.db #0x00	; 0
	.db #0xe1	; 225
	.db #0x00	; 0
	.db #0x31	; 49	'1'
	.db #0x00	; 0
	.db #0x31	; 49	'1'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xf9	; 249
	.db #0x00	; 0
	.db #0xfd	; 253
	.db #0x00	; 0
	.db #0x8c	; 140
	.db #0x00	; 0
	.db #0x8c	; 140
	.db #0x00	; 0
	.db #0xf8	; 248
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xfe	; 254
	.db #0x00	; 0
	.db #0xfe	; 254
	.db #0x00	; 0
	.db #0x30	; 48	'0'
	.db #0x00	; 0
	.db #0x30	; 48	'0'
	.db #0x00	; 0
	.db #0x30	; 48	'0'
	.db #0x00	; 0
	.db #0x3f	; 63
	.db #0x00	; 0
	.db #0x3f	; 63
	.db #0x00	; 0
	.db #0x30	; 48	'0'
	.db #0x00	; 0
	.db #0x30	; 48	'0'
	.db #0x00	; 0
	.db #0x30	; 48	'0'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xbe	; 190
	.db #0x00	; 0
	.db #0x33	; 51	'3'
	.db #0x00	; 0
	.db #0x33	; 51	'3'
	.db #0x00	; 0
	.db #0x31	; 49	'1'
	.db #0x00	; 0
	.db #0x31	; 49	'1'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x1f	; 31
	.db #0x00	; 0
	.db #0x18	; 24
	.db #0x00	; 0
	.db #0x18	; 24
	.db #0x00	; 0
	.db #0x9f	; 159
	.db #0x00	; 0
	.db #0x9f	; 159
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x0f	; 15
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x11	; 17
	.db #0x00	; 0
	.db #0x9f	; 159
	.db #0x00	; 0
	.db #0x8f	; 143
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x9f	; 159
	.db #0x00	; 0
	.db #0x83	; 131
	.db #0x00	; 0
	.db #0xa3	; 163
	.db #0x00	; 0
	.db #0xbf	; 191
	.db #0x00	; 0
	.db #0x1e	; 30
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xf1	; 241
	.db #0x00	; 0
	.db #0x31	; 49	'1'
	.db #0x00	; 0
	.db #0x31	; 49	'1'
	.db #0x00	; 0
	.db #0xf1	; 241
	.db #0x00	; 0
	.db #0xe1	; 225
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x86	; 134
	.db #0x00	; 0
	.db #0x87	; 135
	.db #0x00	; 0
	.db #0x87	; 135
	.db #0x00	; 0
	.db #0x8c	; 140
	.db #0x00	; 0
	.db #0x8c	; 140
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x19	; 25
	.db #0x00	; 0
	.db #0xf9	; 249
	.db #0x00	; 0
	.db #0xf9	; 249
	.db #0x00	; 0
	.db #0x0d	; 13
	.db #0x00	; 0
	.db #0x0d	; 13
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xf0	; 240
	.db #0x00	; 0
	.db #0x98	; 152
	.db #0x00	; 0
	.db #0x98	; 152
	.db #0x00	; 0
	.db #0x8c	; 140
	.db #0x00	; 0
	.db #0x8c	; 140
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x30	; 48	'0'
	.db #0x00	; 0
	.db #0x30	; 48	'0'
	.db #0x00	; 0
	.db #0x30	; 48	'0'
	.db #0x00	; 0
	.db #0x30	; 48	'0'
	.db #0x00	; 0
	.db #0x30	; 48	'0'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
;./start/start_screen.h:117: void draw_press_start_sprite(void) {
;	---------------------------------
; Function draw_press_start_sprite
; ---------------------------------
_draw_press_start_sprite::
	add	sp, #-3
;./start/start_screen.h:119: set_sprite_data(0, 16, press_start_64x16_tiles);
	ld	de, #_press_start_64x16_tiles
	push	de
	ld	hl, #0x1000
	push	hl
	call	_set_sprite_data
	add	sp, #4
;./start/start_screen.h:126: for (uint8_t i = 0; i < 16; i++) {
	ldhl	sp,	#2
	ld	(hl), #0x00
00106$:
	ldhl	sp,	#2
	ld	a, (hl)
	sub	a, #0x10
	jr	NC, 00101$
;./start/start_screen.h:127: uint8_t sprite_x = start_x + (i % 8) * 8; // 8 columnas (64 píxeles de ancho)
	ld	a, (hl-)
	ld	c, a
	ld	b, #0x00
	ld	a, c
	and	a, #0x07
	add	a, a
	add	a, a
	add	a, a
	add	a, #0x30
;./start/start_screen.h:129: uint8_t sprite_y = start_y + ((i & 0xF8) >> 3) * 8;     // Avanza a la fila siguiente después de 8 sprites
	ld	(hl-), a
	ld	a, c
	and	a, #0xf8
	ld	e, a
	ld	d, #0x00
	sra	d
	rr	e
	sra	d
	rr	e
	sra	d
	rr	e
	ld	a, e
	add	a, a
	add	a, a
	add	a, a
	ld	(hl), a
;c:\gbdk\include\gb\gb.h:1804: shadow_OAM[nb].tile=tile;
	sla	c
	rl	b
	sla	c
	rl	b
	ld	hl,#_shadow_OAM + 1
	add	hl,bc
	inc	hl
	ld	e, l
	ld	d, h
	ldhl	sp,	#2
;./start/start_screen.h:132: move_sprite(i, sprite_x + 6, sprite_y); // Posiciona el sprite con 6 pixeles extra en x para mejor centrado
	ld	a, (hl-)
	ld	(de), a
	ld	a, (hl)
	add	a, #0x06
	ld	(hl), a
;c:\gbdk\include\gb\gb.h:1877: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #_shadow_OAM
	add	hl, bc
	ld	e, l
	ld	d, h
;c:\gbdk\include\gb\gb.h:1878: itm->y=y, itm->x=x;
	ldhl	sp,	#0
	ld	a, (hl+)
	ld	(de), a
	inc	de
	ld	a, (hl)
	ld	(de), a
;c:\gbdk\include\gb\gb.h:1850: shadow_OAM[nb].prop=prop;
	ld	hl,#_shadow_OAM + 1
	add	hl,bc
	inc	hl
	inc	hl
	ld	(hl), #0x00
;./start/start_screen.h:126: for (uint8_t i = 0; i < 16; i++) {
	ldhl	sp,	#2
	inc	(hl)
	jr	00106$
00101$:
;./start/start_screen.h:137: SHOW_SPRITES; // Asegura que los sprites sean visibles
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x02
	ldh	(_LCDC_REG + 0), a
;./start/start_screen.h:138: }
	add	sp, #3
	ret
;./start/start_screen.h:157: void toggle_press_start_visibility(uint8_t visible) {
;	---------------------------------
; Function toggle_press_start_visibility
; ---------------------------------
_toggle_press_start_visibility::
	dec	sp
	dec	sp
	ld	c, a
;./start/start_screen.h:162: for (uint8_t i = 0; i < 16; i++) {
	ld	b, #0x00
00108$:
	ld	a, b
	sub	a, #0x10
	jr	NC, 00110$
;./start/start_screen.h:163: if (visible) {
	ld	a, c
	or	a, a
	jr	Z, 00102$
;./start/start_screen.h:164: uint8_t sprite_x = start_x + (i % 8) * 8;     // 8 columnas de ancho
	ld	e, b
	ld	d, #0x00
	ld	a, e
	and	a, #0x07
;	spillPairReg hl
;	spillPairReg hl
	add	a, a
	add	a, a
	add	a, a
	add	a, #0x30
	ldhl	sp,	#1
	ld	(hl), a
;./start/start_screen.h:166: uint8_t sprite_y = start_y + ((i & 0xF8) >> 3) * 8;     // Avanza a la fila siguiente después de 8 sprites
	ld	a, e
	and	a, #0xf8
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	sra	h
	rr	l
	sra	h
	rr	l
	sra	h
	rr	l
	ld	a, l
	add	a, a
	add	a, a
	add	a, a
	add	a, #0x10
	ldhl	sp,	#0
;./start/start_screen.h:167: move_sprite(i, sprite_x + 6, sprite_y);       // Reposiciona el sprite en su lugar con 6 pixeles extra en x para mejor centrado
	ld	(hl+), a
	ld	a, (hl)
	add	a, #0x06
	ld	(hl), a
;c:\gbdk\include\gb\gb.h:1877: OAM_item_t * itm = &shadow_OAM[nb];
	ld	l, e
	ld	h, d
	add	hl, hl
	add	hl, hl
	ld	de, #_shadow_OAM
	add	hl, de
	ld	e, l
	ld	d, h
;c:\gbdk\include\gb\gb.h:1878: itm->y=y, itm->x=x;
	ldhl	sp,	#0
	ld	a, (hl+)
	ld	(de), a
	inc	de
	ld	a, (hl)
	ld	(de), a
;./start/start_screen.h:167: move_sprite(i, sprite_x + 6, sprite_y);       // Reposiciona el sprite en su lugar con 6 pixeles extra en x para mejor centrado
	jr	00109$
00102$:
;c:\gbdk\include\gb\gb.h:1877: OAM_item_t * itm = &shadow_OAM[nb];
	ld	de, #_shadow_OAM+0
	ld	l, b
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	add	hl, de
;c:\gbdk\include\gb\gb.h:1878: itm->y=y, itm->x=x;
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
;./start/start_screen.h:170: move_sprite(i, 0, 0); // Mueve el sprite fuera de la pantalla
00109$:
;./start/start_screen.h:162: for (uint8_t i = 0; i < 16; i++) {
	inc	b
	jr	00108$
00110$:
;./start/start_screen.h:173: }
	inc	sp
	inc	sp
	ret
;./start/start_screen.h:176: void load_128x128_full_screen(const uint8_t *full_screen_sprite, int8_t center, int8_t isTitleScreen) {
;	---------------------------------
; Function load_128x128_full_screen
; ---------------------------------
_load_128x128_full_screen::
	dec	sp
	dec	sp
	ld	c, a
;./start/start_screen.h:177: DISPLAY_OFF;          // Apagar la pantalla mientras se cargan los datos
	call	_display_off
;./start/start_screen.h:179: fill_bkg_rect(0, 0, 20, 18, 80); // Llena la pantalla completa con el tile 60 (color verde/amarillo solido)
	push	de
	ld	hl, #0x5012
	push	hl
	ld	a, #0x14
	push	af
	inc	sp
	xor	a, a
	rrca
	push	af
	call	_fill_bkg_rect
	add	sp, #5
	pop	de
;./start/start_screen.h:184: if (center) {
	ld	a, c
	or	a, a
;./start/start_screen.h:187: pos_y = (18 - 16) / 2; // (Alto pantalla en tiles - alto sprite en tiles) / 2
;./start/start_screen.h:192: pos_y = 18 - 16;       // Alineado al borde inferior
	ld	c, #0x01
	jr	NZ, 00103$
	ld	c, #0x02
00103$:
;./start/start_screen.h:196: set_bkg_data(0, 256, full_screen_sprite); // Carga 256 tiles en VRAM desde el arreglo
	push	de
	xor	a, a
	rrca
	push	af
	call	_set_bkg_data
	add	sp, #4
;./start/start_screen.h:199: fill_bkg_rect(0, 0, 20, 18, 80); // Llena la pantalla completa con el tile 60 (color verde/amarillo solido)
	ld	hl, #0x5012
	push	hl
	ld	a, #0x14
	push	af
	inc	sp
	xor	a, a
	rrca
	push	af
	call	_fill_bkg_rect
	add	sp, #5
;./start/start_screen.h:202: for (uint8_t row = 0; row < 16; row++) {    // Recorre filas (128 píxeles = 16 tiles)
	ld	b, #0x00
00119$:
	ld	a, b
	sub	a, #0x10
	jr	NC, 00105$
;./start/start_screen.h:203: for (uint8_t col = 0; col < 16; col++) {  // Recorre columnas (128 píxeles = 16 tiles)
	ld	a, c
	add	a, b
	ld	d, a
	ld	e, #0x00
00116$:
	ld	a, e
	sub	a, #0x10
	jr	NC, 00120$
;./start/start_screen.h:204: uint8_t tile_index = row * 16 + col;    // Calcula el índice del tile basado en fila y columna
	ld	a, b
	swap	a
	and	a, #0xf0
	ld	l, e
;	spillPairReg hl
;	spillPairReg hl
	add	a, l
	ldhl	sp,	#0
;./start/start_screen.h:205: uint8_t x_tile = pos_x + col;        // Posición x en tiles
	ld	(hl+), a
	ld	a, e
	add	a, #0x02
	ld	(hl), a
;./start/start_screen.h:207: set_bkg_tiles(x_tile, y_tile, 1, 1, &tile_index); // Coloca el tile
	push	de
	ld	hl, #2
	add	hl, sp
	push	hl
	ld	hl, #0x101
	push	hl
	push	de
	inc	sp
	ldhl	sp,	#8
	ld	a, (hl)
	push	af
	inc	sp
	call	_set_bkg_tiles
	add	sp, #6
	pop	de
;./start/start_screen.h:203: for (uint8_t col = 0; col < 16; col++) {  // Recorre columnas (128 píxeles = 16 tiles)
	inc	e
	jr	00116$
00120$:
;./start/start_screen.h:202: for (uint8_t row = 0; row < 16; row++) {    // Recorre filas (128 píxeles = 16 tiles)
	inc	b
	jr	00119$
00105$:
;./start/start_screen.h:211: DISPLAY_ON;     // Enciende la pa ntalla
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x80
	ldh	(_LCDC_REG + 0), a
;./start/start_screen.h:212: SHOW_BKG;       // Muestra el fondo
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x01
	ldh	(_LCDC_REG + 0), a
;./start/start_screen.h:214: if (isTitleScreen) {
	ldhl	sp,	#4
	ld	a, (hl)
	or	a, a
	jr	Z, 00135$
;./start/start_screen.h:216: uint8_t visible = 1;
	ld	c, #0x01
;./start/start_screen.h:219: HIDE_BKG; // Oculta la capa de fondo temporalmente
	ldh	a, (_LCDC_REG + 0)
	and	a, #0xfe
	ldh	(_LCDC_REG + 0), a
;./start/start_screen.h:220: draw_press_start_sprite(); // Llama a la función para dibujar los sprites
	push	bc
	call	_draw_press_start_sprite
	pop	bc
;./start/start_screen.h:221: SHOW_BKG; // Opcional: vuelve a mostrar la capa de fondo si es necesario
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x01
	ldh	(_LCDC_REG + 0), a
;./start/start_screen.h:224: while (1) {
00109$:
;./start/start_screen.h:225: wait_vbl_done();
	call	_wait_vbl_done
;./start/start_screen.h:226: toggle_press_start_visibility(visible); // Alterna la visibilidad del texto PRESS START
	push	bc
	ld	a, c
	call	_toggle_press_start_visibility
	pop	bc
;./start/start_screen.h:227: visible = !visible; // Cambia el estado la visibilidad del texto PRESS START
	ld	a, c
	sub	a,#0x01
	ld	a, #0x00
	rla
	ld	c, a
;./start/start_screen.h:229: if (joypad() & J_START) {
	call	_joypad
	rlca
	jr	NC, 00107$
;./start/start_screen.h:231: toggle_press_start_visibility(0); // Oculta el texto antes de salir
	xor	a, a
	call	_toggle_press_start_visibility
;./start/start_screen.h:232: HIDE_BKG;                         // Oculta el fondo si no lo necesitas en el juego
	ldh	a, (_LCDC_REG + 0)
	and	a, #0xfe
	ldh	(_LCDC_REG + 0), a
;./start/start_screen.h:233: HIDE_SPRITES;                     // Oculta los sprites de la pantalla de inicio
	ldh	a, (_LCDC_REG + 0)
	and	a, #0xfd
	ldh	(_LCDC_REG + 0), a
;./start/start_screen.h:234: DISPLAY_OFF;                      // Apaga la pantalla para preparar el juego
	call	_display_off
;./start/start_screen.h:235: hide_all_sprites();               // Oculta todos los sprites antes de comenzar el juego
	call	_hide_all_sprites
;./start/start_screen.h:236: fill_bkg_rect(0, 0, 20, 18, 0);   // Limpia el fondo de la pantalla de inicio
	xor	a, a
	ld	h, a
	ld	l, #0x12
	push	hl
	ld	a, #0x14
	push	af
	inc	sp
	xor	a, a
	rrca
	push	af
	xor	a, a
	call	_fill_bkg_rect
	add	sp, #5
;./start/start_screen.h:237: clear_background();               // Limpia el mapa de fondo
	call	_clear_background
;./start/start_screen.h:238: clear_vram();                     // Limpia la memoria VRAM
	call	_clear_vram
;./start/start_screen.h:239: break;
	jr	00124$
00107$:
;./start/start_screen.h:241: delay(100); // Pequeño retraso para reducir el uso de CPU
	push	bc
	ld	de, #0x0064
	call	_delay
	pop	bc
	jr	00109$
;./start/start_screen.h:246: for (uint16_t frame_counter = 0; frame_counter < 200; frame_counter++) {
00135$:
	ld	bc, #0x0000
00122$:
	ld	e, c
	ld	d, b
	ld	a, e
	sub	a, #0xc8
	ld	a, d
	sbc	a, #0x00
	jr	NC, 00111$
;./start/start_screen.h:247: wait_vbl_done();
	call	_wait_vbl_done
;./start/start_screen.h:246: for (uint16_t frame_counter = 0; frame_counter < 200; frame_counter++) {
	inc	bc
	jr	00122$
00111$:
;./start/start_screen.h:249: HIDE_BKG;                         // Oculta el fondo
	ldh	a, (_LCDC_REG + 0)
	and	a, #0xfe
	ldh	(_LCDC_REG + 0), a
;./start/start_screen.h:250: DISPLAY_OFF;                      // Apagar pantalla
	call	_display_off
;./start/start_screen.h:251: fill_bkg_rect(0, 0, 20, 18, 0);   // Limpia el fondo de la pantalla de inicio
	xor	a, a
	ld	h, a
	ld	l, #0x12
	push	hl
	ld	a, #0x14
	push	af
	inc	sp
	xor	a, a
	rrca
	push	af
	xor	a, a
	call	_fill_bkg_rect
	add	sp, #5
;./start/start_screen.h:252: clear_background();               // Limpia el mapa de fondo
	call	_clear_background
;./start/start_screen.h:253: clear_vram();                     // Limpia la memoria VRAM
	call	_clear_vram
00124$:
;./start/start_screen.h:256: }
	inc	sp
	inc	sp
	pop	hl
	inc	sp
	jp	(hl)
;./start/start_screen.h:259: void show_start_screen(void) {
;	---------------------------------
; Function show_start_screen
; ---------------------------------
_show_start_screen::
;./start/start_screen.h:261: printf(" "); // Asegura que la fuente se cargue en la VRAM
	ld	de, #___str_0
	push	de
	call	_printf
	pop	hl
;./start/start_screen.h:263: DISPLAY_ON;     // Enciende la pantalla
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x80
	ldh	(_LCDC_REG + 0), a
;./start/start_screen.h:264: SHOW_BKG;       // Muestra el fondo
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x01
	ldh	(_LCDC_REG + 0), a
;./start/start_screen.h:265: SHOW_SPRITES;   // Mostrar los sprites
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x02
	ldh	(_LCDC_REG + 0), a
;./start/start_screen.h:270: write_text_to_background("PRESS START", 4, 15); // Sprite 15, columna 4 (aproximadamente centrado)
	ld	a, #0x0f
	push	af
	inc	sp
	ld	a, #0x04
	ld	de, #___str_1
	call	_write_text_to_background
;./start/start_screen.h:279: animate_levitation_start_screen(center_x, center_y);
	ld	e, #0x38
	ld	a, #0x40
	call	_animate_levitation_start_screen
;./start/start_screen.h:282: while (1) {
00104$:
;./start/start_screen.h:283: wait_vbl_done();
	call	_wait_vbl_done
;./start/start_screen.h:284: if (joypad() & J_START) {
	call	_joypad
	rlca
	jr	NC, 00102$
;./start/start_screen.h:286: hide_all_sprites(); // Oculta todos los sprites antes de comenzar el juego
	call	_hide_all_sprites
;./start/start_screen.h:287: fill_bkg_rect(0, 0, 20, 18, 0); // Limpia el fondo de la pantalla de inicio
	xor	a, a
	ld	h, a
	ld	l, #0x12
	push	hl
	ld	a, #0x14
	push	af
	inc	sp
	xor	a, a
	rrca
	push	af
	call	_fill_bkg_rect
	add	sp, #5
;./start/start_screen.h:288: HIDE_BKG;       // Opcional: oculta el fondo si no lo necesitas en el juego
	ldh	a, (_LCDC_REG + 0)
	and	a, #0xfe
	ldh	(_LCDC_REG + 0), a
;./start/start_screen.h:289: HIDE_SPRITES;   // Opcional: oculta los sprites de la pantalla de inicio
	ldh	a, (_LCDC_REG + 0)
	and	a, #0xfd
	ldh	(_LCDC_REG + 0), a
;./start/start_screen.h:290: DISPLAY_OFF;    // Apaga la pantalla para preparar el juego
	call	_display_off
;./start/start_screen.h:291: clear_vram();
;./start/start_screen.h:292: break;
	jp	_clear_vram
00102$:
;./start/start_screen.h:294: delay(100); // Pequeño retraso para reducir el uso de CPU
	ld	de, #0x0064
	call	_delay
;./start/start_screen.h:296: }
	jr	00104$
___str_0:
	.ascii " "
	.db 0x00
___str_1:
	.ascii "PRESS START"
	.db 0x00
;./movement/sprite_movement.h:40: void move_16_x_16_sprite(uint8_t base_sprite_id, uint8_t *player_x, uint8_t *player_y) {
;	---------------------------------
; Function move_16_x_16_sprite
; ---------------------------------
_move_16_x_16_sprite::
	add	sp, #-7
	ldhl	sp,	#5
	ld	(hl), a
	ld	c, e
	ld	b, d
;./movement/sprite_movement.h:42: uint8_t input = joypad();
	call	_joypad
	ldhl	sp,	#6
	ld	(hl), a
;./movement/sprite_movement.h:45: if ((input & J_LEFT) && *player_x > 0) {
	push	hl
	ldhl	sp,	#8
	bit	1, (hl)
	pop	hl
	jr	Z, 00105$
	ld	a, (bc)
	or	a, a
	jr	Z, 00105$
;./movement/sprite_movement.h:46: (*player_x)--; // Mueve hacia la izquierda
	dec	a
	ld	(bc), a
	jr	00106$
00105$:
;./movement/sprite_movement.h:47: } else if ((input & J_RIGHT) && *player_x < (160)) {
	push	hl
	ldhl	sp,	#8
	bit	0, (hl)
	pop	hl
	jr	Z, 00106$
	ld	a, (bc)
	cp	a, #0xa0
	jr	NC, 00106$
;./movement/sprite_movement.h:48: (*player_x)++; // Mueve hacia la derecha
	inc	a
	ld	(bc), a
00106$:
;./movement/sprite_movement.h:52: if ((input & J_UP) && *player_y > 0) {
	ldhl	sp,	#9
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	push	hl
	ldhl	sp,	#8
	bit	2, (hl)
	pop	hl
	jr	Z, 00112$
	ld	a, (de)
	or	a, a
	jr	Z, 00112$
;./movement/sprite_movement.h:53: (*player_y)--; // Mueve hacia arriba
	dec	a
	ld	(de), a
	jr	00113$
00112$:
;./movement/sprite_movement.h:54: } else if ((input & J_DOWN) && *player_y < (144)) {
	push	hl
	ldhl	sp,	#8
	bit	3, (hl)
	pop	hl
	jr	Z, 00113$
	ld	a, (de)
	cp	a, #0x90
	jr	NC, 00113$
;./movement/sprite_movement.h:55: (*player_y)++; // Mueve hacia abajo
	inc	a
	ld	(de), a
00113$:
;./movement/sprite_movement.h:45: if ((input & J_LEFT) && *player_x > 0) {
	ld	a, (bc)
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
;./movement/sprite_movement.h:59: if (*player_x <= 8) {
;./movement/sprite_movement.h:60: *player_x = 8; // Mantén en el borde izquierdo
	ld	a,#0x08
	cp	a,l
	jr	C, 00118$
	ld	(bc), a
	jr	00119$
00118$:
;./movement/sprite_movement.h:61: } else if (*player_x >= (153)) {
	ld	a, l
	sub	a, #0x99
	jr	C, 00119$
;./movement/sprite_movement.h:62: *player_x = 153; // Mantén en el borde derecho
	ld	a, #0x99
	ld	(bc), a
00119$:
;./movement/sprite_movement.h:65: if (*player_y <= 16) {
	inc	sp
	inc	sp
	push	de
	ld	a, (de)
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
;./movement/sprite_movement.h:66: *player_y = 16; // Mantén en el borde superior
	ld	a,#0x10
	cp	a,l
	jr	C, 00123$
	ld	(de), a
	jr	00145$
00123$:
;./movement/sprite_movement.h:67: } else if (*player_y >= (144)) {
	ld	a, l
	sub	a, #0x90
	jr	C, 00145$
;./movement/sprite_movement.h:68: *player_y = 144; // Mantén en el borde inferior
	ld	a, #0x90
	ld	(de), a
;./movement/sprite_movement.h:72: for (uint8_t i = 0; i < 4; i++) {
00145$:
	ldhl	sp,	#6
	ld	(hl), #0x00
00128$:
	ldhl	sp,	#6
	ld	a, (hl)
	sub	a, #0x04
	jr	NC, 00130$
;./movement/sprite_movement.h:73: uint8_t sprite_id = base_sprite_id + i;
	dec	hl
	ld	a, (hl+)
	add	a, (hl)
	ldhl	sp,	#2
;./movement/sprite_movement.h:74: move_sprite(sprite_id, *player_x + map_4_tiles_offsets[i][0], *player_y + map_4_tiles_offsets[i][1]);
	ld	(hl+), a
	inc	hl
	pop	de
	push	de
	ld	a, (de)
	ld	(hl+), a
	inc	hl
	ld	a, (hl)
	ld	d, #0x00
	add	a, a
	rl	d
	add	a, #<(_map_4_tiles_offsets)
	ld	e, a
	ld	a, d
	adc	a, #>(_map_4_tiles_offsets)
	ld	d, a
	ld	l, e
;	spillPairReg hl
;	spillPairReg hl
	ld	h, d
;	spillPairReg hl
;	spillPairReg hl
	inc	hl
	ld	a, (hl)
	ldhl	sp,	#4
	ld	l, (hl)
;	spillPairReg hl
;	spillPairReg hl
	add	a, l
	ldhl	sp,	#3
	ld	(hl), a
	ld	a, (bc)
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	a, (de)
	add	a, l
	ldhl	sp,	#4
;c:\gbdk\include\gb\gb.h:1877: OAM_item_t * itm = &shadow_OAM[nb];
	ld	(hl-), a
	dec	hl
	ld	l, (hl)
	ld	h, #0x00
	add	hl, hl
	add	hl, hl
	ld	de, #_shadow_OAM
	add	hl, de
	ld	e, l
	ld	d, h
;c:\gbdk\include\gb\gb.h:1878: itm->y=y, itm->x=x;
	ldhl	sp,	#3
	ld	a, (hl+)
	ld	(de), a
	inc	de
;./movement/sprite_movement.h:72: for (uint8_t i = 0; i < 4; i++) {
	ld	a, (hl+)
	inc	hl
	ld	(de), a
	inc	(hl)
	jr	00128$
00130$:
;./movement/sprite_movement.h:76: }
	add	sp, #7
	pop	hl
	pop	af
	jp	(hl)
;./skits/../actions/input.h:15: int8_t wait_for_any_button(void) {
;	---------------------------------
; Function wait_for_any_button
; ---------------------------------
_wait_for_any_button::
;./skits/../actions/input.h:17: while (1) {
00104$:
;./skits/../actions/input.h:18: wait_vbl_done();  // Espera al próximo frame
	call	_wait_vbl_done
;./skits/../actions/input.h:19: if (joypad()) {   // Detecta si algún botón está presionado
	call	_joypad
	or	a, a
	jr	Z, 00104$
;./skits/../actions/input.h:20: return 1;       // Retorna bandera de que la pantalla actual debe ser cerrada
	ld	a, #0x01
;./skits/../actions/input.h:23: }
	ret
_all_tilesets_sky_night_palmtrees:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x55	; 85	'U'
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x55	; 85	'U'
	.db #0xff	; 255
	.db #0xaa	; 170
	.db #0xff	; 255
	.db #0x55	; 85	'U'
	.db #0xff	; 255
	.db #0xaa	; 170
	.db #0xff	; 255
	.db #0x55	; 85	'U'
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0xaa	; 170
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0xaa	; 170
	.db #0x55	; 85	'U'
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x55	; 85	'U'
	.db #0xaa	; 170
	.db #0x55	; 85	'U'
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x55	; 85	'U'
	.db #0xff	; 255
	.db #0xaa	; 170
	.db #0xff	; 255
	.db #0x55	; 85	'U'
	.db #0xff	; 255
	.db #0xaa	; 170
	.db #0xff	; 255
	.db #0x55	; 85	'U'
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0xaa	; 170
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0xaa	; 170
	.db #0x55	; 85	'U'
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x55	; 85	'U'
	.db #0xaa	; 170
	.db #0xaa	; 170
	.db #0x55	; 85	'U'
	.db #0x55	; 85	'U'
	.db #0xaa	; 170
	.db #0xaa	; 170
	.db #0x55	; 85	'U'
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x55	; 85	'U'
	.db #0xaa	; 170
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x55	; 85	'U'
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xaa	; 170
	.db #0x00	; 0
	.db #0x55	; 85	'U'
	.db #0x00	; 0
	.db #0xaa	; 170
	.db #0x00	; 0
	.db #0x55	; 85	'U'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xaa	; 170
	.db #0x00	; 0
	.db #0xaa	; 170
	.db #0x55	; 85	'U'
	.db #0x55	; 85	'U'
	.db #0xaa	; 170
	.db #0xaa	; 170
	.db #0x55	; 85	'U'
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x55	; 85	'U'
	.db #0xaa	; 170
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x55	; 85	'U'
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xaa	; 170
	.db #0x00	; 0
	.db #0x55	; 85	'U'
	.db #0x00	; 0
	.db #0xaa	; 170
	.db #0x00	; 0
	.db #0x55	; 85	'U'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xaa	; 170
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x55	; 85	'U'
	.db #0x00	; 0
	.db #0xaa	; 170
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x55	; 85	'U'
	.db #0x00	; 0
	.db #0xaa	; 170
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x55	; 85	'U'
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xaa	; 170
	.db #0x00	; 0
	.db #0x55	; 85	'U'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xaa	; 170
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x55	; 85	'U'
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xaa	; 170
	.db #0x00	; 0
	.db #0x55	; 85	'U'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xaa	; 170
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xaa	; 170
	.db #0x00	; 0
	.db #0x55	; 85	'U'
	.db #0x00	; 0
	.db #0x99	; 153
	.db #0x00	; 0
	.db #0x44	; 68	'D'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xaa	; 170
	.db #0x00	; 0
	.db #0x55	; 85	'U'
	.db #0x00	; 0
	.db #0x99	; 153
	.db #0x00	; 0
	.db #0x44	; 68	'D'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x55	; 85	'U'
	.db #0x00	; 0
	.db #0xaa	; 170
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x3f	; 63
	.db #0x27	; 39
	.db #0x7f	; 127
	.db #0x61	; 97	'a'
	.db #0xfe	; 254
	.db #0x82	; 130
	.db #0x7e	; 126
	.db #0x42	; 66	'B'
	.db #0x3f	; 63
	.db #0x21	; 33
	.db #0x3f	; 63
	.db #0x2f	; 47
	.db #0x30	; 48	'0'
	.db #0x30	; 48	'0'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x55	; 85	'U'
	.db #0x00	; 0
	.db #0xaa	; 170
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x0f	; 15
	.db #0x00	; 0
	.db #0x0f	; 15
	.db #0x00	; 0
	.db #0x1f	; 31
	.db #0x00	; 0
	.db #0x7f	; 127
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0xc0	; 192
	.db #0x00	; 0
	.db #0xf0	; 240
	.db #0x00	; 0
	.db #0xf8	; 248
	.db #0x00	; 0
	.db #0xfc	; 252
	.db #0x00	; 0
	.db #0xfe	; 254
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x0d	; 13
	.db #0x00	; 0
	.db #0x1f	; 31
	.db #0x00	; 0
	.db #0x3f	; 63
	.db #0x00	; 0
	.db #0x3f	; 63
	.db #0x00	; 0
	.db #0x7f	; 127
	.db #0x00	; 0
	.db #0x7f	; 127
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0xc1	; 193
	.db #0x00	; 0
	.db #0xf3	; 243
	.db #0x00	; 0
	.db #0xfb	; 251
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x0f	; 15
	.db #0x00	; 0
	.db #0x0f	; 15
	.db #0x00	; 0
	.db #0x1f	; 31
	.db #0x00	; 0
	.db #0x7f	; 127
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0xc0	; 192
	.db #0x00	; 0
	.db #0xf0	; 240
	.db #0x00	; 0
	.db #0xf8	; 248
	.db #0x00	; 0
	.db #0xfc	; 252
	.db #0x00	; 0
	.db #0xfe	; 254
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x0c	; 12
	.db #0x00	; 0
	.db #0x1e	; 30
	.db #0x00	; 0
	.db #0x7e	; 126
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0xc1	; 193
	.db #0x00	; 0
	.db #0xf3	; 243
	.db #0x00	; 0
	.db #0xfb	; 251
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x0d	; 13
	.db #0x00	; 0
	.db #0x1f	; 31
	.db #0x00	; 0
	.db #0x3f	; 63
	.db #0x00	; 0
	.db #0x3f	; 63
	.db #0x00	; 0
	.db #0x7f	; 127
	.db #0x00	; 0
	.db #0x7f	; 127
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0xc0	; 192
	.db #0x00	; 0
	.db #0xf0	; 240
	.db #0x00	; 0
	.db #0xf8	; 248
	.db #0x00	; 0
	.db #0xfc	; 252
	.db #0x00	; 0
	.db #0xfe	; 254
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x0d	; 13
	.db #0x00	; 0
	.db #0x1f	; 31
	.db #0x00	; 0
	.db #0x3f	; 63
	.db #0x00	; 0
	.db #0x3f	; 63
	.db #0x00	; 0
	.db #0x7f	; 127
	.db #0x00	; 0
	.db #0x7f	; 127
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0xc1	; 193
	.db #0x00	; 0
	.db #0xf3	; 243
	.db #0x00	; 0
	.db #0xfb	; 251
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xf7	; 247
	.db #0xf9	; 249
	.db #0xf9	; 249
	.db #0xf0	; 240
	.db #0xf8	; 248
	.db #0xf0	; 240
	.db #0xf8	; 248
	.db #0xf0	; 240
	.db #0xe8	; 232
	.db #0xf0	; 240
	.db #0xd0	; 208
	.db #0xe0	; 224
	.db #0xe0	; 224
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x40	; 64
	.db #0x80	; 128
	.db #0xe0	; 224
	.db #0xc0	; 192
	.db #0xe0	; 224
	.db #0xf0	; 240
	.db #0xf8	; 248
	.db #0xf0	; 240
	.db #0xf8	; 248
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0xf8	; 248
	.db #0xf1	; 241
	.db #0xf8	; 248
	.db #0xff	; 255
	.db #0xf9	; 249
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x99	; 153
	.db #0x67	; 103	'g'
	.db #0x01	; 1
	.db #0x03	; 3
	.db #0x01	; 1
	.db #0x03	; 3
	.db #0x07	; 7
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x07	; 7
	.db #0x0b	; 11
	.db #0x07	; 7
	.db #0x03	; 3
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x01	; 1
	.db #0x03	; 3
	.db #0x63	; 99	'c'
	.db #0x01	; 1
	.db #0x89	; 137
	.db #0x7f	; 127
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xd7	; 215
	.db #0xef	; 239
	.db #0xef	; 239
	.db #0xff	; 255
	.db #0xd7	; 215
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xcf	; 207
	.db #0xc7	; 199
	.db #0xc0	; 192
	.db #0xa0	; 160
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0x81	; 129
	.db #0xc0	; 192
	.db #0x01	; 1
	.db #0xe0	; 224
	.db #0xc0	; 192
	.db #0xef	; 239
	.db #0xc0	; 192
	.db #0xff	; 255
	.db #0xcf	; 207
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x7f	; 127
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x7f	; 127
	.db #0xff	; 255
	.db #0x7f	; 127
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x0c	; 12
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0x01	; 1
	.db #0x20	; 32
	.db #0x07	; 7
	.db #0x40	; 64
	.db #0x1f	; 31
	.db #0x80	; 128
	.db #0x3f	; 63
	.db #0x80	; 128
	.db #0x7f	; 127
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x1e	; 30
	.db #0x00	; 0
	.db #0x61	; 97	'a'
	.db #0x1e	; 30
	.db #0x40	; 64
	.db #0x7f	; 127
	.db #0x80	; 128
	.db #0x7f	; 127
	.db #0x80	; 128
	.db #0x7f	; 127
	.db #0x80	; 128
	.db #0x7f	; 127
	.db #0x80	; 128
	.db #0x6f	; 111	'o'
	.db #0x90	; 144
	.db #0x05	; 5
	.db #0xfa	; 250
	.db #0x01	; 1
	.db #0x0e	; 14
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0xf8	; 248
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xfe	; 254
	.db #0x01	; 1
	.db #0xfe	; 254
	.db #0x01	; 1
	.db #0xfe	; 254
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x81	; 129
	.db #0x00	; 0
	.db #0x42	; 66	'B'
	.db #0x00	; 0
	.db #0x24	; 36
	.db #0x81	; 129
	.db #0x24	; 36
	.db #0xc3	; 195
	.db #0x18	; 24
	.db #0xe7	; 231
	.db #0x08	; 8
	.db #0xc7	; 199
	.db #0x08	; 8
	.db #0xc3	; 195
	.db #0x3c	; 60
	.db #0x81	; 129
	.db #0x66	; 102	'f'
	.db #0x00	; 0
	.db #0xc3	; 195
	.db #0x18	; 24
	.db #0x81	; 129
	.db #0x3c	; 60
	.db #0x81	; 129
	.db #0x7e	; 126
	.db #0x81	; 129
	.db #0x7e	; 126
	.db #0x00	; 0
	.db #0x7e	; 126
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x78	; 120	'x'
	.db #0x00	; 0
	.db #0x86	; 134
	.db #0x78	; 120	'x'
	.db #0x02	; 2
	.db #0xfe	; 254
	.db #0x01	; 1
	.db #0xfe	; 254
	.db #0x01	; 1
	.db #0xfe	; 254
	.db #0x01	; 1
	.db #0xfe	; 254
	.db #0x01	; 1
	.db #0xf6	; 246
	.db #0x09	; 9
	.db #0xa0	; 160
	.db #0x5f	; 95
	.db #0x80	; 128
	.db #0x70	; 112	'p'
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x1f	; 31
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x7f	; 127
	.db #0x80	; 128
	.db #0x7f	; 127
	.db #0x80	; 128
	.db #0x7f	; 127
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xc0	; 192
	.db #0x00	; 0
	.db #0x30	; 48	'0'
	.db #0x00	; 0
	.db #0x08	; 8
	.db #0x80	; 128
	.db #0x04	; 4
	.db #0xe0	; 224
	.db #0x02	; 2
	.db #0xf8	; 248
	.db #0x01	; 1
	.db #0xfc	; 252
	.db #0x01	; 1
	.db #0xfe	; 254
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x7f	; 127
	.db #0x80	; 128
	.db #0x7f	; 127
	.db #0x80	; 128
	.db #0x3d	; 61
	.db #0xc2	; 194
	.db #0xbd	; 189
	.db #0x42	; 66	'B'
	.db #0x38	; 56	'8'
	.db #0x47	; 71	'G'
	.db #0x38	; 56	'8'
	.db #0x44	; 68	'D'
	.db #0x18	; 24
	.db #0x24	; 36
	.db #0x00	; 0
	.db #0x18	; 24
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xdc	; 220
	.db #0x22	; 34
	.db #0xdc	; 220
	.db #0x22	; 34
	.db #0x89	; 137
	.db #0x76	; 118	'v'
	.db #0x81	; 129
	.db #0x5a	; 90	'Z'
	.db #0x01	; 1
	.db #0x82	; 130
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xc3	; 195
	.db #0x3c	; 60
	.db #0x00	; 0
	.db #0xc3	; 195
	.db #0x22	; 34
	.db #0xc1	; 193
	.db #0x42	; 66	'B'
	.db #0x81	; 129
	.db #0x48	; 72	'H'
	.db #0x87	; 135
	.db #0x02	; 2
	.db #0xc1	; 193
	.db #0x40	; 64
	.db #0x83	; 131
	.db #0x12	; 18
	.db #0xe1	; 225
	.db #0x42	; 66	'B'
	.db #0x81	; 129
	.db #0x44	; 68	'D'
	.db #0x83	; 131
	.db #0x3b	; 59
	.db #0x44	; 68	'D'
	.db #0x3b	; 59
	.db #0x44	; 68	'D'
	.db #0x91	; 145
	.db #0x6e	; 110	'n'
	.db #0x81	; 129
	.db #0x5a	; 90	'Z'
	.db #0x80	; 128
	.db #0x41	; 65	'A'
	.db #0x80	; 128
	.db #0x40	; 64
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xfe	; 254
	.db #0x01	; 1
	.db #0xfe	; 254
	.db #0x01	; 1
	.db #0xbc	; 188
	.db #0x43	; 67	'C'
	.db #0xbd	; 189
	.db #0x42	; 66	'B'
	.db #0x1c	; 28
	.db #0xe2	; 226
	.db #0x1c	; 28
	.db #0x22	; 34
	.db #0x18	; 24
	.db #0x24	; 36
	.db #0x00	; 0
	.db #0x18	; 24
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x22	; 34
	.db #0xc1	; 193
	.db #0x42	; 66	'B'
	.db #0x81	; 129
	.db #0x48	; 72	'H'
	.db #0x87	; 135
	.db #0x02	; 2
	.db #0xc1	; 193
	.db #0x40	; 64
	.db #0x83	; 131
	.db #0x12	; 18
	.db #0xe1	; 225
	.db #0x42	; 66	'B'
	.db #0x81	; 129
	.db #0x44	; 68	'D'
	.db #0x83	; 131
	.db #0x22	; 34
	.db #0xc1	; 193
	.db #0x42	; 66	'B'
	.db #0x81	; 129
	.db #0x48	; 72	'H'
	.db #0x87	; 135
	.db #0x02	; 2
	.db #0xc1	; 193
	.db #0x40	; 64
	.db #0x83	; 131
	.db #0x12	; 18
	.db #0xe1	; 225
	.db #0x42	; 66	'B'
	.db #0x81	; 129
	.db #0x44	; 68	'D'
	.db #0x83	; 131
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x22	; 34
	.db #0xc1	; 193
	.db #0x42	; 66	'B'
	.db #0x81	; 129
	.db #0x48	; 72	'H'
	.db #0x87	; 135
	.db #0x02	; 2
	.db #0xc1	; 193
	.db #0x40	; 64
	.db #0x83	; 131
	.db #0x12	; 18
	.db #0xe1	; 225
	.db #0x42	; 66	'B'
	.db #0x81	; 129
	.db #0x44	; 68	'D'
	.db #0x83	; 131
	.db #0x22	; 34
	.db #0xc1	; 193
	.db #0x42	; 66	'B'
	.db #0x81	; 129
	.db #0x48	; 72	'H'
	.db #0x87	; 135
	.db #0x02	; 2
	.db #0xc1	; 193
	.db #0x40	; 64
	.db #0x83	; 131
	.db #0x12	; 18
	.db #0xe1	; 225
	.db #0x42	; 66	'B'
	.db #0x81	; 129
	.db #0x44	; 68	'D'
	.db #0x83	; 131
	.db #0x00	; 0
	.db #0x1e	; 30
	.db #0x00	; 0
	.db #0x61	; 97	'a'
	.db #0x1e	; 30
	.db #0x40	; 64
	.db #0x7f	; 127
	.db #0x80	; 128
	.db #0x7f	; 127
	.db #0x80	; 128
	.db #0x7f	; 127
	.db #0x80	; 128
	.db #0x7f	; 127
	.db #0x80	; 128
	.db #0x6f	; 111	'o'
	.db #0x90	; 144
	.db #0x05	; 5
	.db #0xfa	; 250
	.db #0x01	; 1
	.db #0x0e	; 14
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0xf8	; 248
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xfe	; 254
	.db #0x01	; 1
	.db #0xfe	; 254
	.db #0x01	; 1
	.db #0xfe	; 254
	.db #0x01	; 1
	.db #0x22	; 34
	.db #0xc1	; 193
	.db #0x42	; 66	'B'
	.db #0x81	; 129
	.db #0x48	; 72	'H'
	.db #0x87	; 135
	.db #0x02	; 2
	.db #0xc1	; 193
	.db #0x40	; 64
	.db #0x83	; 131
	.db #0x12	; 18
	.db #0xe1	; 225
	.db #0x42	; 66	'B'
	.db #0x81	; 129
	.db #0x44	; 68	'D'
	.db #0x83	; 131
	.db #0x22	; 34
	.db #0xc1	; 193
	.db #0x42	; 66	'B'
	.db #0x81	; 129
	.db #0x48	; 72	'H'
	.db #0x87	; 135
	.db #0x02	; 2
	.db #0xc1	; 193
	.db #0x40	; 64
	.db #0x83	; 131
	.db #0x12	; 18
	.db #0xe1	; 225
	.db #0x42	; 66	'B'
	.db #0x81	; 129
	.db #0x44	; 68	'D'
	.db #0x83	; 131
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xaa	; 170
	.db #0x00	; 0
	.db #0x55	; 85	'U'
	.db #0x00	; 0
	.db #0x99	; 153
	.db #0x00	; 0
	.db #0x44	; 68	'D'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xfe	; 254
	.db #0x01	; 1
	.db #0xfe	; 254
	.db #0x01	; 1
	.db #0xbc	; 188
	.db #0x43	; 67	'C'
	.db #0xbd	; 189
	.db #0x42	; 66	'B'
	.db #0x1c	; 28
	.db #0xe2	; 226
	.db #0x1c	; 28
	.db #0x22	; 34
	.db #0x18	; 24
	.db #0x24	; 36
	.db #0x00	; 0
	.db #0x18	; 24
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x0c	; 12
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0x01	; 1
	.db #0x20	; 32
	.db #0x07	; 7
	.db #0x40	; 64
	.db #0x1f	; 31
	.db #0x80	; 128
	.db #0x3f	; 63
	.db #0x80	; 128
	.db #0x7f	; 127
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x1e	; 30
	.db #0x00	; 0
	.db #0x61	; 97	'a'
	.db #0x1e	; 30
	.db #0x40	; 64
	.db #0x7f	; 127
	.db #0x80	; 128
	.db #0x7f	; 127
	.db #0x80	; 128
	.db #0x7f	; 127
	.db #0x80	; 128
	.db #0x7f	; 127
	.db #0x80	; 128
	.db #0x6f	; 111	'o'
	.db #0x90	; 144
	.db #0x05	; 5
	.db #0xfa	; 250
	.db #0x01	; 1
	.db #0x0e	; 14
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0xf8	; 248
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xfe	; 254
	.db #0x01	; 1
	.db #0xfe	; 254
	.db #0x01	; 1
	.db #0xfe	; 254
	.db #0x01	; 1
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
_skit_arche_normal_48x48_sprite:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x18	; 24
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0xe0	; 224
	.db #0x20	; 32
	.db #0xc0	; 192
	.db #0x40	; 64
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0x00	; 0
	.db #0x88	; 136
	.db #0x20	; 32
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x24	; 36
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x60	; 96
	.db #0x80	; 128
	.db #0x02	; 2
	.db #0x7c	; 124
	.db #0x20	; 32
	.db #0x1f	; 31
	.db #0x11	; 17
	.db #0x08	; 8
	.db #0x0a	; 10
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x01	; 1
	.db #0x06	; 6
	.db #0x08	; 8
	.db #0x06	; 6
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x04	; 4
	.db #0x02	; 2
	.db #0x83	; 131
	.db #0x04	; 4
	.db #0x02	; 2
	.db #0x0d	; 13
	.db #0x14	; 20
	.db #0x0b	; 11
	.db #0x01	; 1
	.db #0x1e	; 30
	.db #0x03	; 3
	.db #0x3c	; 60
	.db #0x41	; 65	'A'
	.db #0x28	; 40
	.db #0x01	; 1
	.db #0x68	; 104	'h'
	.db #0x00	; 0
	.db #0xe9	; 233
	.db #0x50	; 80	'P'
	.db #0xa9	; 169
	.db #0xc4	; 196
	.db #0x39	; 57	'9'
	.db #0xc4	; 196
	.db #0x39	; 57	'9'
	.db #0x80	; 128
	.db #0x3d	; 61
	.db #0x08	; 8
	.db #0x35	; 53	'5'
	.db #0x02	; 2
	.db #0x24	; 36
	.db #0x11	; 17
	.db #0x26	; 38
	.db #0x10	; 16
	.db #0x27	; 39
	.db #0x00	; 0
	.db #0x37	; 55	'7'
	.db #0x8a	; 138
	.db #0x35	; 53	'5'
	.db #0x89	; 137
	.db #0x36	; 54	'6'
	.db #0x00	; 0
	.db #0xbe	; 190
	.db #0x50	; 80	'P'
	.db #0xae	; 174
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x83	; 131
	.db #0x00	; 0
	.db #0x40	; 64
	.db #0x81	; 129
	.db #0x01	; 1
	.db #0xc0	; 192
	.db #0x01	; 1
	.db #0xe0	; 224
	.db #0x10	; 16
	.db #0xe0	; 224
	.db #0x80	; 128
	.db #0x70	; 112	'p'
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x40	; 64
	.db #0x80	; 128
	.db #0x10	; 16
	.db #0xc0	; 192
	.db #0x00	; 0
	.db #0xe8	; 232
	.db #0x98	; 152
	.db #0x64	; 100	'd'
	.db #0x10	; 16
	.db #0x0e	; 14
	.db #0x02	; 2
	.db #0x1c	; 28
	.db #0x02	; 2
	.db #0x3c	; 60
	.db #0x40	; 64
	.db #0x3c	; 60
	.db #0x01	; 1
	.db #0x7c	; 124
	.db #0x00	; 0
	.db #0xfd	; 253
	.db #0x02	; 2
	.db #0xfd	; 253
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x42	; 66	'B'
	.db #0x3c	; 60
	.db #0x00	; 0
	.db #0x7f	; 127
	.db #0x8c	; 140
	.db #0x70	; 112	'p'
	.db #0x0f	; 15
	.db #0xf0	; 240
	.db #0x10	; 16
	.db #0xef	; 239
	.db #0x00	; 0
	.db #0xf1	; 241
	.db #0x04	; 4
	.db #0xe0	; 224
	.db #0x01	; 1
	.db #0xe7	; 231
	.db #0x1a	; 26
	.db #0x25	; 37
	.db #0x12	; 18
	.db #0xe5	; 229
	.db #0x80	; 128
	.db #0x77	; 119	'w'
	.db #0x14	; 20
	.db #0x23	; 35
	.db #0x60	; 96
	.db #0x83	; 131
	.db #0x20	; 32
	.db #0xc3	; 195
	.db #0x02	; 2
	.db #0xe1	; 225
	.db #0x00	; 0
	.db #0xc1	; 193
	.db #0x11	; 17
	.db #0xee	; 238
	.db #0x18	; 24
	.db #0xe7	; 231
	.db #0x10	; 16
	.db #0xef	; 239
	.db #0x0a	; 10
	.db #0xf1	; 241
	.db #0x02	; 2
	.db #0xf1	; 241
	.db #0x04	; 4
	.db #0xf2	; 242
	.db #0x02	; 2
	.db #0xf4	; 244
	.db #0x00	; 0
	.db #0xf3	; 243
	.db #0x80	; 128
	.db #0x78	; 120	'x'
	.db #0x04	; 4
	.db #0xf8	; 248
	.db #0x00	; 0
	.db #0x3c	; 60
	.db #0xe0	; 224
	.db #0x1e	; 30
	.db #0x01	; 1
	.db #0xfe	; 254
	.db #0x20	; 32
	.db #0xcf	; 207
	.db #0x08	; 8
	.db #0x67	; 103	'g'
	.db #0x80	; 128
	.db #0xe7	; 231
	.db #0x8a	; 138
	.db #0x74	; 116	't'
	.db #0x01	; 1
	.db #0x7e	; 126
	.db #0x40	; 64
	.db #0x3f	; 63
	.db #0x40	; 64
	.db #0x3f	; 63
	.db #0x00	; 0
	.db #0x3f	; 63
	.db #0x20	; 32
	.db #0x1f	; 31
	.db #0x20	; 32
	.db #0x9f	; 159
	.db #0x60	; 96
	.db #0x9f	; 159
	.db #0x20	; 32
	.db #0xdf	; 223
	.db #0x40	; 64
	.db #0x9f	; 159
	.db #0x00	; 0
	.db #0x9f	; 159
	.db #0x80	; 128
	.db #0x1f	; 31
	.db #0x00	; 0
	.db #0x1f	; 31
	.db #0x00	; 0
	.db #0x1f	; 31
	.db #0x00	; 0
	.db #0x1f	; 31
	.db #0x00	; 0
	.db #0x1f	; 31
	.db #0x43	; 67	'C'
	.db #0x85	; 133
	.db #0x43	; 67	'C'
	.db #0x84	; 132
	.db #0x15	; 21
	.db #0x82	; 130
	.db #0x18	; 24
	.db #0x87	; 135
	.db #0x40	; 64
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0xc0	; 192
	.db #0x00	; 0
	.db #0xc0	; 192
	.db #0x20	; 32
	.db #0xc0	; 192
	.db #0x01	; 1
	.db #0xc0	; 192
	.db #0x80	; 128
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0xc0	; 192
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0xf2	; 242
	.db #0x01	; 1
	.db #0xf2	; 242
	.db #0x82	; 130
	.db #0x71	; 113	'q'
	.db #0x40	; 64
	.db #0x33	; 51	'3'
	.db #0x20	; 32
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x40	; 64
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0xe7	; 231
	.db #0xc0	; 192
	.db #0x23	; 35
	.db #0xaa	; 170
	.db #0x41	; 65	'A'
	.db #0x18	; 24
	.db #0xe1	; 225
	.db #0x02	; 2
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x04	; 4
	.db #0x03	; 3
	.db #0x20	; 32
	.db #0xdf	; 223
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x80	; 128
	.db #0x7f	; 127
	.db #0x20	; 32
	.db #0x1f	; 31
	.db #0x00	; 0
	.db #0x3f	; 63
	.db #0x00	; 0
	.db #0x3f	; 63
	.db #0x00	; 0
	.db #0x3f	; 63
	.db #0x40	; 64
	.db #0x3f	; 63
	.db #0x21	; 33
	.db #0x5e	; 94
	.db #0x20	; 32
	.db #0x5e	; 94
	.db #0x20	; 32
	.db #0x5e	; 94
	.db #0x00	; 0
	.db #0xe0	; 224
	.db #0x10	; 16
	.db #0xe0	; 224
	.db #0x20	; 32
	.db #0xd0	; 208
	.db #0x08	; 8
	.db #0xf0	; 240
	.db #0x04	; 4
	.db #0xc8	; 200
	.db #0x42	; 66	'B'
	.db #0x84	; 132
	.db #0x41	; 65	'A'
	.db #0x86	; 134
	.db #0x04	; 4
	.db #0x8b	; 139
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x06	; 6
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x40	; 64
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x60	; 96
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x08	; 8
	.db #0x07	; 7
	.db #0x00	; 0
	.db #0x0f	; 15
	.db #0x14	; 20
	.db #0x0b	; 11
	.db #0x20	; 32
	.db #0x1b	; 27
	.db #0x40	; 64
	.db #0x3b	; 59
	.db #0x88	; 136
	.db #0x73	; 115	's'
	.db #0x04	; 4
	.db #0xf3	; 243
	.db #0x00	; 0
	.db #0x7f	; 127
	.db #0x40	; 64
	.db #0x3f	; 63
	.db #0x00	; 0
	.db #0x3f	; 63
	.db #0x20	; 32
	.db #0x1f	; 31
	.db #0x00	; 0
	.db #0x1f	; 31
	.db #0x00	; 0
	.db #0x1f	; 31
	.db #0x00	; 0
	.db #0x1f	; 31
	.db #0x00	; 0
	.db #0x1f	; 31
	.db #0x00	; 0
	.db #0x5e	; 94
	.db #0x00	; 0
	.db #0x5e	; 94
	.db #0x80	; 128
	.db #0x5e	; 94
	.db #0x52	; 82	'R'
	.db #0x8c	; 140
	.db #0x10	; 16
	.db #0x8c	; 140
	.db #0x00	; 0
	.db #0x8c	; 140
	.db #0x00	; 0
	.db #0x8c	; 140
	.db #0x09	; 9
	.db #0x84	; 132
	.db #0x01	; 1
	.db #0x8e	; 142
	.db #0x01	; 1
	.db #0x82	; 130
	.db #0x00	; 0
	.db #0x8f	; 143
	.db #0x0f	; 15
	.db #0x90	; 144
	.db #0x18	; 24
	.db #0xa7	; 167
	.db #0x3c	; 60
	.db #0x83	; 131
	.db #0x5e	; 94
	.db #0x81	; 129
	.db #0x1c	; 28
	.db #0xc3	; 195
	.db #0x40	; 64
	.db #0x80	; 128
	.db #0x10	; 16
	.db #0xe0	; 224
	.db #0x64	; 100	'd'
	.db #0x98	; 152
	.db #0x38	; 56	'8'
	.db #0x87	; 135
	.db #0x1f	; 31
	.db #0x80	; 128
	.db #0x07	; 7
	.db #0xf8	; 248
	.db #0x43	; 67	'C'
	.db #0x84	; 132
	.db #0x8c	; 140
	.db #0x03	; 3
	.db #0x02	; 2
	.db #0x01	; 1
	.db #0x08	; 8
	.db #0x07	; 7
	.db #0x26	; 38
	.db #0x19	; 25
	.db #0x1e	; 30
	.db #0xe1	; 225
	.db #0xfe	; 254
	.db #0x01	; 1
	.db #0xfe	; 254
	.db #0x01	; 1
	.db #0x80	; 128
	.db #0x7e	; 126
	.db #0x70	; 112	'p'
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0xf7	; 247
	.db #0x00	; 0
	.db #0xf7	; 247
	.db #0x00	; 0
	.db #0xf7	; 247
	.db #0xb2	; 178
	.db #0x45	; 69	'E'
	.db #0x12	; 18
	.db #0xe5	; 229
	.db #0x08	; 8
	.db #0xe7	; 231
	.db #0x20	; 32
	.db #0x0f	; 15
	.db #0x20	; 32
	.db #0x0f	; 15
	.db #0x00	; 0
	.db #0x1f	; 31
	.db #0x00	; 0
	.db #0x1f	; 31
	.db #0x00	; 0
	.db #0x1f	; 31
	.db #0x20	; 32
	.db #0x1f	; 31
	.db #0x20	; 32
	.db #0x1f	; 31
	.db #0x08	; 8
	.db #0x37	; 55	'7'
	.db #0x4c	; 76	'L'
	.db #0x33	; 51	'3'
	.db #0x0e	; 14
	.db #0x71	; 113	'q'
;./skits/skit_start.h:19: void load_skit_start_screen(void) {
;	---------------------------------
; Function load_skit_start_screen
; ---------------------------------
_load_skit_start_screen::
;./skits/skit_start.h:21: printf(" "); // Asegura que la fuente se cargue en la VRAM
	ld	de, #___str_3
	push	de
	call	_printf
	pop	hl
;./skits/skit_start.h:23: DISPLAY_ON;     // Enciende la pantalla
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x80
	ldh	(_LCDC_REG + 0), a
;./skits/skit_start.h:24: SHOW_BKG;       // Muestra el fondo
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x01
	ldh	(_LCDC_REG + 0), a
;./skits/skit_start.h:25: SHOW_SPRITES;   // Mostrar los sprites
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x02
	ldh	(_LCDC_REG + 0), a
;./skits/skit_start.h:30: load_48_x_48_sprite(0, skit_arche_normal_48x48_sprite, center_x, center_y);
	ld	hl, #0x2440
	push	hl
	ld	de, #_skit_arche_normal_48x48_sprite
	xor	a, a
	call	_load_48_x_48_sprite
;./skits/skit_start.h:31: slide_metasprite_to_center(0, 0, center_y, center_x, center_y, 2); // Empieza fuera de pantalla y se centra
	ld	hl, #0x224
	push	hl
	ld	hl, #0x4024
	push	hl
	xor	a, a
	ld	e, a
	call	_slide_metasprite_to_center
;./skits/skit_start.h:34: while (1) {
00105$:
;./skits/skit_start.h:36: uint16_t dialog_finished = display_text_box("Zip zib zib bla bla bla blebleble glorp glorp glorb.", 0, 0);
	ld	de, #0x0000
	push	de
	ld	bc, #0x0000
	ld	de, #___str_2
	call	_display_text_box
	ld	c, a
;./skits/skit_start.h:37: wait_vbl_done(); // Sincronización con el hardware
	call	_wait_vbl_done
;./skits/skit_start.h:39: if (dialog_finished && wait_for_any_button()) {
	ld	a, c
	or	a, a
	jr	Z, 00102$
	call	_wait_for_any_button
	or	a, a
	jr	Z, 00102$
;./skits/skit_start.h:40: hide_all_sprites();             // Oculta todos los sprites antes de comenzar el juego
	call	_hide_all_sprites
;./skits/skit_start.h:41: fill_bkg_rect(0, 0, 20, 18, 0); // Limpia el fondo de la pantalla de inicio
	xor	a, a
	ld	h, a
	ld	l, #0x12
	push	hl
	ld	a, #0x14
	push	af
	inc	sp
	xor	a, a
	rrca
	push	af
	call	_fill_bkg_rect
	add	sp, #5
;./skits/skit_start.h:42: HIDE_BKG;                       // Opcional: oculta el fondo si no lo necesitas en el juego
	ldh	a, (_LCDC_REG + 0)
	and	a, #0xfe
	ldh	(_LCDC_REG + 0), a
;./skits/skit_start.h:43: HIDE_SPRITES;                   // Opcional: oculta los sprites de la pantalla de inicio
	ldh	a, (_LCDC_REG + 0)
	and	a, #0xfd
	ldh	(_LCDC_REG + 0), a
;./skits/skit_start.h:44: DISPLAY_OFF;                    // Apaga la pantalla para preparar el juego
	call	_display_off
;./skits/skit_start.h:45: clear_vram();
;./skits/skit_start.h:46: break;
	jp	_clear_vram
00102$:
;./skits/skit_start.h:48: delay(100); // Pequeño retraso para reducir el uso de CPU
	ld	de, #0x0064
	call	_delay
;./skits/skit_start.h:50: }
	jr	00105$
___str_2:
	.ascii "Zip zib zib bla bla bla blebleble glorp glorp glorb."
	.db 0x00
___str_3:
	.ascii " "
	.db 0x00
;./level_start/level_start_screen.h:18: void load_level_start_screen(void) {
;	---------------------------------
; Function load_level_start_screen
; ---------------------------------
_load_level_start_screen::
;./level_start/level_start_screen.h:20: printf(" "); // Asegura que la fuente se cargue en la VRAM
	ld	de, #___str_6
	push	de
	call	_printf
	pop	hl
;./level_start/level_start_screen.h:22: DISPLAY_ON;     // Enciende la pantalla
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x80
	ldh	(_LCDC_REG + 0), a
;./level_start/level_start_screen.h:23: SHOW_BKG;       // Muestra el fondo
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x01
	ldh	(_LCDC_REG + 0), a
;./level_start/level_start_screen.h:24: SHOW_SPRITES;   // Mostrar los sprites
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x02
	ldh	(_LCDC_REG + 0), a
;./level_start/level_start_screen.h:34: while (1) {
00105$:
;./level_start/level_start_screen.h:37: uint16_t dialog_finished = display_text_box("Hello %s, your score is %d.", "CHUCK", 999); // no funciona con argumentos %s %d
	ld	de, #0x03e7
	push	de
	ld	bc, #___str_5
	ld	de, #___str_4
	call	_display_text_box
	ld	c, a
;./level_start/level_start_screen.h:39: wait_vbl_done(); // Sincronización con el hardware
	call	_wait_vbl_done
;./level_start/level_start_screen.h:41: if (dialog_finished && wait_for_any_button()) {
	ld	a, c
	or	a, a
	jr	Z, 00102$
	call	_wait_for_any_button
	or	a, a
	jr	Z, 00102$
;./level_start/level_start_screen.h:43: hide_all_sprites();             // Oculta todos los sprites antes de comenzar el juego
	call	_hide_all_sprites
;./level_start/level_start_screen.h:44: fill_bkg_rect(0, 0, 20, 18, 0); // Limpia el fondo de la pantalla de inicio
	xor	a, a
	ld	h, a
	ld	l, #0x12
	push	hl
	ld	a, #0x14
	push	af
	inc	sp
	xor	a, a
	rrca
	push	af
	call	_fill_bkg_rect
	add	sp, #5
;./level_start/level_start_screen.h:45: HIDE_BKG;                       // Opcional: oculta el fondo si no lo necesitas en el juego
	ldh	a, (_LCDC_REG + 0)
	and	a, #0xfe
	ldh	(_LCDC_REG + 0), a
;./level_start/level_start_screen.h:46: HIDE_SPRITES;                   // Opcional: oculta los sprites de la pantalla de inicio
	ldh	a, (_LCDC_REG + 0)
	and	a, #0xfd
	ldh	(_LCDC_REG + 0), a
;./level_start/level_start_screen.h:47: DISPLAY_OFF;                    // Apaga la pantalla para preparar el juego
	call	_display_off
;./level_start/level_start_screen.h:48: clear_vram();
;./level_start/level_start_screen.h:49: break;
	jp	_clear_vram
00102$:
;./level_start/level_start_screen.h:61: delay(100); // Pequeño retraso para reducir el uso de CPU
	ld	de, #0x0064
	call	_delay
;./level_start/level_start_screen.h:63: }
	jr	00105$
___str_4:
	.ascii "Hello %s, your score is %d."
	.db 0x00
___str_5:
	.ascii "CHUCK"
	.db 0x00
___str_6:
	.ascii " "
	.db 0x00
;./maps/generate_map.h:26: void load_tilemaps(const uint8_t tileset_size, const uint8_t *tileset, const uint8_t *background_tilemap) {
;	---------------------------------
; Function load_tilemaps
; ---------------------------------
_load_tilemaps::
;./maps/generate_map.h:27: set_bkg_data(0, tileset_size, tileset);           // Carga el tileset que contiene gráficos comunes
	push	de
	ld	h, a
	ld	l, #0x00
	push	hl
	call	_set_bkg_data
	add	sp, #4
;./maps/generate_map.h:28: set_bkg_tiles(0, 0, 20, 20, level_1_tilemap_bkg); // Dibujar el mapa en la pantalla
	ld	de, #_level_1_tilemap_bkg
	push	de
	ld	hl, #0x1414
	push	hl
	xor	a, a
	rrca
	push	af
	call	_set_bkg_tiles
	add	sp, #6
;./maps/generate_map.h:29: }
	pop	hl
	pop	af
	jp	(hl)
_arche_level_1_background:
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x08	; 8
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x09	; 9
	.db #0x0b	; 11
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x0c	; 12
	.db #0x1d	; 29
	.db #0x0d	; 13
	.db #0x0a	; 10
	.db #0x09	; 9
	.db #0x0b	; 11
	.db #0x0c	; 12
	.db #0x1d	; 29
	.db #0x0d	; 13
	.db #0x0a	; 10
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
_level_1_tilemap_bkg:
	.db #0x04	; 4
	.db #0x06	; 6
	.db #0x04	; 4
	.db #0x06	; 6
	.db #0x04	; 4
	.db #0x06	; 6
	.db #0x04	; 4
	.db #0x06	; 6
	.db #0x04	; 4
	.db #0x06	; 6
	.db #0x04	; 4
	.db #0x06	; 6
	.db #0x04	; 4
	.db #0x06	; 6
	.db #0x04	; 4
	.db #0x06	; 6
	.db #0x04	; 4
	.db #0x06	; 6
	.db #0x04	; 4
	.db #0x06	; 6
	.db #0x05	; 5
	.db #0x07	; 7
	.db #0x05	; 5
	.db #0x07	; 7
	.db #0x05	; 5
	.db #0x07	; 7
	.db #0x05	; 5
	.db #0x07	; 7
	.db #0x05	; 5
	.db #0x07	; 7
	.db #0x05	; 5
	.db #0x07	; 7
	.db #0x05	; 5
	.db #0x07	; 7
	.db #0x05	; 5
	.db #0x07	; 7
	.db #0x05	; 5
	.db #0x07	; 7
	.db #0x05	; 5
	.db #0x07	; 7
	.db #0x08	; 8
	.db #0x0a	; 10
	.db #0x08	; 8
	.db #0x0a	; 10
	.db #0x08	; 8
	.db #0x0a	; 10
	.db #0x08	; 8
	.db #0x0a	; 10
	.db #0x08	; 8
	.db #0x0a	; 10
	.db #0x08	; 8
	.db #0x0a	; 10
	.db #0x08	; 8
	.db #0x0a	; 10
	.db #0x08	; 8
	.db #0x0a	; 10
	.db #0x08	; 8
	.db #0x0a	; 10
	.db #0x08	; 8
	.db #0x0a	; 10
	.db #0x09	; 9
	.db #0x0b	; 11
	.db #0x09	; 9
	.db #0x0b	; 11
	.db #0x09	; 9
	.db #0x0b	; 11
	.db #0x09	; 9
	.db #0x0b	; 11
	.db #0x09	; 9
	.db #0x0b	; 11
	.db #0x09	; 9
	.db #0x0b	; 11
	.db #0x09	; 9
	.db #0x0b	; 11
	.db #0x09	; 9
	.db #0x0b	; 11
	.db #0x09	; 9
	.db #0x0b	; 11
	.db #0x09	; 9
	.db #0x0b	; 11
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x2c	; 44
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x27	; 39
	.db #0x21	; 33
	.db #0x23	; 35
	.db #0x29	; 41
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x2c	; 44
	.db #0x00	; 0
	.db #0x27	; 39
	.db #0x1f	; 31
	.db #0x27	; 39
	.db #0x31	; 49	'1'
	.db #0x2f	; 47
	.db #0x1f	; 31
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x38	; 56	'8'
	.db #0x31	; 49	'1'
	.db #0x31	; 49	'1'
	.db #0x31	; 49	'1'
	.db #0x31	; 49	'1'
	.db #0x36	; 54	'6'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x1d	; 29
	.db #0x31	; 49	'1'
	.db #0x2f	; 47
	.db #0x31	; 49	'1'
	.db #0x31	; 49	'1'
	.db #0x31	; 49	'1'
	.db #0x31	; 49	'1'
	.db #0x31	; 49	'1'
	.db #0x31	; 49	'1'
	.db #0x1f	; 31
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x12	; 18
	.db #0x12	; 18
	.db #0x12	; 18
	.db #0x12	; 18
	.db #0x12	; 18
	.db #0x12	; 18
	.db #0x12	; 18
	.db #0x12	; 18
	.db #0x12	; 18
	.db #0x12	; 18
	.db #0x12	; 18
	.db #0x12	; 18
	.db #0x12	; 18
	.db #0x12	; 18
	.db #0x12	; 18
	.db #0x12	; 18
	.db #0x12	; 18
	.db #0x12	; 18
	.db #0x12	; 18
	.db #0x12	; 18
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x4e	; 78	'N'
	.db #0x50	; 80	'P'
	.db #0x52	; 82	'R'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x4e	; 78	'N'
	.db #0x50	; 80	'P'
	.db #0x52	; 82	'R'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x4d	; 77	'M'
	.db #0x4f	; 79	'O'
	.db #0x51	; 81	'Q'
	.db #0x53	; 83	'S'
	.db #0x55	; 85	'U'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x4d	; 77	'M'
	.db #0x4f	; 79	'O'
	.db #0x51	; 81	'Q'
	.db #0x53	; 83	'S'
	.db #0x55	; 85	'U'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x58	; 88	'X'
	.db #0x5a	; 90	'Z'
	.db #0x5c	; 92
	.db #0x5e	; 94
	.db #0x60	; 96
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x58	; 88	'X'
	.db #0x5a	; 90	'Z'
	.db #0x5c	; 92
	.db #0x5e	; 94
	.db #0x60	; 96
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x5d	; 93
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x5d	; 93
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x5d	; 93
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x5d	; 93
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x5d	; 93
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x5d	; 93
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x5d	; 93
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x5d	; 93
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x5d	; 93
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
_level_1_tilemap_frg:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x4e	; 78	'N'
	.db #0x50	; 80	'P'
	.db #0x52	; 82	'R'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x4e	; 78	'N'
	.db #0x50	; 80	'P'
	.db #0x52	; 82	'R'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x4d	; 77	'M'
	.db #0x4f	; 79	'O'
	.db #0x51	; 81	'Q'
	.db #0x53	; 83	'S'
	.db #0x55	; 85	'U'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x4d	; 77	'M'
	.db #0x4f	; 79	'O'
	.db #0x51	; 81	'Q'
	.db #0x53	; 83	'S'
	.db #0x55	; 85	'U'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x58	; 88	'X'
	.db #0x5a	; 90	'Z'
	.db #0x5c	; 92
	.db #0x5e	; 94
	.db #0x60	; 96
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x58	; 88	'X'
	.db #0x5a	; 90	'Z'
	.db #0x5c	; 92
	.db #0x5e	; 94
	.db #0x60	; 96
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x5d	; 93
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x5d	; 93
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x5d	; 93
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x5d	; 93
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x5d	; 93
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x5d	; 93
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x5d	; 93
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x5d	; 93
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x5d	; 93
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
;./maps/generate_map.h:32: void start_background_scroll() {
;	---------------------------------
; Function start_background_scroll
; ---------------------------------
_start_background_scroll::
;./maps/generate_map.h:33: while (1) {
00102$:
;./maps/generate_map.h:35: bkg_scroll_x++; // Scroll horizontal (puedes cambiar a negativo para ir hacia la izquierda)
	ld	hl, #_bkg_scroll_x
	inc	(hl)
;./maps/generate_map.h:38: scroll_bkg(bkg_scroll_x, 0);
	ld	c, (hl)
;c:\gbdk\include\gb\gb.h:1392: SCX_REG+=x, SCY_REG+=y;
	ldh	a, (_SCX_REG + 0)
	add	a, c
	ldh	(_SCX_REG + 0), a
;./maps/generate_map.h:41: wait_vbl_done();
	call	_wait_vbl_done
;./maps/generate_map.h:43: }
	jr	00102$
;./maps/generate_map.h:46: void load_and_draw_background_foreground_map(uint8_t player_x, uint8_t player_y) {
;	---------------------------------
; Function load_and_draw_background_foreground_map
; ---------------------------------
_load_and_draw_background_foreground_map::
;./maps/generate_map.h:47: DISPLAY_OFF;
	call	_display_off
;./maps/generate_map.h:48: load_tilemaps(120, all_tilesets_sky_night_palmtrees, level_1_tilemap_bkg);
	ld	de, #_level_1_tilemap_bkg
	push	de
	ld	de, #_all_tilesets_sky_night_palmtrees
	ld	a, #0x78
	call	_load_tilemaps
;./maps/generate_map.h:49: DISPLAY_ON;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x80
	ldh	(_LCDC_REG + 0), a
;./maps/generate_map.h:50: start_background_scroll();
;./maps/generate_map.h:51: }
	jp	_start_background_scroll
;main.c:38: void main(void) {
;	---------------------------------
; Function main
; ---------------------------------
_main::
;main.c:39: DISPLAY_OFF;    // Apagar la pantalla
	call	_display_off
;main.c:40: HIDE_BKG;       // Oculta el fondo
	ldh	a, (_LCDC_REG + 0)
	and	a, #0xfe
	ldh	(_LCDC_REG + 0), a
;main.c:41: HIDE_SPRITES;   // Oculta los sprites
	ldh	a, (_LCDC_REG + 0)
	and	a, #0xfd
	ldh	(_LCDC_REG + 0), a
;main.c:43: load_128x128_full_screen(start_chuck_screen_sprite, 1, 0);  // Pantalla de inicio 1
	xor	a, a
	push	af
	inc	sp
	ld	a, #0x01
	ld	de, #_start_chuck_screen_sprite
	call	_load_128x128_full_screen
;main.c:44: load_128x128_full_screen(start_title_screen_sprite, 0, 1);  // Pantalla de inicio 2 (Press Start)
	ld	a, #0x01
	push	af
	inc	sp
	xor	a, a
	ld	de, #_start_title_screen_sprite
	call	_load_128x128_full_screen
;main.c:45: load_skit_start_screen();                                   // Muestra el skit de inicio
	call	_load_skit_start_screen
;main.c:49: DISPLAY_ON;   // Encender la pantalla
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x80
	ldh	(_LCDC_REG + 0), a
;main.c:50: SHOW_BKG;     // Mostrar el fondo
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x01
	ldh	(_LCDC_REG + 0), a
;main.c:51: SHOW_SPRITES; // Mostrar los sprites
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x02
	ldh	(_LCDC_REG + 0), a
;main.c:55: load_16_x_16_sprite(0, arche_sprite_tiles, player_x, player_y); // Carga el sprite de Arche para el gameplay
	ld	a, (#_player_y)
	ld	h, a
	ld	a, (#_player_x)
	ld	l, a
	push	hl
	ld	de, #_arche_sprite_tiles
	xor	a, a
	call	_load_16_x_16_sprite
;main.c:56: init_single_bullet();                                           // Inicializa sprite de proyectil disparo
	call	_init_single_bullet
;main.c:57: init_spread_bullets();                                          // Inicializa sprite de proyectil disparo
	call	_init_spread_bullets
;main.c:60: while (1) {
00114$:
;main.c:61: uint8_t input = joypad(); // Lee las entradas del control
	call	_joypad
	ld	c, a
;main.c:62: decrease_fire_delay();    // Reduce el retraso entre disparos
	push	bc
	call	_decrease_fire_delay
	pop	bc
;main.c:65: if (input & J_A) { fire_single_bullet(player_x, player_y); }
	bit	4, c
	jr	Z, 00102$
	push	bc
	ld	hl, #_player_y
	ld	e, (hl)
	ld	a, (#_player_x)
	call	_fire_single_bullet
	pop	bc
00102$:
;main.c:67: if (input & J_B) { fire_spread(player_x, player_y); }
	bit	5, c
	jr	Z, 00104$
	push	bc
	ld	hl, #_player_y
	ld	e, (hl)
	ld	a, (#_player_x)
	call	_fire_spread
	pop	bc
00104$:
;main.c:70: if (input & J_LEFT)   { player_x -= 2; }
	bit	1, c
	jr	Z, 00106$
	ld	hl, #_player_x
	ld	a, (hl)
	add	a, #0xfe
	ld	(hl), a
00106$:
;main.c:71: if (input & J_RIGHT)  { player_x += 2; }
	bit	0, c
	jr	Z, 00108$
	ld	hl, #_player_x
	ld	a, (hl)
	add	a, #0x02
	ld	(hl), a
00108$:
;main.c:72: if (input & J_UP)     { player_y -= 2; }
	bit	2, c
	jr	Z, 00110$
	ld	hl, #_player_y
	ld	a, (hl)
	add	a, #0xfe
	ld	(hl), a
00110$:
;main.c:73: if (input & J_DOWN)   { player_y += 2; }
	bit	3, c
	jr	Z, 00112$
	ld	hl, #_player_y
	ld	a, (hl)
	add	a, #0x02
	ld	(hl), a
00112$:
;main.c:77: move_16_x_16_sprite(0, &player_x, &player_y); // Mueve el sprite de Arche a la nueva posición
	ld	de, #_player_y
	push	de
	ld	de, #_player_x
	xor	a, a
	call	_move_16_x_16_sprite
;main.c:78: update_single_bullet();                       // Actualiza el disparo
	call	_update_single_bullet
;main.c:79: update_spread_bullets();                      // Actualiza el disparo spread
	call	_update_spread_bullets
;main.c:80: delay(10);                                    // Retraso para suavizar el movimiento
	ld	de, #0x000a
	call	_delay
;main.c:81: wait_vbl_done();
	call	_wait_vbl_done
;main.c:83: }
	jr	00114$
	.area _CODE
	.area _INITIALIZER
__xinit__bullet_active:
	.db #0x00	; 0
__xinit__spread_bullet_active:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
__xinit__fire_delay:
	.db #0x00	; 0
__xinit__sprite_bin_len:
	.dw #0x1000
__xinit__start_chuck_screen_128x128_len:
	.dw #0x1000
__xinit__start_title_screen_128x128_len:
	.dw #0x1000
__xinit__press_start_tiles_len:
	.dw #0x0200
__xinit__press_start_88x16_len:
	.dw #0x0160
__xinit__press_start_64x16_tiles:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xf3	; 243
	.db #0x00	; 0
	.db #0xdb	; 219
	.db #0x00	; 0
	.db #0xdb	; 219
	.db #0x00	; 0
	.db #0xdb	; 219
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xe7	; 231
	.db #0x00	; 0
	.db #0x36	; 54	'6'
	.db #0x00	; 0
	.db #0x36	; 54	'6'
	.db #0x00	; 0
	.db #0xe7	; 231
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xce	; 206
	.db #0x00	; 0
	.db #0x19	; 25
	.db #0x00	; 0
	.db #0x18	; 24
	.db #0x00	; 0
	.db #0xde	; 222
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x70	; 112	'p'
	.db #0x00	; 0
	.db #0xc8	; 200
	.db #0x00	; 0
	.db #0xc0	; 192
	.db #0x00	; 0
	.db #0xf0	; 240
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x3b	; 59
	.db #0x00	; 0
	.db #0x64	; 100	'd'
	.db #0x00	; 0
	.db #0x60	; 96
	.db #0x00	; 0
	.db #0x78	; 120	'x'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xf3	; 243
	.db #0x00	; 0
	.db #0xc3	; 195
	.db #0x00	; 0
	.db #0xc7	; 199
	.db #0x00	; 0
	.db #0xc4	; 196
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x1f	; 31
	.db #0x00	; 0
	.db #0x19	; 25
	.db #0x00	; 0
	.db #0x99	; 153
	.db #0x00	; 0
	.db #0x9f	; 159
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x3f	; 63
	.db #0x00	; 0
	.db #0x8c	; 140
	.db #0x00	; 0
	.db #0x8c	; 140
	.db #0x00	; 0
	.db #0x0c	; 12
	.db #0x00	; 0
	.db #0xf3	; 243
	.db #0x00	; 0
	.db #0xc3	; 195
	.db #0x00	; 0
	.db #0xc3	; 195
	.db #0x00	; 0
	.db #0xc3	; 195
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x66	; 102	'f'
	.db #0x00	; 0
	.db #0x36	; 54	'6'
	.db #0x00	; 0
	.db #0x36	; 54	'6'
	.db #0x00	; 0
	.db #0x37	; 55	'7'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x0f	; 15
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x13	; 19
	.db #0x00	; 0
	.db #0xce	; 206
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x78	; 120	'x'
	.db #0x00	; 0
	.db #0x18	; 24
	.db #0x00	; 0
	.db #0x98	; 152
	.db #0x00	; 0
	.db #0x70	; 112	'p'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x3c	; 60
	.db #0x00	; 0
	.db #0x0c	; 12
	.db #0x00	; 0
	.db #0x4c	; 76	'L'
	.db #0x00	; 0
	.db #0x38	; 56	'8'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xcc	; 204
	.db #0x00	; 0
	.db #0xcf	; 207
	.db #0x00	; 0
	.db #0xcc	; 204
	.db #0x00	; 0
	.db #0xcc	; 204
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xdb	; 219
	.db #0x00	; 0
	.db #0xd9	; 217
	.db #0x00	; 0
	.db #0xd9	; 217
	.db #0x00	; 0
	.db #0xd9	; 217
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x0c	; 12
	.db #0x00	; 0
	.db #0x8c	; 140
	.db #0x00	; 0
	.db #0x8c	; 140
	.db #0x00	; 0
	.db #0x8c	; 140
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
__xinit__press_start_64x16_tiles_len:
	.dw #0x0100
__xinit__skit_arche_normal_48x48_bin_len:
	.dw #0x0240
__xinit__foreground_tilemap_positions:
	.db #0x00	; 0
	.db #0x50	; 80	'P'
	.db #0x08	; 8
	.db #0x50	; 80	'P'
	.db #0x10	; 16
	.db #0x50	; 80	'P'
	.db #0x18	; 24
	.db #0x50	; 80	'P'
	.db #0x20	; 32
	.db #0x50	; 80	'P'
	.db #0x28	; 40
	.db #0x50	; 80	'P'
	.db #0x30	; 48	'0'
	.db #0x50	; 80	'P'
	.db #0x38	; 56	'8'
	.db #0x50	; 80	'P'
	.db #0x40	; 64
	.db #0x50	; 80	'P'
	.db #0x48	; 72	'H'
	.db #0x50	; 80	'P'
	.db #0x50	; 80	'P'
	.db #0x50	; 80	'P'
	.db #0x58	; 88	'X'
	.db #0x50	; 80	'P'
	.db #0x60	; 96
	.db #0x50	; 80	'P'
	.db #0x68	; 104	'h'
	.db #0x50	; 80	'P'
	.db #0x70	; 112	'p'
	.db #0x50	; 80	'P'
	.db #0x78	; 120	'x'
	.db #0x50	; 80	'P'
	.db #0x80	; 128
	.db #0x50	; 80	'P'
	.db #0x88	; 136
	.db #0x50	; 80	'P'
	.db #0x90	; 144
	.db #0x50	; 80	'P'
	.db #0x98	; 152
	.db #0x50	; 80	'P'
	.db #0x00	; 0
	.db #0x58	; 88	'X'
	.db #0x08	; 8
	.db #0x58	; 88	'X'
	.db #0x10	; 16
	.db #0x58	; 88	'X'
	.db #0x18	; 24
	.db #0x58	; 88	'X'
	.db #0x20	; 32
	.db #0x58	; 88	'X'
	.db #0x28	; 40
	.db #0x58	; 88	'X'
	.db #0x30	; 48	'0'
	.db #0x58	; 88	'X'
	.db #0x38	; 56	'8'
	.db #0x58	; 88	'X'
	.db #0x40	; 64
	.db #0x58	; 88	'X'
	.db #0x48	; 72	'H'
	.db #0x58	; 88	'X'
	.db #0x50	; 80	'P'
	.db #0x58	; 88	'X'
	.db #0x58	; 88	'X'
	.db #0x58	; 88	'X'
	.db #0x60	; 96
	.db #0x58	; 88	'X'
	.db #0x68	; 104	'h'
	.db #0x58	; 88	'X'
	.db #0x70	; 112	'p'
	.db #0x58	; 88	'X'
	.db #0x78	; 120	'x'
	.db #0x58	; 88	'X'
	.db #0x80	; 128
	.db #0x58	; 88	'X'
	.db #0x88	; 136
	.db #0x58	; 88	'X'
	.db #0x90	; 144
	.db #0x58	; 88	'X'
	.db #0x98	; 152
	.db #0x58	; 88	'X'
	.db #0x00	; 0
	.db #0x60	; 96
	.db #0x08	; 8
	.db #0x60	; 96
	.db #0x10	; 16
	.db #0x60	; 96
	.db #0x18	; 24
	.db #0x60	; 96
	.db #0x20	; 32
	.db #0x60	; 96
	.db #0x28	; 40
	.db #0x60	; 96
	.db #0x30	; 48	'0'
	.db #0x60	; 96
	.db #0x38	; 56	'8'
	.db #0x60	; 96
	.db #0x40	; 64
	.db #0x60	; 96
	.db #0x48	; 72	'H'
	.db #0x60	; 96
	.db #0x50	; 80	'P'
	.db #0x60	; 96
	.db #0x58	; 88	'X'
	.db #0x60	; 96
	.db #0x60	; 96
	.db #0x60	; 96
	.db #0x68	; 104	'h'
	.db #0x60	; 96
	.db #0x70	; 112	'p'
	.db #0x60	; 96
	.db #0x78	; 120	'x'
	.db #0x60	; 96
	.db #0x80	; 128
	.db #0x60	; 96
	.db #0x88	; 136
	.db #0x60	; 96
	.db #0x90	; 144
	.db #0x60	; 96
	.db #0x98	; 152
	.db #0x60	; 96
	.db #0x00	; 0
	.db #0x68	; 104	'h'
	.db #0x08	; 8
	.db #0x68	; 104	'h'
	.db #0x10	; 16
	.db #0x68	; 104	'h'
	.db #0x18	; 24
	.db #0x68	; 104	'h'
	.db #0x20	; 32
	.db #0x68	; 104	'h'
	.db #0x28	; 40
	.db #0x68	; 104	'h'
	.db #0x30	; 48	'0'
	.db #0x68	; 104	'h'
	.db #0x38	; 56	'8'
	.db #0x68	; 104	'h'
	.db #0x40	; 64
	.db #0x68	; 104	'h'
	.db #0x48	; 72	'H'
	.db #0x68	; 104	'h'
	.db #0x50	; 80	'P'
	.db #0x68	; 104	'h'
	.db #0x58	; 88	'X'
	.db #0x68	; 104	'h'
	.db #0x60	; 96
	.db #0x68	; 104	'h'
	.db #0x68	; 104	'h'
	.db #0x68	; 104	'h'
	.db #0x70	; 112	'p'
	.db #0x68	; 104	'h'
	.db #0x78	; 120	'x'
	.db #0x68	; 104	'h'
	.db #0x80	; 128
	.db #0x68	; 104	'h'
	.db #0x88	; 136
	.db #0x68	; 104	'h'
	.db #0x90	; 144
	.db #0x68	; 104	'h'
	.db #0x98	; 152
	.db #0x68	; 104	'h'
	.db #0x00	; 0
	.db #0x70	; 112	'p'
	.db #0x08	; 8
	.db #0x70	; 112	'p'
	.db #0x10	; 16
	.db #0x70	; 112	'p'
	.db #0x18	; 24
	.db #0x70	; 112	'p'
	.db #0x20	; 32
	.db #0x70	; 112	'p'
	.db #0x28	; 40
	.db #0x70	; 112	'p'
	.db #0x30	; 48	'0'
	.db #0x70	; 112	'p'
	.db #0x38	; 56	'8'
	.db #0x70	; 112	'p'
	.db #0x40	; 64
	.db #0x70	; 112	'p'
	.db #0x48	; 72	'H'
	.db #0x70	; 112	'p'
	.db #0x50	; 80	'P'
	.db #0x70	; 112	'p'
	.db #0x58	; 88	'X'
	.db #0x70	; 112	'p'
	.db #0x60	; 96
	.db #0x70	; 112	'p'
	.db #0x68	; 104	'h'
	.db #0x70	; 112	'p'
	.db #0x70	; 112	'p'
	.db #0x70	; 112	'p'
	.db #0x78	; 120	'x'
	.db #0x70	; 112	'p'
	.db #0x80	; 128
	.db #0x70	; 112	'p'
	.db #0x88	; 136
	.db #0x70	; 112	'p'
	.db #0x90	; 144
	.db #0x70	; 112	'p'
	.db #0x98	; 152
	.db #0x70	; 112	'p'
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
__xinit__bkg_scroll_x:
	.db #0x00	; 0
__xinit__bkg_scroll_y:
	.db #0x00	; 0
__xinit__player_x:
	.db #0x14	; 20
__xinit__player_y:
	.db #0x4e	; 78	'N'
	.area _CABS (ABS)
