# `gameplay_drag_poi`

*Fichier : `lua/ge/extensions/gameplay/drag/poi.lua` · VM : Game Engine (GE) · 221 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `gameplay_drag_poi` : `extensions.load("gameplay_drag_poi")`, puis la globale `gameplay_drag_poi`

**Dépendances (chargées avant) :** `gameplay_drag_rulesMenu`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `gameplay_drag_poi.applyUserRulesToData(data, stripId, levelId)` |  | 55 |
| `gameplay_drag_poi.blockRejoinForStagedRacers()` | racers still at the stage line won't rejoin a new drag until they drive out of all stage triggers | 40 |
| `gameplay_drag_poi.clearRejoinBlocks()` |  | 51 |
| `gameplay_drag_poi.createStagePoi(data, lane, laneIndex)` |  | 68 |
| `gameplay_drag_poi.onGetRawPoiListForLevel(levelIdentifier, elements)` | *(hook)* | 205 |

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | table |  |

## Appels vers le moteur (C++)

- `be:` `getPlayerVehicleID`
- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/drag/poi.lua`.*
