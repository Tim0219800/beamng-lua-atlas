---@meta
-- tim19Atlas stub generated from lua/vehicle/extensions/gameplayStatisticModules/watchBurnout.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- gameplayStatistic module that detects burnouts: an intact driven wheel spins (wheel speed > 2 and > 1.5 x ground speed, load-weighted slip > 4) while touching the ground. At the end, if the duration exceeds 0.1 s, adds the metric 'vehicle/burnout.time' (aggregated).
--- Access: extension `gameplayStatisticModules_watchBurnout`: `extensions.load (vehicle VM)("gameplayStatisticModules_watchBurnout")`, then the global `gameplayStatisticModules_watchBurnout`
---@class gameplayStatisticModules_watchBurnout
gameplayStatisticModules_watchBurnout = {}

--- Called on load: lists the driven wheels; returns false to unload if the vehicle is not suitable.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/extensions/gameplayStatisticModules/watchBurnout.lua:42
---@return boolean|nil  false to request unloading.
function gameplayStatisticModules_watchBurnout.onExtensionLoaded() end

--- Watch function run in turn by gameplayStatistic: detects burnout start/end and sends the metric.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/extensions/gameplayStatisticModules/watchBurnout.lua:15
function gameplayStatisticModules_watchBurnout.workload() end

