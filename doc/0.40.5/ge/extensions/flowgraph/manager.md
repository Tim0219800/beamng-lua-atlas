# `flowgraph_manager`

*Fichier : `lua/ge/extensions/flowgraph/manager.lua` · VM : Game Engine (GE) · 2333 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/manager")` (fichier sous extensions/ mais pas une extension classique)

## Classe `C`

Le module renvoie un constructeur : `local obj = require("flowgraph_manager")(options)`.

| Méthode | Description | Ligne |
|---|---|---|
| `C:DrawTypeIcon(dataType, connected, alpha, typeIconSize, innercolor)` |  | 1030 |
| `C:_executionStarted()` |  | 2106 |
| `C:_executionStopped()` |  | 2132 |
| `C:_onClear()` |  | 2120 |
| `C:_onDeserialized(data)` |  | 1599 |
| `C:_onSerialize()` |  | 1533 |
| `C:allNodes()` |  | 2265 |
| `C:attach(fgEditor)` |  | 16 |
| `C:autoGraphNodeOffset()` |  | 84 |
| `C:blocksOnResetGameplay()` |  | 2249 |
| `C:broadcastCall(functionName, ...)` |  | 2193 |
| `C:broadcastCallReturn(functionName, ...)` |  | 2202 |
| `C:checkCompileWarnings()` |  | 1989 |
| `C:checkDuplicateId(id)` |  | 28 |
| `C:clearGraph(graph)` |  | 1504 |
| `C:convertToMacro(graph)` |  | 356 |
| `C:copyGraph(oldGraph, newName, hidden)` |  | 342 |
| `C:copyNodes()` |  | 1193 |
| `C:createGraph(name, hidden, forceId)` |  | 333 |
| `C:createGraphAsState(name, isStateGraph)` |  | 257 |
| `C:createGroupState(name)` |  | 269 |
| `C:createInstanceFromMacro(macro, node, forceId)` |  | 691 |
| `C:createMacroInstanceFromPath(path, node)` |  | 725 |
| `C:createNewMacroNode(path)` |  | 684 |
| `C:createStateFromLibrary(data)` |  | 286 |
| `C:createSubgraphFromMacroInstance()` |  | 1849 |
| `C:createSubgraphFromSelection()` |  | 1853 |
| `C:creationWorkflow()` |  | 891 |
| `C:deleteGraph(graph)` |  | 784 |
| `C:deleteGraphs()` |  | 1517 |
| `C:deleteSelection()` |  | 1404 |
| `C:deleteSelectionButton()` |  | 1396 |
| `C:deletionWorkflow()` |  | 1062 |
| `C:destroy()` |  | 2162 |
| `C:detached()` |  | 21 |
| `C:dragDropSource(payloadType, data)` |  | 1169 |
| `C:dragDropTarget(payloadType)` |  | 1158 |
| `C:draw(dtReal, dtSim, dtRaw)` |  | 1423 |
| `C:findDependencyMap(serializedMacros)` |  | 1797 |
| `C:findIntegratedNode(graph)` |  | 520 |
| `C:findLinkIdFromHiddenLinkId(hiddenId)` |  | 1134 |
| `C:findMacrosUsedInChildren(graph, list)` |  | 1787 |
| `C:getAvailableMacros()` |  | 1429 |
| `C:getAvailableNodeTemplates()` |  | 1446 |
| `C:getAvailableStateTemplates()` |  | 1442 |
| `C:getCustomNodeTemplates()` |  | 1465 |
| `C:getDependencies()` |  | 1961 |
| `C:getGraphByName(name)` |  | 2177 |
| `C:getGraphNodeOffset()` |  | 80 |
| `C:getHooklist()` |  | 1920 |
| `C:getNextFreeGraphNodeId()` |  | 50 |
| `C:getNextFreePinLinkId()` |  | 101 |
| `C:getNextUniqueIdentifier()` | do not use ever<br> intentionally unique between all editor instances to prevent possible problems in c++ | 1529 |
| `C:getRelativeAbsolutePath(p, disableLogEntryOnFail)` |  | 2284 |
| `C:goToHistory(index)` |  | 1344 |
| `C:hasNodeForHook(functionName)` |  | 2213 |
| `C:historySnapshot(title)` |  | 1374 |
| `C:init(parent)` |  | 126 |
| `C:logEvent(name, type, description, meta)` |  | 1898 |
| `C:onClientEndMission()` |  | 2277 |
| `C:onDrag()` |  | 1147 |
| `C:onDragEnded()` |  | 1153 |
| `C:onDragStarted()` |  | 1143 |
| `C:onUpdate(dtReal, dtSim, dtRaw)` |  | 1882 |
| `C:pasteNodes()` |  | 1238 |
| `C:queueForRestart()` |  | 2102 |
| `C:redo()` |  | 1364 |
| `C:refreshIntegratedPins(node)` |  | 395 |
| `C:resolveHooksAndReset()` |  | 1858 |
| `C:resolveVariableChanges()` |  | 2186 |
| `C:saveMacro(macro, savedata)` |  | 608 |
| `C:selectGraph(graph)` |  | 303 |
| `C:setPaused(paused)` |  | 2094 |
| `C:setRunning(running, stopInstant)` |  | 2027 |
| `C:setupCreationWorkflow()` |  | 837 |
| `C:setupStateGraph(empty)` |  | 233 |
| `C:undo()` |  | 1354 |
| `C:unselectAll()` |  | 1088 |
| `C:updateEditorPosition(force)` |  | 1759 |
| `C:updateEditorSelections()` | updates the nodes/links table with the item that are selected in the C++ side of things | 1100 |
| `C:updateInstances(macro)` |  | 551 |
| `C:updateNodePositions()` |  | 1776 |
| `C:updateSubgraphs(graph)` |  | 537 |

## Appels vers le moteur (C++)

- `FS:` `fileExists`, `findFiles`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/manager.lua`.*
