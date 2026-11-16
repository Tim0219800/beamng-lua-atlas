# `ui_policeInfo`

*File: `lua/ge/extensions/ui/policeInfo.lua` · VM: Game Engine (GE) · 202 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `ui_policeInfo`: `extensions.load("ui_policeInfo")`, then the global `ui_policeInfo`

GE extension that feeds the police pursuit UI: it reads gameplay_police.getPursuitData every GUI frame and publishes the 'policePursuit' stream (level, visibility, arrest and evade gauges, duration, flags). It also pushes alerts (PoliceAlertPush / PoliceAlertClear) for offenses and for the end of a pursuit. By default it follows the player's vehicle, unless M.targetId is set.

## Example

```lua
ui_policeInfo.targetId = vehId   -- follow another vehicle
ui_policeInfo.showFinalStats = false
local active = ui_policeInfo.isPursuit()
```

## Notes

- Adjustable fields: targetId (nil = player), showFinalStats (true: shows score/offenses/units at the end; false: shows only success/failure) and enabled (false stops the automatic updates). The automatic extraction shifted their comments; the actual definitions are in the code.
- liveData.state: 0 inactive, 1 pursuit, 2 end (arrest or evade finished). In state 2 the data is frozen until onPursuitStatsEnded or the resumption of a pursuit.
- In onPursuitAction, the pursuit data is read with M.targetId (nil = player) and not with vehId.
- The arrest/evade gauges are smoothed by lerp(…, 0.5) when they drop to zero, for a smooth progress bar.

## Functions

| Function | Description | Line |
|---|---|---|
| `ui_policeInfo.isPursuit()` | Indicates whether a pursuit is or has been active (liveData state > 0, including the end screen). | 40 |
| `ui_policeInfo.onGuiUpdate(dt)` | Hook called every GUI frame: reads the pursuit data, updates level, visibility, gauges, duration (format m:ss or h:mm:ss) and flags, then publishes 'policePursuit'. Does nothing if be:getEnabled() is false or if the extension is disabled. *(internal)* *(hook)* | 154 |
| `ui_policeInfo.onPursuitAction(vehId, action, data)` | Hook called for a pursuit action. On 'arrest' or 'evade': switches to state 2, sets the corresponding gauge to 1, clears the alerts and shows either the summary (score, number of offenses, roadblocks or police units), or a simple failure/success depending on showFinalStats. *(internal)* *(hook)* | 77 |
| `ui_policeInfo.onPursuitOffense(vehId, name, data)` | Hook called when an offense is committed during a pursuit; pushes a 3 s alert (text ui.apps.police.offenseAlert with the translated name ui.traffic.infractions.<name>) if the vehicle is the target or the player. *(internal)* *(hook)* | 64 |
| `ui_policeInfo.onPursuitStatsEnded()` | Hook called when the pursuit end statistics are finished; resets the table if in state 2. *(internal)* *(hook)* | 144 |
| `ui_policeInfo.onUiChangedState()` | Hook called when the UI changes state; resets the table. *(internal)* *(hook)* | 150 |
| `ui_policeInfo.onVehicleSwitched(_, id)` | Hook called when the controlled vehicle changes; resets the table if the extension is enabled and without targetId. *(internal)* *(hook)* | 58 |
| `ui_policeInfo.resetPursuitTable()` | Resets all numbers and flags of liveData to zero, clears the alerts (PoliceAlertClear) and republishes the 'policePursuit' stream. | 44 |

### Parameter details

#### `ui_policeInfo.isPursuit()`

Indicates whether a pursuit is or has been active (liveData state > 0, including the end screen).

- **returns**: boolean true if state > 0.

#### `ui_policeInfo.onGuiUpdate(dt)`

Hook called every GUI frame: reads the pursuit data, updates level, visibility, gauges, duration (format m:ss or h:mm:ss) and flags, then publishes 'policePursuit'. Does nothing if be:getEnabled() is false or if the extension is disabled.

- `dt` (*number*) : Time delta in seconds (unused).

#### `ui_policeInfo.onPursuitAction(vehId, action, data)`

Hook called for a pursuit action. On 'arrest' or 'evade': switches to state 2, sets the corresponding gauge to 1, clears the alerts and shows either the summary (score, number of offenses, roadblocks or police units), or a simple failure/success depending on showFinalStats.

- `vehId` (*integer*) : Vehicle concerned.
- `action` (*string*) : 'arrest' or 'evade' (other actions are ignored).
- `data` (*table*) : Not used.

#### `ui_policeInfo.onPursuitOffense(vehId, name, data)`

Hook called when an offense is committed during a pursuit; pushes a 3 s alert (text ui.apps.police.offenseAlert with the translated name ui.traffic.infractions.<name>) if the vehicle is the target or the player.

- `vehId` (*integer*) : Offending vehicle.
- `name` (*string*) : Offense name.
- `data` (*table*) : Additional data (unused).

#### `ui_policeInfo.onVehicleSwitched(_, id)`

Hook called when the controlled vehicle changes; resets the table if the extension is enabled and without targetId.

- `_` (*any*) : Ignored (inferred from code).
- `id` (*integer*) : Id of the new vehicle (unused).

## Fields

| Field | Type | Description |
|---|---|---|
| `enabled` | boolean | Default true. Set to false to disable the automatic updates and alerts. |
| `showFinalStats` | boolean | Default true. Set to false to not show the summary (score, offenses, units) at the end of a pursuit. |
| `targetId` | integer|nil | If set, uses the pursuit data of this vehicle instead of the player's. |

**UI events (guihooks.trigger):** `PoliceAlertClear`, `PoliceAlertPush`

## Calls into the engine (C++)

- `be:` `getEnabled`, `getPlayerVehicleID`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/ui/policeInfo.lua`.*
