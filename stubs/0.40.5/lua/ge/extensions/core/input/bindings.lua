---@meta
-- tim19Atlas stub generated from lua/ge/extensions/core/input/bindings.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- GE extension `core_input_bindings`: loads, merges, saves and sends to the engine the key/axis -> action associations (bindings) of all connected devices, for each player. It reads the default inputmaps (JSON of the game and the vehicles) then the user differences (*.diff in settings/inputmaps), applies the FFB response curves, notifies the UI, the engine, the vehicles (force feedback config) and the other extensions. It also handles the activation of menu ActionMaps according to the open screens. A modder mainly uses it to find the key of an action, reset the controls or enable/disable menu actions.
--- Access: extension `core_input_bindings`: `extensions.load("core_input_bindings")`, then the global `core_input_bindings`
---@class core_input_bindings
---@field assignedPlayers table<string, integer> Device name -> player index.
---@field autoAssignPlayersToDevices boolean true (default): the player<->device assignment is computed automatically by core_multiseat.
---@field bindings table[] Current bindings per device (see notes).
---@field defaultBindings table[] Official default bindings, same structure as bindings; used as a reference to compute the diffs.
---@field dependencies string[] {'core_input_actions', 'core_input_categories', 'core_multiseat', 'license', 'core_versionUpdate'}.
---@field devices table<string, table> Connected devices: name (e.g. 'xinput0') -> {guid, productName, vidpid, playerNumber, platformUserNumber}.
---@field isMenuActive boolean true when the menu ActionMap is active (menu screen or popup open).
core_input_bindings = {}

--- Applies an assignment table at once (device -> player; absent = -1).
---Source: lua/ge/extensions/core/input/bindings.lua:959
---@param assignments table<string, integer> Assignments.
---@param reason string|nil Text for the notifications.
---@return boolean  false if assignments is not a table.
function core_input_bindings.applyPlayerAssignments(assignments, reason) end

--- Enables or disables a custom modifier of the ActionMap for a player (ActionMap.enableCustomModifier).
---Source: lua/ge/extensions/core/input/bindings.lua:1368
---@param player integer Player index.
---@param enabled boolean Enable.
---@param modifier any Modifier (engine value).
function core_input_bindings.enableCustomModifier(player, enabled, modifier) end

--- Other actions used (not 'unused') on the same controls as actionName, on the same device.
---Source: lua/ge/extensions/core/input/bindings.lua:684
---@param actionName string Unique name of the action.
---@return string[]  Sorted action names.
function core_input_bindings.getActionsSharingControls(actionName) end

--- Returns M.assignedPlayers.
---Source: lua/ge/extensions/core/input/bindings.lua:1293
---@return table<string, integer>  Device -> player.
function core_input_bindings.getAssignedPlayers() end

--- Returns the first control (key/axis) found for an action, across all devices. The result is cached until the next notifyGE.
---Source: lua/ge/extensions/core/input/bindings.lua:669
---@param actionName string Unique name of the action.
---@return string|nil  Control name (e.g. 'keyboard0' control, 'axis1').
function core_input_bindings.getControlForAction(actionName) end

--- Reads the force feedback configuration of an action (steering, accelerate, brake) for a vehicle's driver: decodes the JSON returned by be:getFFBConfig then ffbParamsJson into ffbConfig.ffbParams.
---Source: lua/ge/extensions/core/input/bindings.lua:764
---@param veh userdata Vehicle object.
---@param action string Name of the action.
---@return table|nil  FFB config, nil if there is no driver or FFB controller or on a decoding error.
---@return integer  FFBID.
function core_input_bindings.getFFBConfigForAction(veh, action) end

--- Returns isMenuActive.
---Source: lua/ge/extensions/core/input/bindings.lua:1231
---@return boolean  State.
function core_input_bindings.getMenuActionMapEnabled() end

--- Indicates whether watching is active.
---Source: lua/ge/extensions/core/input/bindings.lua:1125
---@return boolean  State.
function core_input_bindings.getMenuActionMapWatchEnabled() end

