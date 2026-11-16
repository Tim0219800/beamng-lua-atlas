# `gameplay_taxi`

*File: `lua/ge/extensions/gameplay/taxi.lua` · VM: Game Engine (GE) · 2061 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `gameplay_taxi`: `extensions.load("gameplay_taxi")`, then the global `gameplay_taxi`

Taxi system in freeroam and career: the player on foot can hail a traffic taxi (or call one from the quick menu), get in, choose a destination on the big map, then the taxi AI drives them along a route (speed up/slow down, skip the trip, stop, change destination, idle camera). In career, a ride is billed (base fare + per km + night surcharge). The extension registers a "taxi" special vehicle provider with gameplay_traffic (1 guaranteed, 1 reserved), manages the taxis' visual states (roof lights, indicators, floating labels) and blocks driving controls during the ride. Disabled during a mission, in multiplayer or in the freeroam tutorial.

## Example

```lua
-- from the quick menu or a script (player within 30 m of a road)
gameplay_taxi.callForTaxi()
print(gameplay_taxi.getTaxiState(someVehId), gameplay_taxi.isTaxiRideActive())
```

## Notes

- Taxi states (getTaxiState): available, enRoute, pullingOverForPickup, waitingForPickup, occupied, pullingOverForDropoff, waitingForDropoff, unavailable. An unknown vehicle returns 'available'.
- Player ride phases: none, awaitingPickup, choosingDestination, driving, arriving. isTaxiRideActive is true in driving and arriving.
- Calling a taxi: the player must be within 30 m of a road; the called taxi waits 30 s and leaves if the player is not within 12 m; a reserved taxi appears at 120-250 m if no active taxi is reachable.
- "Hurry up" levels: 4 levels. Level 1: base traffic aggression and legal speed. Levels 2, 3, 4: AI aggression 0.6 / 0.9 / 1.0 with speed limit disabled.
- Fares (career only): taxis fullsize, bastion, midsize and legran each have an initial fare, a price per km and a night surcharge; the bluebuck uses a meter based on distance in sixths of a mile and on stopped time.
- On arrival, the driver ejects the player after 10 s waiting for drop-off (dropoffKickDelay). Pressing taxi triggers 3 times during the ride stops the taxi and ejects the player.
- onSkipCalled: fade to black, safe teleport of the taxi to skipPosition, route restart, then accelerated physics (setPhysicsSpeedFactor(2)) for 1 s before returning to normal (value 0); the reset to 0 is also ensured at the end of the job.
- onClientEndMission is exported as the same handler as onTrafficStopped.

**Dependencies (loaded first):** `gameplay_util_vehicleSighting`

## Functions

