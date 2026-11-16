# `controller_loggerTemplate`

*File: `lua/vehicle/controller/loggerTemplate.lua` · VM: Vehicle · 103 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** controller `loggerTemplate` declared in the jbeam (`controller`), reachable with `controller.getController("name")`

Data logging controller template (type "auxiliary", defaultOrder 100000): every frame it appends to an in-memory CSV (csvlib library) time, throttle, brake, stored energy of the electric batteries and power of the electric motors. saveLogToCSV writes the "testLog" file. To be copied as a starting point for a custom logger.

## Notes

- No jbeam key is read. The timer is incremented by update(dt); csvData:write('testLog') writes the file without an explicit extension (csvlib behavior).
- The power is outputTorque1 * outputAV1 (W) summed over the devices of type "electricMotor".

## Functions

| Function | Description | Line |
|---|---|---|
| `controller_loggerTemplate.init()` | Creates the CSV (columns time, throttle, brake, batteryCapacity, motorPower) and resets the timer to 0. *(internal)* | 83 |
| `controller_loggerTemplate.reset()` | Recreates an empty CSV and resets the timer to 0. *(internal)* | 77 |
| `controller_loggerTemplate.saveLogToCSV()` | Writes the CSV to disk under the name testLog. | 19 |
| `controller_loggerTemplate.update(dt)` | Increments the internal timer. *(internal)* | 70 |
| `controller_loggerTemplate.updateFixedStep(dt)` | Does nothing. *(internal)* | 60 |
| `controller_loggerTemplate.updateGFX(dt)` | Adds a data row to the CSV. *(internal)* | 55 |

### Parameter details

#### `controller_loggerTemplate.update(dt)`

Increments the internal timer.

- `dt` (*number*) : Time step (s).

#### `controller_loggerTemplate.updateFixedStep(dt)`

Does nothing.

- `dt` (*number*) : Time step (s).

#### `controller_loggerTemplate.updateGFX(dt)`

Adds a data row to the CSV.

- `dt` (*number*) : Time step (s).

## Fields

| Field | Type | Description |
|---|---|---|
| `defaultOrder` | number | 100000. |
| `type` | string | "auxiliary". |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/vehicle/controller/loggerTemplate.lua`.*
