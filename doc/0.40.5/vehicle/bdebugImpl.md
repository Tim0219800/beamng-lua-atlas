# `bdebugImpl`

*File: `lua/vehicle/bdebugImpl.lua` · VM: Vehicle · 2898 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** global `bdebugImpl`

Full implementation of the vehicle's visual debug tool (lazily loaded by bdebug.lua). Draws nodes, beams, torsion bars, collision triangles, rails/slidenodes, center of gravity, aerodynamics, wheel thermals, tire contact point and steering geometry via debugDrawer, according to M.state.vehicle (modes numbered from 1; 1 = 'off'). It sends the state to the GE (guihooks BdebugUpdate and extensions.hook onBDebugUpdate). Modders generally go through bdebug.*, not directly through bdebugImpl.

## Notes

- M.state.vehicle contains for each family an index (nodeTextMode, nodeVisMode, beamTextMode, beamVisMode, collisionTriangleVisMode, torsionBarVisMode, railsSlideNodesVisMode, cogMode, nodeDebugTextMode...) and the list of corresponding modes (...Modes); mode 1 = 'off'. Drawing is enabled only if vehicleDebugVisible is true and at least one non-table field differs from initState.vehicle.
- Beam types (C values, do not change): 0 NORMALTYPE, 1 BEAM_ANISOTROPIC, 2 BEAM_BOUNDED, 3 BEAM_PRESSURED, 4 BEAM_LBEAM, 5 BEAM_BROKEN, 6 BEAM_HYDRO, 7 BEAM_SUPPORT.
- The displayed nodes/beams are sent to the GE (requestDrawnNodesGE/BeamsGE) only once: the callback list is emptied after sending. The callbacks are called as geFuncName(list, scale).
- M.nodeCollision stays nop until the relevant visualization mode enables it internally; M.beamBroke is active only for the beam modes 'type+broken' (5) and 'brokenOnly' (6) when the tool is visible.
- Each debugDraw asks the GE for the viewport size (debug_vehicleDebug.bdebugRequestViewportSize); the GE answers with receiveViewportSize.
- Inconsistency: in setNodeDebugText, the guard `if not M.state then return log(...) end` does a `return log(...)`; it works but the return value is that of log. Also, updateUIs deliberately sends the state to the GE via queueGameEngineLua (workaround for a bug, according to the comment).
- The first call to init copies the savedState (or initState) and takes from newPartialState only the fields nodeDebugTextTypeToID, nodeDebugTextMode and nodeDebugTextModes (and partsSelected).

## Functions

