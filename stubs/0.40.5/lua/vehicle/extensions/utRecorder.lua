---@meta
-- tim19Atlas stub generated from lua/vehicle/extensions/utRecorder.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Sends the vehicle data to the game engine (GE) Lua every frame so that it is recorded with the rest (test tool). The message is queued by obj:queueGameEngineLua and calls extensions.test_utRecorder.onVehicleData(vehId, dataTable) on the GE side.
--- Access: extension `utRecorder`: `extensions.load (vehicle VM)("utRecorder")`, then the global `utRecorder`
---@class utRecorder
utRecorder = {}

--- Called every graphics frame (extensions.hook('updateGFX')). Builds the vehicle data table and sends it to extensions.test_utRecorder.onVehicleData on the GE side.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/extensions/utRecorder.lua:9
---@param dt number Time step (unused).
function utRecorder.updateGFX(dt) end

