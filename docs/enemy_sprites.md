# Sprites y comportamiento de los enemigos

Cada hoja de enemigo es una tira horizontal de 16 fotogramas de metasprites de
32x32. Los índices de fotograma empiezan en cero y los grupos de animación son
consistentes entre los seis enemigos:

| Fotogramas | Animación | Nº de fotogramas |
|---|---|---:|
| 0-3 | `flying` | 4 |
| 4-9 | `attacking` | 6 |
| 10-11 | `hurt` | 2 |
| 12-15 | `death` | 4 |

Nombres de los enemigos (en inglés) y sus carpetas de assets de origen:

| Nombre | Carpeta de sprites |
|---|---|
| `Drone` | `dron` |
| `Draco` | `dragon` |
| `Wasp` | `avispa` |
| `Medusa` | `medusa` |
| `Bat` | `murcielago` |
| `Winged Eye` | `ojo_alado` |

`src/enemies/enemy_system.h` asigna los arreglos de origen a los identificadores
en inglés de los enemigos y proporciona la selección de fotograma de animación,
patrones de movimiento y ataque distintos, transiciones de daño/muerte y el
estado de los proyectiles enemigos. Drone usa disparos simples al estilo de
Arche con ráfagas de tres vías ocasionales; Draco dispara un único proyectil de
llama de 8x8. Por ser metálico y usar ataque en abanico, Drone tiene más vida
que los enemigos normales.
