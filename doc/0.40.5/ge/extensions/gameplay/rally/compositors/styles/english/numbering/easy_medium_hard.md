# `gameplay_rally_compositors_styles_english_numbering_easy_medium_hard`

*File: `lua/ge/extensions/gameplay/rally/compositors/styles/english/numbering/easy_medium_hard.lua` · VM: Game Engine (GE) · 13 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `gameplay_rally_compositors_styles_english_numbering_easy_medium_hard`: `extensions.load("gameplay_rally_compositors_styles_english_numbering_easy_medium_hard")`, then the global `gameplay_rally_compositors_styles_english_numbering_easy_medium_hard`

Shared English corner numbering in three levels: hard, medium, easy. Each level gives the spoken text, the measured physical diameter range (m) and the visual (corner icon, colors). Used by the english/casual style.

## Notes

- Diameter ranges: hard [0, 65[, medium [65, 190[, easy [190, +inf[; they correspond to the turn1, turn3 and turn6 icons.
- No lengthsByIntensity: this system defines no lengths.
- The module returns the table {id, intensity} directly; ranges can be recalibrated per mission via calibrationOverrides.

## Fields

| Field | Type | Description |
|---|---|---|
| `id` | string | System identifier: 'easy_medium_hard' (copied into corner.numberingSystem). |
| `intensity` | table[] | Three entries {id, text, diameter={min,max}, visual={icon, text, colorBg, colorStroke, ...}}, from the tightest (hard, red) to the most open (easy, green). |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/gameplay/rally/compositors/styles/english/numbering/easy_medium_hard.lua`.*
