# `gameplay_drag_dragTypes_bracketRace`

*Fichier : `lua/ge/extensions/gameplay/drag/dragTypes/bracketRace.lua` · VM : Game Engine (GE) · 188 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `gameplay_drag_dragTypes_bracketRace` : `extensions.load("gameplay_drag_dragTypes_bracketRace")`, puis la globale `gameplay_drag_dragTypes_bracketRace`

**Dépendances (chargées avant) :** `gameplay_drag_core`, `gameplay_drag_phaseHandlers`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `gameplay_drag_dragTypes_bracketRace.generateWinData(dragData)` | Determines bracket winner by dial difference. Positive diff (slower than dial) before negative (broke out). DQ last.<br> dragData: current drag data with racers | 127 |
| `gameplay_drag_dragTypes_bracketRace.onExtensionLoaded()` | Interface declarations *(hook)* | 34 |
| `gameplay_drag_dragTypes_bracketRace.onUpdate(dtReal, dtSim, dtRaw)` | *(hook)* | 59 |
| `gameplay_drag_dragTypes_bracketRace.resetDragRace()` |  | 40 |
| `gameplay_drag_dragTypes_bracketRace.startActivity()` |  | 44 |

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | table |  |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/drag/dragTypes/bracketRace.lua`.*
