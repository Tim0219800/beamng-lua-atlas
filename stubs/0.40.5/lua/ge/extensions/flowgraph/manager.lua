---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/manager.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe locale `C` de lua/ge/extensions/flowgraph/manager.lua (instanciée par la fonction renvoyée par le module)
---@class flowgraph_manager
local flowgraph_manager = {}

---Source : lua/ge/extensions/flowgraph/manager.lua:1030
---@param dataType any
---@param connected any
---@param alpha any
---@param typeIconSize any
---@param innercolor any
function flowgraph_manager:DrawTypeIcon(dataType, connected, alpha, typeIconSize, innercolor) end

---Source : lua/ge/extensions/flowgraph/manager.lua:2106
function flowgraph_manager:_executionStarted() end

---Source : lua/ge/extensions/flowgraph/manager.lua:2132
function flowgraph_manager:_executionStopped() end

---Source : lua/ge/extensions/flowgraph/manager.lua:2120
function flowgraph_manager:_onClear() end

---Source : lua/ge/extensions/flowgraph/manager.lua:1599
---@param data any
function flowgraph_manager:_onDeserialized(data) end

---Source : lua/ge/extensions/flowgraph/manager.lua:1533
function flowgraph_manager:_onSerialize() end

---Source : lua/ge/extensions/flowgraph/manager.lua:2265
function flowgraph_manager:allNodes() end

---Source : lua/ge/extensions/flowgraph/manager.lua:16
---@param fgEditor any
function flowgraph_manager:attach(fgEditor) end

---Source : lua/ge/extensions/flowgraph/manager.lua:84
function flowgraph_manager:autoGraphNodeOffset() end

---Source : lua/ge/extensions/flowgraph/manager.lua:2249
function flowgraph_manager:blocksOnResetGameplay() end

---Source : lua/ge/extensions/flowgraph/manager.lua:2193
---@param functionName any
---@param ... any
function flowgraph_manager:broadcastCall(functionName, ...) end

---Source : lua/ge/extensions/flowgraph/manager.lua:2202
---@param functionName any
---@param ... any
function flowgraph_manager:broadcastCallReturn(functionName, ...) end

---Source : lua/ge/extensions/flowgraph/manager.lua:1989
function flowgraph_manager:checkCompileWarnings() end

---Source : lua/ge/extensions/flowgraph/manager.lua:28
---@param id any
function flowgraph_manager:checkDuplicateId(id) end

---Source : lua/ge/extensions/flowgraph/manager.lua:1504
---@param graph any
function flowgraph_manager:clearGraph(graph) end

---Source : lua/ge/extensions/flowgraph/manager.lua:356
---@param graph any
function flowgraph_manager:convertToMacro(graph) end

---Source : lua/ge/extensions/flowgraph/manager.lua:342
---@param oldGraph any
---@param newName any
---@param hidden any
function flowgraph_manager:copyGraph(oldGraph, newName, hidden) end

---Source : lua/ge/extensions/flowgraph/manager.lua:1193
function flowgraph_manager:copyNodes() end

---Source : lua/ge/extensions/flowgraph/manager.lua:333
---@param name any
---@param hidden any
---@param forceId any
function flowgraph_manager:createGraph(name, hidden, forceId) end

---Source : lua/ge/extensions/flowgraph/manager.lua:257
---@param name any
---@param isStateGraph any
function flowgraph_manager:createGraphAsState(name, isStateGraph) end

---Source : lua/ge/extensions/flowgraph/manager.lua:269
---@param name any
function flowgraph_manager:createGroupState(name) end

---Source : lua/ge/extensions/flowgraph/manager.lua:691
---@param macro any
---@param node any
---@param forceId any
function flowgraph_manager:createInstanceFromMacro(macro, node, forceId) end

---Source : lua/ge/extensions/flowgraph/manager.lua:725
---@param path any
---@param node any
function flowgraph_manager:createMacroInstanceFromPath(path, node) end

---Source : lua/ge/extensions/flowgraph/manager.lua:684
---@param path any
function flowgraph_manager:createNewMacroNode(path) end

---Source : lua/ge/extensions/flowgraph/manager.lua:286
---@param data any
function flowgraph_manager:createStateFromLibrary(data) end

