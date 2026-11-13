# `flowgraph_modules_timerModule`

*Fichier : `lua/ge/extensions/flowgraph/modules/timerModule.lua` · VM : Game Engine (GE) · 138 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/modules/timerModule")` (fichier sous extensions/ mais pas une extension classique)

## Classe `C`

| Méthode | Description | Ligne |
|---|---|---|
| `C:addTimer(data)` | adds a new timer. | 38 |
| `C:afterTrigger()` | called at the end, finalizing all the merge strats. | 112 |
| `C:clear()` |  | 18 |
| `C:executionStopped()` |  | 134 |
| `C:getElapsedTime(id)` | gets the elapsed time on a timer. | 92 |
| `C:getFreeId()` |  | 8 |
| `C:getGlobalTime(mode)` | gets the global time depending on the mode. | 30 |
| `C:getTimer(id)` | gets the full timer object. | 58 |
| `C:init()` |  | 13 |
| `C:isComplete(id)` | checks if the timer is complete. | 101 |
| `C:onUpdate(dtReal, dtSim, dtRaw)` |  | 105 |
| `C:set(id, field, val)` | sets some field for the timer, using the variables. | 61 |
| `C:setElapsedTime(id, time)` | sets the elapsed time on a timer. | 74 |
| `C:setMode(id, mode)` | sets the desired mode of the timer | 83 |
| `C:setPause(id, val)` | pauses or unpauses a timer. | 64 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/modules/timerModule.lua`.*
