# `flowgraph_modules_timerModule`

*File: `lua/ge/extensions/flowgraph/modules/timerModule.lua` · VM: Game Engine (GE) · 138 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/modules/timerModule")` (file under extensions/ but not a regular extension)

Flowgraph module (moduleOrder 0) that manages timers. It keeps three cumulative global clocks (real, sim, raw) updated by onUpdate with dtReal, dtSim and dtRaw; each timer references one of them (mode 'dtSim', 'dtReal' or 'dtRaw'), has a start time, a duration (default 5 s) and can be paused. The values are stored in a variableStorage and finalized at the end of the tick.

## Notes

- Units: seconds. Default mode: 'dtSim' (simulation time, affected by slow motion and pause).
- Pauses are deferred: setPause sets a flag (pauseFlag) applied in afterTrigger.
- Probable bug: clear() does C.idCounter = 0 on the class and not on self; the instance keeps its id counter if self.idCounter was already created.
- setMode uses variables:set whereas the other functions use variables:change; the exact behavior depends on variableStorage (not checked here).
- setPause raises an error if the id is unknown.

## Functions

| Function | Description | Line |
|---|---|---|
| `flowgraph_modules_timerModule.addTimer(data)` | Creates a timer and returns its id. (dynamically assigned) | dyn |
| `flowgraph_modules_timerModule.afterTrigger()` | Called after the graph tick: applies the pending pauses or resumes then finalizes the variables. (dynamically assigned) *(internal)* | dyn |
| `flowgraph_modules_timerModule.clear()` | Clears variables and timers, resets the global clocks to 0. (dynamically assigned) *(internal)* | dyn |
| `flowgraph_modules_timerModule.executionStopped()` | Called when the project stops: calls clear(). (dynamically assigned) *(internal)* | dyn |
| `flowgraph_modules_timerModule.getElapsedTime(id)` | Returns the elapsed time: frozen value if paused, otherwise the mode's clock minus the start. (dynamically assigned) | dyn |
| `flowgraph_modules_timerModule.getFreeId()` | Increments and returns a timer id. (dynamically assigned) | dyn |
| `flowgraph_modules_timerModule.getGlobalTime(mode)` | Returns the global clock of the requested mode. (dynamically assigned) | dyn |
| `flowgraph_modules_timerModule.getTimer(id)` | Returns the full timer object (start, mode, duration, isPaused...). (dynamically assigned) | dyn |
| `flowgraph_modules_timerModule.init()` | Creates the variableStorage and calls clear(). (dynamically assigned) *(internal)* | dyn |
| `flowgraph_modules_timerModule.isComplete(id)` | True if the elapsed time has reached the duration. (dynamically assigned) | dyn |
| `flowgraph_modules_timerModule.onUpdate(dtReal, dtSim, dtRaw)` | Called on every manager update: adds dtReal, dtSim and dtRaw to the global clocks. (dynamically assigned) *(internal)* *(hook)* | dyn |
| `flowgraph_modules_timerModule.set(id, field, val)` | Changes a timer field (start, mode, duration) via the variableStorage. (dynamically assigned) | dyn |
| `flowgraph_modules_timerModule.setElapsedTime(id, time)` | Sets a timer's elapsed time (paused: stores the value; otherwise recomputes the start). (dynamically assigned) | dyn |
| `flowgraph_modules_timerModule.setMode(id, mode)` | Changes the timer's clock mode while keeping the elapsed time (if not paused). (dynamically assigned) | dyn |
| `flowgraph_modules_timerModule.setPause(id, val)` | Pauses or resumes a timer; the effect is applied in afterTrigger. Does nothing if the requested state is already the current one; warns if a flag is already set. (dynamically assigned) | dyn |

### Parameter details

#### `flowgraph_modules_timerModule.addTimer(data)`

Creates a timer and returns its id. (dynamically assigned)

