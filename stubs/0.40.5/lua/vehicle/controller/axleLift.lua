---@meta
-- tim19Atlas stub generated from lua/vehicle/controller/axleLift.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Auxiliary controller that raises or lowers axles (typically a truck's liftable axles) to gain ground clearance. It writes a target position into two `electrics.values` (front and rear) that the jbeam reads. Three modes: auto (raises unless speed is too high, speed is too low, the parking brake is applied or lateral acceleration is too strong), manual (always raised) and off (always lowered).
--- Access: controller `axleLift` declared in the jbeam (`controller`), reachable with `controller.getController("name")`
---@class controller_axleLift
---@field type string "auxiliary".
local controller_axleLift = {}

--- Returns the current mode under the key `<name>Mode`.
---Source: lua/vehicle/controller/axleLift.lua:148
---@return table<string, string>  State table.
function controller_axleLift.getState() end

--- Reads the jbeam parameters, sets the electrics to 0, switches to auto mode and adds the radial menu entry.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/axleLift.lua:90
---@param jbeamData table Controller jbeam data.
function controller_axleLift.init(jbeamData) end

--- Resets the two axle electrics values to 0.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/axleLift.lua:85
function controller_axleLift.reset() end

--- Changes the mode ("auto", "manual" or "off"). An unknown mode is ignored. Displays a UI message unless silent.
---Source: lua/vehicle/controller/axleLift.lua:60
---@param mode string "auto", "manual" or "off".
---@param silent boolean|nil true to not display a message.
function controller_axleLift.setMode(mode, silent) end

--- Modifies the thresholds and the mode on the fly; only the fields present are applied.
---Source: lua/vehicle/controller/axleLift.lua:133
---@param parameters table Optional fields: mode, accelerationThreshold, velocityThresholdDisable, velocityThresholdEnable.
function controller_axleLift.setParameters(parameters) end

--- Restores the mode from a state table (silently) if the value is valid.
---Source: lua/vehicle/controller/axleLift.lua:153
---@param data table|nil Table containing the key `<name>Mode`.
function controller_axleLift.setState(data) end

--- Switches to the next mode in the order auto, manual, off, auto.
---Source: lua/vehicle/controller/axleLift.lua:81
function controller_axleLift.toggleMode() end

--- Every frame: chooses the raised or lowered position depending on the mode (in auto: smoothed speed, wheel speed, parking brake, lateral acceleration) and writes it to the two axle electrics.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/axleLift.lua:34
---@param dt number Time step in seconds.
function controller_axleLift.updateGFX(dt) end

return controller_axleLift
