# Sistema de experiencia, niveles y vida

Este documento describe cómo ARCHE gana experiencia, sube de nivel, aumenta su
vida máxima, recibe daño y reaparece. La lógica vive en
`src/player_progress.h` (reglas) y `src/main.c` (estado y bucle de juego).

## Constantes base

Definidas en `src/player_progress.h`:

| Constante | Valor | Significado |
|---|---:|---|
| `PLAYER_LEVEL_CAP` | 99 | Nivel máximo alcanzable. |
| `PLAYER_HEALTH_CAP` | 7 | Vida máxima posible. |
| `PLAYER_START_HEALTH` | 3 | Vida (y vida máxima) al comenzar. |
| `PLAYER_INVULNERABILITY_TICKS` | 45 | Fotogramas de invulnerabilidad tras recibir daño o reaparecer. |
| `PLAYER_RESPAWN_TICKS` | 90 | Fotogramas de espera antes de reaparecer tras ser derrotado. |

Estado inicial en `src/main.c`:

```c
player_health          = PLAYER_START_HEALTH; // 3
player_max_health      = PLAYER_START_HEALTH; // 3
player_level           = 1;
player_xp              = 0;
player_xp_required     = 70;                  // coincide con nivel 1
```

## Experiencia necesaria por nivel

La XP requerida para subir del nivel `L` al siguiente se calcula en
`player_xp_required_for_level()`:

```
xp_required(L) = 40 + 20*L + 10*L²      (para L < 99)
xp_required(99) = 0                     (nivel tope)
```

La progresión es cuadrática, por lo que cada nivel exige bastante más que el
anterior. Valores de referencia:

| Nivel | XP para subir | Nivel | XP para subir |
|---:|---:|---:|---:|
| 1 | 70 | 10 | 1 240 |
| 2 | 120 | 25 | 6 790 |
| 3 | 190 | 50 | 26 040 |
| 4 | 280 | 80 | 65 640 |
| 5 | 390 | 98 | 98 040 |
| 6 | 520 | 99 | 0 (tope) |
| 7 | 670 | | |
| 8 | 840 | | |
| 9 | 1 030 | | |

## Ganar experiencia y subir de nivel

`award_enemy_experience(reward)` en `src/main.c`:

1. Ignora la recompensa si es `0` o si ya se está en el nivel tope.
2. Suma `reward` a `player_xp`.
3. Mientras `player_xp >= player_xp_required` y no se haya llegado al tope:
   - Resta la XP requerida, sube un nivel y recalcula la vida máxima.
   - Si la vida máxima aumentó, **cura al jugador** por la diferencia
     (`player_health += nueva_max - anterior`), limitado a la nueva máxima.
   - Recalcula la XP requerida para el nuevo nivel.
4. Al alcanzar el nivel tope (`PLAYER_LEVEL_CAP`), fija `player_xp = 0` y
   `player_xp_required = 0`.
5. Marca el HUD como sucio (`player_hud_dirty = 1`) para refrescarlo.

La XP sobrante **se acumula** para el siguiente nivel (el bucle `while` permite
subir varios niveles con una sola recompensa si esta es muy grande).

## Vida máxima por nivel

`player_max_health_for_level()` devuelve:

| Rango de nivel | Vida máxima |
|---|---:|
| 1 – 4 | 3 |
| 5 – 24 | 4 |
| 25 – 49 | 5 |
| 50 – 79 | 6 |
| 80 – 99 | 7 |

Al subir un nivel que cruce uno de estos umbrales, la vida actual aumenta en la
misma cantidad que la máxima (el jugador recibe los "corazones" nuevos llenos).

## Habilidades desbloqueadas por nivel

Se sincronizan con el nivel en `fire_update_skills()` (`src/actions/fire.h`),
invocada al iniciar, al subir de nivel y al reaparecer.

