# `gameplay_rally_compositors_styles_english_numbering_one_to_six`

*Fichier : `lua/ge/extensions/gameplay/rally/compositors/styles/english/numbering/one_to_six.lua` · VM : Game Engine (GE) · 65 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `gameplay_rally_compositors_styles_english_numbering_one_to_six` : `extensions.load("gameplay_rally_compositors_styles_english_numbering_one_to_six")`, puis la globale `gameplay_rally_compositors_styles_english_numbering_one_to_six`

Shared English 1-6 corner numbering metadata.
 Existing style files own final string/audio compatibility; this module is
 intended for new composed styles and calibration tooling.

## Champs

| Champ | Type | Description |
|---|---|---|
| `id` | string |  |
| `intensity` | table |  |
| `lengthsByIntensity` | table | Length bucket ids are defined by this style, not referenced from a separate<br> registry. Use the same id across intensities for the same semantic length.<br> note: do not change the hand tuned values without consulting the user. |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/rally/compositors/styles/english/numbering/one_to_six.lua`.*
