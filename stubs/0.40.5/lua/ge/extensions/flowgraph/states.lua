---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/states.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe locale `C` de lua/ge/extensions/flowgraph/states.lua (instanciée par la fonction renvoyée par le module)
---@class flowgraph_states
local flowgraph_states = {}

--- adds a state to this states list. states always are based on a graph.
---Source : lua/ge/extensions/flowgraph/states.lua:64
---@param pnode any
function flowgraph_states:addStateFromPortedNode(pnode) end

---Source : lua/ge/extensions/flowgraph/states.lua:560
---@param functionName any
---@param ... any
function flowgraph_states:broadcastCall(functionName, ...) end

---Source : lua/ge/extensions/flowgraph/states.lua:568
---@param functionName any
---@param results any
---@param ... any
function flowgraph_states:broadcastCallReturn(functionName, results, ...) end

---Source : lua/ge/extensions/flowgraph/states.lua:347
---@param nodes any
---@param links any
function flowgraph_states:buildPortsAndStarts(nodes, links) end

---Source : lua/ge/extensions/flowgraph/states.lua:385
function flowgraph_states:buildStates() end

---Source : lua/ge/extensions/flowgraph/states.lua:21
function flowgraph_states:clear() end

---Source : lua/ge/extensions/flowgraph/states.lua:17
function flowgraph_states:destroy() end

---Source : lua/ge/extensions/flowgraph/states.lua:440
---@param targetGraphId any
function flowgraph_states:findStateNodeInStateGraph(targetGraphId) end

---Source : lua/ge/extensions/flowgraph/states.lua:444
---@param graph any
---@param id any
function flowgraph_states:findStateNodeInStateGraphRecursive(graph, id) end

---Source : lua/ge/extensions/flowgraph/states.lua:159
function flowgraph_states:gatherNodesAndLinks() end

---Source : lua/ge/extensions/flowgraph/states.lua:167
---@param graph any
---@param nodes any
---@param links any
---@param group any
---@param depth any
function flowgraph_states:gatherNodesAndLinksRecursion(graph, nodes, links, group, depth) end

---Source : lua/ge/extensions/flowgraph/states.lua:424
---@param node any
function flowgraph_states:getStateIdForNode(node) end

---Source : lua/ge/extensions/flowgraph/states.lua:547
---@param depth any
function flowgraph_states:getStateIdsForDepth(depth) end

---Source : lua/ge/extensions/flowgraph/states.lua:431
---@param id any
function flowgraph_states:getStateNode(id) end

---Source : lua/ge/extensions/flowgraph/states.lua:435
---@param node any
function flowgraph_states:getStateNodeByNode(node) end

---Source : lua/ge/extensions/flowgraph/states.lua:420
---@param id any
function flowgraph_states:getTransitionStack(id) end

---Source : lua/ge/extensions/flowgraph/states.lua:48
---@param node any
function flowgraph_states:getTransitions(node) end

---Source : lua/ge/extensions/flowgraph/states.lua:577
---@param functionName any
function flowgraph_states:hasNodeForHook(functionName) end

---Source : lua/ge/extensions/flowgraph/states.lua:9
---@param mgr any
function flowgraph_states:init(mgr) end

---Source : lua/ge/extensions/flowgraph/states.lua:581
---@param id any
function flowgraph_states:isRunning(id) end

---Source : lua/ge/extensions/flowgraph/states.lua:247
---@param nodes any
---@param links any
---@param group any
function flowgraph_states:resolveInterHops(nodes, links, group) end

---Source : lua/ge/extensions/flowgraph/states.lua:466
function flowgraph_states:resolveTransitions() end

---Source : lua/ge/extensions/flowgraph/states.lua:109
function flowgraph_states:startAutoStartStates() end

---Source : lua/ge/extensions/flowgraph/states.lua:117
---@param id any
---@param transData any
function flowgraph_states:startState(id, transData) end

---Source : lua/ge/extensions/flowgraph/states.lua:138
---@param id any
function flowgraph_states:stopState(id) end

--- queues a transition that will be resolved at the end of the frame.
---Source : lua/ge/extensions/flowgraph/states.lua:458
---@param sourceStateId any
---@param transitionName any
---@param transitionData any
---@param sourceNode any
function flowgraph_states:transition(sourceStateId, transitionName, transitionData, sourceNode) end

