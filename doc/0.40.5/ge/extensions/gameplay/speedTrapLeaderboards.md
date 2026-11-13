# `gameplay_speedTrapLeaderboards`

*Fichier : `lua/ge/extensions/gameplay/speedTrapLeaderboards.lua` · VM : Game Engine (GE) · 132 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `gameplay_speedTrapLeaderboards` : `extensions.load("gameplay_speedTrapLeaderboards")`, puis la globale `gameplay_speedTrapLeaderboards`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `gameplay_speedTrapLeaderboards.addRecord(speedTrapData, playerSpeed, overSpeed, veh)` |  | 58 |
| `gameplay_speedTrapLeaderboards.getLeaderboards()` |  | 106 |
| `gameplay_speedTrapLeaderboards.loadLeaderboards(folderPath)` |  | 21 |
| `gameplay_speedTrapLeaderboards.onBeforeCareerActivate()` | *(hook)* | 100 |
| `gameplay_speedTrapLeaderboards.onClientEndMission()` | *(hook)* | 94 |
| `gameplay_speedTrapLeaderboards.onClientPostStartMission(levelPath)` | TODO need some "onFreeroamStart" function *(hook)* | 88 |
| `gameplay_speedTrapLeaderboards.onDeserialized(data)` | *(hook)* | 116 |
| `gameplay_speedTrapLeaderboards.onSerialize()` | *(hook)* | 110 |
| `gameplay_speedTrapLeaderboards.saveLeaderboards(folderPath, forceOverwrite)` |  | 35 |

## Appels vers le moteur (C++)

- `FS:` `findFiles`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/speedTrapLeaderboards.lua`.*
