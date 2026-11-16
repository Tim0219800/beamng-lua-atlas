---@meta
-- tim19Atlas stub generated from lua/vehicle/controller/lightbar.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Auxiliary lightbar (beacon lights) controller with configurable modes (type "auxiliary"). Each mode defines, per electrics value name, a sequence of states (duration, value) repeated in a loop as long as the main electrics value (by default "lightbar") is > 0; a single-state sequence becomes a static value. The electrics values produced are multiplied by the intensity of the main value (0..1). A "Lightbar Modes" radial menu allows changing the mode.
--- Access: controller `lightbar` declared in the jbeam (`controller`), reachable with `controller.getController("name")`
---@class controller_lightbar
---@field type string "auxiliary".
local controller_lightbar = {}

--- Returns the current mode index.
---Source: lua/vehicle/controller/lightbar.lua:231
---@return table  State table (reused).
function controller_lightbar.getState() end

--- Builds the modes (animated sequences and static values), registers the radial menu entry if several modes exist.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/lightbar.lua:143
---@param jbeamData table Controller jbeam data.
function controller_lightbar.init(jbeamData) end

--- Restores the default mode.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/lightbar.lua:138
---@param jbeamData table Controller jbeam data.
function controller_lightbar.reset(jbeamData) end

--- Activates the mode at the given index: resets the sequences to zero, applies the static values and displays a message. Does nothing if the index does not exist.
---Source: lua/vehicle/controller/lightbar.lua:96
---@param index integer Index 1..n in modes.
function controller_lightbar.setModeIndex(index) end

--- Applies the mode index from a state table if valid.
---Source: lua/vehicle/controller/lightbar.lua:236
---@param data table|nil State table.
function controller_lightbar.setState(data) end

--- Switches to the next mode (returns to the first after the last).
---Source: lua/vehicle/controller/lightbar.lua:129
function controller_lightbar.toggleMode() end

--- Advances the sequences of each electrics value according to dt and writes electrics.values.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/lightbar.lua:43
---@param dt number Time step (s).
function controller_lightbar.updateGFX(dt) end

return controller_lightbar
