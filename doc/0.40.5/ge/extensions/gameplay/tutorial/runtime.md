# `gameplay_tutorial_runtime`

*File: `lua/ge/extensions/gameplay/tutorial/runtime.lua` · VM: Game Engine (GE) · 306 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `gameplay_tutorial_runtime`: `extensions.load("gameplay_tutorial_runtime")`, then the global `gameplay_tutorial_runtime`

Generic tutorial engine: it chains "steps" that are each a separate Lua extension (prefix + step identifier). It loads/unloads the current step's extension, stores progress (completed steps, current step) and relays onUpdate/onPreRender to the active step, to damage tracking, to the markers and to the zone bounds system. A modder uses it by calling configure() then start().

## Example

```lua
gameplay_tutorial_runtime.configure({stepOrder = {"1", "2"}, stepExtensionPrefix = "career_modules_tutorial_step"})
gameplay_tutorial_runtime.start()
-- from a completed step:
gameplay_tutorial_runtime.advanceToNextStep()
```

## Notes

- A step's extension is loaded under the name stepExtensionPrefix .. stepId; it can expose setup(), cleanup(), onUpdate() and onPreRender().
- stop() unloads the step without marking the tutorial as completed and cleans up neither markers, nor bounds, nor setup; endTutorial() does this full cleanup and sets isCompleted to true.
- A step identifier is converted to a string by activateStep (tostring); completeStep, on the other hand, uses the identifier as is as the key in completedSteps.
- onUpdate updates damage tracking (damageTracker) even when the tutorial is not active.

**Dependencies (loaded first):** `gameplay_tutorial_setup`, `gameplay_tutorial_markers`, `gameplay_tutorial_damageTracker`, `gameplay_tutorial_bounds`

## Functions

| Function | Description | Line |
|---|---|---|
| `gameplay_tutorial_runtime.activateStep(stepId)` | Cleans up and unloads the previous step, loads the new step's extension, updates progress and calls its setup({}). | 150 |
| `gameplay_tutorial_runtime.advanceToNextStep()` | Completes the current step then activates the next one; if there are none left, calls endTutorial(). | 200 |
| `gameplay_tutorial_runtime.completeStep(stepId)` | Marks a step as completed in completedSteps. | 192 |
| `gameplay_tutorial_runtime.configure(opts)` | Sets the configuration: step order, step extension prefix, initial prefabs, loading of sites and blocked actions at start, onStarted/onEnded callbacks. Also wires the getters of the bounds and markers modules (tutorial vehicle). | 57 |
| `gameplay_tutorial_runtime.endTutorial()` | Normal end: cleanup of the step, markers, damage tracking, bounds and setup; sets isCompleted to true, clears the UI task list (ClearTasklist) and calls onEnded. | 227 |
| `gameplay_tutorial_runtime.getCurrentStep()` | Identifier of the current step. | 103 |
| `gameplay_tutorial_runtime.getProgressData()` | Returns the internal progress table (not a copy). | 95 |
| `gameplay_tutorial_runtime.getStepIdByIndex(index)` | Step identifier at a given position in the configured order. | 111 |
| `gameplay_tutorial_runtime.getStepOrder()` | Returns the configured ordered list of step identifiers. | 107 |
| `gameplay_tutorial_runtime.isActive()` | Indicates whether the tutorial is in progress. | 99 |
| `gameplay_tutorial_runtime.onPreRender(dtReal, dtSim, dtRaw)` | Hook called before rendering: relays to the active step (dtReal, dtSim only) and to the bounds module. *(internal)* *(hook)* | 293 |
| `gameplay_tutorial_runtime.onUpdate(dtReal, dtSim, dtRaw)` | Hook called every frame by the extension engine: passes the tutorial vehicle id to the damageTracker, relays to the active step, updates damage, markers and bounds. *(internal)* *(hook)* | 277 |
| `gameplay_tutorial_runtime.setProgressData(data)` | Replaces the progress (current step, completed steps, completed flag), typically after loading a save. | 88 |
| `gameplay_tutorial_runtime.start()` | Starts the tutorial: activates the initial prefabs, loads the sites, installs the blocked actions, then activates the stored step (or the first one if invalid). Calls onStarted on success. | 115 |
| `gameplay_tutorial_runtime.stop()` | Unloads the active step without marking the tutorial as completed and without cleaning up the other modules. | 262 |