--- Current state (enabled or not) of each independent menu action.
---Source: lua/ge/extensions/core/input/bindings.lua:1108
---@return table<string, boolean>  Action -> enabled.
function core_input_bindings.getMenuActionStates() end

--- State of the MenuScrollActionMap.
---Source: lua/ge/extensions/core/input/bindings.lua:1141
---@return boolean  true if pushed.
function core_input_bindings.getMenuScrollActionMapEnabled() end

--- List of devices sorted by recent activity (cached, getDevicesByRecentActivity).
---Source: lua/ge/extensions/core/input/bindings.lua:1459
---@return table  Recent devices.
function core_input_bindings.getRecentDevices() end

--- Reloads the bindings while recording the file paths read (useful to list the inputmaps used).
---Source: lua/ge/extensions/core/input/bindings.lua:1362
---@return string[]  Paths read.
function core_input_bindings.getUsedBindingsFiles() end

--- Indicates whether a modal popup is open (UI state '/popup/...' other than '/popup/activity/').
---Source: lua/ge/extensions/core/input/bindings.lua:1288
---@return boolean  State.
function core_input_bindings.isModalPopupOpen() end

--- Deprecated: logs an error with the call stack and calls setMenuActionMapEnabled(enabled).
---Source: lua/ge/extensions/core/input/bindings.lua:1347
---@param enabled boolean Desired state.
function core_input_bindings.menuActive(enabled) end

