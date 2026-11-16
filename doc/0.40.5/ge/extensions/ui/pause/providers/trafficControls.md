# `ui_pause_providers_trafficControls`

*File: `lua/ge/extensions/ui/pause/providers/trafficControls.lua` · VM: Game Engine (GE) · 341 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `ui_pause_providers_trafficControls`: `extensions.load("ui_pause_providers_trafficControls")`, then the global `ui_pause_providers_trafficControls`

Data provider for the pause menu "traffic controls" panel. It counts traffic vehicles (driving, parked, police, active/inactive) via gameplay_traffic, gameplay_parking and gameplay_police, computes the quantities to spawn from the settings (trafficAmount, trafficExtraAmount, trafficParkingAmount, trafficParkedVehicles) and builds the buttons (start, stop, delete, spawn normal traffic, police or parked vehicles, enable/disable). The buttons are executed by executeTrafficControlAction.

## Notes

- The buttons are created once (buttonModule) then cloned on each getData call, with disabled and, for the spawn buttons, spawnAmount {total, traffic, activeTraffic, extraTraffic, normalTraffic, police, parked}.
- The planned police quantity is 25% (rounded up) of the active traffic; "active" traffic is trafficAmount, or getMaxVehicleAmount(10) if the setting is 0 (then adjusted by gameplay_traffic.getIdealSpawnAmount).
- If police vehicles are not listed by gameplay_police, traffic vehicles whose Config Type is "police" (or whose .pc contains "police") are counted instead.
- Traffic is considered enabled if at least one vehicle exists and the traffic state is "on" or parking is active.
- During the "traffic" lesson of the first drive, the returned state is forced to "off" as long as no traffic or parked vehicle exists.
- Labels are translated with _tr (ui.radialmenu2.traffic.*), except the "toggleTraffic" button whose "Traffic" label is hard-coded.

## Functions

| Function | Description | Line |
|---|---|---|
| `ui_pause_providers_trafficControls.executeTrafficControlAction(buttonId, payload)` | Executes a button's action by its identifier: start, stop or delete traffic, spawn normal, police or parked traffic, or toggle. | 335 |
| `ui_pause_providers_trafficControls.getData(payload)` | Builds the traffic panel state: traffic state, parking active, enabled, canActivateExisting (more than one object in the scene), driving/parked/police/total counters ({total, active, inactive}) and action buttons (toggle, controls, spawn). | 305 |

### Parameter details

#### `ui_pause_providers_trafficControls.executeTrafficControlAction(buttonId, payload)`

Executes a button's action by its identifier: start, stop or delete traffic, spawn normal, police or parked traffic, or toggle.

- `buttonId` (*any*) : Button identifier, provided by getData.
- `payload` (*any*) : Data passed to the button's callback.
- **returns**: boolean false if buttonId is nil, otherwise the callback result.

#### `ui_pause_providers_trafficControls.getData(payload)`

Builds the traffic panel state: traffic state, parking active, enabled, canActivateExisting (more than one object in the scene), driving/parked/police/total counters ({total, active, inactive}) and action buttons (toggle, controls, spawn).

- `payload` (*table|nil*) : requestId is returned as is; editable == false disables all buttons.
- **returns**: table {requestId, state, parkingActive, enabled, canActivateExisting, driving, parked, police, total, actions}.

## Calls into the engine (C++)

- `be:` `getObjectActive`, `getObjectCount`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/ui/pause/providers/trafficControls.lua`.*
