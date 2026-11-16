# `ui_pause_vehicleConfigurationGuard`

*File: `lua/ge/extensions/ui/pause/vehicleConfigurationGuard.lua` · VM: Game Engine (GE) · 103 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `ui_pause_vehicleConfigurationGuard`: `extensions.load("ui_pause_vehicleConfigurationGuard")`, then the global `ui_pause_vehicleConfigurationGuard`

Exit guard for the pause menu's vehicle configuration screen. When the UI reports unapplied changes (setHasPendingChanges), any navigation away from the screen is intercepted by confirmExit: a confirmation dialog (Cancel / Discard / Apply) is shown and the navigation is held pending, then resumed once the decision is made. Useful to a modder who adds a configuration sub-route or wants to understand why a navigation is blocked.

## Example

```lua
ui_pause_vehicleConfigurationGuard.setHasPendingChanges(true)
-- the router then calls confirmExit(route, params, context) before leaving the screen
```

## Notes

- The sub-routes pause.vehicle.configurationcombined.save, .configlistmanage and .mirrors never trigger the dialog (SUB_ROUTES table).
- confirmExit returns false when it blocks the navigation; it is then replayed via ui_router.navigate by resumePendingExit with a bypass flag (exitConfirmationBypass) so as not to ask for confirmation again.
- The pending target is always refreshed on each confirmExit call: a dialog closed without a callback therefore does not block navigation indefinitely.
- Unapplied changes exist only in the UI; discarding simply means continuing the navigation.

## Functions

| Function | Description | Line |
|---|---|---|
| `ui_pause_vehicleConfigurationGuard.cancelExit()` | Callback of the Cancel button: forgets the pending navigation. *(internal)* | 83 |
| `ui_pause_vehicleConfigurationGuard.confirmExit(route, params, context)` | Called before leaving the screen. Returns true (navigation allowed) if the bypass is active, if there are no pending changes, if the route name is invalid or if it is a configuration sub-route. Otherwise stores the requested navigation, shows the showConfirmationDialog dialog (buttons Cancel, Discard, Apply) and returns false. *(internal)* | 39 |
| `ui_pause_vehicleConfigurationGuard.confirmExitApplying()` | Callback of the Apply button: triggers the UI event VehicleConfigurationCombinedApplyAndExit. The pending parts tree and tuning live in the UI, which applies them then calls resumePendingExit() back. *(internal)* | 94 |
| `ui_pause_vehicleConfigurationGuard.confirmExitDiscarding()` | Callback of the Discard button: resumes the pending navigation without applying the changes. *(internal)* | 88 |
| `ui_pause_vehicleConfigurationGuard.navigateBack()` | Navigates to the return route: core_vehicle_configTarget.getReturnRoute() if the extension is loaded, otherwise "pause.vehicle". Uses the option restoreLastScope = true. | 21 |
| `ui_pause_vehicleConfigurationGuard.resumePendingExit()` | Replays the pending navigation, bypassing the confirmation. Returns false if there is no pending navigation. | 98 |
| `ui_pause_vehicleConfigurationGuard.setHasPendingChanges(value)` | Indicates whether the configuration screen contains unapplied changes. Any value other than true is converted to false. | 17 |

### Parameter details

#### `ui_pause_vehicleConfigurationGuard.confirmExit(route, params, context)`

Called before leaving the screen. Returns true (navigation allowed) if the bypass is active, if there are no pending changes, if the route name is invalid or if it is a configuration sub-route. Otherwise stores the requested navigation, shows the showConfirmationDialog dialog (buttons Cancel, Discard, Apply) and returns false.

- `route` (*table|any*) : Target route; its name field is used if context.routeName is absent
- `params` (*table|nil*) : Navigation parameters to replay later
- `context` (*table|nil*) : Router context: routeName and options (inferred from code)
- **returns**: boolean true if navigation can continue, false if it is suspended pending the dialog

#### `ui_pause_vehicleConfigurationGuard.confirmExitDiscarding()`

Callback of the Discard button: resumes the pending navigation without applying the changes.

- **returns**: any Result of the replayed navigation, or false if nothing was pending

#### `ui_pause_vehicleConfigurationGuard.navigateBack()`

Navigates to the return route: core_vehicle_configTarget.getReturnRoute() if the extension is loaded, otherwise "pause.vehicle". Uses the option restoreLastScope = true.

- **returns**: any Result of ui_router.navigate

#### `ui_pause_vehicleConfigurationGuard.resumePendingExit()`

Replays the pending navigation, bypassing the confirmation. Returns false if there is no pending navigation.

- **returns**: any Result of ui_router.navigate, or false

#### `ui_pause_vehicleConfigurationGuard.setHasPendingChanges(value)`

Indicates whether the configuration screen contains unapplied changes. Any value other than true is converted to false.

- `value` (*boolean*) : true if there are pending changes

**UI events (guihooks.trigger):** `VehicleConfigurationCombinedApplyAndExit`, `showConfirmationDialog`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/ui/pause/vehicleConfigurationGuard.lua`.*
