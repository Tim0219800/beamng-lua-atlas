---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/manager.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Manager object (a flowgraph project).
---@class flowgraph_manager
local flowgraph_manager = {}

--- Draws the icon of a data type (type color, filled if connected) in the editor.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/manager.lua:1030
---@param dataType string|table pin type
---@param connected boolean connected pin
---@param alpha number opacity
---@param typeIconSize number|nil size
---@param innercolor ImVec4|nil inner color
function flowgraph_manager:DrawTypeIcon(dataType, connected, alpha, typeIconSize, innercolor) end

--- Notifies graphs and modules of the start (module order by moduleOrder).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/manager.lua:2106
function flowgraph_manager:_executionStarted() end

--- Called on stop: notifies graphs, variables and modules (executionStopped), removes the extension proxy, unloads the extensions in extToUnload, resets steps and frameCount to 0.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/manager.lua:2132
function flowgraph_manager:_executionStopped() end

--- Called on stop: notifies graphs, variables, modules (onClear) and states.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/manager.lua:2120
function flowgraph_manager:_onClear() end

--- Rebuilds the project from serialized data.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/manager.lua:1599
---@param data table data
function flowgraph_manager:_onDeserialized(data) end

--- Serializes the whole project (graphs, macros, variables, metadata).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/manager.lua:1533
---@return table  project data
function flowgraph_manager:_onSerialize() end

--- Iterator over all nodes of all graphs: for node in mgr:allNodes() do ... end.
---Source: lua/ge/extensions/flowgraph/manager.lua:2265
---@return function  iterator
---@return table  context
function flowgraph_manager:allNodes() end

--- Attaches the editor (fgEditor) and updates the node positions.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/manager.lua:16
---@param fgEditor table flowgraph editor
function flowgraph_manager:attach(fgEditor) end

--- Sets this offset to the largest existing graph or node id (graphs and macros).
---Source: lua/ge/extensions/flowgraph/manager.lua:84
function flowgraph_manager:autoGraphNodeOffset() end

--- True if the project is running and one of its nodes declares blocksOnResetGameplay (result cached until the next setRunning).
---Source: lua/ge/extensions/flowgraph/manager.lua:2249
---@return boolean  blocks the gameplay reset
function flowgraph_manager:blocksOnResetGameplay() end

--- If the project is running, calls the given hook function on the extension proxy then on the states (hence on the nodes that listen to it).
---Source: lua/ge/extensions/flowgraph/manager.lua:2193
---@param functionName string hook name (e.g. 'onVehicleResetted')
---@param ... any hook arguments
function flowgraph_manager:broadcastCall(functionName, ...) end

--- Like broadcastCall, but collects the nodes' results in a table (passed as the first argument to the hooks).
---Source: lua/ge/extensions/flowgraph/manager.lua:2202
---@param functionName string hook name
---@param ... any arguments
---@return table  results
function flowgraph_manager:broadcastCallReturn(functionName, ...) end

--- Logs an error if a section of the graph has several root nodes (multiple flow colors).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/manager.lua:1989
function flowgraph_manager:checkCompileWarnings() end

--- Was meant to report an id already in use (see notes: faulty code).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/manager.lua:28
---@param id integer id to check
---@return boolean|nil  true if duplicate
function flowgraph_manager:checkDuplicateId(id) end

--- Clears a graph (the current one by default): removes nodes and links from the editor then calls graph:clear().
---Source: lua/ge/extensions/flowgraph/manager.lua:1504
---@param graph table|nil graph
function flowgraph_manager:clearGraph(graph) end

--- Turns a graph into a macro: its serialized copy becomes a macro (self.macros) and the original graph becomes an instance of that macro.
---Source: lua/ge/extensions/flowgraph/manager.lua:356
---@param graph table graph to convert
---@return table|nil  macro
function flowgraph_manager:convertToMacro(graph) end

