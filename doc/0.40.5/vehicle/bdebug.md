# `bdebug`

*File: `lua/vehicle/bdebug.lua` · VM: Vehicle · 294 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** global `bdebug`

Lightweight facade of the vehicle's visual debug tool (nodes, beams, collision triangles, center of gravity...). As long as nobody uses it, bdebugImpl.lua (large module) is not loaded: the functions marked "initialize" load bdebugImpl on their first call and then redirect to it. A modder mainly uses it to display text on nodes (setNodeDebugText) or to enable/disable the tool. The GE receives the state via guihooks BdebugUpdate and extensions.hook onBDebugUpdate (sent by bdebugImpl).

## Example

```lua
-- vehicle VM
bdebug.setNodeDebugText('myTest', 12, 'node 12')
bdebug.setEnabled(true)
-- cleanup
bdebug.clearTypeNodeDebugText('myTest')
```

## Notes

- setPartsSelected, setNodeDebugText, clearNodeDebugText, clearTypeNodeDebugText and clearAllNodeDebugText can be called before bdebugImpl is initialized: the data is stored in a local state and then passed to bdebugImpl at its init. After init, these functions are replaced by those of bdebugImpl.
- Before initialization, isEnabled() always returns false; receiveViewportSize is an empty function; nodeCollision, beamBroke, debugDraw, onPlayersChanged and reset are nop. They are replaced by redirections to bdebugImpl at init.
- initState, state and stateNoReset are proxy tables: the first read or write of a field loads bdebugImpl and redirects to its tables.
- toggleEnabled, nodetextModeChange, nodevisModeChange, nodedebugtextModeChange, skeletonModeChange, colTrisModeChange, cogChange and resetModes are reserved for input events; the code says not to use them from the UI.
- bdebug.init does nothing (loading is lazy). bdebug.setPartsSelected is assigned twice in the file (harmless).
- Persistence: onSerialize saves bdebugImpl.state if bdebugImpl has been initialized; onDeserialize reinitializes it right after a vehicle reload.

## Functions

| Function | Description | Line |
|---|---|---|
| `bdebug.clearAllNodeDebugText()` | Removes all node debug text groups. | 229 |
| `bdebug.clearNodeDebugText(type, nodeCID)` | Removes the texts of a node in a group. | 200 |
| `bdebug.clearTypeNodeDebugText(type)` | Removes an entire text group (and shifts the indices of the following groups). | 209 |
| `bdebug.cogChange(change)` | Changes the center of gravity display mode (cogModes, including 'off' and 'on'). *(internal)* | 150 |
| `bdebug.colTrisModeChange(change)` | Changes the collision triangle mode (off, simple, type, withoutBroken, withBroken, brokenOnly, collideableOnly). *(internal)* | 145 |
| `bdebug.init()` | Empty function called at vehicle initialization; loading is lazy. *(internal)* | 250 |
| `bdebug.isEnabled()` | Indicates whether the tool is visible. Always returns false before bdebugImpl is loaded, then bdebugImpl.isEnabled. | 107 |
| `bdebug.nodedebugtextModeChange(change)` | Changes the displayed node debug text group (off then the groups created by setNodeDebugText). *(internal)* | 135 |
| `bdebug.nodetextModeChange(change)` | Switches to the next/previous node text mode (off, names, numbers, names+numbers, weights, materials, groups, forces, relativePositions, worldPositions, clusters). Called by input actions. *(internal)* | 125 |
| `bdebug.nodevisModeChange(change)` | Changes the node visualization mode (off, simple, highlighted, weights, displacement, velocities, forces, density, clusters, mainCluster, nodeStability). *(internal)* | 130 |
| `bdebug.onDeserialize(data)` | Restore hook after reload: if a bdebugImpl state was saved, initializes bdebugImpl with it. *(internal)* *(hook)* | 244 |
| `bdebug.onSerialize()` | Save hook before vehicle reload: returns {bdebugImplState = state} if bdebugImpl has already been initialized. *(internal)* *(hook)* | 238 |
| `bdebug.receiveViewportSize()` | Empty function until bdebugImpl is loaded; then replaced by bdebugImpl.receiveViewportSize(sizeX, sizeY). *(internal)* | 253 |
| `bdebug.requestDrawnBeamsGE(geFuncName)` | Like requestDrawnNodesGE but for beams: calls geFuncName(beamsDrawn, beamScale) in the GE. | 102 |
| `bdebug.requestDrawnNodesGE(geFuncName)` | Requests that at the next draw, the list of drawn nodes be sent to a GE Lua function, called as geFuncName(nodesDrawn, nodeScale). | 96 |
| `bdebug.requestState()` | Initializes bdebugImpl and requests that the current state be sent to the UI/GE (BdebugUpdate). | 85 |
| `bdebug.resetModes()` | Resets all modes to their default value (copy of initState) and displays the message vehicle.bdebug.clear. | 155 |
| `bdebug.setEnabled(enabled)` | Initializes bdebugImpl then shows/hides the vehicle's visual debug. | 111 |
| `bdebug.setNodeDebugText(type, nodeCID, text)` | Adds a text on a node in a debug text group (the group is created if it does not exist). Several calls on the same node stack the texts. Usable before the init of bdebugImpl. | 172 |
| `bdebug.setPartsSelected(parts)` | Defines the selected parts whose nodes/beams are highlighted. Usable before the init of bdebugImpl. | 164 |
| `bdebug.setState(state, stateNoReset, notSendBack)` | Initializes bdebugImpl then applies a state coming from the UI to it. Ignored if state.objectId is not the current object. | 90 |
| `bdebug.skeletonModeChange(change)` | Changes the beam (skeleton) visualization mode: off, simple, highlighted, type, type+broken, brokenOnly, supportOnly, stress, displacement, deformation, etc. *(internal)* | 140 |
| `bdebug.toggleEnabled()` | Toggles the debug display. Reserved for the input system, do not call from the UI. *(internal)* | 120 |

