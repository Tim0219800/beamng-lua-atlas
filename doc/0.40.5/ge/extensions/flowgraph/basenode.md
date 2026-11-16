# `flowgraph_basenode`

*File: `lua/ge/extensions/flowgraph/basenode.lua` · VM: Game Engine (GE) · 1557 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `flowgraph_basenode`: `extensions.load("flowgraph_basenode")`, then the global `flowgraph_basenode`

Base class of all flowgraph nodes. It creates the pins from the derived node's C.pinSchema, manages the behaviors (once, duration, simple...) according to C.category, runs work()/workOnce() under xpcall (errors become node errors displayed in red), draws the node in the editor (header, pins, tooltip, context menu) and serializes/deserializes the node (position, custom color, hardcoded pins, hidden pins). A modder who writes a custom node inherits from this class and overrides work, init, postInit, drawMiddle, etc.

## Example

```lua
-- skeleton of a flowgraph node
local C = {}
C.name = 'Mon nœud'
C.description = 'Fait quelque chose.'
C.category = 'once_p_duration'
C.pinSchema = {
  {dir = 'in', type = 'number', name = 'valeur', default = 1, description = 'Entrée.'},
  {dir = 'out', type = 'number', name = 'resultat', description = 'Sortie.'},
}
function C:work()
  self.pinOut.resultat.value = self.pinIn.valeur.value * 2
end
return _flowgraph_createNode(C)
```

## Notes

- Format of C.pinSchema (read by _preInit for outputs then _postInit for inputs): {dir='in'|'out', type, name, default, description, fixed, hidden, impulse, chainFlow, tableType, hardcoded, defaultHardCodeType}. The old format without a dir field is rejected (error log). default values on an output are ignored with a warning.
- self.pinIn[name] and self.pinOut[name]: access to pins by name. pinIn returns an empty pin (emptyPin, not modifiable) if the name does not exist and refuses writes. pinInLocal contains the real input pins; pinIn contains "hardcoded" inputs when a constant value is set.
- Behaviors (self.behaviour): 'once', 'duration', 'simple', 'singleActive', 'obsolete'. The flow/reset/incomplete/complete/completed pins are created automatically according to the category (ui_flowgraph_editor.isFunctionalNode, isSimpleNode, isDurationNode, isF_DurationNode, isOnceNode, isDynamicNode).
- Fixed order of some pins: flow in, flow out, reset in, incomplete out, complete out, completed out.
- dynamicMode: 'repeat' (default, work called every time) or 'once' (workOnce once then work, with a reset pin).
- Editor grid: gridSize 14, offset (10, 8); alignToGrid aligns the position to it.
- Bug: isFlowActive loops over _flowInDeps but always returns true (the final return true is reached even if no dependency has flow).
- Bug: in __onDeserialized, the test type(data) == 'cdata' uses the variable data (global, nil) instead of v; the cdata branch is therefore never taken.
- Bug: alignToGrid references an undefined variable force (nil global); the condition depends only on nodePosition.
- Bug: in _workDynamicOnce, workCount is incremented up to twice per call (once in the block, once at the end).
- Functions prefixed with _ or __ are internal wrappers called by the manager/graph; the unprefixed versions (onLink, onUnlink, onSetHardcode, onUnsetHardcode, onNodeReset, onDurationXxx) are the hooks to override.

## Functions

| Function | Description | Line |
|---|---|---|
| `flowgraph_basenode.createBase(...)` | Creates a node object with C as metatable and calls init(...). *(internal)* | 1533 |
| `flowgraph_basenode.use(mgr, graph, forceId, derivedClass)` | Creates a base node, copies the derived class on top, then calls _preInit (output pins), init (if redefined) and _postInit (input pins, categories, postInit). *(internal)* | 1541 |

### Parameter details

#### `flowgraph_basenode.createBase(...)`

Creates a node object with C as metatable and calls init(...).

