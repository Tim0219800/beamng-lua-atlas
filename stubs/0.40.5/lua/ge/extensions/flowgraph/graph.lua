---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/graph.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe locale `C` de lua/ge/extensions/flowgraph/graph.lua (instanciée par la fonction renvoyée par le module)
---@class flowgraph_graph
local flowgraph_graph = {}

---Source : lua/ge/extensions/flowgraph/graph.lua:1266
function flowgraph_graph:_executionStarted() end

---Source : lua/ge/extensions/flowgraph/graph.lua:1281
function flowgraph_graph:_executionStopped() end

---Source : lua/ge/extensions/flowgraph/graph.lua:1274
function flowgraph_graph:_onClear() end

---Source : lua/ge/extensions/flowgraph/graph.lua:1031
---@param data any
function flowgraph_graph:_onDeserialized(data) end

---Source : lua/ge/extensions/flowgraph/graph.lua:952
function flowgraph_graph:_onSerialize() end

---Source : lua/ge/extensions/flowgraph/graph.lua:1378
---@param depth any
function flowgraph_graph:_printStructure(depth) end

---Source : lua/ge/extensions/flowgraph/graph.lua:1229
---@param a any
---@param b any
---@param newLinkInfo any
function flowgraph_graph:canCreateLink(a, b, newLinkInfo) end

---Source : lua/ge/extensions/flowgraph/graph.lua:789
function flowgraph_graph:clear() end

---Source : lua/ge/extensions/flowgraph/graph.lua:77
function flowgraph_graph:clearVariableChangesChildren() end

---Source : lua/ge/extensions/flowgraph/graph.lua:913
---@param startPin any
---@param endPin any
---@param ... any
function flowgraph_graph:createLink(startPin, endPin, ...) end

---Source : lua/ge/extensions/flowgraph/graph.lua:818
---@param nodeType any
---@param forceId any
---@param ... any
function flowgraph_graph:createNode(nodeType, forceId, ...) end

---Source : lua/ge/extensions/flowgraph/graph.lua:919
---@param link any
function flowgraph_graph:deleteLink(link) end

---Source : lua/ge/extensions/flowgraph/graph.lua:874
---@param node any
---@param ignoreIntegratedNodes any
function flowgraph_graph:deleteNode(node, ignoreIntegratedNodes) end

---Source : lua/ge/extensions/flowgraph/graph.lua:1347
---@param id any
function flowgraph_graph:findNodeInChildren(id) end

---Source : lua/ge/extensions/flowgraph/graph.lua:1350
---@param id any
function flowgraph_graph:findNodeRecursive(id) end

---Source : lua/ge/extensions/flowgraph/graph.lua:1249
---@param pinId any
function flowgraph_graph:findPin(pinId) end

---Source : lua/ge/extensions/flowgraph/graph.lua:1365
function flowgraph_graph:forceRecursiveNodeUpdatePosition() end

---Source : lua/ge/extensions/flowgraph/graph.lua:127
---@param rNodes any
---@param rLinks any
---@param interInfo any
function flowgraph_graph:gatherNodesAndLinks(rNodes, rLinks, interInfo) end

---Source : lua/ge/extensions/flowgraph/graph.lua:1315
function flowgraph_graph:getChildPosition() end

---Source : lua/ge/extensions/flowgraph/graph.lua:65
function flowgraph_graph:getChildren() end

---Source : lua/ge/extensions/flowgraph/graph.lua:1427
function flowgraph_graph:getChildrenWithStates() end

---Source : lua/ge/extensions/flowgraph/graph.lua:1326
---@param indexes any
function flowgraph_graph:getDeepChild(indexes) end

---Source : lua/ge/extensions/flowgraph/graph.lua:92
---@param dirtyChildren any
function flowgraph_graph:getDirtyChildren(dirtyChildren) end

---Source : lua/ge/extensions/flowgraph/graph.lua:1304
function flowgraph_graph:getInstanceRoot() end

---Source : lua/ge/extensions/flowgraph/graph.lua:1472
---@param withIds any
function flowgraph_graph:getLocation(withIds) end

---Source : lua/ge/extensions/flowgraph/graph.lua:1290
function flowgraph_graph:getMacro() end

---Source : lua/ge/extensions/flowgraph/graph.lua:58
function flowgraph_graph:getParent() end

---Source : lua/ge/extensions/flowgraph/graph.lua:1405
function flowgraph_graph:getParentWithStates() end

---Source : lua/ge/extensions/flowgraph/graph.lua:1334
---@param hooks any
---@param deps any
function flowgraph_graph:getRecursiveHooksAndDependencies(hooks, deps) end

---Source : lua/ge/extensions/flowgraph/graph.lua:84
function flowgraph_graph:getRootGraph() end

---Source : lua/ge/extensions/flowgraph/graph.lua:1441
function flowgraph_graph:getSiblings() end

---Source : lua/ge/extensions/flowgraph/graph.lua:1171
---@param pin any
function flowgraph_graph:hasLink(pin) end

---Source : lua/ge/extensions/flowgraph/graph.lua:18
---@param mgr any
---@param name any
---@param forceId any
function flowgraph_graph:init(mgr, name, forceId) end

---Source : lua/ge/extensions/flowgraph/graph.lua:1162
---@param startPin any
---@param endPin any
function flowgraph_graph:linkExists(startPin, endPin) end

---Source : lua/ge/extensions/flowgraph/graph.lua:863
---@param node any
---@param newGraph any
function flowgraph_graph:moveNodeToGraph(node, newGraph) end

---Source : lua/ge/extensions/flowgraph/graph.lua:1180
---@param sourcePin any
---@param targetPin any
function flowgraph_graph:pinsCompatible(sourcePin, targetPin) end

---Source : lua/ge/extensions/flowgraph/graph.lua:266
function flowgraph_graph:plan() end

---Source : lua/ge/extensions/flowgraph/graph.lua:1390
function flowgraph_graph:printStructure() end

---Source : lua/ge/extensions/flowgraph/graph.lua:192
---@param rLinks any
---@param interInfo any
function flowgraph_graph:resolveInterHops(rLinks, interInfo) end

---Source : lua/ge/extensions/flowgraph/graph.lua:109
---@param dirty any
---@param startFromRoot any
function flowgraph_graph:setDirty(dirty, startFromRoot) end

---Source : lua/ge/extensions/flowgraph/graph.lua:1374
function flowgraph_graph:toString() end

---Source : lua/ge/extensions/flowgraph/graph.lua:1256
---@param t any
---@param ignoreType any
function flowgraph_graph:updateChildrenTypes(t, ignoreType) end