| Nivel | Habilidad | Efecto |
|---:|---|---|
| 10 (`PLAYER_SPREAD_SKILL_LEVEL`) | **Ataque spread** (botón B) | Dispara una ráfaga fija de **3 proyectiles** (uno recto, uno en diagonal arriba y otro abajo). Antes del nivel 10, B no hace nada. |
| 15 (`PLAYER_FAST_SPREAD_SKILL_LEVEL`) | **Fast spread** | Permite **spamear** B: se pueden lanzar ráfagas de 3 sin esperar a que los proyectiles anteriores salgan de pantalla, con un enfriamiento más corto (`FAST_SPREAD_FIRE_DELAY = 6` frente a `SPREAD_FIRE_DELAY = 10`). |

Reglas de disparo (`fire_spread`):

- Sin el spread desbloqueado, la función retorna sin hacer nada.
- Con el spread normal, solo se dispara si **los 3 proyectiles anteriores ya
  salieron**; así nunca se generan ráfagas incompletas al pulsar rápido.
- Al disparar siempre se lanzan **los 3 proyectiles juntos**, nunca de a uno.
- Con fast spread se omite la espera anterior y cada ráfaga reinicia el grupo de
  3 desde la posición del jugador.

## Recibir daño e invulnerabilidad

`damage_player(damage)` en `src/main.c`:

- Se ignora si el jugador es invulnerable o ya está derrotado.
- Resta `damage` a `player_health` (si `damage >= vida`, la vida queda en 0).
- Marca el HUD como sucio y activa `player_invulnerability =
  PLAYER_INVULNERABILITY_TICKS` (45 fotogramas).
- En el bucle principal la invulnerabilidad se decrementa cada fotograma; mientras
  está activa, el sprite del jugador parpadea (se oculta cuando
  `player_invulnerability & 4`) y no se comprueban colisiones contra él.

## Derrota y reaparición

Cuando la vida llega a 0 (`damage_player`):

- `player_defeated = 1` y `player_respawn_timer = PLAYER_RESPAWN_TICKS` (90).
- Se ocultan los sprites del jugador y se limpian los proyectiles del jugador.

El bucle principal congela el juego hasta que el temporizador llega a 0 y
entonces llama a `respawn_at_checkpoint()`, que:

- Restaura `player_level`, `player_xp` y `player_xp_required` desde el
  **checkpoint**.
- Recalcula la vida máxima del nivel restaurado y **rellena la vida al máximo**.
- Recoloca al jugador en `(20, 78)` y le da `PLAYER_INVULNERABILITY_TICKS` de
  invulnerabilidad.
- Reinicia enemigos (`level_1_enemies_init`) desde la oleada del checkpoint y
  resetea el scroll del cielo.
- Marca el HUD como sucio.

## Checkpoint

`PlayerCheckpoint` (en `src/player_progress.h`) guarda:

| Campo | Contenido |
|---|---|
| `stage` | Número de fase. |
| `level` | Nivel del jugador al guardar. |
| `stage_progress` | Oleada superada (`level_1_wave_number - 1`). |
| `xp_progress` | XP acumulada dentro del nivel actual. |

`save_player_checkpoint(stage)` se invoca en los puntos de control del guion
(por ejemplo al inicio de la misión). La vida **no** se guarda: al reaparecer
siempre se restaura al máximo del nivel.

## Visualización en el HUD

- **HUD de juego** (`src/ui/game_hud.h`): corazón + 7 segmentos de vida en
  `y=16`, y el bloque `LVL` + valor de 2 dígitos alineado a la derecha.
- **Pantalla de información** (botón SELECT): filas centradas con el nivel, la
  XP (`actual / requerida`) y la vida.

> Nota de hardware: la DMG/Game Boy solo puede mostrar 10 sprites por línea de
> barrido. El HUD reparte los elementos entre filas distintas (nivel en `y=48`,
> XP en `y=64`, vida en `y=80`) y mantiene cada fila en 10 sprites o menos para
> evitar que se recorten.
