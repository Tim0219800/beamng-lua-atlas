# `flowgraph_manager`

*File: `lua/ge/extensions/flowgraph/manager.lua` · VM: Game Engine (GE) · 2333 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/manager")` (file under extensions/ but not a regular extension)

Flowgraph 'manager' class: a manager represents ONE flowgraph project (graphs, macros, variables, modules, history, execution state). It is created by core_flowgraphManager (self.fgMgr) and exposed to the editor (fgEditor). It creates the graphs (including the state graph), manages macros and their instances, selection, copy-paste, undo-redo, project serialization, and drives execution: setRunning plans the graphs, starts the states, broadcasts the hooks (broadcastCall) and notifies the 16 modules (missionReplay, drift, vehicle, level, prefab, timer, button, action, camera, file, traffic, mission, foreach, thread, ui, aiRecording) sorted by moduleOrder. The module returns a constructor: require('/lua/ge/extensions/flowgraph/manager')(parent).

## Notes

- Execution states (runningState): 'stopped', 'running', 'paused'. A normal stop is deferred to the end of the frame (queueReset handled by resolveHooksAndReset); setRunning(false, true) stops and destroys immediately.
- Graph and node ids are small (getNextFreeGraphNodeId); pin and link ids count down from 2^29 (getNextFreePinLinkId).
- The modules' hooks are registered via extProxy:submitEventSinks(getHooklist(), getDependencies()); getHooklist and getDependencies return {} if the project is not 'running'.
- getRelativeAbsolutePath looks first at the root, then in the activity's layers folders, or otherwise savedDir then missionFolder.
- Bug: checkDuplicateId uses the undefined variables 'i', 'occupied' and 'node' (leftovers from getNextFreeGraphNodeId): self.graphs[i] is always nil and the following loop can fail; the check is therefore ineffective (it only runs if __safeIds, true by default).
- Minor bug: setPaused calls extProxy:submitEventSinks(self:getHooklist()) without the dependency list.
- Probable bug: findMacrosUsedInChildren reads graph.children, a field commented out in graph.lua (never filled).
- createStateFromLibrary uses the undefined 'oldIdMap' (nil) when calling graph:_onDeserialized.

## Class `C`

Manager object (a flowgraph project).

The module returns a constructor: `local obj = require("flowgraph_manager")(options)`.

