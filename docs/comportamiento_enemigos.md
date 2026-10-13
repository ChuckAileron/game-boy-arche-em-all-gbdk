# Comportamiento de los enemigos

Existen dos implementaciones de enemigos en `src/enemies/`. La que usa el juego
actualmente es **`level_1_enemies.h`** (Wasp y Medusa del nivel 1), referenciada
desde `src/main.c`. `enemy_system.h` es un sistema genérico más amplio que
**no está conectado** al bucle de juego (ver la última sección).

Para el desglose de fotogramas y nombres de sprites, consulta
`docs/enemy_sprites.md`.

## Sistema activo: nivel 1 (`src/enemies/level_1_enemies.h`)

Cada oleada tiene **2 enemigos fijos**:

| Índice | Enemigo | Tipo de recompensa | XP | Daño por contacto |
|---:|---|---|---:|---:|
| 0 | Wasp (avispa) | `XP_IRON_WASP` | 20 | 1 |
| 1 | Medusa | `XP_GHOST_MEDUSA` | 24 | 1 |

Ambos mueren de **un solo proyectil** de Arche (`level_1_enemy_damage()` pasa
directamente al estado `DYING` y concede la XP una única vez).

### Sprites y tiles

- `LEVEL_1_ENEMY_COUNT = 2`, `ENEMY_SPRITES_PER_ENEMY = 4` (metasprite 16×16).
- Sprites OAM en `ENEMY_SPRITE_FIRST` (21) → ocupan 21–28.
- Tiles en `ENEMY_TILE_FIRST` (192), 4 por enemigo → 192–199.
- Los proyectiles usan `ENEMY_PROJECTILE_FIRST` (33).
- `level_1_enemy_render()` solo sube a VRAM los tiles cuando cambia de
  fotograma (`frame_loaded`/`rendered_*`) y usa la paleta `S_PALETTE` (OBP1).

### Animaciones y duración de fotograma

`level_1_enemy_frame_duration()` define los ticks por fotograma:

| Animación | Fotogramas | Duración por fotograma |
|---|---:|---|
| `FLYING` | 4 | 6 ticks |
| `ATTACKING` | 6 | `{8, 8, 6, 4, 6, 8}` |
| `HURT` | 2 | 4 ticks |
| `DYING` | 4 | 5 ticks |

Al terminar `DYING`, el enemigo se desactiva (`active = 0`). `HURT` y
`ATTACKING` vuelven a `FLYING` al acabar el ciclo. (En el nivel 1 `HURT` no se
llega a usar porque todo es muerte de un golpe.)

### Movimiento

Ambos aparecen a la derecha, fuera de pantalla (`x = 164` y `x = 172`), y
avanzan hacia la izquierda.

- **Wasp**: se desplaza en horizontal mientras `x > 92`. Cada 8 ticks sube o
  baja 2 px según `direction`. Rebota entre `y < 32` (baja) e `y > 112` (sube).
- **Medusa**: se desplaza en horizontal mientras `x > 112`. Cada 8 ticks sigue
  la altura del jugador: sube si está por encima, baja si está por debajo
  (manteniéndose aproximadamente a la altura del jugador, entre `y = 24` y
  `y = 120`).

### Generación de oleadas (`level_1_start_wave`)

- Cada disparo de oleada incrementa `level_1_wave_number` y coloca a ambos
  enemigos con dirección alternante: `wasp.direction = oleada & 1`,
  `medusa.direction = (oleada >> 1) & 1`.
- Posición vertical:
  - Oleada 0: Wasp `y = 44`, Medusa `y = 92`.
  - Oleadas siguientes: Wasp `y = 28 + ((oleada * 37) % 80)`,
    Medusa `y = 32 + ((oleada * 53) % 80)`.
- Cuando **ambos** enemigos están inactivos, se arranca un temporizador de
  **90 fotogramas** (`level_1_respawn_timer`) y, al agotarse, comienza la
  siguiente oleada.
- `level_1_enemies_init(starting_wave)` arranca la oleada indicada; se usa al
  inicio (`0`) y al reaparecer desde un checkpoint (`stage_progress`).

### Ataque

`enemy_update()` acumula `attack_tick` y dispara al alcanzar el periodo:

