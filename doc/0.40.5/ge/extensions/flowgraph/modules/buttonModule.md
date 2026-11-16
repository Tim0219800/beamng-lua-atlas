# `flowgraph_modules_buttonModule`

*File: `lua/ge/extensions/flowgraph/modules/buttonModule.lua` · VM: Game Engine (GE) · 98 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/modules/buttonModule")` (file under extensions/ but not a regular extension)

Flowgraph module (moduleOrder 0) that manages custom buttons shown in the UI during a flowgraph project. Each button has a label, a style, an active state, an order, and clicked/complete variables stored in a variableStorage. In afterTrigger, the list of active buttons, sorted by order then id, is sent to the UI via guihooks.trigger('CustomFGButtons', data). The click comes back through a Lua command that calls buttonClicked.

## Notes

- The 'clicked' variable is reset to false on every afterTrigger: it is true for only one tick.
- The list is sent back to the UI only if buttonsChanged is true (add or set).
- The module is called 'button' in mgr.modules (see getCmd).

## Functions

| Function | Description | Line |
|---|---|---|
| `flowgraph_modules_buttonModule.addButton(data)` | Adds a button and returns its id. (dynamically assigned) | dyn |
| `flowgraph_modules_buttonModule.afterTrigger()` | Called after the graph tick: finalizes the variables, sends the sorted active buttons to the UI if modified, then sets clicked back to false. (dynamically assigned) *(internal)* | dyn |
| `flowgraph_modules_buttonModule.buttonClicked(id)` | Called when the UI reports a click: sets clicked and complete to true. (dynamically assigned) | dyn |
| `flowgraph_modules_buttonModule.clear()` | Clears variables and buttons, resets the id counter to 0 and sends an empty list to the UI (CustomFGButtons). (dynamically assigned) *(internal)* | dyn |
| `flowgraph_modules_buttonModule.executionStopped()` | Called when the project stops: calls clear() (the buttons disappear from the UI). (dynamically assigned) *(internal)* | dyn |
| `flowgraph_modules_buttonModule.getButton(id)` | Returns the button's table (variable-type fields: label, style, active, order, clicked, complete). (dynamically assigned) | dyn |
| `flowgraph_modules_buttonModule.getCmd(id)` | Builds the Lua command string executed by the UI on click: gets the manager's 'button' module and calls buttonClicked(id). (dynamically assigned) | dyn |
| `flowgraph_modules_buttonModule.getFreeId()` | Increments and returns a button id. (dynamically assigned) | dyn |
| `flowgraph_modules_buttonModule.init()` | Creates the variableStorage and calls clear(). (dynamically assigned) *(internal)* | dyn |
| `flowgraph_modules_buttonModule.set(id, field, val)` | Changes a button field via the variableStorage (applied at the end of the tick) and marks the list as modified. (dynamically assigned) | dyn |

### Parameter details

#### `flowgraph_modules_buttonModule.addButton(data)`

Adds a button and returns its id. (dynamically assigned)

- `data` (*table*) : optional fields label (default 'Button <id>'), style (default 'default'), active (default true), order (default id)
- **returns**: integer button id

#### `flowgraph_modules_buttonModule.buttonClicked(id)`

Called when the UI reports a click: sets clicked and complete to true. (dynamically assigned)

- `id` (*integer*) : button id

#### `flowgraph_modules_buttonModule.getButton(id)`

Returns the button's table (variable-type fields: label, style, active, order, clicked, complete). (dynamically assigned)

- `id` (*integer*) : button id
- **returns**: table|nil button

#### `flowgraph_modules_buttonModule.getCmd(id)`

Builds the Lua command string executed by the UI on click: gets the manager's 'button' module and calls buttonClicked(id). (dynamically assigned)

- `id` (*integer*) : button id
- **returns**: string Lua code

#### `flowgraph_modules_buttonModule.getFreeId()`

Increments and returns a button id. (dynamically assigned)

- **returns**: integer id

#### `flowgraph_modules_buttonModule.set(id, field, val)`

Changes a button field via the variableStorage (applied at the end of the tick) and marks the list as modified. (dynamically assigned)

- `id` (*integer*) : button id
- `field` (*string*) : label, style, active, order, clicked or complete
- `val` (*any*) : new value

## Class `C`

| Method | Description | Line |
|---|---|---|
| `C:addButton(data)` | adds a new Button. | 27 |
| `C:afterTrigger()` |  | 67 |
| `C:buttonClicked(id)` |  | 57 |
| `C:clear()` |  | 18 |
| `C:executionStopped()` |  | 93 |
| `C:getButton(id)` |  | 51 |
| `C:getCmd(id)` |  | 62 |
| `C:getFreeId()` |  | 8 |
| `C:init()` |  | 13 |
| `C:set(id, field, val)` |  | 55 |

**UI events (guihooks.trigger):** `CustomFGButtons`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/modules/buttonModule.lua`.*
