# `flowgraph_graph`

*Fichier : `lua/ge/extensions/flowgraph/graph.lua` · VM : Game Engine (GE) · 1527 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/graph")` (fichier sous extensions/ mais pas une extension classique)

## Classe `C`

Le module renvoie un constructeur : `local obj = require("flowgraph_graph")(options)`.

| Méthode | Description | Ligne |
|---|---|---|
| `C:_executionStarted()` |  | 1266 |
| `C:_executionStopped()` |  | 1281 |
| `C:_onClear()` |  | 1274 |
| `C:_onDeserialized(data)` |  | 1031 |
| `C:_onSerialize()` |  | 952 |
| `C:_printStructure(depth)` |  | 1378 |
| `C:canCreateLink(a, b, newLinkInfo)` |  | 1229 |
| `C:clear()` |  | 789 |
| `C:clearVariableChangesChildren()` |  | 77 |
| `C:createLink(startPin, endPin, ...)` |  | 913 |
| `C:createNode(nodeType, forceId, ...)` |  | 818 |
| `C:deleteLink(link)` |  | 919 |
| `C:deleteNode(node, ignoreIntegratedNodes)` |  | 874 |
| `C:findNodeInChildren(id)` |  | 1347 |
| `C:findNodeRecursive(id)` |  | 1350 |
| `C:findPin(pinId)` |  | 1249 |
| `C:forceRecursiveNodeUpdatePosition()` |  | 1365 |
| `C:gatherNodesAndLinks(rNodes, rLinks, interInfo)` |  | 127 |
| `C:getChildPosition()` |  | 1315 |
| `C:getChildren()` |  | 65 |
| `C:getChildrenWithStates()` |  | 1427 |
| `C:getDeepChild(indexes)` |  | 1326 |
| `C:getDirtyChildren(dirtyChildren)` |  | 92 |
| `C:getInstanceRoot()` |  | 1304 |
| `C:getLocation(withIds)` |  | 1472 |
| `C:getMacro()` |  | 1290 |
| `C:getParent()` |  | 58 |
| `C:getParentWithStates()` |  | 1405 |
| `C:getRecursiveHooksAndDependencies(hooks, deps)` |  | 1334 |
| `C:getRootGraph()` |  | 84 |
| `C:getSiblings()` |  | 1441 |
| `C:hasLink(pin)` |  | 1171 |
| `C:init(mgr, name, forceId)` |  | 18 |
| `C:linkExists(startPin, endPin)` |  | 1162 |
| `C:moveNodeToGraph(node, newGraph)` |  | 863 |
| `C:pinsCompatible(sourcePin, targetPin)` |  | 1180 |
| `C:plan()` |  | 266 |
| `C:printStructure()` |  | 1390 |
| `C:resolveInterHops(rLinks, interInfo)` |  | 192 |
| `C:setDirty(dirty, startFromRoot)` |  | 109 |
| `C:toString()` |  | 1374 |
| `C:updateChildrenTypes(t, ignoreType)` |  | 1256 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/graph.lua`.*
