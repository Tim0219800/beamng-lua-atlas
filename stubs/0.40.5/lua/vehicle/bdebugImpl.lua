---@meta
-- tim19Atlas stub generated from lua/vehicle/bdebugImpl.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Full implementation of the vehicle's visual debug tool (lazily loaded by bdebug.lua). Draws nodes, beams, torsion bars, collision triangles, rails/slidenodes, center of gravity, aerodynamics, wheel thermals, tire contact point and steering geometry via debugDrawer, according to M.state.vehicle (modes numbered from 1; 1 = 'off'). It sends the state to the GE (guihooks BdebugUpdate and extensions.hook onBDebugUpdate). Modders generally go through bdebug.*, not directly through bdebugImpl.
--- Access: global `bdebugImpl`
---@class bdebugImpl
---@field beamBroke function Hook beamBroke(id, energy) called when a beam breaks; nop except in broken beams mode.
---@field debugDraw function Debug drawing debugDraw(focusPos) called every frame by the main loop; nop if no mode is active.
---@field initState table Default state: vehicleDebugVisible=false, objectId, and vehicle = all the modes (nodeTextModes, nodeVisModes, beamTextModes, beamVisModes, collisionTriangleVisModes, torsionBarVisModes, railsSlideNodesVisModes, cogModes, aerodynamics...), scales (aerodynamicsScale 0.1, nodeTextMaxDist 10), tireContactPoint, steeringGeometry (steeringGeometryLineLength 20), wheelThermals.
---@field nodeCollision function Hook nodeCollision(p) called by the engine on node collision; nop by default, enabled by the relevant visualization mode.
---@field partsState table {partsSelected = table}: selected parts to highlight.
---@field stateNoReset table State kept across mode resets (received with setState).
bdebugImpl = {}

--- Removes all node debug text groups (only 'off' remains).
---Source: lua/vehicle/bdebugImpl.lua:2765
function bdebugImpl.clearAllNodeDebugText() end

--- Removes the texts of a node in a group.
---Source: lua/vehicle/bdebugImpl.lua:2734
---@param type string Group name.
---@param nodeCID integer Runtime node ID.
function bdebugImpl.clearNodeDebugText(type, nodeCID) end

--- Removes an entire text group and realigns the indices of the following groups as well as the selected mode.
---Source: lua/vehicle/bdebugImpl.lua:2744
---@param type string Group name.
function bdebugImpl.clearTypeNodeDebugText(type) end

--- Shifts the center of gravity display mode (cyclic) with a UI message.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/bdebugImpl.lua:2825
---@param change integer +1 / -1.
function bdebugImpl.cogChange(change) end

--- Shifts the collision triangle mode (cyclic) with a UI message.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/bdebugImpl.lua:2818
---@param change integer +1 / -1.
function bdebugImpl.colTrisModeChange(change) end

--- Initializes the tool: counts nodes, beams, triangles, torsion bars, rails and slidenodes of v.data, copies the saved state, retrieves the debug texts and selected parts from bdebug.lua and sends the state to the UI. Called by bdebug.lua on lazy loading.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/bdebugImpl.lua:2838
---@param savedState table|nil State saved before reload; nil to start from initState.
---@param newPartialState table Partial state accumulated by bdebug before init (vehicle.nodeDebugText*, partsSelected).
function bdebugImpl.init(savedState, newPartialState) end

--- Indicates whether the visual debug is displayed.
---Source: lua/vehicle/bdebugImpl.lua:2772
---@return boolean  M.state.vehicleDebugVisible.
function bdebugImpl.isEnabled() end

--- Shifts the displayed node debug text group (cyclic) with a UI message.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/bdebugImpl.lua:2804
---@param change integer +1 / -1.
function bdebugImpl.nodedebugtextModeChange(change) end

--- Shifts the node text mode (cyclic) and displays a UI message with the mode name.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/bdebugImpl.lua:2790
---@param change integer +1 next, -1 previous.
function bdebugImpl.nodetextModeChange(change) end

--- Shifts the node visualization mode (cyclic) with a UI message.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/bdebugImpl.lua:2797
---@param change integer +1 / -1.
function bdebugImpl.nodevisModeChange(change) end

--- Hook called when the player changes vehicle (m = true if this vehicle is concerned): updates the drawing and sends the state back to the UI.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/bdebugImpl.lua:2648
---@param m boolean True if this vehicle is (becomes) the player vehicle (inferred from code).
function bdebugImpl.onPlayersChanged(m) end

--- Stores the viewport size (useful for placing texts/legends). Called by the GE in response to bdebugRequestViewportSize.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/bdebugImpl.lua:2568
---@param sizeX number Width in pixels.
---@param sizeY number Height in pixels.
function bdebugImpl.receiveViewportSize(sizeX, sizeY) end

--- Registers a GE function to call at the next draw with the list of drawn beams: geFuncName(beamsDrawn, beamScale).
---Source: lua/vehicle/bdebugImpl.lua:2643
---@param geFuncName string Name of the GE function.
function bdebugImpl.requestDrawnBeamsGE(geFuncName) end

--- Registers a GE function to call at the next draw with the list of drawn nodes: geFuncName(nodesDrawn, nodeScale).
---Source: lua/vehicle/bdebugImpl.lua:2637
---@param geFuncName string Name of the GE function.
function bdebugImpl.requestDrawnNodesGE(geFuncName) end

--- Sends the current state (state and stateNoReset) to the GE (guihooks BdebugUpdate and hook onBDebugUpdate).
---Source: lua/vehicle/bdebugImpl.lua:2560
function bdebugImpl.requestState() end

--- On vehicle reset: empties the memories of broken/deformed beams and triggered groups so that the messages repeat.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/bdebugImpl.lua:2861
function bdebugImpl.reset() end

--- Resets the state to a copy of initState (all modes 'off'), displays the message vehicle.bdebug.clear and updates the UI.
---Source: lua/vehicle/bdebugImpl.lua:2832
function bdebugImpl.resetModes() end

--- Shows or hides the visual debug, updates the drawing and the UI.
---Source: lua/vehicle/bdebugImpl.lua:2776
---@param enabled boolean true to show.
function bdebugImpl.setEnabled(enabled) end

--- Adds a text on a node in the given group (created if absent), then updates the drawing and the UI.
---Source: lua/vehicle/bdebugImpl.lua:2701
---@param type string Name of the text group.
---@param nodeCID integer Runtime node ID.
---@param text string Text to display.
function bdebugImpl.setNodeDebugText(type, nodeCID, text) end

--- Defines the selected parts (M.partsState.partsSelected) used to highlight nodes, beams, etc.
---Source: lua/vehicle/bdebugImpl.lua:2693
---@param parts table Part selection.
function bdebugImpl.setPartsSelected(parts) end

--- Replaces the state with the one received from the UI (ignored if state.objectId differs from the current object), recomputes vehicleDebugVisible and the drawing, then sends the state back to the UI unless notSendBack.
---Source: lua/vehicle/bdebugImpl.lua:2654
---@param state table New state (with objectId and vehicle).
---@param stateNoReset table New non-reset state.
---@param notSendBack boolean|nil true to not send the state back to the UI.
function bdebugImpl.setState(state, stateNoReset, notSendBack) end

--- Shifts the beam visualization mode (beamVisMode, cyclic) with a UI message.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/bdebugImpl.lua:2811
---@param change integer +1 / -1.
function bdebugImpl.skeletonModeChange(change) end

--- Toggles the debug display. Reserved for the input system, not for the UI.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/bdebugImpl.lua:2785
function bdebugImpl.toggleEnabled() end