| Enemigo | Periodo de ataque |
|---|---:|
| Wasp | 110 ticks |
| Medusa | 145 ticks |

- **Wasp**: dispara un proyectil **recto** hacia la izquierda (`dy = 0`).
- **Medusa**: dispara **dos proyectiles en diagonal** a la vez (uno hacia
  arriba, `dy = -1`, y otro hacia abajo, `dy = 1`); nunca dispara recto hacia el
  sprite del jugador.

Los proyectiles salen desde `(enemy.x, enemy.y + 8)`.

### Proyectiles enemigos

- Máximo `ENEMY_PROJECTILE_COUNT = 4` proyectiles simultáneos (8×8).
- Velocidad: `dx = -1`, `dy` según el enemigo. Daño: 1.
- Se desactivan al salir de pantalla (`x < 8`, `y < 8` o `y > 152`).
- `level_1_spawn_shot()` reutiliza el primer slot libre.

### Colisiones

| Función | Cajas | Efecto |
|---|---|---|
| `level_1_player_shot_collision` | Disparo 8×8 vs enemigo 16×16 | Mata al enemigo y devuelve su XP (una vez). |
| `level_1_enemy_projectile_collision` | Proyectil 8×8 vs jugador 16×16 | Devuelve el daño del proyectil y lo desactiva. |
| `level_1_enemy_body_collision` | Enemigo 16×16 vs jugador 16×16 | Devuelve el daño por contacto (1). |

El enemigo solo es vulnerable si está activo y **no** está en `DYING`.

### Pausa e info

- `level_1_enemies_hide()` oculta los sprites de enemigos y proyectiles y marca
  los tiles como "sucios" para que se vuelvan a dibujar al reanudar. Se llama al
  pausar y al abrir la pantalla de información (SELECT).
- Según el código, el overlay de pausa **toma prestadas temporalmente** las
  entradas OAM 21–26.

## Tabla completa de recompensas de XP

`level_1_enemy_reward(kind)` mapea los tipos de recompensa a su valor:

| Recompensa | XP |
|---|---:|
| `XP_BAT_NEEDLE` | 8 |
| `XP_WINGED_EYE` | 12 |
| `XP_BLADE_CROW` | 16 |
| `XP_IRON_WASP` | 20 |
| `XP_GHOST_MEDUSA` | 24 |
| `XP_SENTINEL_DRONE` | 40 |
| `XP_EMBER_DRACO` | 48 |
| `XP_VESPER` | 160 |
| `XP_WASP_QUEEN` | 280 |

El nivel 1 solo usa `XP_IRON_WASP` y `XP_GHOST_MEDUSA`; el resto queda
preparado para enemigos de fases futuras.

## Sistema genérico no conectado (`src/enemies/enemy_system.h`)

Define 6 tipos de enemigos con metasprites **32×32** (16 tiles) y sistema de
vida propio. **No se incluye desde `src/main.c`**; se documenta aquí por
completitud:

| Tipo | Nombre | Vida |
|---|---|---:|
| `ENEMY_DRONE` | Drone | 4 |
| `ENEMY_DRACO` | Draco | 3 |
| `ENEMY_WASP` | Wasp | 2 |
| `ENEMY_MEDUSA` | Medusa | 3 |
| `ENEMY_BAT` | Bat | 2 |
| `ENEMY_WINGED_EYE` | Winged Eye | 2 |

El **Drone** es metálico y usa un ataque en abanico (spread), por lo que tiene
**más vida (4)** que los enemigos normales (2) y que Draco/Medusa (3), y otorga
**más XP (`XP_SENTINEL_DRONE`, 40)** que los enemigos normales de la tabla.

Características: animaciones `flying/attacking/hurt/dying` de 4/6/2/4
fotogramas (8 ticks por fotograma), patrones de movimiento por tipo (avance con
oscilación, arco descendente, picado diagonal, seguimiento del jugador,
zig-zag, patrulla oscilante) y proyectiles `NORMAL`/`SPREAD`/`FLAME`. Draco
dispara una llama de 8×8; Drone combina disparo recto con ráfagas de tres vías
poco frecuentes. Las recompensas de XP de la tabla anterior están pensadas para
estos nombres.
