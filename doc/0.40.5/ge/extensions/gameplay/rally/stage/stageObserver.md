# `gameplay_rally_stage_stageObserver`

*Fichier : `lua/ge/extensions/gameplay/rally/stage/stageObserver.lua` · VM : Game Engine (GE) · 350 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/gameplay/rally/stage/stageObserver")` (fichier sous extensions/ mais pas une extension classique)

## Classe `C`

Le module renvoie un constructeur : `local obj = require("gameplay_rally_stage_stageObserver")(options)`.

| Méthode | Description | Ligne |
|---|---|---|
| `C:getAuthorityMode()` |  | 151 |
| `C:getStageTime()` |  | 325 |
| `C:getState()` |  | 330 |
| `C:init(options)` |  | 137 |
| `C:recordRaceSplit(splitData, time)` |  | 220 |
| `C:reset()` |  | 155 |
| `C:resetAfterTeleport()` |  | 173 |
| `C:resetFootprint()` |  | 169 |
| `C:setAuthorityMode(mode)` |  | 147 |
| `C:update(context)` |  | 226 |

## Appels vers le moteur (C++)

- `be:` `getObjectOOBBCenterXYZ`, `getObjectOOBBHalfAxisXYZ`, `getObjectOOBBIsInitialized`
- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/rally/stage/stageObserver.lua`.*
