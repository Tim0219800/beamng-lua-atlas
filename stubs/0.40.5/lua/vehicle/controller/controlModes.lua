---@meta
-- tim19Atlas stub generated from lua/vehicle/controller/controlModes.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Auxiliary controller that remaps the driver's inputs (steering, throttle, brake, or combined throttle-brake) to custom `electrics.values` values, according to a chosen "control mode" (for example to drive a crane or cylinders). Each mode lists the active electrics; each electric is configured with a source input, smoothings, a speed and bounds. Adds a radial menu to choose the mode.
--- Access: controller `controlModes` declared in the jbeam (`controller`), reachable with `controller.getController("name")`
---@class controller_controlModes
---@field controlModeIndex integer|nil Index of the active mode (1 = first); nil before init.
---@field controlModeName string|nil Name of the active mode; nil before init.
---@field type string "auxiliary".
local controller_controlModes = {}

--- Returns the active mode index under the key `<name>_modeIndex`.
---Source: lua/vehicle/controller/controlModes.lua:123
---@return table  State table.
function controller_controlModes.getState() end

--- Reads the modes and the configuration from the jbeam, creates the smoothers, sets the electrics to 0 and registers the radial menu (only once).
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/controlModes.lua:65
---@param jbeamData table Controller jbeam data.
function controller_controlModes.init(jbeamData) end

--- Chooses the mode by its index (ignored if it does not exist) and displays its name unless silent.
---Source: lua/vehicle/controller/controlModes.lua:38
---@param index integer Mode index (1 = first).
---@param silent boolean|nil true to not display a message.
function controller_controlModes.setControlModeIndex(index, silent) end

--- Defines a custom input usable in `config.input`.
---Source: lua/vehicle/controller/controlModes.lua:61
---@param name string Input name.
---@param value number Input value.
function controller_controlModes.setInputValue(name, value) end

--- Restores the mode index if it is valid (silently).
---Source: lua/vehicle/controller/controlModes.lua:128
---@param data table|nil State table.
function controller_controlModes.setState(data) end

--- Shifts the mode index by `value` with cyclic wrap-around (beyond the last: first; below the first: last).
---Source: lua/vehicle/controller/controlModes.lua:50
---@param value integer +1 or -1 in practice.
function controller_controlModes.toggleControlMode(value) end

--- Every frame: reads the inputs and updates the electrics of the active mode (bounded smoothed integration).
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/controlModes.lua:25
---@param dt number Time step in seconds.
function controller_controlModes.updateGFX(dt) end

return controller_controlModes
