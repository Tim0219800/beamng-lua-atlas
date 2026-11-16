# `flowgraph_modules_levelModule`

*File: `lua/ge/extensions/flowgraph/modules/levelModule.lua` · VM: Game Engine (GE) · 70 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/modules/levelModule")` (file under extensions/ but not a regular extension)

Flowgraph module (moduleOrder 100) that synchronizes a project's actions with level loading. It lets you defer a function until loading finishes (delayOrInstantFunction) and reload the collision (be:reloadCollision) after a level loads or at the end of the tick when a prefab is loaded.

## Notes

- The loading test is done by core_gamestate.loading(). The isLoadingLevel field is commented out and unused.
- beginLoadingLevel is empty.
- uniqueFuns is created and cleared but never used; the prefabs list is only filled.

## Functions

| Function | Description | Line |
|---|---|---|
| `flowgraph_modules_levelModule.afterTrigger()` | Called after the graph tick: if reloadCollisionOnAfterTrigger is true, calls be:reloadCollision(). (dynamically assigned) *(internal)* | dyn |
| `flowgraph_modules_levelModule.beginLoadingLevel()` | Intended to signal the start of a level load (empty body). (dynamically assigned) *(internal)* | dyn |
| `flowgraph_modules_levelModule.clear()` | Clears the tables and sets the flags reloadCollisionOnLevelLoading / reloadCollisionOnAfterTrigger back to false. (dynamically assigned) *(internal)* | dyn |
| `flowgraph_modules_levelModule.delayOrInstantFunction(fun)` | Runs fun immediately if no level is loading, otherwise queues it until finishedLevelLoading. (dynamically assigned) | dyn |
| `flowgraph_modules_levelModule.executionStopped()` | Called when the project stops: calls clear(). (dynamically assigned) *(internal)* | dyn |
| `flowgraph_modules_levelModule.finishedLevelLoading()` | To be called at the end of level loading: reloads the collision if requested, runs then clears the deferred functions. (dynamically assigned) *(internal)* | dyn |
| `flowgraph_modules_levelModule.init()` | Creates the tables funs, uniqueFuns and prefabs, initializes the collision reload flags then calls clear(). (dynamically assigned) *(internal)* | dyn |
| `flowgraph_modules_levelModule.prefabLoaded(id)` | Signals that a prefab was loaded: requests a collision reload (at the end of level loading if in progress, otherwise after the tick) and stores the id. (dynamically assigned) | dyn |

### Parameter details

#### `flowgraph_modules_levelModule.delayOrInstantFunction(fun)`

Runs fun immediately if no level is loading, otherwise queues it until finishedLevelLoading. (dynamically assigned)

- `fun` (*function*) : function with no arguments

#### `flowgraph_modules_levelModule.prefabLoaded(id)`

Signals that a prefab was loaded: requests a collision reload (at the end of level loading if in progress, otherwise after the tick) and stores the id. (dynamically assigned)

- `id` (*integer*) : prefab object id

## Class `C`

| Method | Description | Line |
|---|---|---|
| `C:afterTrigger()` |  | 41 |
| `C:beginLoadingLevel()` |  | 25 |
| `C:clear()` |  | 16 |
| `C:delayOrInstantFunction(fun)` | this function will delay another function until finishedLevelLoading is called, or will call it instantly if not level is being loaded. | 49 |
| `C:executionStopped()` |  | 66 |
| `C:finishedLevelLoading()` |  | 29 |
| `C:init()` |  | 7 |
| `C:prefabLoaded(id)` |  | 57 |

## Calls into the engine (C++)

- `be:` `reloadCollision`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/modules/levelModule.lua`.*
