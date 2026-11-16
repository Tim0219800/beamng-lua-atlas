# `gameplay_rally_compositors_styles_english_enthusiast`

*File: `lua/ge/extensions/gameplay/rally/compositors/styles/english/enthusiast.lua` · VM: Game Engine (GE) · 71 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `gameplay_rally_compositors_styles_english_enthusiast`: `extensions.load("gameplay_rally_compositors_styles_english_enthusiast")`, then the global `gameplay_rally_compositors_styles_english_enthusiast`

Rally note style 'English enthusiast': full English co-driver, with 1 to 6 numbering (one_to_six), distance calls enabled (english/distance), corner lengths, shapes (opens, tightens, over crest, etc.), descriptors (flat, square, hairpin, open/tight hairpin, bare), cautions and all the modifiers of the english/modifiers file. Assembles the modules of the english folder; M.composite and M.enumerate point to compositorUtil.

## Notes

- File WARNING: any change to a string used for a note requires regenerating the audio files.
- The 'bare' descriptor has an empty text: it is used to call a corner without an intensity word (label 'bare').
- Shapes: opens, tightens, opensOverCrest, opensAndTightens, overCrest (variant '2'), tightensDown, tightensOverCrest, tightensAndOpens; some have no visual.
- Fields are documented as read by textCompositor and styleValidator; validation is done at load time.

## Fields

| Field | Type | Description |
|---|---|---|
| `componentTypes` | table | corner (one_to_six numbering, left/right direction, shapes, descriptors), caution (english/caution) and modifiers (english/modifiers). |
| `composite` | function | compositorUtil.compositeFromPhrases. |
| `distance` | table | Distance config (english/distance), distance calls enabled. |
| `enumerate` | function | compositorUtil.enumerateConcise. |
| `system` | table | Localized system notes (english/systemPacenotes). |
| `visualGeneral` | table | General colors of the visual notes (english/visual). |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/gameplay/rally/compositors/styles/english/enthusiast.lua`.*