| Function | Description | Line |
|---|---|---|
| `gameplay_taxi.callForTaxi()` | Calls a taxi to the road closest to the player. Tries the available active taxis first (from nearest to farthest) then a reserve. Displays a message and emits the hook onTaxiCalled with 'tooFarFromRoad', 'dispatched' or 'noTaxiAvailable'. | 1160 |
| `gameplay_taxi.cancelTaxiCall()` | Cancels the called taxis (not the hailed ones) and displays a message; no effect if no taxi was called. | 1092 |
| `gameplay_taxi.confirmTaxiDestination()` | Confirms the chosen destination (choosingDestination phase with a destination set) and starts the ride. | 1765 |
| `gameplay_taxi.getTaxiState(vehId)` | Returns the current state of a taxi. | 498 |
| `gameplay_taxi.getTaxiViewData()` | Data for the taxi UI: phase, ability to speed up/slow down/skip/stop/change destination, hurry up level, remaining and total distance, etc. | 356 |
| `gameplay_taxi.isTaxiRideActive()` | Indicates whether a ride is in progress (driving or arriving phases). | 1869 |
| `gameplay_taxi.isTaxiViewActive()` | Indicates whether the taxi UI view is active. | 1870 |
| `gameplay_taxi.onAiRouteDone(vehId)` | Hook called when the AI has finished its route: switches to the arriving phase if it is the ride's taxi. *(internal)* *(hook)* | 1698 |
| `gameplay_taxi.onAnyMissionChanged()` | Hook: re-evaluates the system activation (disabled during a mission). *(internal)* *(hook)* | 841 |
| `gameplay_taxi.onChangeDestinationCalled()` | Hook (Change destination button): returns to destination choice and reopens the big map. *(internal)* *(hook)* | 1588 |
| `gameplay_taxi.onClientEndMission()` | Hook: same handling as onTrafficStopped. *(internal)* *(hook)* | 866 |
| `gameplay_taxi.onDeactivateBigMapCallback()` | Hook: if the map is closed without a choice, resumes the route, the drop-off wait or re-displays the taxi view. *(internal)* *(hook)* | 1771 |
| `gameplay_taxi.onExtensionUnloaded()` | Hook: removes the floating labels engine. *(internal)* *(hook)* | 2048 |
| `gameplay_taxi.onGameplayInteract()` | Interaction action hook: during a ride, stops the taxi; otherwise, hails a nearby available taxi. *(internal)* *(hook)* | 1705 |
| `gameplay_taxi.onHurryUpCalled()` | Hook: goes up one AI urgency level. *(internal)* *(hook)* | 1624 |
| `gameplay_taxi.onRegisterQuickAccessMenus()` | Hook: adds the Call / Cancel taxi entries to the quick menu (and a Taxi category in career). *(internal)* *(hook)* | 1824 |
| `gameplay_taxi.onSetBigmapNavFocus(pos)` | Big map hook: stores the chosen destination and sends the UI TaxiDestinationPreviewed with the route length. *(internal)* *(hook)* | 1752 |
| `gameplay_taxi.onSkipCalled()` | Hook (Skip button): fade to black, teleports the taxi to skipPosition, restarts the route and accelerates physics for 1 s; only once per ride. *(internal)* *(hook)* | 1627 |
| `gameplay_taxi.onSlowDownCalled()` | Hook: goes down one AI urgency level. *(internal)* *(hook)* | 1625 |
| `gameplay_taxi.onStopTaxiCalled()` | Hook (Stop button): if slow, switches to arrival; otherwise, makes the taxi pull over while driving. *(internal)* *(hook)* | 1677 |
| `gameplay_taxi.onTaxiViewEnter(context, toRoute, fromRoute, data)` | UI router hook: adds data.taxi = getTaxiViewData(). *(internal)* *(hook)* | 1799 |
| `gameplay_taxi.onTrafficSpecialVehiclesProviders()` | Hook emitted by gameplay_traffic when preparing traffic: registers the 'taxi' provider (priority 5, 1 guaranteed, 1 reserved) if the system is enabled. *(internal)* *(hook)* | 250 |
| `gameplay_taxi.onTrafficStarted()` | Hook: re-evaluates the system activation. *(internal)* *(hook)* | 837 |
| `gameplay_taxi.onTrafficStopped()` | Hook: ends the ride (onTaxiRideEnded reason 'trafficStopped'), clears the states and removes the labels. *(internal)* *(hook)* | 866 |
| `gameplay_taxi.onTrafficVehicleAdded(id)` | Hook: if the vehicle is a non-reserved AI taxi, assigns it an availability state. *(internal)* *(hook)* | 845 |
| `gameplay_taxi.onTrafficVehicleCrashed(vehId)` | Hook: a crashed taxi is set aside (pickup canceled or marked unavailable) and its light switches to "driverDistress". *(internal)* *(hook)* | 1804 |
| `gameplay_taxi.onTrafficVehicleRemoved(id)` | Hook: forgets the taxi removed from traffic. *(internal)* *(hook)* | 854 |
| `gameplay_taxi.onUpdate(dtReal, dtSim, dtRaw)` | Hook called every frame: detects the nearest taxi, updates pull over, arrivals, waiting and blocking of pickups, labels, idle camera, arrival approach, fare, ejection and interface. *(internal)* *(hook)* | 1470 |
| `gameplay_taxi.onVehicleResetted(id)` | Hook: randomly removes the state of a reset taxi (except the ride's or pickup's taxi). *(internal)* *(hook)* | 1791 |
| `gameplay_taxi.onVehicleSwitched(oldId, newId)` | Hook: when the player gets into a pickup taxi, starts the ride (hook onTaxiRideStarted), chooses the fare calculator, blocks driving actions, switches to the orbit camera and opens the destination map; when exiting the taxi, ends the ride. *(internal)* *(hook)* | 1519 |
| `gameplay_taxi.onVehicleTriggersExecuteLink(lnk, actionValue, vehicleId)` | Hook: the player triggered a taxi trigger during the ride; three warnings lead to stopping and ejection. *(internal)* *(hook)* | 1713 |
| `gameplay_taxi.setIdleCameraEnabled(enabled)` | Enables or disables (user preference) the idle camera (starts after 15 s without action during the ride). | 1665 |
| `gameplay_taxi.setUseBillboards(enabled)` | Enables or disables the floating state labels ("TAXI" + state) above the taxis when the player is on foot; visible up to about 45 m. | 1907 |
| `gameplay_taxi.startTaxiWithCurrentRoute(skipWait)` | Closes the big map, computes the route to player.destinationPos then starts the taxi AI (ai.driveUsingPath, 1 lap, avoidance enabled) and switches to the driving phase. Runs in a job. Does nothing without a destination or without a route. | 764 |
| `gameplay_taxi.taxiSettingChanged()` | To call when the enableTaxiInFreeroam setting changes: re-evaluates whether the system should be active. | 833 |

### Parameter details

#### `gameplay_taxi.getTaxiState(vehId)`

Returns the current state of a taxi.

- `vehId` (*integer*) : Vehicle identifier.
- **returns**: string State key ('available' by default).

#### `gameplay_taxi.getTaxiViewData()`

Data for the taxi UI: phase, ability to speed up/slow down/skip/stop/change destination, hurry up level, remaining and total distance, etc.

