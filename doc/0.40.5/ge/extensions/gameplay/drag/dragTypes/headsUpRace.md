# `gameplay_drag_dragTypes_headsUpRace`

*Fichier : `lua/ge/extensions/gameplay/drag/dragTypes/headsUpRace.lua` · VM : Game Engine (GE) · 174 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `gameplay_drag_dragTypes_headsUpRace` : `extensions.load("gameplay_drag_dragTypes_headsUpRace")`, puis la globale `gameplay_drag_dragTypes_headsUpRace`

**Dépendances (chargées avant) :** `gameplay_drag_core`, `gameplay_drag_phaseHandlers`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `gameplay_drag_dragTypes_headsUpRace.generateWinData(dragData)` | Determines winner by best (timer + reaction) for the important timer. DQ racers sort last.<br> dragData: current drag data with racers | 134 |
| `gameplay_drag_dragTypes_headsUpRace.onExtensionLoaded()` | Interface declarations *(hook)* | 36 |
| `gameplay_drag_dragTypes_headsUpRace.onUpdate(dtReal, dtSim, dtRaw)` | *(hook)* | 61 |
| `gameplay_drag_dragTypes_headsUpRace.resetDragRace()` |  | 42 |
| `gameplay_drag_dragTypes_headsUpRace.startActivity()` |  | 46 |

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | table |  |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/drag/dragTypes/headsUpRace.lua`.*
