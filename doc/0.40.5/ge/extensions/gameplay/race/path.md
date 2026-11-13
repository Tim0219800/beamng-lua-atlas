# `gameplay_race_path`

*Fichier : `lua/ge/extensions/gameplay/race/path.lua` · VM : Game Engine (GE) · 648 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/gameplay/race/path")` (fichier sous extensions/ mais pas une extension classique)

## Classe `C`

Le module renvoie un constructeur : `local obj = require("gameplay_race_path")(options)`.

| Méthode | Description | Ligne |
|---|---|---|
| `C:autoConfig()` | this creates an automatic configuration.<br> It takes the first (= lowest ID) pathnode and creates a path from there, using segments.<br> assumes there is only one "first" segment. | 57 |
| `C:classify()` |  | 606 |
| `C:copy()` |  | 382 |
| `C:drawAiRouteDebug()` |  | 222 |
| `C:drawDebug(drawMode)` |  | 215 |
| `C:findSegments(from, to)` |  | 194 |
| `C:findStartPositionByName(name)` |  | 311 |
| `C:fromCheckpointList(list, closed)` |  | 427 |
| `C:fromLapConfig(lapConfig, closed)` |  | 399 |
| `C:fromTrack(trackInfo, usePrefabs)` |  | 469 |
| `C:getAiPath()` |  | 245 |
| `C:getLastPathnode()` |  | 638 |
| `C:getNextUniqueIdentifier()` |  | 7 |
| `C:init(name)` |  | 14 |
| `C:onDeserialized(data)` |  | 352 |
| `C:onSerialize()` |  | 320 |
| `C:recalculateSegments()` |  | 629 |
| `C:reverse()` | switches start/endNode, all segments and direction of pathnodes. startPositions are not changed. | 389 |

## Appels vers le moteur (C++)

- `FS:` `fileExists`
- `debugDrawer:` `drawSphere`, `drawSquarePrism`
- `scenetree.` `findObject`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/race/path.lua`.*
