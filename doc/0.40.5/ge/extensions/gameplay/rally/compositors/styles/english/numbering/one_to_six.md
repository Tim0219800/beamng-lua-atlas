# `gameplay_rally_compositors_styles_english_numbering_one_to_six`

*File: `lua/ge/extensions/gameplay/rally/compositors/styles/english/numbering/one_to_six.lua` · VM: Game Engine (GE) · 65 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `gameplay_rally_compositors_styles_english_numbering_one_to_six`: `extensions.load("gameplay_rally_compositors_styles_english_numbering_one_to_six")`, then the global `gameplay_rally_compositors_styles_english_numbering_one_to_six`

Shared English corner numbering from 1 (very tight) to 6 (nearly flat), with for each level the spoken text, the physical diameter range (m), the visual (turn1 to turn6 icon, neon colors) and the arc length brackets (short, standard, half long, long, extra long). Used by english/enthusiast; the style files remain responsible for string and audio compatibility, this module serves newly composed styles and calibration tools.

## Notes

- Diameters (m): one [0,35[, two [35,65[, three [65,116[, four [116,190[, five [190,260[, six [260,+inf[.
- The length ids are the same for all levels (short, standard, halfLong, long, extraLong); 'standard' has no text (nothing is said).
- The file's comment asks not to modify the hand-tuned values (marked 'hand tuned') without consulting the author.
- arcMeters thresholds of 'short'/'standard': one 6/35, two 6/55, three 28/60, four 37/85, five 42/100, six 50/100.
- The module returns the table {id, intensity, lengthsByIntensity} directly.

## Fields

| Field | Type | Description |
|---|---|---|
| `id` | string | 'one_to_six'. |
| `intensity` | table[] | Six entries {id, text, diameter, visual} ordered from one to six. |
| `lengthsByIntensity` | table<string, table[]> | For each intensity id (one..six), five brackets {id, text, arcMeters={min,max}}; the last one (extraLong) has no max. |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/gameplay/rally/compositors/styles/english/numbering/one_to_six.lua`.*
