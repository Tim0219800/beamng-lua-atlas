# `gameplay_rally_compositors_styles_spanish_enthusiast`

*File: `lua/ge/extensions/gameplay/rally/compositors/styles/spanish/enthusiast.lua` · VM: Game Engine (GE) · 121 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `gameplay_rally_compositors_styles_spanish_enthusiast`: `extensions.load("gameplay_rally_compositors_styles_spanish_enthusiast")`, then the global `gameplay_rally_compositors_styles_spanish_enthusiast`

Spanish rally note style ('Spanish enthusiast'): 1 to 6 numbering (uno to seis), 'izquierda'/'derecha' directions, shapes (se abre, se cierra...), descriptors (ka for square, horquilla, a fondo), cautions (cuidado, ojo, peligro), a reduced set of modifiers (frenando, freno, se estrecha, agua, salto, rasante, zona bacheada, con bache, no cortar, cruzar meta) and translated system notes. Defines its own distance configuration (links 'en' and 'para', 'punto' for the decimal point, max 5000 m) and its colors.

## Notes

- File WARNING: any change to a string requires regenerating the audio files.
- Distance links: < 10 m 'en', < 20 m 'para', < 25 m 'para' (two thresholds carry the same word).
- Base unit 'm', large unit 'km', decimal point 'punto'. Rounding: 10 m, 50 m (from 100 m), 250 m (from 1000 m).
- Caution levels: 1 'cuidado', 2 'ojo', 3 'peligro'; a single shared (red) visual, without levelVisuals.
- The system notes use systemPacenotes.localized directly from notebook/systemPacenotes.
- Shapes defined: opens, tightens, opensThenTightens, tightensThenOpens.

## Fields

| Field | Type | Description |
|---|---|---|
| `componentTypes` | table | corner (spanish/numbering/one_to_six numbering, direction, shapes, descriptors), caution and modifiers. |
| `composite` | function | compositorUtil.compositeFromPhrases. |
| `distance` | table | Spanish distance configuration {links, units, rounding, max=5000}. |
| `enumerate` | function | compositorUtil.enumerateConcise. |
| `system` | table | System notes in Spanish (precountdown 'Buena suerte!', countdown cinco..ya, seconds warnings, etc.). |
| `visualGeneral` | table | {intoColor, distanceColor} (visual note colors). |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/gameplay/rally/compositors/styles/spanish/enthusiast.lua`.*
