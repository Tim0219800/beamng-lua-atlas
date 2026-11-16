---@meta
-- tim19Atlas stub generated from lua/vehicle/controller/braking/transbrake.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Auxiliary transbrake controller (drag racing gearbox brake): it locks the gearbox via `gearbox:setLock(value)`. The lock is active when `gearbox.lockCoef == 0`. Publishes this state in `electrics.values[electricsName]` and adds an entry to the radial menu. Can also be commanded by the gameplay event `controller:<name>`.
--- Access: controller `braking/transbrake` declared in the jbeam (`controller`), reachable with `controller.getController("name")`
---@class controller_braking_transbrake
---@field type string "auxiliary".
---@field updateGFX function nop by default, replaced in init by the function that publishes the electrics when the gearbox exists.
local controller_braking_transbrake = {}

--- Returns whether the transbrake is active.
---Source: lua/vehicle/controller/braking/transbrake.lua:74
---@return table  Key `<name>Active` (boolean).
function controller_braking_transbrake.getState() end

--- Finds the gearbox, chooses the updateGFX function and adds the radial menu entry (only once).
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/braking/transbrake.lua:37
---@param jbeamData table Controller jbeam data.
function controller_braking_transbrake.init(jbeamData) end

--- Hook from controller.lua. If the event name is "controller:<typeName>" or "controller:<name>", runs the command contained in eventData: {"setTransbrake", boolean}. Example: onGameplayEvent("controller:transbrake", {"setTransbrake", true}).
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/braking/transbrake.lua:92
---@param event string Event name.
---@param eventData table {commandName, value}.
function controller_braking_transbrake.onGameplayEvent(event, eventData) end

--- Enables or disables the transbrake to match the saved state (silently).
---Source: lua/vehicle/controller/braking/transbrake.lua:79
---@param data table|nil State table.
function controller_braking_transbrake.setState(data) end

--- Applies or releases the gearbox lock (`gearbox:setLock`) and displays a message unless silent.
---Source: lua/vehicle/controller/braking/transbrake.lua:21
---@param value boolean true to lock.
---@param silent boolean|nil true to not display a message.
function controller_braking_transbrake.setTransbrake(value, silent) end

--- Toggles the transbrake state.
---Source: lua/vehicle/controller/braking/transbrake.lua:30
function controller_braking_transbrake.toggleTransbrake() end

return controller_braking_transbrake
