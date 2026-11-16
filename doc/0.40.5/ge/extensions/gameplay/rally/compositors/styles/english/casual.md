# `gameplay_rally_compositors_styles_english_casual`

*File: `lua/ge/extensions/gameplay/rally/compositors/styles/english/casual.lua` · VM: Game Engine (GE) · 115 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `gameplay_rally_compositors_styles_english_casual`: `extensions.load("gameplay_rally_compositors_styles_english_casual")`, then the global `gameplay_rally_compositors_styles_english_casual`

Rally note style 'English casual': a simplified English co-driver that calls corners as 'easy / medium / hard' (easy_medium_hard numbering) plus the flat, square and hairpin descriptors. It speaks no distance calls (distance.callsEnabled = false), no lengths and no corner shapes. It uses only a subset of modifiers (jumps, crests, splashes, surface changes, stop/finish, chicanes) and aliases that map the other variants to those modifiers. Reuses the distance, visual, caution, systemPacenotes and modifiers modules from the english folder.

## Notes

- File WARNING: any change to a string used for a note requires regenerating the audio files.
- The style composes the same way as the others: M.composite = compositorUtil.compositeFromPhrases, M.enumerate = compositorUtil.enumerateConcise.
- The aliases (casualModifierAliases): jump/badDipJump/badJump/bigJump -> overJump; crest variants -> crest; water/intoWater -> watersplash; overFinish -> finish; openHairpin/tightHairpin -> hairpin.
- The descriptorAliases field exists only in this style among the three styles of this series.
- Validated by styleValidator when loaded by textCompositor.

## Fields

| Field | Type | Description |
|---|---|---|
| `componentTypes` | table | Component registry: corner (easy_medium_hard numbering, left/right direction, flat/square/hairpin descriptors), caution (english/caution), modifiers (subset) and modifierAliases. |
| `composite` | function | compositorUtil.compositeFromPhrases: (config, structured, distBefore, distAfter, escapeVars) -> list of texts. |
| `distance` | table | Distance config copied from the english/distance style but with callsEnabled = false (no spoken distance calls). |
| `enumerate` | function | compositorUtil.enumerateConcise: (textCompositor, config) -> list of unique phrases. |
| `system` | table | Localized system notes (english/systemPacenotes). |
| `visualGeneral` | table | General colors of the visual notes (intoColor, distanceColor), from english/visual. |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/gameplay/rally/compositors/styles/english/casual.lua`.*