--- Copies a graph by serialization then deserialization, keeping macroID.
---Source: lua/ge/extensions/flowgraph/manager.lua:342
---@param oldGraph table source graph
---@param newName string|nil name
---@param hidden boolean|nil do not register
---@return table  copy
function flowgraph_manager:copyGraph(oldGraph, newName, hidden) end

--- Copies the selected nodes to the internal clipboard (copiedNodes).
---Source: lua/ge/extensions/flowgraph/manager.lua:1193
function flowgraph_manager:copyNodes() end

--- Creates a graph linked to the manager; if it is not hidden, it is added to self.graphs.
---Source: lua/ge/extensions/flowgraph/manager.lua:333
---@param name string|nil name
---@param hidden boolean|nil do not register in graphs
---@param forceId integer|nil imposed id
---@return table  graph
function flowgraph_manager:createGraph(name, hidden, forceId) end

--- Creates a graph and a state node (states/stateNode) in the current graph that targets it.
---Source: lua/ge/extensions/flowgraph/manager.lua:257
---@param name string name
---@param isStateGraph boolean state graph
---@return table  graph
---@return table  state node
function flowgraph_manager:createGraphAsState(name, isStateGraph) end

--- Creates a group state (state graph child of the current graph) with entry and 'success' exit.
---Source: lua/ge/extensions/flowgraph/manager.lua:269
---@param name string name
---@return table  graph
---@return table  state node
function flowgraph_manager:createGroupState(name) end

--- Creates a graph of type 'instance' from a macro and optionally links it to an integrated node.
---Source: lua/ge/extensions/flowgraph/manager.lua:691
---@param macro table macro graph
---@param node table|nil integrated node
---@param forceId integer|nil imposed id
---@return table  instance
function flowgraph_manager:createInstanceFromMacro(macro, node, forceId) end

--- Creates a macro instance from a file (reuses the already loaded macro if it has the same macroPath).
---Source: lua/ge/extensions/flowgraph/manager.lua:725
---@param path string macro path
---@param node table integrated node
---@return table  instance
function flowgraph_manager:createMacroInstanceFromPath(path, node) end

--- Creates a macro/integrated node in the current graph, instantiated from a macro file.
---Source: lua/ge/extensions/flowgraph/manager.lua:684
---@param path string macro file path
function flowgraph_manager:createNewMacroNode(path) end

--- Creates a state from library data (graph, node, minId, name).
---Source: lua/ge/extensions/flowgraph/manager.lua:286
---@param data table state data
---@return table  graph
---@return table  node
function flowgraph_manager:createStateFromLibrary(data) end

--- Creates a subgraph from the selected macro instance (via groupHelper).
---Source: lua/ge/extensions/flowgraph/manager.lua:1849
function flowgraph_manager:createSubgraphFromMacroInstance() end

--- Groups the selection into a subgraph (groupHelper:createGroupingFromSelection).
---Source: lua/ge/extensions/flowgraph/manager.lua:1853
function flowgraph_manager:createSubgraphFromSelection() end

--- Every frame, handles link and node creation by dragging in the editor.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/manager.lua:891
function flowgraph_manager:creationWorkflow() end

--- Deletes a graph (manager graphs or macros); logs an error if it does not belong to the manager.
---Source: lua/ge/extensions/flowgraph/manager.lua:784
---@param graph table graph
function flowgraph_manager:deleteGraph(graph) end

--- Deletes all graphs then all macros.
---Source: lua/ge/extensions/flowgraph/manager.lua:1517
function flowgraph_manager:deleteGraphs() end

--- Deletes the selected nodes and links of the current graph (if editing is allowed).
---Source: lua/ge/extensions/flowgraph/manager.lua:1404
function flowgraph_manager:deleteSelection() end

--- Deletes the selection then adds a 'Deleted Selection' history entry.
---Source: lua/ge/extensions/flowgraph/manager.lua:1396
function flowgraph_manager:deleteSelectionButton() end

