---@meta
-- tim19Atlas stub generated from lua/vehicle/controller/nitrousOxideInjection.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Auxiliary controller for nitrous oxide (N2O) control (type "auxiliary", relevantDevice "mainEngine"). It arms/disarms the system via electrics.values (arming electrics value), purges the lines on arming and adds an "N2O" button to the simplified control panel and an entry to the radial menu. The injection itself is handled by the engine (engine.nitrousOxideInjection); this controller only handles the interface and the arming.
--- Access: controller `nitrousOxideInjection` declared in the jbeam (`controller`), reachable with `controller.getController("name")`
---@class controller_nitrousOxideInjection
---@field relevantDevice string "mainEngine": concerned powertrain device (default value).
---@field type string "auxiliary".
local controller_nitrousOxideInjection = {}

--- Restores the arming state.
---Source: lua/vehicle/controller/nitrousOxideInjection.lua:71
---@param data table|nil Table returned by serialize.
function controller_nitrousOxideInjection.deserialize(data) end

--- Returns the remaining purge time.
---Source: lua/vehicle/controller/nitrousOxideInjection.lua:77
---@return table  State table (reused).
function controller_nitrousOxideInjection.getState() end

--- Reads the configuration, finds the engine, registers the radial menu and displays the state.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/nitrousOxideInjection.lua:104
---@param jbeamData table Controller jbeam data.
function controller_nitrousOxideInjection.init(jbeamData) end

--- Clears the interface state data.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/nitrousOxideInjection.lua:100
---@param jbeamData table Controller jbeam data.
function controller_nitrousOxideInjection.reset(jbeamData) end

--- Returns the arming state.
---Source: lua/vehicle/controller/nitrousOxideInjection.lua:65
---@return table  {isArmed = electrics value}
function controller_nitrousOxideInjection.serialize() end

--- Enables/disables the injection override electrics value.
---Source: lua/vehicle/controller/nitrousOxideInjection.lua:53
---@param active boolean True to force the injection.
function controller_nitrousOxideInjection.setOverride(active) end

--- Restores the remaining purge time (bounded 0..purgeTime).
---Source: lua/vehicle/controller/nitrousOxideInjection.lua:84
---@param data table|nil State table.
function controller_nitrousOxideInjection.setState(data) end

--- Arms or disarms the system (line purge on arming) and displays a message.
---Source: lua/vehicle/controller/nitrousOxideInjection.lua:57
function controller_nitrousOxideInjection.toggleActive() end

--- Updates the simplified panel button when the tank, the arming or the activity change (nop if no N2O) (dynamically assigned)
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/nitrousOxideInjection.lua:dyn
---@param dt number Time step (s).
function controller_nitrousOxideInjection.updateGFX(dt) end

--- (Re)creates the "N2O" button of the simplified panel with the color (inactive, armed, active) and the tank level.
---Source: lua/vehicle/controller/nitrousOxideInjection.lua:25
function controller_nitrousOxideInjection.updateSimpleControlButtons() end

return controller_nitrousOxideInjection