### Parameter details

#### `bdebug.clearNodeDebugText(type, nodeCID)`

Removes the texts of a node in a group.

- `type` (*string*) : Group name.
- `nodeCID` (*integer*) : Runtime node ID.

#### `bdebug.clearTypeNodeDebugText(type)`

Removes an entire text group (and shifts the indices of the following groups).

- `type` (*string*) : Group name.

#### `bdebug.cogChange(change)`

Changes the center of gravity display mode (cogModes, including 'off' and 'on').

- `change` (*integer*) : +1 / -1 (cyclic).

#### `bdebug.colTrisModeChange(change)`

Changes the collision triangle mode (off, simple, type, withoutBroken, withBroken, brokenOnly, collideableOnly).

- `change` (*integer*) : +1 / -1 (cyclic).

#### `bdebug.isEnabled()`

Indicates whether the tool is visible. Always returns false before bdebugImpl is loaded, then bdebugImpl.isEnabled.

- **returns**: boolean true if vehicleDebugVisible.

#### `bdebug.nodedebugtextModeChange(change)`

Changes the displayed node debug text group (off then the groups created by setNodeDebugText).

- `change` (*integer*) : +1 / -1 (cyclic).

#### `bdebug.nodetextModeChange(change)`

Switches to the next/previous node text mode (off, names, numbers, names+numbers, weights, materials, groups, forces, relativePositions, worldPositions, clusters). Called by input actions.

- `change` (*integer*) : +1 next, -1 previous (cyclic).

#### `bdebug.nodevisModeChange(change)`

Changes the node visualization mode (off, simple, highlighted, weights, displacement, velocities, forces, density, clusters, mainCluster, nodeStability).

- `change` (*integer*) : +1 / -1 (cyclic).

#### `bdebug.onDeserialize(data)`

Restore hook after reload: if a bdebugImpl state was saved, initializes bdebugImpl with it.

- `data` (*table*) : Table returned by onSerialize.

#### `bdebug.onSerialize()`

Save hook before vehicle reload: returns {bdebugImplState = state} if bdebugImpl has already been initialized.

- **returns**: table {bdebugImplState = table|nil}.

#### `bdebug.requestDrawnBeamsGE(geFuncName)`

Like requestDrawnNodesGE but for beams: calls geFuncName(beamsDrawn, beamScale) in the GE.

- `geFuncName` (*string*) : Name of the GE function.

#### `bdebug.requestDrawnNodesGE(geFuncName)`

Requests that at the next draw, the list of drawn nodes be sent to a GE Lua function, called as geFuncName(nodesDrawn, nodeScale).

- `geFuncName` (*string*) : Name of the GE function (global path, e.g. 'myModule.receive').

#### `bdebug.setEnabled(enabled)`

Initializes bdebugImpl then shows/hides the vehicle's visual debug.

- `enabled` (*boolean*) : true to show.

#### `bdebug.setNodeDebugText(type, nodeCID, text)`

Adds a text on a node in a debug text group (the group is created if it does not exist). Several calls on the same node stack the texts. Usable before the init of bdebugImpl.

- `type` (*string*) : Name of the text group.
- `nodeCID` (*integer*) : Runtime node ID (cid).
- `text` (*string*) : Text to display.

#### `bdebug.setPartsSelected(parts)`

Defines the selected parts whose nodes/beams are highlighted. Usable before the init of bdebugImpl.

- `parts` (*table*) : Part selection (partsSelected format used by bdebugImpl, inferred from code).

#### `bdebug.setState(state, stateNoReset, notSendBack)`

Initializes bdebugImpl then applies a state coming from the UI to it. Ignored if state.objectId is not the current object.

- `state` (*table*) : State (objectId, vehicleDebugVisible, vehicle = {...modes...}).
- `stateNoReset` (*table*) : State kept across mode resets.
- `notSendBack` (*boolean|nil*) : true to not send the state back to the UI.

#### `bdebug.skeletonModeChange(change)`

Changes the beam (skeleton) visualization mode: off, simple, highlighted, type, type+broken, brokenOnly, supportOnly, stress, displacement, deformation, etc.

- `change` (*integer*) : +1 / -1 (cyclic).

## Fields

| Field | Type | Description |
|---|---|---|
| `beamBroke` | function | Beam break hook beamBroke(id, energy); nop before init, then redirection to bdebugImpl. |
| `debugDraw` | function | Debug drawing debugDraw(focusPos) called by the main loop; nop before init, then redirection to bdebugImpl. |
| `initState` | table | Proxy to bdebugImpl.initState (default state of the modes). Loads bdebugImpl on access. |
| `nodeCollision` | function | Node collision hook; nop until bdebugImpl is loaded, then redirects nodeCollision(p) to bdebugImpl. |
| `onPlayersChanged` | function | Player change hook; nop before init, then bdebugImpl.onPlayersChanged. |
| `reset` | function | Vehicle reset; nop before init, then bdebugImpl.reset. |
| `state` | table | Proxy to bdebugImpl.state (current state). Loads bdebugImpl on access. |
| `stateNoReset` | table | Proxy to bdebugImpl.stateNoReset (state not reset by resetModes). Loads bdebugImpl on access. |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/vehicle/bdebug.lua`.*
