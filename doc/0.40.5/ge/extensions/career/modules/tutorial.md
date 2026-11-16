# `career_modules_tutorial`

*File: `lua/ge/extensions/career/modules/tutorial.lua` · VM: Game Engine (GE) · 240 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `career_modules_tutorial`: `extensions.load("career_modules_tutorial")`, then the global `career_modules_tutorial`

Career tutorial, in 9 steps (01enterVehicle to 09spmSignup). This module is a thin layer over gameplay_tutorial_runtime: it provides the step order, the step extension prefix (career_modules_tutorial_step<id>), the initial prefabs and the end action, and it saves progress in <profile>/career/tutorialState.json.

## Notes

- At career start (onCareerActive), the tutorial only starts if career_career.tutorialEnabled is true.
- At the end of the tutorial: autosave re-enabled, save, default career recovery, player state reset, raw POIs cleared and return to the "career" game state.
- An invalid saved step is ignored (back to the first step).
- The control functions return the runtime's boolean and resynchronize progress on success.
- sharedTutorialData is captured at the end of module loading (copy of the runtime's reference).

**Dependencies (loaded first):** `gameplay_tutorial_runtime`, `gameplay_tutorial_setup`, `gameplay_tutorial_markers`, `gameplay_tutorial_damageTracker`, `gameplay_tutorial_bounds`

## Functions

| Function | Description | Line |
|---|---|---|
| `career_modules_tutorial.activateStep(stepId)` | Directly activates a step. | 164 |
| `career_modules_tutorial.advanceToNextStep()` | Moves to the next step. | 180 |
| `career_modules_tutorial.completeStep(stepId)` | Marks a step as completed. | 172 |
| `career_modules_tutorial.endTutorial()` | Ends the tutorial (triggers the configured end action). | 188 |
| `career_modules_tutorial.getCompletedSteps()` | Returns the completed steps. | 204 |
| `career_modules_tutorial.getCurrentStep()` | Returns the id of the current step. | 144 |
| `career_modules_tutorial.getStepIdByIndex(index)` | Returns the step id at a given index (starting from 1). | 152 |
| `career_modules_tutorial.getStepOrder()` | Returns the ordered list of step ids. | 148 |
| `career_modules_tutorial.isActive()` | Indicates whether the tutorial is in progress. | 140 |
| `career_modules_tutorial.onCareerActive()` | Hook called when the career becomes active; starts the tutorial if enabled. *(internal)* *(hook)* | 132 |
| `career_modules_tutorial.onExtensionLoaded()` | Load hook: configures the runtime, reads tutorialState.json of the current profile and sends the progress to the runtime. *(internal)* *(hook)* | 94 |
| `career_modules_tutorial.onExtensionUnloaded()` | Unload hook: stops the runtime. *(internal)* *(hook)* | 120 |
| `career_modules_tutorial.onGetRawPoiListForTutorial(elements)` | During the tutorial, adds the "garage" point (tutorial_apm_parking) to the POI list on the garageExteriorPark parking spot, with icon, name and big map thumbnail. *(internal)* *(hook)* | 209 |
| `career_modules_tutorial.onPreRender(dtReal, dtSim, dtRaw)` | Pre-render hook: relays to the runtime. *(internal)* *(hook)* | 200 |
| `career_modules_tutorial.onSaveCurrentProfile(currentSavePath)` | Profile save hook: writes the progress to tutorialState.json. *(internal)* *(hook)* | 126 |
| `career_modules_tutorial.onUpdate(dtReal, dtSim, dtRaw)` | Update hook: relays to the runtime. *(internal)* *(hook)* | 196 |
| `career_modules_tutorial.start()` | Starts the tutorial via the runtime. | 156 |

### Parameter details

#### `career_modules_tutorial.activateStep(stepId)`

Directly activates a step.

- `stepId` (*string*) : Step id.
- **returns**: boolean Success.

#### `career_modules_tutorial.advanceToNextStep()`

Moves to the next step.

- **returns**: boolean Success.

#### `career_modules_tutorial.completeStep(stepId)`

Marks a step as completed.

- `stepId` (*string*) : Step id.
- **returns**: boolean Success.

#### `career_modules_tutorial.endTutorial()`

Ends the tutorial (triggers the configured end action).

- **returns**: boolean Success.

#### `career_modules_tutorial.getCompletedSteps()`

Returns the completed steps.

- **returns**: table completedSteps from the runtime (empty if none).

#### `career_modules_tutorial.getCurrentStep()`

Returns the id of the current step.

- **returns**: string|nil E.g. "03basicManeuvers".

#### `career_modules_tutorial.getStepIdByIndex(index)`

Returns the step id at a given index (starting from 1).

- `index` (*integer*) : Index in the step order.
- **returns**: string|nil Step id.

#### `career_modules_tutorial.getStepOrder()`

Returns the ordered list of step ids.

- **returns**: string[] The 9 steps.

#### `career_modules_tutorial.isActive()`

Indicates whether the tutorial is in progress.

- **returns**: boolean Runtime result.

#### `career_modules_tutorial.onCareerActive()`

Hook called when the career becomes active; starts the tutorial if enabled.

- **returns**: boolean|nil false if the tutorial is disabled.

#### `career_modules_tutorial.onGetRawPoiListForTutorial(elements)`

During the tutorial, adds the "garage" point (tutorial_apm_parking) to the POI list on the garageExteriorPark parking spot, with icon, name and big map thumbnail.

- `elements` (*table*) : POI list to fill (table.insert).

#### `career_modules_tutorial.onPreRender(dtReal, dtSim, dtRaw)`

Pre-render hook: relays to the runtime.

- `dtReal` (*number*) : Real time delta (s).
- `dtSim` (*number*) : Simulation time delta (s).
- `dtRaw` (*number*) : Raw delta (s).

#### `career_modules_tutorial.onSaveCurrentProfile(currentSavePath)`

Profile save hook: writes the progress to tutorialState.json.

- `currentSavePath` (*string*) : Profile save folder.

#### `career_modules_tutorial.onUpdate(dtReal, dtSim, dtRaw)`

Update hook: relays to the runtime.

- `dtReal` (*number*) : Real time delta (s).
- `dtSim` (*number*) : Simulation time delta (s).
- `dtRaw` (*number*) : Raw delta (s).

#### `career_modules_tutorial.start()`

Starts the tutorial via the runtime.

- **returns**: boolean Success.

## Fields

| Field | Type | Description |
|---|---|---|
| `dependencies` | string[] | gameplay_tutorial_runtime, _setup, _markers, _damageTracker, _bounds. |
| `sharedTutorialData` | table | Data shared between steps, from gameplay_tutorial_runtime. |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/career/modules/tutorial.lua`.*