| Method | Description | Line |
|---|---|---|
| `C:DrawTypeIcon(dataType, connected, alpha, typeIconSize, innercolor)` | Draws the icon of a data type (type color, filled if connected) in the editor. | 1030 |
| `C:_executionStarted()` | Notifies graphs and modules of the start (module order by moduleOrder). | 2106 |
| `C:_executionStopped()` | Called on stop: notifies graphs, variables and modules (executionStopped), removes the extension proxy, unloads the extensions in extToUnload, resets steps and frameCount to 0. | 2132 |
| `C:_onClear()` | Called on stop: notifies graphs, variables, modules (onClear) and states. | 2120 |
| `C:_onDeserialized(data)` | Rebuilds the project from serialized data. | 1599 |
| `C:_onSerialize()` | Serializes the whole project (graphs, macros, variables, metadata). | 1533 |
| `C:allNodes()` | Iterator over all nodes of all graphs: for node in mgr:allNodes() do ... end. | 2265 |
| `C:attach(fgEditor)` | Attaches the editor (fgEditor) and updates the node positions. | 16 |
| `C:autoGraphNodeOffset()` | Sets this offset to the largest existing graph or node id (graphs and macros). | 84 |
| `C:blocksOnResetGameplay()` | True if the project is running and one of its nodes declares blocksOnResetGameplay (result cached until the next setRunning). | 2249 |
| `C:broadcastCall(functionName, ...)` | If the project is running, calls the given hook function on the extension proxy then on the states (hence on the nodes that listen to it). | 2193 |
| `C:broadcastCallReturn(functionName, ...)` | Like broadcastCall, but collects the nodes' results in a table (passed as the first argument to the hooks). | 2202 |
| `C:checkCompileWarnings()` | Logs an error if a section of the graph has several root nodes (multiple flow colors). | 1989 |
| `C:checkDuplicateId(id)` | Was meant to report an id already in use (see notes: faulty code). | 28 |
| `C:clearGraph(graph)` | Clears a graph (the current one by default): removes nodes and links from the editor then calls graph:clear(). | 1504 |
| `C:convertToMacro(graph)` | Turns a graph into a macro: its serialized copy becomes a macro (self.macros) and the original graph becomes an instance of that macro. | 356 |
| `C:copyGraph(oldGraph, newName, hidden)` | Copies a graph by serialization then deserialization, keeping macroID. | 342 |
| `C:copyNodes()` | Copies the selected nodes to the internal clipboard (copiedNodes). | 1193 |
| `C:createGraph(name, hidden, forceId)` | Creates a graph linked to the manager; if it is not hidden, it is added to self.graphs. | 333 |
| `C:createGraphAsState(name, isStateGraph)` | Creates a graph and a state node (states/stateNode) in the current graph that targets it. | 257 |
| `C:createGroupState(name)` | Creates a group state (state graph child of the current graph) with entry and 'success' exit. | 269 |
| `C:createInstanceFromMacro(macro, node, forceId)` | Creates a graph of type 'instance' from a macro and optionally links it to an integrated node. | 691 |
| `C:createMacroInstanceFromPath(path, node)` | Creates a macro instance from a file (reuses the already loaded macro if it has the same macroPath). | 725 |
| `C:createNewMacroNode(path)` | Creates a macro/integrated node in the current graph, instantiated from a macro file. | 684 |
| `C:createStateFromLibrary(data)` | Creates a state from library data (graph, node, minId, name). | 286 |
| `C:createSubgraphFromMacroInstance()` | Creates a subgraph from the selected macro instance (via groupHelper). | 1849 |
| `C:createSubgraphFromSelection()` | Groups the selection into a subgraph (groupHelper:createGroupingFromSelection). | 1853 |
| `C:creationWorkflow()` | Every frame, handles link and node creation by dragging in the editor. | 891 |
| `C:deleteGraph(graph)` | Deletes a graph (manager graphs or macros); logs an error if it does not belong to the manager. | 784 |
| `C:deleteGraphs()` | Deletes all graphs then all macros. | 1517 |
| `C:deleteSelection()` | Deletes the selected nodes and links of the current graph (if editing is allowed). | 1404 |
| `C:deleteSelectionButton()` | Deletes the selection then adds a 'Deleted Selection' history entry. | 1396 |
| `C:deletionWorkflow()` | Handles deletion by the editor (Delete key and selection). | 1062 |
| `C:destroy()` | Stops the project if it is running, destroys the states and the extension proxy and marks the manager as destroyed. | 2162 |
| `C:detached()` | Detaches the editor: clears the selection. | 21 |
| `C:dragDropSource(payloadType, data)` | Called by the editor to prepare the source of a drag-and-drop. | 1169 |
| `C:dragDropTarget(payloadType)` | Called by the editor when an object is dropped: handles the drag-and-drop target. | 1158 |
| `C:draw(dtReal, dtSim, dtRaw)` | Draws the project in the editor every frame (ui). | 1423 |
| `C:findDependencyMap(serializedMacros)` | Builds the dependency order between serialized macros. | 1797 |
| `C:findIntegratedNode(graph)` | Finds the macro/integrated node of the parent graph that represents this graph. | 520 |
| `C:findLinkIdFromHiddenLinkId(hiddenId)` | Returns the id of the link with the given hiddenId, in the current graph. | 1134 |
| `C:findMacrosUsedInChildren(graph, list)` | Recursively lists the macroIDs used by the children (see notes). | 1787 |
| `C:getAvailableMacros()` | Lists the JSON macro files in the /flowgraphEditor/macros/ folder (by name, with the path field). | 1429 |
| `C:getAvailableNodeTemplates()` | Returns the node templates (list and lookup table by type) of the game, plus the custom nodes from the project's customNodes/ folder if it is saved. | 1446 |
| `C:getAvailableStateTemplates()` | Returns the state templates from core_flowgraphManager. | 1442 |
| `C:getCustomNodeTemplates()` | Loads the custom nodes (*Node.lua) from savedDir/customNodes/. | 1465 |
| `C:getDependencies()` | Returns, sorted, the extensions required by the nodes (excluding macros) and the modules. Empty if the project is not running. | 1961 |
| `C:getGraphByName(name)` | Returns the first graph with this name. | 2177 |
| `C:getGraphNodeOffset()` | Id offset used during deserialization (default 0). | 80 |
| `C:getHooklist()` | Returns the list of hook targets (the manager and a table of functions grouping the modules' hooks, run under xpcall with error logging). Empty if the project is not running. | 1920 |
| `C:getNextFreeGraphNodeId()` | Returns the next free id for a graph or a node (incremental, checks graphs, macros and their nodes). | 50 |
| `C:getNextFreePinLinkId()` | Returns the next free id for pins and links, counting down from 2^29. | 101 |
| `C:getNextUniqueIdentifier()` | Returns an id that is unique across all editor instances (delegates to core_flowgraphManager). | 1529 |
| `C:getRelativeAbsolutePath(p, disableLogEntryOnFail)` | Resolves one or more paths relative to the root, the activity's layer folders, savedDir or the mission folder and returns the first existing file (FS:fileExists). Otherwise returns the first candidate path and false (with a warning unless disabled). | 2284 |
| `C:goToHistory(index)` | Restores a history state by index. | 1344 |
| `C:hasNodeForHook(functionName)` | True if the project is running and a node or state listens to this hook. | 2213 |
| `C:historySnapshot(title)` | Records a serialized snapshot of the project in the history (ignored if editing is forbidden, i.e. during execution). | 1374 |
| `C:init(parent)` | Creates an empty project: 'New State' graph with an events/onUpdate node, state graph, variableStorage, instances of the 16 modules, history (99 entries max), extension proxy (newExtensionProxy) registered in core_flowgraphManager.runningProxies, groupHelper, and a first history snapshot. | 126 |
| `C:logEvent(name, type, description, meta)` | Adds an event to the project log (name, type 'I'/'W'/'E', description, frame, time) and counts duplicates by name. Useful for nodes and modules to trace execution. | 1898 |
| `C:onClientEndMission()` | End-of-mission hook: immediately stops the project if stopRunningOnClientEndMission is true. | 2277 |
| `C:onDrag()` | During a drag-and-drop. | 1147 |
| `C:onDragEnded()` | End of a drag-and-drop. | 1153 |
| `C:onDragStarted()` | Start of a drag-and-drop (dragging = true). | 1143 |
| `C:onUpdate(dtReal, dtSim, dtRaw)` | Called every frame: counts frames, stores dtReal/dtSim/dtRaw, handles step-by-step mode (steps) then calls onUpdate of each module. | 1882 |
| `C:pasteNodes()` | Pastes the copied nodes into the current graph. | 1238 |
| `C:queueForRestart()` | Requests a project restart at the end of the frame. | 2102 |
| `C:redo()` | Moves to the next history entry. | 1364 |
| `C:refreshIntegratedPins(node)` | Rebuilds the pins of a macro/integrated node from its target graph while keeping links and hardcoded values. | 395 |
| `C:resolveHooksAndReset()` | Called at the end of the frame by core_flowgraphManager: executes the deferred stops (queueReset) and restarts (queueRestart). | 1858 |
| `C:resolveVariableChanges()` | Applies the pending variable changes of the manager and of all graphs. | 2186 |
| `C:saveMacro(macro, savedata)` | Writes a macro (root) to a JSON file with its tags and updates macroPath of the instances. | 608 |
| `C:selectGraph(graph)` | Makes a graph current (shows its tab, remembers the recent instance, opens the macro if stopped) and clears the selection. | 303 |
| `C:setPaused(paused)` | Pauses or resumes the project (no effect if stopped). | 2094 |
| `C:setRunning(running, stopInstant)` | Starts or stops the project. On start: plans the root graphs, builds and starts the states, notifies nodes and modules (_executionStarted) and broadcasts 'onExecutionStarted'. On stop: broadcasts 'onRemoveNextFrame' and schedules the stop at the end of the frame, or immediately if stopInstant. | 2027 |
| `C:setupCreationWorkflow()` | Prepares node or link creation from the editor (ui_flowgraph_editor). | 837 |
| `C:setupStateGraph(empty)` | Creates the 'States' state graph with stateEntry and stateExit nodes, and (unless empty) a stateNode toward the main graph. | 233 |
| `C:undo()` | Goes back to the previous history entry. | 1354 |
| `C:unselectAll()` | Clears the node and link selection. | 1088 |
| `C:updateEditorPosition(force)` | Updates the editor position of all nodes in the graphs and macros. | 1759 |
| `C:updateEditorSelections()` | Updates the selected node and link tables from the C++-side selection. | 1100 |
| `C:updateInstances(macro)` | Updates all instances of a modified macro from its serialized version. | 551 |
| `C:updateNodePositions()` | Re-reads the editor position of all nodes in the graphs. | 1776 |
| `C:updateSubgraphs(graph)` | Recursively replaces the target graphs of integrated nodes with copies of type 'instance'. | 537 |

## Calls into the engine (C++)

- `FS:` `fileExists`, `findFiles`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/manager.lua`.*
