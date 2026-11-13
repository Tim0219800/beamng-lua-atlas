# `gameplay_rally_stage_stageTimingState`

*Fichier : `lua/ge/extensions/gameplay/rally/stage/stageTimingState.lua` · VM : Game Engine (GE) · 168 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/gameplay/rally/stage/stageTimingState")` (fichier sous extensions/ mais pas une extension classique)

## Classe `C`

Le module renvoie un constructeur : `local obj = require("gameplay_rally_stage_stageTimingState")(options)`.

| Méthode | Description | Ligne |
|---|---|---|
| `C:addTime(seconds)` |  | 50 |
| `C:advance(dt)` |  | 39 |
| `C:completeAt(time)` |  | 60 |
| `C:getFrameDt()` |  | 143 |
| `C:getFrameStartTime()` |  | 139 |
| `C:getSplitOrder()` |  | 123 |
| `C:getSplitTimes()` |  | 119 |
| `C:getState()` |  | 147 |
| `C:getTime()` |  | 135 |
| `C:init()` |  | 7 |
| `C:isActive()` |  | 127 |
| `C:isComplete()` |  | 131 |
| `C:markSplitMissing(splitData, reason)` |  | 95 |
| `C:recordSplit(splitData, time, source)` |  | 68 |
| `C:reset()` |  | 11 |
| `C:setActive(active)` |  | 23 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/rally/stage/stageTimingState.lua`.*
