# `telemetryLogger`

*File: `lua/vehicle/extensions/telemetryLogger.lua` · VM: Vehicle · 87 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `telemetryLogger`: `extensions.load (vehicle VM)("telemetryLogger")`, then the global `telemetryLogger`

Simple telemetry recorder: every graphics frame (when recording is active) it stores timestamp, position, speed, throttle, brake, steering, parking brake and G forces (sensors.gx2/gy2), then saveDataToDisk writes it all to a CSV file `telemetryData_HH-MM-SS.csv`. Handy for a modder who wants to export a driving session.

## Example

```lua
extensions.load('telemetryLogger')
telemetryLogger.startRecording()
-- ... drive ...
telemetryLogger.saveDataToDisk()
```

## Notes

- CSV columns: frame, timestamp, position, velocity, throttle, brake, steering, parkingbrake, gForceX, gForceY. The position is a string "(x,y,z)" (quoted in the CSV because it contains commas). The line ends with an extra comma; line endings \r\n.
- timestamp = sum of the dt received (simulation seconds), velocity = norm of obj:getVelocity() (m/s).
- The file is created with a relative path (the game's working directory, not a dedicated user folder). The line order comes from pairs() on an indexed array, so normally ascending but not guaranteed.
- saveDataToDisk stops recording, writes, then calls onInit() which clears the data. It returns false if the file cannot be opened (and in that case does not clear the data); otherwise it returns nothing.
- escapeCSV crashes if a value is nil (e.g. sensors.gx2 missing).

## Functions

| Function | Description | Line |
|---|---|---|
| `telemetryLogger.onInit()` | Hook called on vehicle initialization: clears the data, resets the index and the timestamp to zero and stops recording. *(internal)* *(hook)* | 72 |
| `telemetryLogger.onReset()` | Hook called on vehicle reset; same function as onInit (clears the data and stops recording). *(internal)* *(hook)* | 72 |
| `telemetryLogger.saveDataToDisk()` | Stops recording and writes the collected data to `telemetryData_<time>.csv`, then resets the state. | 40 |
| `telemetryLogger.startRecording()` | Enables recording: updateGFX adds a data point every frame. Does not reset the data (use onInit/onReset or saveDataToDisk for that). | 64 |
| `telemetryLogger.stopRecording()` | Pauses recording without clearing the data already collected. | 68 |
| `telemetryLogger.updateGFX(dt)` | Called every graphics frame (extensions.hook('updateGFX')). If recording is active, adds a data point. *(internal)* | 13 |

### Parameter details

#### `telemetryLogger.saveDataToDisk()`

Stops recording and writes the collected data to `telemetryData_<time>.csv`, then resets the state.

- **returns**: boolean|nil false if the file could not be opened, nil otherwise.

#### `telemetryLogger.updateGFX(dt)`

Called every graphics frame (extensions.hook('updateGFX')). If recording is active, adds a data point.

- `dt` (*number*) : Time step in seconds, added to the timestamp.

## Calls into the engine (C++)

- `obj:` `getPosition`, `getVelocity`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/vehicle/extensions/telemetryLogger.lua`.*
