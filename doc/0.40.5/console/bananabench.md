# `bananabench`

*File: `lua/console/bananabench.lua` · VM: Console · 239 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("bananabench")`

Vehicle physics test bench "bananabench" (version 0.5), run in the console VM (BeamNG without UI). It initializes a physics engine (initBeamEngine at 2000 Hz), loads a vehicle (jbeam/loader), spawns it in 1 to N copies and measures, over 200 iterations of 100 physics steps, the throughput in millions of beams per second (MBeams/s) and the percentage of real time. It prints a table and returns the results. It is the base used by bananabench-json, bananabench-csv, bananabench-xml and bananabench-print.

## Example

```lua
local bench = require('lua/console/bananabench')
local res = bench.physics({'pickup'}, 1, 4)
print(res.tests.pickup.maxMbeams)
```

## Notes

- Internal constants: physicsFPS = 2000, physicsSteps = 100 (do not exceed), gfxSteps = 200, default vehicle {'pickup'}, default number of vehicles 40 (global VehiclesToTest if defined).
- On load, the file calls require('jit') and lua/console/console-lib.initConsole() (which creates dummy globals) and initBeamEngine; it therefore creates an engine on import.
- Each vehicle is placed at (300*i, 300*i, 1) and its sleeping is disabled (setSleepingEnabled(false)). A 5-step warm-up round precedes each measurement; the GC is stopped and the JIT turned off (under pcall, since it may be absent on some platforms) during the measurement.
- Result of benchPhysics: {hw, physicsFPS, physicsSteps, gfxSteps, version, tests = {[vehicle] = {maxMbeams, maxMbeamsNum, maxRealtimeVehicles, version = 2, time, tests = {{vehicles, res = {Mbeamspersec, percentRealtime, time, spawntime}, msg}}}}, vehicleMax, vehicleMin, time}.
- Globals created: benchLog (log collector not used afterwards), benchPhysics, myBenchStep. Uses the engine APIs BeamEngine:spawnObject2/deleteAllObjects/instabilityDetected/setDynamicCollisionEnabled, obj:getNodeCount/getBeamCount/queueLuaCommand, FS:findFiles, setPowerPlanMaxPerformance/restorePowerPlan.
- `benchPhysics` returns nil (after an error log) if the engine could not be created; a vehicle whose beam or node count is nil is skipped.

## Functions

| Function | Description | Line |
|---|---|---|
| `bananabench.beam()` | Returns the BeamEngine engine object created by this module, to drive it directly (e.g. setThreadingLayout for a thread count sweep). | 234 |
| `bananabench.getAllVehicles()` | Lists the subfolders of /vehicles (excluding /vehicles/common) as names. | 84 |
| `bananabench.physics(vehicles, vehicleMin, vehicleMax)` | Runs the physics benchmark (alias of benchPhysics). For each vehicle in the list, measures from vehicleMin to vehicleMax copies and prints an MBeams/s and % realtime table. | 94 |

### Parameter details

#### `bananabench.beam()`

Returns the BeamEngine engine object created by this module, to drive it directly (e.g. setThreadingLayout for a thread count sweep).

- **returns**: userdata Native BeamNG system.

#### `bananabench.getAllVehicles()`

Lists the subfolders of /vehicles (excluding /vehicles/common) as names.

- **returns**: string[] Vehicle names.

#### `bananabench.physics(vehicles, vehicleMin, vehicleMax)`

Runs the physics benchmark (alias of benchPhysics). For each vehicle in the list, measures from vehicleMin to vehicleMax copies and prints an MBeams/s and % realtime table.

- `vehicles` (*string[]|nil*) : Folder names under /vehicles; default {'pickup'}.
- `vehicleMin` (*integer|nil*) : Minimum number of simultaneous vehicles (default 1).
- `vehicleMax` (*integer|nil*) : Maximum number (default VehiclesToTest or 40).
- **returns**: table|nil Benchmark results (see notes), nil if the engine is unavailable.

## Global functions defined here

| Function | Description | Line |
|---|---|---|
| `benchLog(level, origin, msg, newline)` |  | 71 |
| `benchPhysics(vehicles, vehicleMin, vehicleMax)` |  | 94 |
| `myBenchStep(testVehicle, vehLPackData, n, steps)` |  | 33 |

## Calls into the engine (C++)

- `BeamEngine:` `deleteAllObjects`, `instabilityDetected`, `setDynamicCollisionEnabled`, `spawnObject2`
- `FS:` `findFiles`
- `obj:` `getBeamCount`, `getNodeCount`, `queueLuaCommand`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/console/bananabench.lua`.*
