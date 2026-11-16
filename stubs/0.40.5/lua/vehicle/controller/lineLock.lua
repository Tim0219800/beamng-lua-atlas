---@meta
-- tim19Atlas stub generated from lua/vehicle/controller/lineLock.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Dragster "line lock" auxiliary controller (type "auxiliary", defaultOrder 40): locks the brake pressure of the listed wheels (typically the front) at the current level to allow heating the rear tires. On activation, it stores the current main brake torque of each locked wheel and reapplies it at each step into wd.desiredBrakingTorque as long as the line lock is active. A "Line Lock" entry is added to the radial menu.
--- Access: controller `lineLock` declared in the jbeam (`controller`), reachable with `controller.getController("name")`
---@class controller_lineLock
---@field defaultOrder number 40.
---@field type string "auxiliary".
local controller_lineLock = {}

--- Returns the active state and the stored torques per wheel.
---Source: lua/vehicle/controller/lineLock.lua:115
---@return table  State table (reused).
function controller_lineLock.getState() end

--- Reads the wheels to lock, registers the radial menu entry.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/lineLock.lua:66
---@param jbeamData table Controller jbeam data.
function controller_lineLock.init(jbeamData) end

--- Enables or disables the line lock and stores the current brake torque of the locked wheels.
---Source: lua/vehicle/controller/lineLock.lua:43
---@param value number 1 to activate, 0 to deactivate.
function controller_lineLock.setLineLock(value) end

--- Restores the state returned by getState.
---Source: lua/vehicle/controller/lineLock.lua:123
---@param data table|nil State table.
function controller_lineLock.setState(data) end

--- Toggles the line lock state.
---Source: lua/vehicle/controller/lineLock.lua:61
function controller_lineLock.toggleLineLock() end

--- Writes the state into electrics.values.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/lineLock.lua:39
---@param dt number Time step (s).
function controller_lineLock.updateGFX(dt) end

--- Every step: applies the stored brake torques to the locked wheels when the line lock is active.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/lineLock.lua:30
---@param dt number Time step (s).
function controller_lineLock.updateWheelsIntermediate(dt) end

return controller_lineLock
