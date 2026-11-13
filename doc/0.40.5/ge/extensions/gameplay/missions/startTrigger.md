# `gameplay_missions_startTrigger`

*Fichier : `lua/ge/extensions/gameplay/missions/startTrigger.lua` · VM : Game Engine (GE) · 192 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `gameplay_missions_startTrigger` : `extensions.load("gameplay_missions_startTrigger")`, puis la globale `gameplay_missions_startTrigger`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `gameplay_missions_startTrigger.defaultLocationCheck(location, level, playerPosition, mission)` |  | 16 |
| `gameplay_missions_startTrigger.defaultLocationDisplayMarker(location, playerPosition)` |  | 21 |
| `gameplay_missions_startTrigger.getMissionClusters(mergeRadius)` |  | 127 |
| `gameplay_missions_startTrigger.onAnyMissionChanged()` | *(hook)* | 187 |
| `gameplay_missions_startTrigger.parseMission(mission)` | creates a list of locations from a start trigger. | 62 |

## Appels vers le moteur (C++)

- `debugDrawer:` `drawCylinder`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/missions/startTrigger.lua`.*