- `data` (*table*) : mode (default 'dtSim'), time (time already elapsed, default 0), duration (default 5)
- **returns**: integer timer id

#### `flowgraph_modules_timerModule.getElapsedTime(id)`

Returns the elapsed time: frozen value if paused, otherwise the mode's clock minus the start. (dynamically assigned)

- `id` (*integer*) : timer id
- **returns**: number elapsed time (s)

#### `flowgraph_modules_timerModule.getFreeId()`

Increments and returns a timer id. (dynamically assigned)

- **returns**: integer id

#### `flowgraph_modules_timerModule.getGlobalTime(mode)`

Returns the global clock of the requested mode. (dynamically assigned)

- `mode` (*string*) : 'dtSim', 'dtReal' or 'dtRaw'
- **returns**: number cumulative time (s), 0 if the mode is unknown

#### `flowgraph_modules_timerModule.getTimer(id)`

Returns the full timer object (start, mode, duration, isPaused...). (dynamically assigned)

- `id` (*integer*) : timer id
- **returns**: table|nil timer

#### `flowgraph_modules_timerModule.isComplete(id)`

True if the elapsed time has reached the duration. (dynamically assigned)

- `id` (*integer*) : timer id
- **returns**: boolean completed

#### `flowgraph_modules_timerModule.onUpdate(dtReal, dtSim, dtRaw)`

Called on every manager update: adds dtReal, dtSim and dtRaw to the global clocks. (dynamically assigned)

- `dtReal` (*number*) : real time delta (s)
- `dtSim` (*number*) : simulation time delta (s)
- `dtRaw` (*number*) : raw time delta (s)

#### `flowgraph_modules_timerModule.set(id, field, val)`

Changes a timer field (start, mode, duration) via the variableStorage. (dynamically assigned)

- `id` (*integer*) : timer id
- `field` (*string*) : start, mode or duration
- `val` (*any*) : new value

#### `flowgraph_modules_timerModule.setElapsedTime(id, time)`

Sets a timer's elapsed time (paused: stores the value; otherwise recomputes the start). (dynamically assigned)

- `id` (*integer*) : timer id
- `time` (*number*) : elapsed time (s)

#### `flowgraph_modules_timerModule.setMode(id, mode)`

Changes the timer's clock mode while keeping the elapsed time (if not paused). (dynamically assigned)

- `id` (*integer*) : timer id
- `mode` (*string*) : 'dtSim', 'dtReal' or 'dtRaw'

#### `flowgraph_modules_timerModule.setPause(id, val)`

Pauses or resumes a timer; the effect is applied in afterTrigger. Does nothing if the requested state is already the current one; warns if a flag is already set. (dynamically assigned)

- `id` (*integer*) : timer id
- `val` (*boolean*) : true = pause, false = resume

## Class `C`

| Method | Description | Line |
|---|---|---|
| `C:addTimer(data)` | adds a new timer. | 38 |
| `C:afterTrigger()` | called at the end, finalizing all the merge strats. | 112 |
| `C:clear()` |  | 18 |
| `C:executionStopped()` |  | 134 |
| `C:getElapsedTime(id)` | gets the elapsed time on a timer. | 92 |
| `C:getFreeId()` |  | 8 |
| `C:getGlobalTime(mode)` | gets the global time depending on the mode. | 30 |
| `C:getTimer(id)` | gets the full timer object. | 58 |
| `C:init()` |  | 13 |
| `C:isComplete(id)` | checks if the timer is complete. | 101 |
| `C:onUpdate(dtReal, dtSim, dtRaw)` |  | 105 |
| `C:set(id, field, val)` | sets some field for the timer, using the variables. | 61 |
| `C:setElapsedTime(id, time)` | sets the elapsed time on a timer. | 74 |
| `C:setMode(id, mode)` | sets the desired mode of the timer | 83 |
| `C:setPause(id, val)` | pauses or unpauses a timer. | 64 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/modules/timerModule.lua`.*