### Parameter details

#### `gameplay_tutorial_runtime.activateStep(stepId)`

Cleans up and unloads the previous step, loads the new step's extension, updates progress and calls its setup({}).

- `stepId` (*string|integer*) : Step identifier present in stepOrder.
- **returns**: boolean false if inactive, invalid id or extension not found.

#### `gameplay_tutorial_runtime.advanceToNextStep()`

Completes the current step then activates the next one; if there are none left, calls endTutorial().

- **returns**: boolean false if inactive or if the current step is not in stepOrder.

#### `gameplay_tutorial_runtime.completeStep(stepId)`

Marks a step as completed in completedSteps.

- `stepId` (*string*) : Step identifier.
- **returns**: boolean false if the tutorial is not active.

#### `gameplay_tutorial_runtime.configure(opts)`

Sets the configuration: step order, step extension prefix, initial prefabs, loading of sites and blocked actions at start, onStarted/onEnded callbacks. Also wires the getters of the bounds and markers modules (tutorial vehicle).

- `opts` (*table*) : Optional fields: stepOrder (list of ids), stepExtensionPrefix, initialPrefabs, loadSitesOnStart, setupBlockedActionsOnStart, onStarted, onEnded.

#### `gameplay_tutorial_runtime.endTutorial()`

Normal end: cleanup of the step, markers, damage tracking, bounds and setup; sets isCompleted to true, clears the UI task list (ClearTasklist) and calls onEnded.

- **returns**: boolean false if the tutorial was not active.

#### `gameplay_tutorial_runtime.getCurrentStep()`

Identifier of the current step.

- **returns**: string|nil nil if no step is active.

#### `gameplay_tutorial_runtime.getProgressData()`

Returns the internal progress table (not a copy).

- **returns**: table {currentStepId, completedSteps, isCompleted}

#### `gameplay_tutorial_runtime.getStepIdByIndex(index)`

Step identifier at a given position in the configured order.

- `index` (*integer*) : Position starting at 1.
- **returns**: string|nil nil if out of bounds.

#### `gameplay_tutorial_runtime.getStepOrder()`

Returns the configured ordered list of step identifiers.

- **returns**: string[] List of ids.

#### `gameplay_tutorial_runtime.isActive()`

Indicates whether the tutorial is in progress.

- **returns**: boolean true between start() and endTutorial()/stop().

#### `gameplay_tutorial_runtime.onPreRender(dtReal, dtSim, dtRaw)`

Hook called before rendering: relays to the active step (dtReal, dtSim only) and to the bounds module.

- `dtReal` (*number*) : Real time delta (s).
- `dtSim` (*number*) : Simulated time delta (s).
- `dtRaw` (*number*) : Raw time delta (s).

#### `gameplay_tutorial_runtime.onUpdate(dtReal, dtSim, dtRaw)`

Hook called every frame by the extension engine: passes the tutorial vehicle id to the damageTracker, relays to the active step, updates damage, markers and bounds.

- `dtReal` (*number*) : Real time delta (s).
- `dtSim` (*number*) : Simulated time delta (s).
- `dtRaw` (*number*) : Raw time delta (s).

#### `gameplay_tutorial_runtime.setProgressData(data)`

Replaces the progress (current step, completed steps, completed flag), typically after loading a save.

- `data` (*table*) : Table with currentStepId, completedSteps (table id -> true) and isCompleted.

#### `gameplay_tutorial_runtime.start()`

Starts the tutorial: activates the initial prefabs, loads the sites, installs the blocked actions, then activates the stored step (or the first one if invalid). Calls onStarted on success.

- **returns**: boolean false if already active, if stepOrder is empty or if the step could not be activated.

## Fields

| Field | Type | Description |
|---|---|---|
| `dependencies` | string[] | Extensions loaded before this one: gameplay_tutorial_setup, _markers, _damageTracker and _bounds. |
| `sharedTutorialData` | table | Shared empty table that steps can use to exchange data. |

**UI events (guihooks.trigger):** `ClearTasklist`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/gameplay/tutorial/runtime.lua`.*
