# Ruta al compilador GBDK
GBDK_PATH = C:/GBDK
CC = $(GBDK_PATH)/bin/lcc
ROM_FLAGS = -Wl-yt1 -Wl-yo4

# Ruta de BGB
BGB_PATH = "C:/Users/TECH/Documents/Proyectos DEV Resources/bgbw64/bgb64.exe"

# Archivos fuente y salidas de compilación
SRC = src/main.c
OBJ = build/level_1_enemy_assets.o build/main.o
OUT = build/arche.gb

# Compilación del proyecto
all: $(OUT)

build:
	mkdir -p build

# Generated level data is checked in under src/, so local assets/tools are not
# required for the ROM build.

$(OUT): $(OBJ)
	$(CC) -Wa-l -Wl-m -Wl-j $(ROM_FLAGS) -DUSE_SFR_FOR_REG -o $(OUT) $(OBJ)

build/main.o: $(SRC) src/enemies/level_1_enemies.h src/enemies/level_1_enemy_assets.h src/movement/sprite_movement.h src/player_progress.h src/ui/pause_overlay.h src/ui/game_hud.h src/maps/level_1_sky.h src/maps/level_1_cloud_data.h src/sprites/sprite_generate.h src/start/start_screen.h src/sprites/title_screen/start_screen_sprites.h src/sprites/texts/press_start_sprites.h | build
	$(CC) -Wa-l -Wl-m -Wl-j $(ROM_FLAGS) -DUSE_SFR_FOR_REG -c -o $@ $<

build/level_1_enemy_assets.o: src/enemies/level_1_enemy_assets.c src/enemies/level_1_enemy_assets.h src/enemies/level_1_enemy_data.h | build
	$(CC) -Wa-l -Wl-m -Wl-j $(ROM_FLAGS) -DUSE_SFR_FOR_REG -c -o $@ $<

# Ejecuta BGB con la ROM generada
run: all
	$(BGB_PATH) $(OUT)

# Regla para limpieza
clean:
	rm -f build/*
