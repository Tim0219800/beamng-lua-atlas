---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/bindingsLegend.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Feeds the interface's "controls legend" app (bindings legend). It groups sets of actions (named by a label and ranked by priority) and sends them to the UI via `setActionsForLegend`: actions tied to held modifiers (Shift, Ctrl, Alt, modifier1 to 6), vehicle-specific actions, basic driving controls and constant actions. A modder or another module uses it to display its own actions on screen with addActions. Depends on `core_input_actions` and `core_input_bindings`.
--- Access: extension `ui_bindingsLegend`: `extensions.load("ui_bindingsLegend")`, then the global `ui_bindingsLegend`
---@class ui_bindingsLegend
---@field dependencies table<integer, string> Extensions loaded before: core_input_actions and core_input_bindings.
ui_bindingsLegend = {}

--- Adds (or replaces) an action set shown in the legend, then sends the data to the UI. An empty set simply removes the old set with the same label.
---Source: lua/ge/extensions/ui/bindingsLegend.lua:754
---@param label string Name of the action set (replacement key).
---@param actions table<integer, table> Actions; each entry has at least `action` (input action name) and optionally `label`, `inputActionOnClick`.
---@param additionalData table|nil Options: priority, ttl, removeIfOverwrittenWithHigherPriority, resetFade, modifiersActive…
function ui_bindingsLegend.addActions(label, actions, additionalData) end

--- Enables or disables the display of vehicle-specific actions (priority 10). No effect if the app is hidden in the settings, if the requested state is already active, or if the vehicle has no such actions.
---Source: lua/ge/extensions/ui/bindingsLegend.lua:925
---@param enable boolean true to show.
function ui_bindingsLegend.enableShowVehicleSpecificActions(enable) end

--- Hook called when the action filter changes. Invalidates the caches and sends the data back to the UI.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/bindingsLegend.lua:979
function ui_bindingsLegend.onActionFilterUpdated() end

--- Hook called at the end of a mission/level. Empties the action sets and caches, and unregisters the gearbox modes.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/bindingsLegend.lua:951
function ui_bindingsLegend.onClientEndMission() end

--- Hook called at the start of a mission/level. Does nothing.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/bindingsLegend.lua:948
function ui_bindingsLegend.onClientStartMission() end

--- Hook called after a Lua reload. Starts a job that invalidates the modifier actions cache.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/bindingsLegend.lua:1069
---@param data any Deserialized data (not used).
function ui_bindingsLegend.onDeserialized(data) end

--- Hook called when the input device changes. Invalidates the caches and sends the data back to the UI.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/bindingsLegend.lua:1063
function ui_bindingsLegend.onDeviceChanged() end

--- Hook called when the extension loads. Reads `ui/bindingAppActions.json` and computes the vehicle's available actions.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/bindingsLegend.lua:1050
function ui_bindingsLegend.onExtensionLoaded() end

--- Hook called when the held modifier keys change. Searches, among the bindings of recent devices, for the actions whose modifiers match exactly and shows them as the `modified` set (priority 9).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/bindingsLegend.lua:791
---@param newModifiers integer Bit mask: 1 Left Shift, 2 Right Shift, 4 Left Ctrl, 8 Right Ctrl, 16 Left Alt, 32 Right Alt, 64 to 2048 modifier1 to modifier6.
function ui_bindingsLegend.onModifierChanged(newModifiers) end

--- Hook called when the settings change. Resets the signature of the basic controls and sends the data back to the UI.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/bindingsLegend.lua:996
function ui_bindingsLegend.onSettingsChanged() end

--- Hook called every frame. Advances the fade timer, refreshes the basic driving controls (gearbox mode change), counts down the `ttl` of the action sets and shows the debug window. Exits early if there is no player vehicle.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/bindingsLegend.lua:869
---@param dtReal number Real time delta in seconds.
---@param dtSim number Simulation time delta in seconds (not used).
---@param dtRaw number Raw delta in seconds (not used).
function ui_bindingsLegend.onUpdate(dtReal, dtSim, dtRaw) end

--- Hook called when a vehicle is reset. Same function as onVehicleSpawned: if it is player 0's vehicle (or without an id), invalidates the caches and sends the data back to the UI.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/bindingsLegend.lua:969
---@param vehId integer Vehicle id.
function ui_bindingsLegend.onVehicleResetted(vehId) end

--- Hook called when a vehicle is spawned. See onVehicleResetted.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/bindingsLegend.lua:969
---@param vehId integer Vehicle id.
function ui_bindingsLegend.onVehicleSpawned(vehId) end

--- Hook called when the controlled vehicle changes. Recomputes the vehicle's actions and, if it has any, briefly shows them (`vehicleSpecific` set, ttl 10 s) with a help message.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/bindingsLegend.lua:1027
---@param oldId integer Old vehicle.
---@param newId integer New vehicle.
---@param player integer Player concerned (unused).
function ui_bindingsLegend.onVehicleSwitched(oldId, newId, player) end

--- Resets the legend's hiding timer.
---Source: lua/ge/extensions/ui/bindingsLegend.lua:107
function ui_bindingsLegend.resetFade() end

--- Merges the action sets (keeping those of highest priority), adds modifier info and the `showApp` state, then sends everything to the UI via the `setActionsForLegend` hook.
---Source: lua/ge/extensions/ui/bindingsLegend.lua:630
---@param forceResetFade boolean|nil Forces the hiding delay to reset.
function ui_bindingsLegend.sendDataToUI(forceResetFade) end

--- Enables or disables the "BindingsLegend Debug" ImGui window (hiding delay, fade state).
---Source: lua/ge/extensions/ui/bindingsLegend.lua:82
---@param enabled boolean true to display the window.
function ui_bindingsLegend.setDebug(enabled) end

--- Enables or disables the display of basic driving controls (`basicDriving` set), updated according to the gearbox mode.
---Source: lua/ge/extensions/ui/bindingsLegend.lua:901
---@param enable boolean true to enable.
function ui_bindingsLegend.setShowBasicDrivingControls(enable) end

--- Shows two UI messages (`Message`, 10 s) indicating how to display the vehicle's actions, one for gamepad and one for keyboard. Ignored during the first-drive experience or if the app is hidden.
---Source: lua/ge/extensions/ui/bindingsLegend.lua:1007
function ui_bindingsLegend.showToggleVehicleSpecificActionsMessage() end

--- Toggles the `bindingsLegendShowApp` setting, hides the vehicle actions, resets the timer and sends the data back to the UI.
---Source: lua/ge/extensions/ui/bindingsLegend.lua:1075
function ui_bindingsLegend.toggleShowApp() end

--- Shows or hides the actions specific to the player's vehicle.
---Source: lua/ge/extensions/ui/bindingsLegend.lua:944
function ui_bindingsLegend.toggleShowVehicleSpecificActions() end

--- Executes an input action as if it were triggered, on player 0's vehicle (called from the UI when an action is clicked).
---Source: lua/ge/extensions/ui/bindingsLegend.lua:1058
---@param action string Input action name.
---@param value number|nil Value passed to `core_input_actions.executeCommand`.
function ui_bindingsLegend.triggerInputAction(action, value) end

