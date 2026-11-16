---@meta
-- tim19Atlas stub generated from lua/ge/extensions/core/nodegrabberGamepad.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- GE extension `core_nodegrabberGamepad`: drives the 'nodegrabber' (grab and pull a vehicle node with the mouse or controller) for controller and mouse inputs. It enables the 'Nodegrabber' action map, temporarily switches the player's camera to the 'relative' camera placed like the current camera, sets the pull strength (0 to 100) and displays the key legend. Calls are normally triggered by input actions (nodegrabberPadMode, nodegrabberGrab, nodegrabberStrength...), not by mod code.
--- Access: extension `core_nodegrabberGamepad`: `extensions.load("core_nodegrabberGamepad")`, then the global `core_nodegrabberGamepad`
---@class core_nodegrabberGamepad
---@field dependencies string[] { 'ui_bindingsLegend' }.
---@field state table Nodegrabber state (see notes).
core_nodegrabberGamepad = {}

--- Adds `value` to the pull strength (clamped to 0..100), applies it to the nodegrabber and displays the UI message if the rounded value changed.
---Source: lua/ge/extensions/core/nodegrabberGamepad.lua:203
---@param value number Strength change.
function core_nodegrabberGamepad.addStrength(value) end

--- Strength-setting input action: binary button (filterType 0) = addStrength(value × 5); analog axis = stores the value and onUpdate applies it continuously.
---Source: lua/ge/extensions/core/nodegrabberGamepad.lua:209
---@param value number Input value.
---@param filterType integer 0 for a button, other for an axis.
function core_nodegrabberGamepad.changeStrength(value, filterType) end

--- Restores the normal force and fixes (pins) the currently targeted node via be.nodeGrabber:fixCurrentNode.
---Source: lua/ge/extensions/core/nodegrabberGamepad.lua:198
function core_nodegrabberGamepad.fixCurrentNode() end

--- 'grab' input action: grabs or releases depending on the device (mouse = simulated click; other = setGrab).
---Source: lua/ge/extensions/core/nodegrabberGamepad.lua:180
---@param value number Axis or button value (0 = released).
---@param deviceName string Name of the input device (starting with 'mouse' for a mouse).
function core_nodegrabberGamepad.grab(value, deviceName) end

--- When action filters change: cancels the interaction if nodegrabberRender or nodegrabberGrab is blocked.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/nodegrabberGamepad.lua:253
function core_nodegrabberGamepad.onActionFilterUpdated() end

--- Before a vehicle is replaced: cancels the interaction if concerned.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/nodegrabberGamepad.lua:251
---@param vehicleId integer Vehicle id.
function core_nodegrabberGamepad.onBeforeVehicleReplaced(vehicleId) end

--- When the camera mode changes: disables controller mode (except grab and mouse) if the new camera is not 'relative'.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/nodegrabberGamepad.lua:258
---@param cameraName string Name of the new camera mode.
function core_nodegrabberGamepad.onCameraModeChanged(cameraName) end

--- When the CEF UI changes visibility: cancels the interaction if it becomes invisible.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/nodegrabberGamepad.lua:245
---@param cefVisible boolean UI visible.
function core_nodegrabberGamepad.onCefVisibilityChanged(cefVisible) end

--- At the end of the level: cancels any interaction.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/nodegrabberGamepad.lua:244
function core_nodegrabberGamepad.onClientEndMission() end

--- When an object is deleted: cancels the interaction only if it is a reload (isReloading).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/nodegrabberGamepad.lua:252
---@param vehicleId integer Object id.
---@param isReloading boolean true if it is a vehicle reload.
function core_nodegrabberGamepad.onDespawnObject(vehicleId, isReloading) end

--- On unload: cancels any interaction.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/nodegrabberGamepad.lua:243
function core_nodegrabberGamepad.onExtensionUnloaded() end

--- When a global camera is activated: disables controller mode (except grab and mouse).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/nodegrabberGamepad.lua:259
---@param cameraName string|nil Name of the global camera.
function core_nodegrabberGamepad.onGlobalCameraSet(cameraName) end

--- When the menu action map activates: cancels the interaction.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/nodegrabberGamepad.lua:246
---@param enabled boolean Menu action map active.
function core_nodegrabberGamepad.onMenuActionMapEnabled(enabled) end

--- Called by the native nodegrabber when a node is grabbed or released: updates state.grabbing, the mouse legend and the node display.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/nodegrabberGamepad.lua:169
---@param grabbed boolean true if a node is currently grabbed.
function core_nodegrabberGamepad.onNodegrab(grabbed) end

--- Before a Lua reload: cancels any interaction and returns M.state.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/nodegrabberGamepad.lua:237
---@return table  M.state.
function core_nodegrabberGamepad.onSerialize() end

--- Per-frame hook: in active controller mode and if the strength axis is non-zero, adds strengthAxis × 50 × dtReal to the strength.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/nodegrabberGamepad.lua:217
---@param dtReal number Elapsed real time (s).
function core_nodegrabberGamepad.onUpdate(dtReal) end

--- When a vehicle is reset: cancels the interaction if it is the followed vehicle or the player vehicle.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/nodegrabberGamepad.lua:250
---@param vehicleId integer Vehicle id.
function core_nodegrabberGamepad.onVehicleResetted(vehicleId) end

--- Grabs (value > 0, with force value × strength) or releases (restores the normal force) the targeted node.
---Source: lua/ge/extensions/core/nodegrabberGamepad.lua:188
---@param value number Intensity 0..1 (> 0 = grab).
function core_nodegrabberGamepad.setGrab(value) end

--- Enables or disables mouse mode. Enabling mouse mode first disables controller mode.
---Source: lua/ge/extensions/core/nodegrabberGamepad.lua:159
---@param enabled boolean true to enable.
function core_nodegrabberGamepad.setMouseActive(enabled) end

--- Enables or disables the nodegrabber controller mode (relative camera, controller mode, action map and legend).
---Source: lua/ge/extensions/core/nodegrabberGamepad.lua:176
function core_nodegrabberGamepad.toggleActive() end

