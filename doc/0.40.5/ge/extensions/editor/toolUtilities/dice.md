# `editor_toolUtilities_dice`

*Fichier : `lua/ge/extensions/editor/toolUtilities/dice.lua` · VM : Game Engine (GE) · 33 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_toolUtilities_dice` : `extensions.load("editor_toolUtilities_dice")`, puis la globale `editor_toolUtilities_dice`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_toolUtilities_dice.roll(seed, salt, a, b, c, d, e)` | A draw in [0,1). Absent address slots count as zero, so a caller with two of them need not pass five. | 12 |
| `editor_toolUtilities_dice.spread(seed, salt, a, b, c, d, e)` | The same draw, mapped to -1 .. 1. What a jitter wants: how far out of place a thing was left, either way. | 24 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/toolUtilities/dice.lua`.*