---Source : lua/ge/extensions/flowgraph/manager.lua:1849
function flowgraph_manager:createSubgraphFromMacroInstance() end

---Source : lua/ge/extensions/flowgraph/manager.lua:1853
function flowgraph_manager:createSubgraphFromSelection() end

---Source : lua/ge/extensions/flowgraph/manager.lua:891
function flowgraph_manager:creationWorkflow() end

---Source : lua/ge/extensions/flowgraph/manager.lua:784
---@param graph any
function flowgraph_manager:deleteGraph(graph) end

---Source : lua/ge/extensions/flowgraph/manager.lua:1517
function flowgraph_manager:deleteGraphs() end

---Source : lua/ge/extensions/flowgraph/manager.lua:1404
function flowgraph_manager:deleteSelection() end

---Source : lua/ge/extensions/flowgraph/manager.lua:1396
function flowgraph_manager:deleteSelectionButton() end

---Source : lua/ge/extensions/flowgraph/manager.lua:1062
function flowgraph_manager:deletionWorkflow() end

---Source : lua/ge/extensions/flowgraph/manager.lua:2162
function flowgraph_manager:destroy() end

---Source : lua/ge/extensions/flowgraph/manager.lua:21
function flowgraph_manager:detached() end

---Source : lua/ge/extensions/flowgraph/manager.lua:1169
---@param payloadType any
---@param data any
function flowgraph_manager:dragDropSource(payloadType, data) end

---Source : lua/ge/extensions/flowgraph/manager.lua:1158
---@param payloadType any
function flowgraph_manager:dragDropTarget(payloadType) end

---Source : lua/ge/extensions/flowgraph/manager.lua:1423
---@param dtReal any
---@param dtSim any
---@param dtRaw any
function flowgraph_manager:draw(dtReal, dtSim, dtRaw) end

---Source : lua/ge/extensions/flowgraph/manager.lua:1797
---@param serializedMacros any
function flowgraph_manager:findDependencyMap(serializedMacros) end

---Source : lua/ge/extensions/flowgraph/manager.lua:520
---@param graph any
function flowgraph_manager:findIntegratedNode(graph) end

---Source : lua/ge/extensions/flowgraph/manager.lua:1134
---@param hiddenId any
function flowgraph_manager:findLinkIdFromHiddenLinkId(hiddenId) end

---Source : lua/ge/extensions/flowgraph/manager.lua:1787
---@param graph any
---@param list any
function flowgraph_manager:findMacrosUsedInChildren(graph, list) end

---Source : lua/ge/extensions/flowgraph/manager.lua:1429
function flowgraph_manager:getAvailableMacros() end

---Source : lua/ge/extensions/flowgraph/manager.lua:1446
function flowgraph_manager:getAvailableNodeTemplates() end

---Source : lua/ge/extensions/flowgraph/manager.lua:1442
function flowgraph_manager:getAvailableStateTemplates() end

---Source : lua/ge/extensions/flowgraph/manager.lua:1465
function flowgraph_manager:getCustomNodeTemplates() end

---Source : lua/ge/extensions/flowgraph/manager.lua:1961
function flowgraph_manager:getDependencies() end

---Source : lua/ge/extensions/flowgraph/manager.lua:2177
---@param name any
function flowgraph_manager:getGraphByName(name) end

---Source : lua/ge/extensions/flowgraph/manager.lua:80
function flowgraph_manager:getGraphNodeOffset() end

---Source : lua/ge/extensions/flowgraph/manager.lua:1920
function flowgraph_manager:getHooklist() end

---Source : lua/ge/extensions/flowgraph/manager.lua:50
function flowgraph_manager:getNextFreeGraphNodeId() end

---Source : lua/ge/extensions/flowgraph/manager.lua:101
function flowgraph_manager:getNextFreePinLinkId() end

--- do not use ever
---  intentionally unique between all editor instances to prevent possible problems in c++
---Source : lua/ge/extensions/flowgraph/manager.lua:1529
function flowgraph_manager:getNextUniqueIdentifier() end

---Source : lua/ge/extensions/flowgraph/manager.lua:2284
---@param p any
---@param disableLogEntryOnFail any
function flowgraph_manager:getRelativeAbsolutePath(p, disableLogEntryOnFail) end

