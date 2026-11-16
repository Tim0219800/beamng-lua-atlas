---@meta
-- tim19Atlas stub generated from lua/vehicle/controller/shiftLights.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Auxiliary shift light LED controller. Splits the RPM range [minRPM, maxRPM] into steps (one per electric listed in outputElectrics) and sets each electric to 1 when the RPM reaches its step; above maxRPM (or engine stalled if hasStallWarning), the "flashing" LEDs blink and electrics.values.shouldShift becomes true.
--- Access: controller `shiftLights` declared in the jbeam (`controller`), reachable with `controller.getController("name")`
---@class controller_shiftLights
---@field type string "auxiliary".
local controller_shiftLights = {}

--- Reads the jbeam keys and builds the RPM steps and the flashing LED lists.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/shiftLights.lua:59
---@param jbeamData table Controller jbeam data.
function controller_shiftLights.init(jbeamData) end

--- Every frame: updates the step electrics, shouldShift and the blinking.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/shiftLights.lua:25
---@param dt number Time step in seconds.
function controller_shiftLights.updateGFX(dt) end

return controller_shiftLights
