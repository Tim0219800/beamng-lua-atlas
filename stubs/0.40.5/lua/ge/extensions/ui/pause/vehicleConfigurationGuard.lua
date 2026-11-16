---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/pause/vehicleConfigurationGuard.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Exit guard for the pause menu's vehicle configuration screen. When the UI reports unapplied changes (setHasPendingChanges), any navigation away from the screen is intercepted by confirmExit: a confirmation dialog (Cancel / Discard / Apply) is shown and the navigation is held pending, then resumed once the decision is made. Useful to a modder who adds a configuration sub-route or wants to understand why a navigation is blocked.
--- Access: extension `ui_pause_vehicleConfigurationGuard`: `extensions.load("ui_pause_vehicleConfigurationGuard")`, then the global `ui_pause_vehicleConfigurationGuard`
---@class ui_pause_vehicleConfigurationGuard
ui_pause_vehicleConfigurationGuard = {}

--- Callback of the Cancel button: forgets the pending navigation.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/pause/vehicleConfigurationGuard.lua:83
function ui_pause_vehicleConfigurationGuard.cancelExit() end

--- Called before leaving the screen. Returns true (navigation allowed) if the bypass is active, if there are no pending changes, if the route name is invalid or if it is a configuration sub-route. Otherwise stores the requested navigation, shows the showConfirmationDialog dialog (buttons Cancel, Discard, Apply) and returns false.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/pause/vehicleConfigurationGuard.lua:39
---@param route table|any Target route; its name field is used if context.routeName is absent
---@param params table|nil Navigation parameters to replay later
---@param context table|nil Router context: routeName and options (inferred from code)
---@return boolean  true if navigation can continue, false if it is suspended pending the dialog
function ui_pause_vehicleConfigurationGuard.confirmExit(route, params, context) end

--- Callback of the Apply button: triggers the UI event VehicleConfigurationCombinedApplyAndExit. The pending parts tree and tuning live in the UI, which applies them then calls resumePendingExit() back.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/pause/vehicleConfigurationGuard.lua:94
function ui_pause_vehicleConfigurationGuard.confirmExitApplying() end

--- Callback of the Discard button: resumes the pending navigation without applying the changes.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/pause/vehicleConfigurationGuard.lua:88
---@return any  Result of the replayed navigation, or false if nothing was pending
function ui_pause_vehicleConfigurationGuard.confirmExitDiscarding() end

--- Navigates to the return route: core_vehicle_configTarget.getReturnRoute() if the extension is loaded, otherwise "pause.vehicle". Uses the option restoreLastScope = true.
---Source: lua/ge/extensions/ui/pause/vehicleConfigurationGuard.lua:21
---@return any  Result of ui_router.navigate
function ui_pause_vehicleConfigurationGuard.navigateBack() end

--- Replays the pending navigation, bypassing the confirmation. Returns false if there is no pending navigation.
---Source: lua/ge/extensions/ui/pause/vehicleConfigurationGuard.lua:98
---@return any  Result of ui_router.navigate, or false
function ui_pause_vehicleConfigurationGuard.resumePendingExit() end

--- Indicates whether the configuration screen contains unapplied changes. Any value other than true is converted to false.
---Source: lua/ge/extensions/ui/pause/vehicleConfigurationGuard.lua:17
---@param value boolean true if there are pending changes
function ui_pause_vehicleConfigurationGuard.setHasPendingChanges(value) end

