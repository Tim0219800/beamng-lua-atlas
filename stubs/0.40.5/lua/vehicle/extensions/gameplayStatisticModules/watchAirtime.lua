---@meta
-- tim19Atlas stub generated from lua/vehicle/extensions/gameplayStatisticModules/watchAirtime.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- gameplayStatistic module that measures the time the vehicle is fully airborne: ground speed > 6 m/s, no wheel in contact (contactMaterialID1 and 2 = -1) and vehicle up axis within 45° of vertical (z > 0.707). On landing, if the duration exceeds 0.1 s, adds the metric 'vehicle/airtime.time' (aggregated).
--- Access: extension `gameplayStatisticModules_watchAirtime`: `extensions.load (vehicle VM)("gameplayStatisticModules_watchAirtime")`, then the global `gameplayStatisticModules_watchAirtime`
---@class gameplayStatisticModules_watchAirtime
gameplayStatisticModules_watchAirtime = {}

--- Called on load: stores the wheel count; returns false to unload if the vehicle is not suitable.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/extensions/gameplayStatisticModules/watchAirtime.lua:39
---@return boolean|nil  false to request unloading.
function gameplayStatisticModules_watchAirtime.onExtensionLoaded() end

--- Watch function run in turn by gameplayStatistic: updates the 'airborne' state and sends the metric on landing.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/extensions/gameplayStatisticModules/watchAirtime.lua:11
function gameplayStatisticModules_watchAirtime.workload() end

