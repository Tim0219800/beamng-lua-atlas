---@meta
-- tim19Atlas stub generated from lua/vehicle/bdebug.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Lightweight facade of the vehicle's visual debug tool (nodes, beams, collision triangles, center of gravity...). As long as nobody uses it, bdebugImpl.lua (large module) is not loaded: the functions marked "initialize" load bdebugImpl on their first call and then redirect to it. A modder mainly uses it to display text on nodes (setNodeDebugText) or to enable/disable the tool. The GE receives the state via guihooks BdebugUpdate and extensions.hook onBDebugUpdate (sent by bdebugImpl).
--- Access: global `bdebug`
---@class bdebug
---@field beamBroke function Beam break hook beamBroke(id, energy); nop before init, then redirection to bdebugImpl.
---@field debugDraw function Debug drawing debugDraw(focusPos) called by the main loop; nop before init, then redirection to bdebugImpl.
---@field initState table Proxy to bdebugImpl.initState (default state of the modes). Loads bdebugImpl on access.
---@field nodeCollision function Node collision hook; nop until bdebugImpl is loaded, then redirects nodeCollision(p) to bdebugImpl.
---@field onPlayersChanged function Player change hook; nop before init, then bdebugImpl.onPlayersChanged.
---@field reset function Vehicle reset; nop before init, then bdebugImpl.reset.
---@field state table Proxy to bdebugImpl.state (current state). Loads bdebugImpl on access.
---@field stateNoReset table Proxy to bdebugImpl.stateNoReset (state not reset by resetModes). Loads bdebugImpl on access.
bdebug = {}

--- Removes all node debug text groups.
---Source: lua/vehicle/bdebug.lua:229
function bdebug.clearAllNodeDebugText() end

--- Removes the texts of a node in a group.
---Source: lua/vehicle/bdebug.lua:200
---@param type string Group name.
---@param nodeCID integer Runtime node ID.
function bdebug.clearNodeDebugText(type, nodeCID) end

--- Removes an entire text group (and shifts the indices of the following groups).
---Source: lua/vehicle/bdebug.lua:209
---@param type string Group name.
function bdebug.clearTypeNodeDebugText(type) end

--- Changes the center of gravity display mode (cogModes, including 'off' and 'on').
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/bdebug.lua:150
---@param change integer +1 / -1 (cyclic).
function bdebug.cogChange(change) end

--- Changes the collision triangle mode (off, simple, type, withoutBroken, withBroken, brokenOnly, collideableOnly).
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/bdebug.lua:145
---@param change integer +1 / -1 (cyclic).
function bdebug.colTrisModeChange(change) end

--- Empty function called at vehicle initialization; loading is lazy.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/bdebug.lua:250
function bdebug.init() end

--- Indicates whether the tool is visible. Always returns false before bdebugImpl is loaded, then bdebugImpl.isEnabled.
---Source: lua/vehicle/bdebug.lua:107
---@return boolean  true if vehicleDebugVisible.
function bdebug.isEnabled() end

--- Changes the displayed node debug text group (off then the groups created by setNodeDebugText).
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/bdebug.lua:135
---@param change integer +1 / -1 (cyclic).
function bdebug.nodedebugtextModeChange(change) end

--- Switches to the next/previous node text mode (off, names, numbers, names+numbers, weights, materials, groups, forces, relativePositions, worldPositions, clusters). Called by input actions.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/bdebug.lua:125
---@param change integer +1 next, -1 previous (cyclic).
function bdebug.nodetextModeChange(change) end

--- Changes the node visualization mode (off, simple, highlighted, weights, displacement, velocities, forces, density, clusters, mainCluster, nodeStability).
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/bdebug.lua:130
---@param change integer +1 / -1 (cyclic).
function bdebug.nodevisModeChange(change) end

--- Restore hook after reload: if a bdebugImpl state was saved, initializes bdebugImpl with it.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/bdebug.lua:244
---@param data table Table returned by onSerialize.
function bdebug.onDeserialize(data) end

--- Save hook before vehicle reload: returns {bdebugImplState = state} if bdebugImpl has already been initialized.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/bdebug.lua:238
---@return table  {bdebugImplState = table|nil}.
function bdebug.onSerialize() end

--- Empty function until bdebugImpl is loaded; then replaced by bdebugImpl.receiveViewportSize(sizeX, sizeY).
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/bdebug.lua:253
function bdebug.receiveViewportSize() end

--- Like requestDrawnNodesGE but for beams: calls geFuncName(beamsDrawn, beamScale) in the GE.
---Source: lua/vehicle/bdebug.lua:102
---@param geFuncName string Name of the GE function.
function bdebug.requestDrawnBeamsGE(geFuncName) end

--- Requests that at the next draw, the list of drawn nodes be sent to a GE Lua function, called as geFuncName(nodesDrawn, nodeScale).
---Source: lua/vehicle/bdebug.lua:96
---@param geFuncName string Name of the GE function _anon(global path, e.g. 'myModule.receive').
function bdebug.requestDrawnNodesGE(geFuncName) end

--- Initializes bdebugImpl and requests that the current state be sent to the UI/GE (BdebugUpdate).
---Source: lua/vehicle/bdebug.lua:85
function bdebug.requestState() end

--- Resets all modes to their default value (copy of initState) and displays the message vehicle.bdebug.clear.
---Source: lua/vehicle/bdebug.lua:155
function bdebug.resetModes() end

--- Initializes bdebugImpl then shows/hides the vehicle's visual debug.
---Source: lua/vehicle/bdebug.lua:111
---@param enabled boolean true to show.
function bdebug.setEnabled(enabled) end

--- Adds a text on a node in a debug text group (the group is created if it does not exist). Several calls on the same node stack the texts. Usable before the init of bdebugImpl.
---Source: lua/vehicle/bdebug.lua:172
---@param type string Name of the text group.
---@param nodeCID integer Runtime node ID (cid).
---@param text string Text to display.
function bdebug.setNodeDebugText(type, nodeCID, text) end

--- Defines the selected parts whose nodes/beams are highlighted. Usable before the init of bdebugImpl.
---Source: lua/vehicle/bdebug.lua:164
---@param parts table Part selection (partsSelected format used by bdebugImpl, inferred from code).
function bdebug.setPartsSelected(parts) end

--- Initializes bdebugImpl then applies a state coming from the UI to it. Ignored if state.objectId is not the current object.
---Source: lua/vehicle/bdebug.lua:90
---@param state table State (objectId, vehicleDebugVisible, vehicle = {...modes...}).
---@param stateNoReset table State kept across mode resets.
---@param notSendBack boolean|nil true to not send the state back to the UI.
function bdebug.setState(state, stateNoReset, notSendBack) end

--- Changes the beam (skeleton) visualization mode: off, simple, highlighted, type, type+broken, brokenOnly, supportOnly, stress, displacement, deformation, etc.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/bdebug.lua:140
---@param change integer +1 / -1 (cyclic).
function bdebug.skeletonModeChange(change) end

--- Toggles the debug display. Reserved for the input system, do not call from the UI.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/bdebug.lua:120
function bdebug.toggleEnabled() end