--- Sends to the UI the controllers, the assigned players and an InputBindingsChanged packet (categories, current vehicle's actions, binding template, bindings, defaultBindings, reason).
---Source: lua/ge/extensions/core/input/bindings.lua:702
---@param reason string Text indicating the cause.
function core_input_bindings.notifyUI(reason) end

--- UI route change hook: stores the route name and updates the menu ActionMap state.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/input/bindings.lua:1262
---@param context table Context with toRoute.name.
function core_input_bindings.onAfterRouteChange(context) end

--- Hook when a device is plugged/unplugged: updates the list (with UI toasts), the assignments and notifies everyone.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/input/bindings.lua:1325
function core_input_bindings.onDeviceChanged() end

--- Hook on load: runs the migrations (v37 layout popup; conversion of PlayStation controller diffs before 0.38).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/input/bindings.lua:1455
function core_input_bindings.onExtensionLoaded() end

--- File change hook: if an actions or inputmap file (settings/inputmaps, vehicles/.../inputmaps, *.inputmap.json) changes, schedules a reload in 0.1 s.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/input/bindings.lua:1316
---@param filename string Modified path.
---@param t any Unused (inferred from code).
function core_input_bindings.onFileChanged(filename, t) end

--- Hook at first update: lists the devices, assigns the players, computes all bindings and notifies.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/input/bindings.lua:1353
function core_input_bindings.onFirstUpdate() end

--- Hook when a player enters or leaves a vehicle: sends the force feedback config back to the vehicles.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/input/bindings.lua:828
---@param player integer Player index.
function core_input_bindings.onPlayerVehiclePresenceChanged(player) end

--- Hook called when the device activity order changes: caches and sends RecentDevicesChanged to the UI.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/input/bindings.lua:1464
---@param _recentDevices table New list.
function core_input_bindings.onRecentDevicesChanged(_recentDevices) end

--- Settings change hook: if the 'multiseat' setting changed, recomputes assignments and bindings.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/input/bindings.lua:1335
function core_input_bindings.onSettingsChanged() end

--- Hook on UI initialization: resets the modal popup state to false.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/input/bindings.lua:1284
function core_input_bindings.onUIInitialised() end

--- UI state change hook: detects open popups ('/popup/...') and updates the menu ActionMap.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/input/bindings.lua:1269
---@param stateName string UI state.
---@param opened boolean Open or closed.
---@param stateStack string[] Stack of open states.
function core_input_bindings.onUIStateTriggered(stateName, opened, stateStack) end

--- Hook on vehicle creation: recomputes assignments and bindings without notification.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/input/bindings.lua:1016
---@param vehId integer Vehicle id.
---@param veh userdata Vehicle object.
function core_input_bindings.onVehicleSpawned(vehId, veh) end

--- Hook on a player's vehicle change: recomputes assignments and bindings (the specific actions change) and notifies everyone.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/input/bindings.lua:996
---@param oldId integer Old vehicle.
---@param newId integer New vehicle.
---@param player integer Player index.
function core_input_bindings.onVehicleSwitched(oldId, newId, player) end

--- Recomputes the automatic assignment via core_multiseat (if autoAssign) and only notifies if it changed.
---Source: lua/ge/extensions/core/input/bindings.lua:973
---@param logEnabled boolean|nil Enables core_multiseat logs.
---@param seatPlayers boolean|nil Passed to core_multiseat.getAssignedPlayers.
---@return table<string, integer>  Current assignments.
function core_input_bindings.refreshAssignedPlayers(logEnabled, seatPlayers) end

--- Deletes the custom bindings (user inputmaps/diff) of a device or of all, generic and of the player vehicle, and reloads.
---Source: lua/ge/extensions/core/input/bindings.lua:926
---@param desiredDevName string|nil Device name; nil = all connected devices.
function core_input_bindings.resetBindings(desiredDevName) end

--- Saves the bindings sent by the UI: splits them by vehicle/generic, compares to the default version and writes a .diff file per device and vehicle, then forces a reload.
---Source: lua/ge/extensions/core/input/bindings.lua:894
---@param data table Complete inputmap of a device: {bindings, devicetype, guid, name, vidpid, …}.
function core_input_bindings.saveBindingsToDisk(data) end

--- Enables or disables a menu ActionMap: either by action name ('menu_item_up' -> MenuIndependent_menu_item_upActionMap), or directly by ActionMap name. Refuses (error log) ActionMaps not related to menus or unknown.
---Source: lua/ge/extensions/core/input/bindings.lua:1147
---@param enabled boolean New state.
---@param actionName string|nil Action name; can be nil if actionMapName is given.
---@param actionMapName string|nil Full name of the ActionMap.
---@return boolean|nil  New effective state (am.enabled), nil on failure.
function core_input_bindings.setMenuActionEnabled(enabled, actionName, actionMapName) end

--- Enables or disables the main menu ActionMap (and, on disabling, all independent menu ActionMaps), updates isMenuActive and notifies the UI/extensions.
---Source: lua/ge/extensions/core/input/bindings.lua:1204
---@param enabled boolean true = menus active.
function core_input_bindings.setMenuActionMapEnabled(enabled) end

--- Enables/disables the UI notification MenuActionMapStateChanged on every modification of a menu ActionMap.
---Source: lua/ge/extensions/core/input/bindings.lua:1120
---@param enabled boolean true = watch.
---@return boolean  New state.
function core_input_bindings.setMenuActionMapWatchEnabled(enabled) end

--- Applies in batch a state for several menu actions: {menu_item_up = true, menu_item_down = false}. Ignores non-boolean values.
---Source: lua/ge/extensions/core/input/bindings.lua:1183
---@param actionStates table<string, boolean> Action -> desired state.
---@return table<string, boolean>|boolean  Action -> effective state; false if the argument is not a table.
function core_input_bindings.setMenuActionsEnabled(actionStates) end

--- Pushes or pops the 'MenuScrollActionMap' on the ActionMap stack.
---Source: lua/ge/extensions/core/input/bindings.lua:1131
---@param enabled boolean true = push.
---@return boolean  Resulting state; false if the ActionMap does not exist.
function core_input_bindings.setMenuScrollActionMapEnabled(enabled) end

--- Assigns a player to a device (assignPlayerToDevice), recomputes the bindings and notifies everyone.
---Source: lua/ge/extensions/core/input/bindings.lua:952
---@param devname string Device name.
---@param player integer Player index.
function core_input_bindings.setPlayerToDevice(devname, player) end

--- Per-frame hook: runs the deferred bindings reload; disables the 'VehicleSpecificActionMap' when the player is walking (unicycle in world camera) outside split-screen.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/input/bindings.lua:1298
---@param dtRaw number Raw time delta in seconds.
function core_input_bindings.updateGFX(dtRaw) end