--- Handles deletion by the editor (Delete key and selection).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/manager.lua:1062
function flowgraph_manager:deletionWorkflow() end

--- Stops the project if it is running, destroys the states and the extension proxy and marks the manager as destroyed.
---Source: lua/ge/extensions/flowgraph/manager.lua:2162
function flowgraph_manager:destroy() end

--- Detaches the editor: clears the selection.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/manager.lua:21
function flowgraph_manager:detached() end

--- Called by the editor to prepare the source of a drag-and-drop.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/manager.lua:1169
---@param payloadType string content type
---@param data any data
function flowgraph_manager:dragDropSource(payloadType, data) end

--- Called by the editor when an object is dropped: handles the drag-and-drop target.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/manager.lua:1158
---@param payloadType string content type
function flowgraph_manager:dragDropTarget(payloadType) end

--- Draws the project in the editor every frame (ui).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/manager.lua:1423
---@param dtReal number real dt
---@param dtSim number simulation dt
---@param dtRaw number raw dt
function flowgraph_manager:draw(dtReal, dtSim, dtRaw) end

--- Builds the dependency order between serialized macros.
---Source: lua/ge/extensions/flowgraph/manager.lua:1797
---@param serializedMacros table serialized macros
function flowgraph_manager:findDependencyMap(serializedMacros) end

--- Finds the macro/integrated node of the parent graph that represents this graph.
---Source: lua/ge/extensions/flowgraph/manager.lua:520
---@param graph table graph
---@return table|nil  node
function flowgraph_manager:findIntegratedNode(graph) end

--- Returns the id of the link with the given hiddenId, in the current graph.
---Source: lua/ge/extensions/flowgraph/manager.lua:1134
---@param hiddenId integer link hiddenId
---@return integer|nil  link id
function flowgraph_manager:findLinkIdFromHiddenLinkId(hiddenId) end

--- Recursively lists the macroIDs used by the children (see notes).
---Source: lua/ge/extensions/flowgraph/manager.lua:1787
---@param graph table graph
---@param list string[] list to fill
function flowgraph_manager:findMacrosUsedInChildren(graph, list) end

--- Lists the JSON macro files in the /flowgraphEditor/macros/ folder (by name, with the path field).
---Source: lua/ge/extensions/flowgraph/manager.lua:1429
---@return table<string, table>  macros by name
function flowgraph_manager:getAvailableMacros() end

--- Returns the node templates (list and lookup table by type) of the game, plus the custom nodes from the project's customNodes/ folder if it is saved.
---Source: lua/ge/extensions/flowgraph/manager.lua:1446
---@return table  list
---@return table  lookup by nodeType
function flowgraph_manager:getAvailableNodeTemplates() end

--- Returns the state templates from core_flowgraphManager.
---Source: lua/ge/extensions/flowgraph/manager.lua:1442
---@return table  templates
function flowgraph_manager:getAvailableStateTemplates() end

--- Loads the custom nodes (*Node.lua) from savedDir/customNodes/.
---Source: lua/ge/extensions/flowgraph/manager.lua:1465
---@return table  {lookup, res}
function flowgraph_manager:getCustomNodeTemplates() end

--- Returns, sorted, the extensions required by the nodes (excluding macros) and the modules. Empty if the project is not running.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/manager.lua:1961
---@return string[]  extension names
function flowgraph_manager:getDependencies() end

--- Returns the first graph with this name.
---Source: lua/ge/extensions/flowgraph/manager.lua:2177
---@param name string name
---@return table|nil  graph
function flowgraph_manager:getGraphByName(name) end

--- Id offset used during deserialization (default 0).
---Source: lua/ge/extensions/flowgraph/manager.lua:80
---@return integer  offset
function flowgraph_manager:getGraphNodeOffset() end

