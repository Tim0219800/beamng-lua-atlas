# `gameplay_rally_compositors_helpers_visualCompositor`

*File: `lua/ge/extensions/gameplay/rally/compositors/helpers/visualCompositor.lua` · VM: Game Engine (GE) · 283 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/gameplay/rally/compositors/helpers/visualCompositor")` (file under extensions/ but not a regular extension)

Visual rally note compositor: turns a structured note into a list (4 maximum) of 'visuals' for the visual notes UI app (turn icons turn1..turn6/turnHp/turnSq, caution/doubleCaution, atomic icons, modifiers, distance). It reads the visuals from the active style's componentTypes registry via the textCompositor, with the same order and the same rules as the text compositor (descriptor takes precedence over intensity, risk adjustment). Elements without a visual or of unknown type are ignored without error. The module returns a constructor: require(...)(textCompositor).

## Notes

- A 'turnModifier' or 'additionalNote' modifier attaches to the last corner visual already emitted; if there is none yet, it is held for the next corner.
- A corner visual carries: type (icon), turnModifier, colorNoteIcon, colorNoteText, background {color, strokeColor, opacity=1}, isLeft (direction == -1), size=2, turnTypeValue.
- caution: the icon is 'doubleCaution' if level >= 3, otherwise 'caution'.
- The first visual receives isInto/intoColor (the note is chained to the previous one if 0 < distance before < max distance of the links); the last receives distance and colorDistance (config.visualGeneral.distanceColor).
- Each visual receives id = '<note name with _>_<index>' and pnId = pacenote.id.
- If distAfterMeters > 0 and distance calls are enabled, config.visualGeneral must exist, otherwise an indexing error occurs (inferred from code).

## Class `C`

Visual compositor returned by the module constructor.

The module returns a constructor: `local obj = require("gameplay_rally_compositors_helpers_visualCompositor")(options)`.

| Method | Description | Line |
|---|---|---|
| `C:_getMaxLinkDistance()` | Maximum distance (threshold of the last link) below which two notes are chained ('into'). | 24 |
| `C:compositeVisual(pacenote, structured, distBeforeMeters, distAfterMeters)` | Builds the list of visuals for a structured note. | 204 |
| `C:init(textCompositor)` | Stores the text compositor whose configuration is read. | 20 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/gameplay/rally/compositors/helpers/visualCompositor.lua`.*
