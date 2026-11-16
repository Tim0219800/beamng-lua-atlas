# `test_csvMetrics`

*File: `lua/vehicle/extensions/test/csvMetrics.lua` · VM: Vehicle · 103 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `test_csvMetrics`: `extensions.load (vehicle VM)("test_csvMetrics")`, then the global `test_csvMetrics`

Test tool: periodically records vehicle metrics (time, position, quaternion rotation, and in extended mode temperatures, RPM, fuel, speeds, brake and engine thermals) into a CSV report written with csvlib when disable() is called. Reads electrics.values and powertrain.getDevicesByType('combustionEngine').

## Example

```lua
extensions.load('test_csvMetrics')
test_csvMetrics.enable('metrics.csv', 64, nil)
-- ...
test_csvMetrics.disable() -- writes the file
```

## Notes

- Bug: `logExtendedMetrics = extended == nil and true or false` gives true only if extended is nil; passing extended=true gives false (simple mode) and extended=false also gives false. Extended mode is therefore obtained by passing nil.
- A row is written every `rate` frames (frame % rate == 0), not at a fixed time interval; the default is 64 frames. The frame counter starts at 1 and is only reset to 1 by disable().
- The time (Time column) is the sum of the dt received, in seconds; the ambient temperature is converted from K to °C (obj:getEnvTemperature() - 273.15); the rotation is the quaternion (x,y,z,w).
- Header: the engine thermal columns are only added if device.thermals ~= nil, but writeRow always adds 4 values per engine and indexes v.thermals without a test: error if an engine has no thermals, and misaligned columns.
- Wheel columns: 3 columns per entry of electrics.values.wheelThermals (BrakeCoreTemp, BrakeSurfaceTemp, BrakeThermalEfficiency); electrics.values.wheelThermals must exist.
- csvFile is not written until disable() is called; disable() without a prior enable() would crash (csvFile nil).

## Functions

| Function | Description | Line |
|---|---|---|
| `test_csvMetrics.disable()` | Writes the accumulated CSV to disk (csvData:write(path)), disables recording and resets the frame counter to 1. | 95 |
| `test_csvMetrics.enable(path, writeRate, extended)` | Starts recording: stores the output path and the rate, builds the CSV header (simple or extended) and enables updateGFX. | 16 |
| `test_csvMetrics.updateGFX(dt)` | Called every graphics frame (extensions.hook('updateGFX')). If enabled, accumulates time and writes a row every `rate` frames. *(internal)* | 82 |

### Parameter details

#### `test_csvMetrics.enable(path, writeRate, extended)`

Starts recording: stores the output path and the rate, builds the CSV header (simple or extended) and enables updateGFX.

- `path` (*string*) : Path of the CSV file written by disable().
- `writeRate` (*integer|nil*) : One row every N frames; 64 if nil.
- `extended` (*boolean|nil*) : nil = extended metrics; any other value = simple metrics (see notes, inverted behavior).

#### `test_csvMetrics.updateGFX(dt)`

Called every graphics frame (extensions.hook('updateGFX')). If enabled, accumulates time and writes a row every `rate` frames.

- `dt` (*number*) : Time step in seconds.

## Calls into the engine (C++)

- `obj:` `getEnvTemperature`, `getPosition`, `getRotation`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/vehicle/extensions/test/csvMetrics.lua`.*
