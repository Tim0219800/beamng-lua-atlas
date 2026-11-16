# `ui_vehicleRadarApp`

*File: `lua/ge/extensions/ui/vehicleRadarApp.lua` · VM: Game Engine (GE) · 306 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `ui_vehicleRadarApp`: `extensions.load("ui_vehicleRadarApp")`, then the global `ui_vehicleRadarApp`

Lua part of the "vehicle radar" interface app (vehicle proximity radar). Every GUI frame, it selects the visible vehicles near the player vehicle, computes for each its center, size, orientation, type (vehicle, traffic, parked, trailer), paint color, coupling points (fifthwheel) and minimal distance between oriented bounding boxes (OOBB), then sends it all in the 'vehicleRadar' stream. It loads and saves the app settings.

## Notes

- The settings are stored in settings/ui_apps/appsSettings/vehicleRadarSettings.json. Default keys: rangeMeters=13, rangeSeconds=0.8, foreAftOffsetPct=0, rangeType='distance', minimalLook=false, coloredCars=true.
- With rangeType='time', the range equals the player's speed (m/s) multiplied by rangeSeconds, clamped between 5 and 30 m.
- Vehicles are filtered in two steps (fast by position, precise by OOBB); the OOBB distance is computed only if the gap between boxes is at most about 2.5 m.
- The sizes sent (sizeX/Y/Z) are the full dimensions (2 x half-extents); rotX is the atan2 angle of the box's axis 0, in radians.
- Colors are gamma-corrected (power 1/2.2) and sent as integers 0 to 255.
- The caches (couplings, objects, paints, jbeam name) are cleared on every vehicle change or spawn.

## Functions

| Function | Description | Line |
|---|---|---|
| `ui_vehicleRadarApp.onExtensionLoaded()` | Hook called on load: reads the settings file and sends the settings to the UI via 'VehicleRadarSettingsLoaded'. *(internal)* *(hook)* | 58 |
| `ui_vehicleRadarApp.onGuiUpdate(dtReal, dtSim, dtRaw)` | Hook called every GUI frame: builds {playerVehicleId, playerVehicleSpeed, objects} and sends it via guihooks.queueStream('vehicleRadar', data). Objects are keyed by vehicle id. *(internal)* *(hook)* | 153 |
| `ui_vehicleRadarApp.onVehicleSpawned()` | Hook called when a vehicle spawns: clears the caches. *(internal)* *(hook)* | 296 |
| `ui_vehicleRadarApp.onVehicleSwitched()` | Hook called when the controlled vehicle changes: clears the caches. *(internal)* *(hook)* | 292 |
| `ui_vehicleRadarApp.updateSetting(key, value)` | Modifies an existing setting and saves the settings file. Does nothing if the key does not exist or if the value is unchanged. | 63 |

### Parameter details

#### `ui_vehicleRadarApp.onGuiUpdate(dtReal, dtSim, dtRaw)`

Hook called every GUI frame: builds {playerVehicleId, playerVehicleSpeed, objects} and sends it via guihooks.queueStream('vehicleRadar', data). Objects are keyed by vehicle id.

- `dtReal` (*number*) : Real frame time (s).
- `dtSim` (*number*) : Simulated frame time (s).
- `dtRaw` (*number*) : Raw frame time (s).

#### `ui_vehicleRadarApp.updateSetting(key, value)`

Modifies an existing setting and saves the settings file. Does nothing if the key does not exist or if the value is unchanged.

- `key` (*string*) : Setting name (rangeMeters, rangeSeconds, foreAftOffsetPct, rangeType, minimalLook, coloredCars).
- `value` (*any*) : New value.

**Globals assigned:** `i`

**UI events (guihooks.trigger):** `VehicleRadarSettingsLoaded`

## Calls into the engine (C++)

- `FS:` `directoryCreate`, `directoryExists`
- `be:` `getObject`, `getObjectByID`, `getObjectCount`, `getObjectOOBBHalfExtentsXYZ`, `getPlayerVehicleID`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/ui/vehicleRadarApp.lua`.*
