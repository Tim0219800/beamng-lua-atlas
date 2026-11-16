# `gameplay_drift_quickMessages`

*File: `lua/ge/extensions/gameplay/drift/quickMessages.lua` · VM: Game Engine (GE) · 456 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `gameplay_drift_quickMessages`: `extensions.load("gameplay_drift_quickMessages")`, then the global `gameplay_drift_quickMessages`

Detects the drift "quick messages" (small bonuses shown during the drift: big angle, reverse drift, long drift, close call, long chain, precision drift) and gives them a reward that is added to the cached score. Each message is described by primary conditions (all to be met at the same time), possibly confirmation conditions (e.g. no crash afterwards) and reset conditions. Emits onDriftQuickMessageDisplay for the interface and onDriftQuickMessageReached for the scoreboard.

## Notes

- Messages and settings: bigAngle (angle > 80°, +15), reverseDrift (angle > 105°, +30), longDrift (duration > 4 s and speed > 30, +20), closeCall (angle > 25°, speed > 30 km/h, wall distance < 1.5 m, confirmed if no crash for 1 s, reset after 4 s, +80), longDriftChain (>= 10 chained drifts, +160), precisionDrifting (3 closeCalls in a chain and no longer drifting, +150).
- The text comes from the translation missions.drift.quickMessage.<id> and is displayed in the form "text +reward".
- The conditions are not evaluated when general drift is frozen (gameplay_drift_general.getFrozen()).
- Optimization: after 2 s without drift, with no chain or confirmation pending, the module goes into idle mode and skips the checks until the next drift.
- A crash, a spinout or the reset of the player's vehicle call reset() and cancel any pending message.

**Dependencies (loaded first):** `gameplay_drift_general`, `gameplay_drift_drift`, `gameplay_drift_scoring`

## Functions

| Function | Description | Line |
|---|---|---|
| `gameplay_drift_quickMessages.getDriftDebugInfo()` | Returns {default=false, canBeChanged=true} for the drift debug window. | 422 |
| `gameplay_drift_quickMessages.getGC()` | Returns the amount of garbage measured by the profiler at the last frame (0 outside debug). | 426 |
| `gameplay_drift_quickMessages.getQuickMessages()` | Re-translates then returns the quick messages table (used by the scoreboard and the end screen). | 416 |
| `gameplay_drift_quickMessages.onDriftActiveDataFinished()` | Hook: an individual drift just ended (triggers the onDriftEnd type resets). *(internal)* *(hook)* | 402 |
| `gameplay_drift_quickMessages.onDriftCompleted()` | Hook: a drift chain has ended (triggers the onChainEnd type resets). *(internal)* *(hook)* | 412 |
| `gameplay_drift_quickMessages.onDriftCrash()` | Hook: crash, calls reset(). *(internal)* *(hook)* | 434 |
| `gameplay_drift_quickMessages.onDriftPlVehReset()` | Hook: the player's drift vehicle was put back in place; calls reset(). *(internal)* *(hook)* | 407 |
| `gameplay_drift_quickMessages.onDriftSpinout()` | Hook: spinout, calls reset(). *(internal)* *(hook)* | 438 |
| `gameplay_drift_quickMessages.onUpdate(dt)` | Called every frame: reads the tracked vehicle's drift state, checks primary conditions, confirmations and resets, handles idle mode. *(internal)* *(hook)* | 345 |
| `gameplay_drift_quickMessages.reset()` | Empties the messages awaiting confirmation and already triggered, resets the close call counter and idle mode to zero. | 393 |

### Parameter details

#### `gameplay_drift_quickMessages.getDriftDebugInfo()`

Returns {default=false, canBeChanged=true} for the drift debug window.

- **returns**: table {default = false, canBeChanged = true}

#### `gameplay_drift_quickMessages.getGC()`

Returns the amount of garbage measured by the profiler at the last frame (0 outside debug).

- **returns**: number Garbage of the "Drift quick messages" section.

#### `gameplay_drift_quickMessages.getQuickMessages()`

Re-translates then returns the quick messages table (used by the scoreboard and the end screen).

- **returns**: table<string, {msg:string, reward:number, primaryConditions:table}> Quick messages keyed by id (precisionDrifting, bigAngle, reverseDrift, longDrift, closeCall, longDriftChain).

#### `gameplay_drift_quickMessages.onUpdate(dt)`

Called every frame: reads the tracked vehicle's drift state, checks primary conditions, confirmations and resets, handles idle mode.

- `dt` (*number*) : Time delta (first argument of onUpdate, dtReal).

## Fields

| Field | Type | Description |
|---|---|---|
| `dependencies` | string[] | gameplay_drift_general, gameplay_drift_drift, gameplay_drift_scoring. |

## Emitted hooks

Events broadcast to extensions by `extensions.hook`:

- `onDriftQuickMessageDisplay` — listened to by 1 module(s)
- `onDriftQuickMessageReached` — listened to by 1 module(s)

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/gameplay/drift/quickMessages.lua`.*
