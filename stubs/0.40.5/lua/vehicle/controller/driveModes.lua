---@meta
-- tim19Atlas stub generated from lua/vehicle/controller/driveModes.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Auxiliary drive modes controller (Eco, Sport, Snow, etc., or differential/range modes for a 4x4). Each mode is a set of typed settings applied all at once when the mode changes: exhaust, turbo, supercharger, automatic gearbox, parameters of another controller (`setParameters`), mode of a powertrain device, electrics value, radial menu entry and simplified control panel button. Several can be instantiated (one per function: driving, differential, range...). The default mode is applied in initLastStage.
--- Access: controller `driveModes` declared in the jbeam (`controller`), reachable with `controller.getController("name")`
---@class controller_driveModes
---@field type string "auxiliary".
local controller_driveModes = {}

--- Restores the active mode from serialize.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/driveModes.lua:237
---@param data table|nil Serialize data.
function controller_driveModes.deserialize(data) end

--- Returns the key of the active mode.
---Source: lua/vehicle/controller/driveModes.lua:208
---@return string|nil  Key of the active mode, nil if none.
function controller_driveModes.getCurrentDriveModeKey() end

--- Returns a mode's data (key, name, order, settings, settingsOrder).
---Source: lua/vehicle/controller/driveModes.lua:214
---@param modeKey string|nil Mode key.
---@return table|nil  Mode data, nil if unknown.
function controller_driveModes.getDriveModeData(modeKey) end

--- Returns the key of the active mode under `<name>ActiveMode`.
---Source: lua/vehicle/controller/driveModes.lua:246
---@return table  State table.
function controller_driveModes.getState() end

--- Reads the modes (`modes*` keys), the enabled modes (`enabledModes*`) and the default settings from the jbeam, sorts the modes and registers the radial menu entry.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/driveModes.lua:295
---@param jbeamData table Controller jbeam data.
function controller_driveModes.init(jbeamData) end

--- Chooses the default mode (`defaultMode` if enabled, otherwise the first) and applies it.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/driveModes.lua:409
---@param jbeamData table Controller jbeam data.
function controller_driveModes.initLastStage(jbeamData) end

--- Switches to the next enabled mode, wrapping back to the first at the end.
---Source: lua/vehicle/controller/driveModes.lua:190
function controller_driveModes.nextDriveMode() end

--- Switches to the previous enabled mode, wrapping back to the last at the start.
---Source: lua/vehicle/controller/driveModes.lua:199
function controller_driveModes.previousDriveMode() end

--- Restores the radial menu title and icon read from the jbeam.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/driveModes.lua:220
---@param jbeamData table Jbeam data.
function controller_driveModes.reset(jbeamData) end

--- Reapplies the active mode after the reset.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/driveModes.lua:225
function controller_driveModes.resetLastStage() end

--- Returns the active mode for the save.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/driveModes.lua:231
---@return table|nil  {activeDriveModeKey, activeDriveModeIndex}, nil if no mode.
function controller_driveModes.serialize() end

--- Activates the mode with the given key: finds its index among the enabled modes, applies all its settings and displays a UI message unless silent. Unknown or nil key: does nothing.
---Source: lua/vehicle/controller/driveModes.lua:164
---@param modeKey string|nil Mode key.
---@param silent boolean|nil true to not display a message.
function controller_driveModes.setDriveMode(modeKey, silent) end

--- Creates, updates or removes a button of the simplified control panel (`ui_simplePowertrainControl`). The default click calls this controller's `nextDriveMode()`.
---Source: lua/vehicle/controller/driveModes.lua:75
---@param id string Button identifier.
---@param buttonUIName string Displayed name.
---@param icon string Icon.
---@param color string Color (hexadecimal) when active.
---@param offColor string|nil Off color (default "343434").
---@param offColorElectric string|nil Electrics name: at 1 or more, the button takes `offColor`.
---@param onClick string|nil Lua code run on click.
---@param remove boolean|nil true to remove the button.
function controller_driveModes.setSimpleControlButton(id, buttonUIName, icon, color, offColor, offColorElectric, onClick, remove) end

--- Silently activates the given mode if it exists and differs from the active mode.
---Source: lua/vehicle/controller/driveModes.lua:253
---@param data table|nil State table.
function controller_driveModes.setState(data) end

--- Every frame: updates the color (active or off) of the simplified control buttons according to their `offColorElectric` electrics.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/driveModes.lua:154
---@param dt number Time step in seconds.
function controller_driveModes.updateGFX(dt) end

--- Sends the state of all buttons back to the simplified control panel (called by controller.updateSimpleControlButtons).
---Source: lua/vehicle/controller/driveModes.lua:94
function controller_driveModes.updateSimpleControlButtons() end

return controller_driveModes
