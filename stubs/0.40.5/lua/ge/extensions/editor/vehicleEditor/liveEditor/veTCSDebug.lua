---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/vehicleEditor/liveEditor/veTCSDebug.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- 'TCS Debug' window of the live Vehicle Editor: plots in real time (600 history points) the traction control data of the vehicle's first 'esc' type controller (debugData.tcs): braking factors per wheel, slip per wheel with threshold, throttle factors and overall slip. Three PlotMultiLines graphs.
--- Access: extension `editor_vehicleEditor_liveEditor_veTCSDebug`: `extensions.load("editor_vehicleEditor_liveEditor_veTCSDebug")`, then the global `editor_vehicleEditor_liveEditor_veTCSDebug`
---@class editor_vehicleEditor_liveEditor_veTCSDebug
---@field menuEntry string 'TCS'.
editor_vehicleEditor_liveEditor_veTCSDebug = {}

--- Restores the open state.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/vehicleEditor/liveEditor/veTCSDebug.lua:222
---@param data table onSerialize table.
function editor_vehicleEditor_liveEditor_veTCSDebug.onDeserialized(data) end

--- Called when the extension is loaded: fills the slipThresholds history with 600 zeros.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/vehicleEditor/liveEditor/veTCSDebug.lua:206
function editor_vehicleEditor_liveEditor_veTCSDebug.onExtensionLoaded() end

--- Called on unload (does nothing).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/vehicleEditor/liveEditor/veTCSDebug.lua:213
function editor_vehicleEditor_liveEditor_veTCSDebug.onExtensionUnloaded() end

--- Returns {windowOpen}.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/vehicleEditor/liveEditor/veTCSDebug.lua:216
---@return table  {windowOpen = boolean}
function editor_vehicleEditor_liveEditor_veTCSDebug.onSerialize() end

--- Called every frame: requests the TCS data from the vehicle, updates the histories and draws the graphs.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/vehicleEditor/liveEditor/veTCSDebug.lua:35
---@param dt number Time delta.
function editor_vehicleEditor_liveEditor_veTCSDebug.onUpdate(dt) end

--- Opens the window.
---Source: lua/ge/extensions/editor/vehicleEditor/liveEditor/veTCSDebug.lua:201
function editor_vehicleEditor_liveEditor_veTCSDebug.open() end

