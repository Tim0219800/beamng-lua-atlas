# `flowgraph_modules_actionModule`

*File: `lua/ge/extensions/flowgraph/modules/actionModule.lua` · VM: Game Engine (GE) · 77 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/modules/actionModule")` (file under extensions/ but not a regular extension)

Flowgraph module (moduleOrder 0) that blocks or allows input actions while a flowgraph project is running. It keeps a set of blocked actions and, in afterTrigger, pushes the list to core_input_actionFilter under the group 'fg_filter_<manager id>'. It also stores the walking mode (gameplay_walk) allowed state at start to restore it on stop.

## Notes

- Blocks are applied only at the end of the tick (afterTrigger), only if self.changed is true.
- Probable bug: in executionStopped, the variable 'list' is not defined (nil global), so setGroup is called with nil.
- Probable bug: blockActions/allowActions use the key 'k' (list index) for addActions/removeActions, and afterTrigger iterates over them with ipairs: blocks from different lists overwrite each other by index.
- The values of addActions/removeActions are never cleared after being applied.

## Functions

| Function | Description | Line |
|---|---|---|
| `flowgraph_modules_actionModule.afterTrigger()` | Called by the manager after the graph tick. If changes occurred, recomputes the list of blocked actions and sends it to core_input_actionFilter (setGroup then addAction(0, group, true)). (dynamically assigned) *(internal)* | dyn |
| `flowgraph_modules_actionModule.allowActions(id)` | Marks the actions of the registered list as to be allowed again (applied in afterTrigger). (dynamically assigned) | dyn |
| `flowgraph_modules_actionModule.blockActions(id)` | Marks the actions of the registered list as to be blocked (applied in afterTrigger). (dynamically assigned) | dyn |
| `flowgraph_modules_actionModule.clear()` | Resets the tables storedActions, actionsByName, addActions, removeActions and lists. (dynamically assigned) *(internal)* | dyn |
| `flowgraph_modules_actionModule.executionStarted()` | Called when the project starts: stores gameplay_walk.isTogglingEnabled(). (dynamically assigned) *(internal)* | dyn |
| `flowgraph_modules_actionModule.executionStopped()` | Called when the project stops: disables the filter group and restores the permission to toggle walking mode that was stored at start. (dynamically assigned) *(internal)* | dyn |
| `flowgraph_modules_actionModule.getFreeId()` | Increments and returns a unique identifier for registering an action list. (dynamically assigned) | dyn |
| `flowgraph_modules_actionModule.init()` | Called when the module is created: calls clear(). (dynamically assigned) *(internal)* | dyn |
| `flowgraph_modules_actionModule.registerList(list)` | Registers a list of action names and returns its identifier, which can then be used with blockActions/allowActions. (dynamically assigned) | dyn |

### Parameter details

#### `flowgraph_modules_actionModule.allowActions(id)`

Marks the actions of the registered list as to be allowed again (applied in afterTrigger). (dynamically assigned)

- `id` (*integer*) : identifier returned by registerList

#### `flowgraph_modules_actionModule.blockActions(id)`

Marks the actions of the registered list as to be blocked (applied in afterTrigger). (dynamically assigned)

- `id` (*integer*) : identifier returned by registerList

#### `flowgraph_modules_actionModule.getFreeId()`

Increments and returns a unique identifier for registering an action list. (dynamically assigned)

- **returns**: integer new identifier

#### `flowgraph_modules_actionModule.registerList(list)`

Registers a list of action names and returns its identifier, which can then be used with blockActions/allowActions. (dynamically assigned)

- `list` (*string[]*) : input action names
- **returns**: integer list identifier

## Class `C`

| Method | Description | Line |
|---|---|---|
| `C:afterTrigger()` |  | 44 |
| `C:allowActions(id)` |  | 37 |
| `C:blockActions(id)` |  | 30 |
| `C:clear()` |  | 16 |
| `C:executionStarted()` |  | 71 |
| `C:executionStopped()` |  | 62 |
| `C:getFreeId()` |  | 7 |
| `C:init()` |  | 12 |
| `C:registerList(list)` |  | 24 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/modules/actionModule.lua`.*
