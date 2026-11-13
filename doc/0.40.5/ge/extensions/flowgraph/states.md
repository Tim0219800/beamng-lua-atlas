# `flowgraph_states`

*Fichier : `lua/ge/extensions/flowgraph/states.lua` · VM : Game Engine (GE) · 591 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/states")` (fichier sous extensions/ mais pas une extension classique)

## Classe `C`

Le module renvoie un constructeur : `local obj = require("flowgraph_states")(options)`.

| Méthode | Description | Ligne |
|---|---|---|
| `C:addStateFromPortedNode(pnode)` | adds a state to this states list. states always are based on a graph. | 64 |
| `C:broadcastCall(functionName, ...)` |  | 560 |
| `C:broadcastCallReturn(functionName, results, ...)` |  | 568 |
| `C:buildPortsAndStarts(nodes, links)` |  | 347 |
| `C:buildStates()` |  | 385 |
| `C:clear()` |  | 21 |
| `C:destroy()` |  | 17 |
| `C:findStateNodeInStateGraph(targetGraphId)` |  | 440 |
| `C:findStateNodeInStateGraphRecursive(graph, id)` |  | 444 |
| `C:gatherNodesAndLinks()` |  | 159 |
| `C:gatherNodesAndLinksRecursion(graph, nodes, links, group, depth)` |  | 167 |
| `C:getStateIdForNode(node)` |  | 424 |
| `C:getStateIdsForDepth(depth)` |  | 547 |
| `C:getStateNode(id)` |  | 431 |
| `C:getStateNodeByNode(node)` |  | 435 |
| `C:getTransitionStack(id)` |  | 420 |
| `C:getTransitions(node)` |  | 48 |
| `C:hasNodeForHook(functionName)` |  | 577 |
| `C:init(mgr)` |  | 9 |
| `C:isRunning(id)` |  | 581 |
| `C:resolveInterHops(nodes, links, group)` |  | 247 |
| `C:resolveTransitions()` |  | 466 |
| `C:startAutoStartStates()` |  | 109 |
| `C:startState(id, transData)` |  | 117 |
| `C:stopState(id)` |  | 138 |
| `C:transition(sourceStateId, transitionName, transitionData, sourceNode)` | queues a transition that will be resolved at the end of the frame. | 458 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/states.lua`.*