| Function | Description | Line |
|---|---|---|
| `bdebugImpl.clearAllNodeDebugText()` | Removes all node debug text groups (only 'off' remains). | 2765 |
| `bdebugImpl.clearNodeDebugText(type, nodeCID)` | Removes the texts of a node in a group. | 2734 |
| `bdebugImpl.clearTypeNodeDebugText(type)` | Removes an entire text group and realigns the indices of the following groups as well as the selected mode. | 2744 |
| `bdebugImpl.cogChange(change)` | Shifts the center of gravity display mode (cyclic) with a UI message. *(internal)* | 2825 |
| `bdebugImpl.colTrisModeChange(change)` | Shifts the collision triangle mode (cyclic) with a UI message. *(internal)* | 2818 |
| `bdebugImpl.init(savedState, newPartialState)` | Initializes the tool: counts nodes, beams, triangles, torsion bars, rails and slidenodes of v.data, copies the saved state, retrieves the debug texts and selected parts from bdebug.lua and sends the state to the UI. Called by bdebug.lua on lazy loading. *(internal)* | 2838 |
| `bdebugImpl.isEnabled()` | Indicates whether the visual debug is displayed. | 2772 |
| `bdebugImpl.nodedebugtextModeChange(change)` | Shifts the displayed node debug text group (cyclic) with a UI message. *(internal)* | 2804 |
| `bdebugImpl.nodetextModeChange(change)` | Shifts the node text mode (cyclic) and displays a UI message with the mode name. *(internal)* | 2790 |
| `bdebugImpl.nodevisModeChange(change)` | Shifts the node visualization mode (cyclic) with a UI message. *(internal)* | 2797 |
| `bdebugImpl.onPlayersChanged(m)` | Hook called when the player changes vehicle (m = true if this vehicle is concerned): updates the drawing and sends the state back to the UI. *(internal)* *(hook)* | 2648 |
| `bdebugImpl.receiveViewportSize(sizeX, sizeY)` | Stores the viewport size (useful for placing texts/legends). Called by the GE in response to bdebugRequestViewportSize. *(internal)* | 2568 |
| `bdebugImpl.requestDrawnBeamsGE(geFuncName)` | Registers a GE function to call at the next draw with the list of drawn beams: geFuncName(beamsDrawn, beamScale). | 2643 |
| `bdebugImpl.requestDrawnNodesGE(geFuncName)` | Registers a GE function to call at the next draw with the list of drawn nodes: geFuncName(nodesDrawn, nodeScale). | 2637 |
| `bdebugImpl.requestState()` | Sends the current state (state and stateNoReset) to the GE (guihooks BdebugUpdate and hook onBDebugUpdate). | 2560 |
| `bdebugImpl.reset()` | On vehicle reset: empties the memories of broken/deformed beams and triggered groups so that the messages repeat. *(internal)* | 2861 |
| `bdebugImpl.resetModes()` | Resets the state to a copy of initState (all modes 'off'), displays the message vehicle.bdebug.clear and updates the UI. | 2832 |
| `bdebugImpl.setEnabled(enabled)` | Shows or hides the visual debug, updates the drawing and the UI. | 2776 |
| `bdebugImpl.setNodeDebugText(type, nodeCID, text)` | Adds a text on a node in the given group (created if absent), then updates the drawing and the UI. | 2701 |
| `bdebugImpl.setPartsSelected(parts)` | Defines the selected parts (M.partsState.partsSelected) used to highlight nodes, beams, etc. | 2693 |
| `bdebugImpl.setState(state, stateNoReset, notSendBack)` | Replaces the state with the one received from the UI (ignored if state.objectId differs from the current object), recomputes vehicleDebugVisible and the drawing, then sends the state back to the UI unless notSendBack. | 2654 |
| `bdebugImpl.skeletonModeChange(change)` | Shifts the beam visualization mode (beamVisMode, cyclic) with a UI message. *(internal)* | 2811 |
| `bdebugImpl.toggleEnabled()` | Toggles the debug display. Reserved for the input system, not for the UI. *(internal)* | 2785 |

### Parameter details

#### `bdebugImpl.clearNodeDebugText(type, nodeCID)`

Removes the texts of a node in a group.

- `type` (*string*) : Group name.
- `nodeCID` (*integer*) : Runtime node ID.

#### `bdebugImpl.clearTypeNodeDebugText(type)`

Removes an entire text group and realigns the indices of the following groups as well as the selected mode.

- `type` (*string*) : Group name.

#### `bdebugImpl.cogChange(change)`

Shifts the center of gravity display mode (cyclic) with a UI message.

- `change` (*integer*) : +1 / -1.

#### `bdebugImpl.colTrisModeChange(change)`

Shifts the collision triangle mode (cyclic) with a UI message.

- `change` (*integer*) : +1 / -1.

#### `bdebugImpl.init(savedState, newPartialState)`

Initializes the tool: counts nodes, beams, triangles, torsion bars, rails and slidenodes of v.data, copies the saved state, retrieves the debug texts and selected parts from bdebug.lua and sends the state to the UI. Called by bdebug.lua on lazy loading.

- `savedState` (*table|nil*) : State saved before reload; nil to start from initState.
- `newPartialState` (*table*) : Partial state accumulated by bdebug before init (vehicle.nodeDebugText*, partsSelected).

#### `bdebugImpl.isEnabled()`

Indicates whether the visual debug is displayed.

- **returns**: boolean M.state.vehicleDebugVisible.

#### `bdebugImpl.nodedebugtextModeChange(change)`

Shifts the displayed node debug text group (cyclic) with a UI message.

- `change` (*integer*) : +1 / -1.

#### `bdebugImpl.nodetextModeChange(change)`

Shifts the node text mode (cyclic) and displays a UI message with the mode name.

- `change` (*integer*) : +1 next, -1 previous.

#### `bdebugImpl.nodevisModeChange(change)`

Shifts the node visualization mode (cyclic) with a UI message.

- `change` (*integer*) : +1 / -1.

#### `bdebugImpl.onPlayersChanged(m)`

Hook called when the player changes vehicle (m = true if this vehicle is concerned): updates the drawing and sends the state back to the UI.

