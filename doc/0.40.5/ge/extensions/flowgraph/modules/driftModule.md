# `flowgraph_modules_driftModule`

*File: `lua/ge/extensions/flowgraph/modules/driftModule.lua` · VM: Game Engine (GE) · 69 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/modules/driftModule")` (file under extensions/ but not a regular extension)

Flowgraph module (moduleOrder 0, depends on gameplay_drift_general) that relays drift gameplay events to flowgraph nodes. It listens to the hooks onDriftSpinout, onDriftCrash, onDonutDriftScored, onTightDriftScored and onDriftCompletedScored, and keeps each event in a callbacks table with a lifetime (ttl) of 2 ticks that nodes can read.

## Notes

- The callbacks known at init are tight, donut, spinout, crash, tap, scored; each has ttl = 0 at the start.
- An event is considered active as long as ttl > 0; onUpdate decrements the ttl by one per call.
- addCallback sets ttl = 2: the event stays visible for about 2 updates.
- onDonutZoneReactivated is not declared in C.hooks; it is called directly and relays to gameplay_drift_drift.onDonutZoneReactivated().

**Dependencies (loaded first):** `gameplay_drift_general`

## Functions

| Function | Description | Line |
|---|---|---|
| `flowgraph_modules_driftModule.addCallback(name, data)` | Registers (or replaces) an event with ttl = 2 and some data. (dynamically assigned) | dyn |
| `flowgraph_modules_driftModule.getCallBacks()` | Returns the callbacks table (key = name, value = {ttl, data}). (dynamically assigned) | dyn |
| `flowgraph_modules_driftModule.init()` | Called when the module is created: calls resetModule(). (dynamically assigned) *(internal)* | dyn |
| `flowgraph_modules_driftModule.onDonutDriftScored(score)` | Hook: donut scored; registers 'donut' with {score}. (dynamically assigned) *(internal)* *(hook)* | dyn |
| `flowgraph_modules_driftModule.onDonutZoneReactivated()` | Relays to gameplay_drift_drift.onDonutZoneReactivated(). (dynamically assigned) *(hook)* | dyn |
| `flowgraph_modules_driftModule.onDriftCompletedScored(data)` | Hook: drift completed and counted; registers 'scored' with addedScore, cachedScore and combo. (dynamically assigned) *(internal)* *(hook)* | dyn |
| `flowgraph_modules_driftModule.onDriftCrash()` | Hook: drift crash; registers 'crash'. (dynamically assigned) *(internal)* *(hook)* | dyn |
| `flowgraph_modules_driftModule.onDriftSpinout()` | Hook: the player spun out; registers 'spinout'. (dynamically assigned) *(internal)* *(hook)* | dyn |
| `flowgraph_modules_driftModule.onTightDriftScored(score)` | Hook: tight drift scored; registers 'tight' with {score}. (dynamically assigned) *(internal)* *(hook)* | dyn |
| `flowgraph_modules_driftModule.onUpdate()` | Called on every manager update: decrements the ttl of each positive callback. (dynamically assigned) *(internal)* *(hook)* | dyn |
| `flowgraph_modules_driftModule.resetModule()` | Recreates the callbacks table with all events at ttl = 0. (dynamically assigned) *(internal)* | dyn |

### Parameter details

#### `flowgraph_modules_driftModule.addCallback(name, data)`

Registers (or replaces) an event with ttl = 2 and some data. (dynamically assigned)

- `name` (*string*) : event name (tight, donut, spinout, crash, scored...)
- `data` (*table|nil*) : associated data

#### `flowgraph_modules_driftModule.getCallBacks()`

Returns the callbacks table (key = name, value = {ttl, data}). (dynamically assigned)

- **returns**: table<string, table> callbacks by name

#### `flowgraph_modules_driftModule.onDonutDriftScored(score)`

Hook: donut scored; registers 'donut' with {score}. (dynamically assigned)

- `score` (*number*) : score obtained

#### `flowgraph_modules_driftModule.onDriftCompletedScored(data)`

Hook: drift completed and counted; registers 'scored' with addedScore, cachedScore and combo. (dynamically assigned)

- `data` (*table*) : fields addedScore, cachedScore, combo

#### `flowgraph_modules_driftModule.onTightDriftScored(score)`

Hook: tight drift scored; registers 'tight' with {score}. (dynamically assigned)

- `score` (*number*) : score obtained

## Class `C`

| Method | Description | Line |
|---|---|---|
| `C:addCallback(name, data)` |  | 38 |
| `C:getCallBacks()` |  | 34 |
| `C:init()` |  | 21 |
| `C:onDonutDriftScored(score)` |  | 57 |
| `C:onDonutZoneReactivated()` |  | 65 |
| `C:onDriftCompletedScored(data)` |  | 61 |
| `C:onDriftCrash()` |  | 49 |
| `C:onDriftSpinout()` |  | 45 |
| `C:onTightDriftScored(score)` |  | 53 |
| `C:onUpdate()` |  | 25 |
| `C:resetModule()` |  | 10 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/modules/driftModule.lua`.*