---Source : lua/ge/extensions/flowgraph/manager.lua:1344
---@param index any
function flowgraph_manager:goToHistory(index) end

---Source : lua/ge/extensions/flowgraph/manager.lua:2213
---@param functionName any
function flowgraph_manager:hasNodeForHook(functionName) end

---Source : lua/ge/extensions/flowgraph/manager.lua:1374
---@param title any
function flowgraph_manager:historySnapshot(title) end

---Source : lua/ge/extensions/flowgraph/manager.lua:126
---@param parent any
function flowgraph_manager:init(parent) end

---Source : lua/ge/extensions/flowgraph/manager.lua:1898
---@param name any
---@param type any
---@param description any
---@param meta any
function flowgraph_manager:logEvent(name, type, description, meta) end

---Source : lua/ge/extensions/flowgraph/manager.lua:2277
function flowgraph_manager:onClientEndMission() end

---Source : lua/ge/extensions/flowgraph/manager.lua:1147
function flowgraph_manager:onDrag() end

---Source : lua/ge/extensions/flowgraph/manager.lua:1153
function flowgraph_manager:onDragEnded() end

---Source : lua/ge/extensions/flowgraph/manager.lua:1143
function flowgraph_manager:onDragStarted() end

---Source : lua/ge/extensions/flowgraph/manager.lua:1882
---@param dtReal any
---@param dtSim any
---@param dtRaw any
function flowgraph_manager:onUpdate(dtReal, dtSim, dtRaw) end

---Source : lua/ge/extensions/flowgraph/manager.lua:1238
function flowgraph_manager:pasteNodes() end

---Source : lua/ge/extensions/flowgraph/manager.lua:2102
function flowgraph_manager:queueForRestart() end

---Source : lua/ge/extensions/flowgraph/manager.lua:1364
function flowgraph_manager:redo() end

---Source : lua/ge/extensions/flowgraph/manager.lua:395
---@param node any
function flowgraph_manager:refreshIntegratedPins(node) end

---Source : lua/ge/extensions/flowgraph/manager.lua:1858
function flowgraph_manager:resolveHooksAndReset() end

---Source : lua/ge/extensions/flowgraph/manager.lua:2186
function flowgraph_manager:resolveVariableChanges() end

---Source : lua/ge/extensions/flowgraph/manager.lua:608
---@param macro any
---@param savedata any
function flowgraph_manager:saveMacro(macro, savedata) end

---Source : lua/ge/extensions/flowgraph/manager.lua:303
---@param graph any
function flowgraph_manager:selectGraph(graph) end

---Source : lua/ge/extensions/flowgraph/manager.lua:2094
---@param paused any
function flowgraph_manager:setPaused(paused) end

---Source : lua/ge/extensions/flowgraph/manager.lua:2027
---@param running any
---@param stopInstant any
function flowgraph_manager:setRunning(running, stopInstant) end

---Source : lua/ge/extensions/flowgraph/manager.lua:837
function flowgraph_manager:setupCreationWorkflow() end

---Source : lua/ge/extensions/flowgraph/manager.lua:233
---@param empty any
function flowgraph_manager:setupStateGraph(empty) end

---Source : lua/ge/extensions/flowgraph/manager.lua:1354
function flowgraph_manager:undo() end

---Source : lua/ge/extensions/flowgraph/manager.lua:1088
function flowgraph_manager:unselectAll() end

---Source : lua/ge/extensions/flowgraph/manager.lua:1759
---@param force any
function flowgraph_manager:updateEditorPosition(force) end

--- updates the nodes/links table with the item that are selected in the C++ side of things
---Source : lua/ge/extensions/flowgraph/manager.lua:1100
function flowgraph_manager:updateEditorSelections() end

---Source : lua/ge/extensions/flowgraph/manager.lua:551
---@param macro any
function flowgraph_manager:updateInstances(macro) end

---Source : lua/ge/extensions/flowgraph/manager.lua:1776
function flowgraph_manager:updateNodePositions() end

---Source : lua/ge/extensions/flowgraph/manager.lua:537
---@param graph any
function flowgraph_manager:updateSubgraphs(graph) end

