# `gameplay_rally_compositors_styles_spanish_numbering_one_to_six`

*File: `lua/ge/extensions/gameplay/rally/compositors/styles/spanish/numbering/one_to_six.lua` · VM: Game Engine (GE) · 60 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `gameplay_rally_compositors_styles_spanish_numbering_one_to_six`: `extensions.load("gameplay_rally_compositors_styles_spanish_numbering_one_to_six")`, then the global `gameplay_rally_compositors_styles_spanish_numbering_one_to_six`

Shared Spanish corner numbering from 1 to 6: spoken texts (uno, dos, tres, cuatro, cinco, seis), physical diameter ranges (m), visuals with the BeamNG CSS palette (red550, orange, yellow400, peach300, blue500, green500) and arc length brackets (corta, standard without text, media larga, larga, extra larga). Used by spanish/enthusiast.

## Notes

- Diameters identical to the English version: [0,35[, [35,65[, [65,116[, [116,190[, [190,260[, [260,+inf[ m.
- The length thresholds differ slightly from English (e.g. four standard 35 to 80, five standard 42 to 90, .5 bounds for one and three).
- 'standard' has no text: nothing is said for a standard length.
- The module returns the table {id, intensity, lengthsByIntensity} directly.

## Fields

| Field | Type | Description |
|---|---|---|
| `id` | string | 'one_to_six'. |
| `intensity` | table[] | Six entries {id, text, diameter, visual} ordered from one to six. |
| `lengthsByIntensity` | table<string, table[]> | For each intensity, five brackets {id, text, arcMeters={min,max}} (short, standard, halfLong, long, extraLong). |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/gameplay/rally/compositors/styles/spanish/numbering/one_to_six.lua`.*