--- Returns the list of hook targets (the manager and a table of functions grouping the modules' hooks, run under xpcall with error logging). Empty if the project is not running.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/manager.lua:1920
---@return table[]  hook targets
function flowgraph_manager:getHooklist() end

--- Returns the next free id for a graph or a node (incremental, checks graphs, macros and their nodes).
---Source: lua/ge/extensions/flowgraph/manager.lua:50
---@return integer  id
function flowgraph_manager:getNextFreeGraphNodeId() end

--- Returns the next free id for pins and links, counting down from 2^29.
---Source: lua/ge/extensions/flowgraph/manager.lua:101
---@return integer  id
function flowgraph_manager:getNextFreePinLinkId() end

--- Returns an id that is unique across all editor instances (delegates to core_flowgraphManager).
---Source: lua/ge/extensions/flowgraph/manager.lua:1529
---@return integer  id
function flowgraph_manager:getNextUniqueIdentifier() end

--- Resolves one or more paths relative to the root, the activity's layer folders, savedDir or the mission folder and returns the first existing file (FS:fileExists). Otherwise returns the first candidate path and false (with a warning unless disabled).
---Source: lua/ge/extensions/flowgraph/manager.lua:2284
---@param p string|string[] relative path(s)
---@param disableLogEntryOnFail boolean|nil no warning if not found
---@return string|nil  path
---@return boolean  found
function flowgraph_manager:getRelativeAbsolutePath(p, disableLogEntryOnFail) end

--- Restores a history state by index.
---Source: lua/ge/extensions/flowgraph/manager.lua:1344
---@param index integer index in history
function flowgraph_manager:goToHistory(index) end

--- True if the project is running and a node or state listens to this hook.
---Source: lua/ge/extensions/flowgraph/manager.lua:2213
---@param functionName string hook name
---@return boolean  listened to
function flowgraph_manager:hasNodeForHook(functionName) end

--- Records a serialized snapshot of the project in the history (ignored if editing is forbidden, i.e. during execution).
---Source: lua/ge/extensions/flowgraph/manager.lua:1374
---@param title string entry title
function flowgraph_manager:historySnapshot(title) end

--- Creates an empty project: 'New State' graph with an events/onUpdate node, state graph, variableStorage, instances of the 16 modules, history (99 entries max), extension proxy (newExtensionProxy) registered in core_flowgraphManager.runningProxies, groupHelper, and a first history snapshot.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/manager.lua:126
---@param parent table core_flowgraphManager extension
function flowgraph_manager:init(parent) end

--- Adds an event to the project log (name, type 'I'/'W'/'E', description, frame, time) and counts duplicates by name. Useful for nodes and modules to trace execution.
---Source: lua/ge/extensions/flowgraph/manager.lua:1898
---@param name string event name
---@param type string|nil 'I', 'W' or 'E'
---@param description string|nil details
---@param meta table|nil e.g. {type = 'node', node = node}
function flowgraph_manager:logEvent(name, type, description, meta) end

--- End-of-mission hook: immediately stops the project if stopRunningOnClientEndMission is true.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/manager.lua:2277
function flowgraph_manager:onClientEndMission() end

--- During a drag-and-drop.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/manager.lua:1147
function flowgraph_manager:onDrag() end

--- End of a drag-and-drop.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/manager.lua:1153
function flowgraph_manager:onDragEnded() end

--- Start of a drag-and-drop (dragging = true).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/manager.lua:1143
function flowgraph_manager:onDragStarted() end

--- Called every frame: counts frames, stores dtReal/dtSim/dtRaw, handles step-by-step mode (steps) then calls onUpdate of each module.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/manager.lua:1882
---@param dtReal number real dt (s)
---@param dtSim number simulation dt (s)
---@param dtRaw number raw dt (s)
function flowgraph_manager:onUpdate(dtReal, dtSim, dtRaw) end

--- Pastes the copied nodes into the current graph.
---Source: lua/ge/extensions/flowgraph/manager.lua:1238
function flowgraph_manager:pasteNodes() end

--- Requests a project restart at the end of the frame.
---Source: lua/ge/extensions/flowgraph/manager.lua:2102
function flowgraph_manager:queueForRestart() end

--- Moves to the next history entry.
---Source: lua/ge/extensions/flowgraph/manager.lua:1364
function flowgraph_manager:redo() end

--- Rebuilds the pins of a macro/integrated node from its target graph while keeping links and hardcoded values.
---Source: lua/ge/extensions/flowgraph/manager.lua:395
---@param node table integrated node
function flowgraph_manager:refreshIntegratedPins(node) end

--- Called at the end of the frame by core_flowgraphManager: executes the deferred stops (queueReset) and restarts (queueRestart).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/manager.lua:1858
function flowgraph_manager:resolveHooksAndReset() end

--- Applies the pending variable changes of the manager and of all graphs.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/manager.lua:2186
function flowgraph_manager:resolveVariableChanges() end

--- Writes a macro (root) to a JSON file with its tags and updates macroPath of the instances.
---Source: lua/ge/extensions/flowgraph/manager.lua:608
---@param macro table macro graph
---@param savedata table filepath field
function flowgraph_manager:saveMacro(macro, savedata) end

--- Makes a graph current (shows its tab, remembers the recent instance, opens the macro if stopped) and clears the selection.
---Source: lua/ge/extensions/flowgraph/manager.lua:303
---@param graph table graph
function flowgraph_manager:selectGraph(graph) end

--- Pauses or resumes the project (no effect if stopped).
---Source: lua/ge/extensions/flowgraph/manager.lua:2094
---@param paused boolean pause
function flowgraph_manager:setPaused(paused) end

--- Starts or stops the project. On start: plans the root graphs, builds and starts the states, notifies nodes and modules (_executionStarted) and broadcasts 'onExecutionStarted'. On stop: broadcasts 'onRemoveNextFrame' and schedules the stop at the end of the frame, or immediately if stopInstant.
---Source: lua/ge/extensions/flowgraph/manager.lua:2027
---@param running boolean start (true) or stop (false)
---@param stopInstant boolean|nil stop and destroy immediately
function flowgraph_manager:setRunning(running, stopInstant) end

--- Prepares node or link creation from the editor (ui_flowgraph_editor).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/manager.lua:837
function flowgraph_manager:setupCreationWorkflow() end

--- Creates the 'States' state graph with stateEntry and stateExit nodes, and (unless empty) a stateNode toward the main graph.
---Source: lua/ge/extensions/flowgraph/manager.lua:233
---@param empty boolean|nil do not create a stateNode
---@return table  state graph
---@return table  entry node
---@return table  exit node
function flowgraph_manager:setupStateGraph(empty) end

--- Goes back to the previous history entry.
---Source: lua/ge/extensions/flowgraph/manager.lua:1354
function flowgraph_manager:undo() end

--- Clears the node and link selection.
---Source: lua/ge/extensions/flowgraph/manager.lua:1088
function flowgraph_manager:unselectAll() end

--- Updates the editor position of all nodes in the graphs and macros.
---Source: lua/ge/extensions/flowgraph/manager.lua:1759
---@param force boolean|nil unused
function flowgraph_manager:updateEditorPosition(force) end

--- Updates the selected node and link tables from the C++-side selection.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/manager.lua:1100
function flowgraph_manager:updateEditorSelections() end

--- Updates all instances of a modified macro from its serialized version.
---Source: lua/ge/extensions/flowgraph/manager.lua:551
---@param macro table|nil modified macro
function flowgraph_manager:updateInstances(macro) end

--- Re-reads the editor position of all nodes in the graphs.
---Source: lua/ge/extensions/flowgraph/manager.lua:1776
function flowgraph_manager:updateNodePositions() end

--- Recursively replaces the target graphs of integrated nodes with copies of type 'instance'.
---Source: lua/ge/extensions/flowgraph/manager.lua:537
---@param graph table graph
function flowgraph_manager:updateSubgraphs(graph) end