- `m` (*boolean*) : True if this vehicle is (becomes) the player vehicle (inferred from code).

#### `bdebugImpl.receiveViewportSize(sizeX, sizeY)`

Stores the viewport size (useful for placing texts/legends). Called by the GE in response to bdebugRequestViewportSize.

- `sizeX` (*number*) : Width in pixels.
- `sizeY` (*number*) : Height in pixels.

#### `bdebugImpl.requestDrawnBeamsGE(geFuncName)`

Registers a GE function to call at the next draw with the list of drawn beams: geFuncName(beamsDrawn, beamScale).

- `geFuncName` (*string*) : Name of the GE function.

#### `bdebugImpl.requestDrawnNodesGE(geFuncName)`

Registers a GE function to call at the next draw with the list of drawn nodes: geFuncName(nodesDrawn, nodeScale).

- `geFuncName` (*string*) : Name of the GE function.

#### `bdebugImpl.setEnabled(enabled)`

Shows or hides the visual debug, updates the drawing and the UI.

- `enabled` (*boolean*) : true to show.

#### `bdebugImpl.setNodeDebugText(type, nodeCID, text)`

Adds a text on a node in the given group (created if absent), then updates the drawing and the UI.

- `type` (*string*) : Name of the text group.
- `nodeCID` (*integer*) : Runtime node ID.
- `text` (*string*) : Text to display.

#### `bdebugImpl.setPartsSelected(parts)`

Defines the selected parts (M.partsState.partsSelected) used to highlight nodes, beams, etc.

- `parts` (*table*) : Part selection.

#### `bdebugImpl.setState(state, stateNoReset, notSendBack)`

Replaces the state with the one received from the UI (ignored if state.objectId differs from the current object), recomputes vehicleDebugVisible and the drawing, then sends the state back to the UI unless notSendBack.

- `state` (*table*) : New state (with objectId and vehicle).
- `stateNoReset` (*table*) : New non-reset state.
- `notSendBack` (*boolean|nil*) : true to not send the state back to the UI.

#### `bdebugImpl.skeletonModeChange(change)`

Shifts the beam visualization mode (beamVisMode, cyclic) with a UI message.

- `change` (*integer*) : +1 / -1.

## Fields

| Field | Type | Description |
|---|---|---|
| `beamBroke` | function | Hook beamBroke(id, energy) called when a beam breaks; nop except in broken beams mode. |
| `debugDraw` | function | Debug drawing debugDraw(focusPos) called every frame by the main loop; nop if no mode is active. |
| `initState` | table | Default state: vehicleDebugVisible=false, objectId, and vehicle = all the modes (nodeTextModes, nodeVisModes, beamTextModes, beamVisModes, collisionTriangleVisModes, torsionBarVisModes, railsSlideNodesVisModes, cogModes, aerodynamics...), scales (aerodynamicsScale 0.1, nodeTextMaxDist 10), tireContactPoint, steeringGeometry (steeringGeometryLineLength 20), wheelThermals. |
| `nodeCollision` | function | Hook nodeCollision(p) called by the engine on node collision; nop by default, enabled by the relevant visualization mode. |
| `partsState` | table | {partsSelected = table}: selected parts to highlight. |
| `stateNoReset` | table | State kept across mode resets (received with setState). |

## Calls into the engine (C++)

- `obj:` `beamIsBroken`, `calcCenterOfGravity`, `getAbsNodePosition`, `getBeamDebugDeformation`, `getBeamFrequencyAmplitude`, `getBeamLength`, `getBeamRefLength`, `getBeamStress`, `getBeamStressDamp`, `getCameraPosition`, `getDirectionVector`, `getDirectionVectorUp`, `getDistanceFromTerrainPoint`, `getEnvTemperature`, `getGroupPressure`, `getNodeCluster`, `getNodeForceVector`, `getNodeForceVectorXYZ`, `getNodeMass`, `getNodePosition`, `getNodePositionRelative`, `getNodePositionRelativeXYZ`, `getNodeTemperature`, `getNodeVelocityVector`, `getOriginalNodePositionRelative`, `getPosition`, `getPositionXYZ`, `getTorsionbarAngle`, `getTorsionbarDeformation`, `getVelocity`, `getWheelAvgTemperature`, `getWheelCoreTemperature`, `inWater`, `isTriangleBroken`, `queueGameEngineLua`, `torsionbarIsBroken`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/vehicle/bdebugImpl.lua`.*