- **returns**: table Table for the UI (playerCurrentPhase, canHurryUp, canSlowDown, canSkip, canStop, distanceLeft, totalDistance...).

#### `gameplay_taxi.isTaxiRideActive()`

Indicates whether a ride is in progress (driving or arriving phases).

- **returns**: boolean true if on a ride.

#### `gameplay_taxi.isTaxiViewActive()`

Indicates whether the taxi UI view is active.

- **returns**: boolean true if active.

#### `gameplay_taxi.onAiRouteDone(vehId)`

Hook called when the AI has finished its route: switches to the arriving phase if it is the ride's taxi.

- `vehId` (*integer*) : AI vehicle.

#### `gameplay_taxi.onSetBigmapNavFocus(pos)`

Big map hook: stores the chosen destination and sends the UI TaxiDestinationPreviewed with the route length.

- `pos` (*vec3|nil*) : Chosen position, nil to clear.

#### `gameplay_taxi.onTaxiViewEnter(context, toRoute, fromRoute, data)`

UI router hook: adds data.taxi = getTaxiViewData().

- `context` (*any*) : Router context.
- `toRoute` (*string*) : Destination route.
- `fromRoute` (*string*) : Origin route.
- `data` (*table*) : View data table (modified).

#### `gameplay_taxi.onTrafficVehicleAdded(id)`

Hook: if the vehicle is a non-reserved AI taxi, assigns it an availability state.

- `id` (*integer*) : Vehicle identifier.

#### `gameplay_taxi.onTrafficVehicleCrashed(vehId)`

Hook: a crashed taxi is set aside (pickup canceled or marked unavailable) and its light switches to "driverDistress".

- `vehId` (*integer*) : Vehicle identifier.

#### `gameplay_taxi.onTrafficVehicleRemoved(id)`

Hook: forgets the taxi removed from traffic.

- `id` (*integer*) : Vehicle identifier.

#### `gameplay_taxi.onUpdate(dtReal, dtSim, dtRaw)`

Hook called every frame: detects the nearest taxi, updates pull over, arrivals, waiting and blocking of pickups, labels, idle camera, arrival approach, fare, ejection and interface.

- `dtReal` (*number*) : Real time (s).
- `dtSim` (*number*) : Simulated time (s).
- `dtRaw` (*number*) : Raw time (s).

#### `gameplay_taxi.onVehicleResetted(id)`

Hook: randomly removes the state of a reset taxi (except the ride's or pickup's taxi).

- `id` (*integer*) : Vehicle identifier.

#### `gameplay_taxi.onVehicleSwitched(oldId, newId)`

Hook: when the player gets into a pickup taxi, starts the ride (hook onTaxiRideStarted), chooses the fare calculator, blocks driving actions, switches to the orbit camera and opens the destination map; when exiting the taxi, ends the ride.

- `oldId` (*integer*) : Old vehicle.
- `newId` (*integer*) : New vehicle.

#### `gameplay_taxi.onVehicleTriggersExecuteLink(lnk, actionValue, vehicleId)`

Hook: the player triggered a taxi trigger during the ride; three warnings lead to stopping and ejection.

- `lnk` (*any*) : Trigger link.
- `actionValue` (*number*) : 1 on press.
- `vehicleId` (*integer*) : Vehicle concerned.

#### `gameplay_taxi.setIdleCameraEnabled(enabled)`

Enables or disables (user preference) the idle camera (starts after 15 s without action during the ride).

- `enabled` (*boolean*) : true to allow.

#### `gameplay_taxi.setUseBillboards(enabled)`

Enables or disables the floating state labels ("TAXI" + state) above the taxis when the player is on foot; visible up to about 45 m.

- `enabled` (*boolean*) : true to show.

#### `gameplay_taxi.startTaxiWithCurrentRoute(skipWait)`

Closes the big map, computes the route to player.destinationPos then starts the taxi AI (ai.driveUsingPath, 1 lap, avoidance enabled) and switches to the driving phase. Runs in a job. Does nothing without a destination or without a route.

- `skipWait` (*boolean|nil*) : true to not wait 2 s before departure (default false).

## Fields

| Field | Type | Description |
|---|---|---|
| `dependencies` | string[] | Extensions loaded beforehand: gameplay_util_vehicleSighting. |

## Emitted hooks

Events broadcast to extensions by `extensions.hook`:

- `onTaxiCalled` — listened to by 1 module(s)
- `onTaxiRideEnded` — listened to by 1 module(s)
- `onTaxiRideStarted` — listened to by 1 module(s)

**UI events (guihooks.trigger):** `Message`, `TaxiDestinationPreviewed`

## Calls into the engine (C++)

- `be:` `getObject`, `getObjectActive`, `getObjectCount`, `getPlayerVehicle`, `getPlayerVehicleID`, `setPhysicsSpeedFactor`
- `core_environment.` `getLightState`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/gameplay/taxi.lua`.*
