# `controller_inputOutputDemo`

*File: `lua/vehicle/controller/inputOutputDemo.lua` · VM: Vehicle · 152 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** controller `inputOutputDemo` declared in the jbeam (`controller`), reachable with `controller.getController("name")`

Demo controller (type "auxiliary", defaultOrder 100000) showing how to read vehicle data, generate inputs and communicate over UDP. Every frame it records time, throttle, brake, battery energy and motor power in an in-memory CSV table, sends random inputs (throttle, brake, steering in FILTER_DIRECT) and exchanges a JSON message with 127.0.0.1:54812. Not intended for a playable vehicle.

## Notes

- Warning: GenerateInputEvents sends random values of throttle (0..1), brake (0..1) and steering (-1..1) every frame: the vehicle becomes uncontrollable.
- The UDP communication uses socket.udp() with a receive timeout of 5 ms, sends {"test":123} and prints (dump) the response; the network blocks for up to 5 ms per frame.
- saveLogToCSV writes the file testLog.csv with writeFile (path relative to the game's write directory, inferred from code).
- No jbeam key is read. The local function names (SaveLogToDisk, LogInterestingData...) are not exported.

## Functions

| Function | Description | Line |
|---|---|---|
| `controller_inputOutputDemo.init()` | Prepares the CSV header, resets the timer to 0 and configures the UDP socket toward 127.0.0.1:54812. *(internal)* | 125 |
| `controller_inputOutputDemo.reset()` | Clears the CSV log (header only) and resets the timer to 0. *(internal)* | 119 |
| `controller_inputOutputDemo.saveLogToCSV()` | Writes the accumulated log to testLog.csv. | 37 |
| `controller_inputOutputDemo.update(dt)` | Increments the internal timer. *(internal)* | 112 |
| `controller_inputOutputDemo.updateFixedStep(dt)` | Does nothing. *(internal)* | 102 |
| `controller_inputOutputDemo.updateGFX(dt)` | Logs the data, generates random inputs and communicates over UDP. *(internal)* | 95 |

### Parameter details

#### `controller_inputOutputDemo.update(dt)`

Increments the internal timer.

- `dt` (*number*) : Time step (s).

#### `controller_inputOutputDemo.updateFixedStep(dt)`

Does nothing.

- `dt` (*number*) : Time step (s).

#### `controller_inputOutputDemo.updateGFX(dt)`

Logs the data, generates random inputs and communicates over UDP.

- `dt` (*number*) : Time step (s).

## Fields

| Field | Type | Description |
|---|---|---|
| `defaultOrder` | number | 100000 (executed last). |
| `type` | string | "auxiliary". |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/vehicle/controller/inputOutputDemo.lua`.*
