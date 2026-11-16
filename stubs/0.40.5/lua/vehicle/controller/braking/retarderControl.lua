---@meta
-- tim19Atlas stub generated from lua/vehicle/controller/braking/retarderControl.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Auxiliary controller that commands a powertrain retarder. An ordered list of settings (optional auto, off, then manual levels) determines the coefficient sent to `retarder:setRetarderCoef`. In auto mode, the retarder follows `brake_input`; it is cut when ABS is active, during a gear change, or (by default) when the throttle is applied. Adds a submenu to the radial menu.
--- Access: controller `braking/retarderControl` declared in the jbeam (`controller`), reachable with `controller.getController("name")`
---@class controller_braking_retarderControl
---@field type string "auxiliary".
local controller_braking_retarderControl = {}

--- Shifts the setting index (clamped to the list limits) and applies it.
---Source: lua/vehicle/controller/braking/retarderControl.lua:83
---@param indexChange integer Index change (+1, -1...).
function controller_braking_retarderControl.changeRetarderSettingIndex(indexChange) end

--- Returns the active setting index under the key `<name>_settingIndex`.
---Source: lua/vehicle/controller/braking/retarderControl.lua:230
---@return table  State table.
function controller_braking_retarderControl.getState() end

--- Finds the retarder, builds the settings list and the radial menu (only once).
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/braking/retarderControl.lua:128
---@param jbeamData table Controller jbeam data.
function controller_braking_retarderControl.init(jbeamData) end

--- Forces the next transmission of the coefficient to the retarder.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/braking/retarderControl.lua:124
---@param jbeamData table Jbeam data.
function controller_braking_retarderControl.reset(jbeamData) end

--- Looks for a setting equal to `newMode` in the list and applies it; otherwise a warning in the log.
---Source: lua/vehicle/controller/braking/retarderControl.lua:73
---@param newMode string|number "auto", "off" or a manual level from the list.
function controller_braking_retarderControl.setRetarderMode(newMode) end

--- Applies the setting located at this index in the list (auto, off or manual level); ignored if the index does not exist.
---Source: lua/vehicle/controller/braking/retarderControl.lua:65
---@param settingIndex integer Index (1 = first in the settings list).
---@param silent boolean|nil true to not display a message.
function controller_braking_retarderControl.setRetarderSettingIndex(settingIndex, silent) end

--- Restores the setting index if it is valid (silently).
---Source: lua/vehicle/controller/braking/retarderControl.lua:237
---@param data table|nil State table.
function controller_braking_retarderControl.setState(data) end

--- Every frame: computes the coefficient (depending on the mode, ABS, gear shifts and throttle), passes it to the retarder when it changes and publishes the electrics.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/braking/retarderControl.lua:88
---@param dt number Time step in seconds.
function controller_braking_retarderControl.updateGFX(dt) end

return controller_braking_retarderControl
