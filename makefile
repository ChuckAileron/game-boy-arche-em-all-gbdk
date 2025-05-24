# Ruta al compilador GBDK
GBDK_PATH = C:/GBDK
CC = $(GBDK_PATH)/bin/lcc

# Ruta de BGB
BGB_PATH = "C:\Users\Usuario\Documents\DEVELOPMENT\Resources\bgbw64\bgb64.exe"

# Archivos fuente y salida
SRC = main.c
OBJ = main.o
OUT = arche.gb

# Compilación del proyecto
all: $(OUT)

$(OUT): $(OBJ)
	$(CC) -Wa-l -Wl-m -Wl-j -DUSE_SFR_FOR_REG -o $(OUT) $(OBJ)

$(OBJ): $(SRC)
	$(CC) -Wa-l -Wl-m -Wl-j -DUSE_SFR_FOR_REG -c -o $(OBJ) $(SRC)

# Ejecuta BGB con la ROM generada
run: all
	$(BGB_PATH) $(OUT)

# Regla para limpieza
clean:
	del /q *.o *.lst *.map *.gb *.ihx *.noi