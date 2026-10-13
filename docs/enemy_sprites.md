# Enemy sprites and behavior

Each enemy sheet is a horizontal 16-frame strip of 32x32 metasprites. Frame
indices are zero-based and the animation groups are consistent across all six
enemies:

| Frames | Animation | Frame count |
|---|---|---:|
| 0-3 | `flying` | 4 |
| 4-9 | `attacking` | 6 |
| 10-11 | `hurt` | 2 |
| 12-15 | `death` | 4 |

English game names and their source asset folders:

| Game name | Sprite folder |
|---|---|
| `Drone` | `dron` |
| `Draco` | `dragon` |
| `Wasp` | `avispa` |
| `Medusa` | `medusa` |
| `Bat` | `murcielago` |
| `Winged Eye` | `ojo_alado` |

`src/enemies/enemy_system.h` maps the source arrays to English game
identifiers and provides animation-frame selection, distinct movement/attack
patterns, damage/death transitions, and enemy projectile state. Drone uses
Arche-style single shots with occasional three-way spread; Draco fires a single
8x8 flame projectile.
