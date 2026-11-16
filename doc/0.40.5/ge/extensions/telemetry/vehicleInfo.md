# `telemetry_vehicleInfo`

*File: `lua/ge/extensions/telemetry/vehicleInfo.lua` · VM: Game Engine (GE) · 50 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `telemetry_vehicleInfo`: `extensions.load("telemetry_vehicleInfo")`, then the global `telemetry_vehicleInfo`

Utilities shared by the telemetry trackers to describe a vehicle: model and configuration (`getData`) and originating mod (`getMod`). It is not a tracker itself, hence its place outside the `trackers` folder.

## Example

```lua
local data = telemetry_vehicleInfo.getData(be:getPlayerVehicleID(0))
if data then print(data.model, data.config) end
```

## Notes

- A custom configuration (partConfig containing `{` or `[`) is reported as ":custom", so that no user-built configuration leaves the machine.
- getMod can only resolve zipped mods: an unpacked mod returns nil.

## Functions

| Function | Description | Line |
|---|---|---|
| `telemetry_vehicleInfo.getData(vid)` | Returns the model (`vehicle.JBeam`) and configuration of a vehicle. The configuration is the file name without extension, or ":custom" if it is custom. Returns nil (with a warning in the log if the id is unknown) if the vehicle does not exist or is not a BeamNGVehicle. | 14 |
| `telemetry_vehicleInfo.getMod(model)` | Returns the mod a vehicle model comes from, via `core_modmanager.getModForFilename('/vehicles/<model>/info.json')`. Nil for base content, if the model is nil or if `core_modmanager` is absent. | 37 |

### Parameter details

#### `telemetry_vehicleInfo.getData(vid)`

Returns the model (`vehicle.JBeam`) and configuration of a vehicle. The configuration is the file name without extension, or ":custom" if it is custom. Returns nil (with a warning in the log if the id is unknown) if the vehicle does not exist or is not a BeamNGVehicle.

- `vid` (*integer*) : Vehicle object id.
- **returns**: table|nil `{model = string, config = string}` or nil.

#### `telemetry_vehicleInfo.getMod(model)`

Returns the mod a vehicle model comes from, via `core_modmanager.getModForFilename('/vehicles/<model>/info.json')`. Nil for base content, if the model is nil or if `core_modmanager` is absent.

- `model` (*string|nil*) : Vehicle model name (folder under /vehicles).
- **returns**: table|nil `{name = string, modID = any}` (modID may be nil), or nil.

## Calls into the engine (C++)

- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/telemetry/vehicleInfo.lua`.*
