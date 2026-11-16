# `gameplay_rally_compositors_styles_english_caution`

*File: `lua/ge/extensions/gameplay/rally/compositors/styles/english/caution.lua` · VM: Game Engine (GE) · 19 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `gameplay_rally_compositors_styles_english_caution`: `extensions.load("gameplay_rally_compositors_styles_english_caution")`, then the global `gameplay_rally_compositors_styles_english_caution`

'caution' component shared by the English styles: texts of the three warning levels ('care', 'caution', 'double caution') and colors of the matching visual notes (background, outline, icon, text) taken from compositors/helpers/colors.

## Notes

- The module returns the table {levels, levelVisuals} directly (no M).
- visualCompositor picks the 'doubleCaution' icon for level >= 3, otherwise 'caution'.

## Fields

| Field | Type | Description |
|---|---|---|
| `levelVisuals` | table<integer, table> | Colors per level: {colorBg, colorStroke, colorNoteIcon, colorNoteText}. Level 1 yellow on black, levels 2 and 3 red on black. |
| `levels` | table<integer, string> | Spoken text per level: [1]='care', [2]='caution', [3]='double caution'. |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/gameplay/rally/compositors/styles/english/caution.lua`.*