- `...` (*any*) : mgr, graph, forceId (passed to C:init)
- **returns**: table base node

#### `flowgraph_basenode.use(mgr, graph, forceId, derivedClass)`

Creates a base node, copies the derived class on top, then calls _preInit (output pins), init (if redefined) and _postInit (input pins, categories, postInit).

- `mgr` (*table*) : flowgraph manager
- `graph` (*table*) : graph containing the node
- `forceId` (*integer|nil*) : forced id (otherwise mgr:getNextFreeGraphNodeId())
- `derivedClass` (*table*) : class of the concrete node type
- **returns**: table initialized node

## Class `C`

Flowgraph node. Main fields: mgr, graph, id, name, description, color, iconColor, type ('node' by default, 'simple', 'variable'), tags, behaviour, triggerCount, workCount, data, dynamicMode, durationState, pinIn, pinInLocal, pinOut, pinList (display order), nodePosition ({x, y}), customName/customColor/customIcon/customIconColor, _error.

| Method | Description | Line |
|---|---|---|
| `C:HSVtoRGB(h, s, v)` | Converts HSV to RGB via the global function HSVtoRGB after reducing h to its fractional part and clamping s and v to [0, 1]. | 647 |
| `C:__executionStarted()` | Called by the manager at start: clears the node error, sets outputs back to nil if clearOutPinsOnStart, resets _frameLastUsed and _dynamicDone, then calls _executionStarted. | 622 |
| `C:__executionStopped()` | Called by the manager on stop: calls _executionStopped and sets _dynamicDone back to false. | 615 |
| `C:__getNodeError(category)` | Returns the error message of a category. | 1509 |
| `C:__onDeserialized(nodeData)` | Restores position, customizations, data (known properties only), dynamic mode, saved pins, hardcoded values, quickAccess and hidden pins. Logs warnings if a pin cannot be found. | 1381 |
| `C:__onSerialize()` | Serializes the node: data (without cdata), type, position, custom name/color/icon, identifier, dynamic mode, pins (if savePins), hardcoded pins, quickAccess, hidden pins, timeline. | 1298 |
| `C:__setNodeError(category, err)` | Records an error for a category (log E); called without a category, clears all errors. | 1497 |
| `C:_destroy()` | Calls self:destroy(). | 105 |
| `C:_doubleClicked()` | Calls self:doubleClicked() if that function exists on the derived node. | 574 |
| `C:_drawMiddle(builder, style, drawType)` | Draws the central area according to the display mode (flowLevel, simple, debug, default, heatmap, geometry); calls drawMiddle if the derived node defines it. | 824 |
| `C:_executionStarted()` | Empty internal hook called at start. | 620 |
| `C:_executionStopped()` | Empty internal hook called when execution stops. | 613 |
| `C:_onClear()` | Empty (the call to _executionStopped is commented out there). | 609 |
| `C:_onDeserialized(nodeData)` | Empty hook called during deserialization. | 1378 |
| `C:_onLink(link)` | Calls onLink. | 584 |
| `C:_onNodeReset()` | Calls onNodeReset under xpcall then sets all pinOut values back to nil. | 336 |
| `C:_onSerialize(res)` | Empty hook allowing the derived node to add fields to the serialized table. | 1295 |
| `C:_onSetHardcode(pin, value, forceType)` | Calls onSetHardcode. | 598 |
| `C:_onUnlink(link)` | Calls onUnlink. | 591 |
| `C:_onUnsetHardcode(pin)` | Calls onUnsetHardcode. | 605 |
| `C:_postDeserialize()` | Empty hook called after the full deserialization of the graph. | 1515 |
| `C:_postInit()` | Creates the input pins from pinSchema (with hardcoded values if requested), creates a reset pin if the mode is 'once', calls handleNodeCategories then postInit. | 135 |
| `C:_preInit()` | Creates the output pins described in pinSchema (hidden, impulse, chainFlow, tableType). | 113 |
| `C:_setHardcodedDummyInputPin(pin, val, forceType)` | Sets (val not nil) or removes (val nil) a constant value on an input pin: creates a dummy entry in pinIn with hardCodeType, sets pin.pinMode to 'hardcoded' or 'normal' and calls the hooks. | 1251 |
| `C:_setupTimeline(beginTime, endTime)` | Creates self.timeline {beginTime, endTime, lane = 0} and defines empty (nop) onTimelineBegin/End/Trigger if absent. | 1283 |
| `C:_workDynamicOnce()` | 'once' mode: handles the reset (pinIn.reset), calls workOnce once then work on each call while the flow is active. | 351 |
| `C:_workDynamicRepeat()` | Runs work under xpcall, applies checkAutomatedFlow, increments workCount and records any error (node error + manager event). | 321 |
| `C:addBehaviour(behaviour)` | Enables a behavior in self.behaviour. | 234 |
| `C:addedToGraph(graph)` | Empty hook called when the node is added to a graph. | 109 |
| `C:alignToGrid(x, y)` | Aligns the node to the 14 px grid (offset 10, 8), optionally after setting a position, then updates the editor. | 1520 |
| `C:autoCreatePin(direction, type, name, default, description, extra, fixed)` | Like createPin, but only if no pin with the same name/direction exists, then moves the pin to the position imposed by pinOrder for functional nodes. | 251 |
| `C:checkAutomatedFlow()` | Copies pinIn.flow to pinOut.flow for non-simple functional nodes and drives incomplete/complete/completed for f_duration nodes. 'completed' falls back to false after one frame. | 397 |
| `C:createPin(direction, type, name, default, description, autoNumber, extra, fixed)` | Creates a pin on the node (flowgraph/pin module), adds it to pinInLocal/pinOut, to pinList and to graph.pins. Refuses empty or duplicate names (except autoNumber, which adds a suffix 2..101). | 465 |
| `C:createResetPin()` | Creates a 'reset' flow input pin (impulse) and adds the 'once' behavior, if it does not exist. | 301 |
| `C:customContextMenu()` | Empty hook to add entries to the node's context menu. | 1096 |
| `C:destroy()` | Empty hook called when the node is destroyed; override to free resources. | 102 |
| `C:draw(builder, style)` | Draws the whole node in the editor: styles according to error/recent activity, header, input pins, middle (under xpcall), output pins, behavior icons. Ignores types other than node, simple, variable. | 892 |
| `C:drawHeader(builder, style)` | Draws the node header (icon, name, [ERROR] if error, id if preference set, heatmap color according to the age of _frameLastUsed). | 653 |
| `C:drawMiddle(builder, style)` | Drawing hook for the middle of the node, to be overridden; the base version simply calls builder:Middle(). | 888 |
| `C:drawTooltip()` | Draws the tooltip of the hovered node: activity in heatmap mode, name, custom name, behaviors, obsolescence, description, TODO, errors. | 710 |
| `C:getData()` | Returns the self.data table (the node's editable properties). | 86 |
| `C:getLinks()` | Walks the graph's links and returns those arriving at the node, then those leaving it. | 634 |
| `C:getPinIn()` | Returns self.pinIn. | 94 |
| `C:getPinInConstValue(pinName)` | Returns the constant value of an input pin if it was set as hardcoded, otherwise nil. | 1086 |
| `C:handleNodeCategories()` | According to self.category, adds the behaviors and automatically creates the flow, reset, incomplete, complete, completed pins. Logs an error if a 'simple' node has flow pins or if a 'provider' has inputs. Without a category, forces the 'repeat' mode. | 169 |
| `C:hasFlowPins()` | Returns whether pinSchema contains a 'flow' pin. | 279 |
| `C:hasInputPins()` | Returns whether pinSchema contains an input pin. | 290 |
| `C:hideProperties()` | Empty hook called when the selection leaves the node. | 572 |
| `C:init(mgr, graph, forceId)` | Initializes all node fields (identifier, name 'unknown', default color, pin tables, alignment pin). Checks for duplicate identifiers if mgr.__safeIds. | 36 |
| `C:isFlowActive()` | Supposed to tell whether a flow dependency is active, but always returns true (see notes). | 562 |
| `C:onDurationFinished()` | Empty hook: the duration state becomes 'finished'. | 439 |
| `C:onDurationInactive()` | Empty hook: the duration state becomes 'inactive'. | 435 |
| `C:onDurationStarted()` | Empty hook: the duration state becomes 'started'. | 437 |
| `C:onLink(link)` | Empty hook called when a link is created on a pin of the node. | 581 |
| `C:onNodeReset()` | Empty hook called when the node is reset (reset pin in 'once' mode). | 334 |
| `C:onSetHardcode(pin, value, forceType)` | Empty hook called when a constant (hardcoded) value is set on an input pin. | 595 |
| `C:onUnlink(link)` | Empty hook called when a link is deleted. | 588 |
| `C:onUnsetHardcode(pin)` | Empty hook called when a pin's constant value is removed. | 602 |
| `C:overDraw()` | Draws a large semi-transparent icon over the node (call commented out in draw, so unused). | 800 |
| `C:postInit()` | Empty hook called at the end of _postInit, once all pins are created. | 316 |
| `C:removeBehaviour(behaviour)` | Disables a behavior (sets the value to false). | 243 |
| `C:removePin(pin)` | Removes a pin: first removes the graph links that use it, then removes the pin from the tables and from pinList. The code comment notes that other side effects remain to be checked. | 503 |
| `C:removeResetPin()` | Removes the 'reset' pin and the 'once' behavior. | 309 |
| `C:renamePin(pin, newName)` | Renames an input pin in pinInLocal. Refuses (with a warning) if the new name is already taken by another pin. Handles input pins only. | 528 |
| `C:representsGraph()` | Returns nil by default; nodes that represent a subgraph return that graph. | 110 |
| `C:setData(data)` | Replaces self.data. | 90 |
| `C:setDurationState(state)` | Changes the state of an f_duration category node and signals the change; checkAutomatedFlow then updates the incomplete/complete/completed pins and calls onDurationXxx. | 389 |
| `C:setDynamicMode(mode)` | Sets the dynamic mode; creates the reset pin for 'once', removes it for 'repeat'. | 453 |
| `C:setPinIn(data)` | Replaces self.pinIn. | 98 |
| `C:shiftPin(idInList, direction)` | Swaps a pin in pinList with its neighbor (circular) to change the display order. | 540 |
| `C:showContextMenu(menuPos)` | Shows the context menu (copy, delete, show/hide pins, create a subgraph, ungroup, comment, development tools depending on preferences). | 1097 |
| `C:showProperties()` | Empty hook called when the node is selected to display its properties. | 571 |
| `C:toString()` | Returns a string "name (nodeType / id) in graph" for logs. | 1513 |
| `C:toggleDynamicMode()` | Toggles between 'repeat' and 'once' if the category is dynamic. | 442 |
| `C:trigger()` | Triggers the node via self._trigger (function compiled by the manager) if the graph is not stopped; increments triggerCount and updates _frameLastUsed. | 549 |
| `C:updateEditorPosition()` | Applies nodePosition to the node in the editor (SetNodePosition). Call it only when the manager is open in the editor. | 1366 |
| `C:updateNodePosition()` | Reads the node's position in the ImGui editor and stores it in nodePosition (if within ±2e8). | 1355 |
| `C:work(args)` | Main function of the node, to be overridden. Called by the manager each time the flow passes, in an xpcall. In 'once' mode, it is called after workOnce. | 318 |
| `C:workOnce()` | Empty hook called only once (dynamic 'once' mode) when the flow arrives, before the work calls. Re-armed by a reset. | 349 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/basenode.lua`.*
