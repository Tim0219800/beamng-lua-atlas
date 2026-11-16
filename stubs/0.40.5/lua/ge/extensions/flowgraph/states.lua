---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/states.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- State manager of a flowgraph project. Fields: mgr, states (node id -> state {id, depth, graph, name, autoStart, extProxy, active, ports, transitionStack, extHooks, extDeps}), queuedTransitions, hookExists, resolveExtProxy, stateGraph.
---@class flowgraph_states
local flowgraph_states = {}

--- Creates a state from a node with ports: dedicated extension proxy, collects the hooks and dependencies of the target graph (`getRecursiveHooksAndDependencies`), records the existing `onXxx` hooks in `hookExists`.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/states.lua:64
---@param pnode table Item {node, depth, ports, startingState}.
function flowgraph_states:addStateFromPortedNode(pnode) end

--- Calls the `functionName` hook on the proxy of every state that has it.
---Source: lua/ge/extensions/flowgraph/states.lua:560
---@param functionName string Hook name.
---@param ... any Arguments passed to the hook.
function flowgraph_states:broadcastCall(functionName, ...) end

--- Like `broadcastCall`, but passes the `results` table as first argument so the states can put results in it.
---Source: lua/ge/extensions/flowgraph/states.lua:568
---@param functionName string Hook name.
---@param results table Shared results table.
---@param ... any Extra arguments.
function flowgraph_states:broadcastCallReturn(functionName, results, ...) end

--- Fills in each node's ports (transition name -> targets, stop depth, project stop) and marks the starting states (connected to the root nodes).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/states.lua:347
---@param nodes table Nodes.
---@param links table Flattened links.
---@return table  Valid nodes (excluding connectors).
function flowgraph_states:buildPortsAndStarts(nodes, links) end

--- Builds all the project's states (collection, flattening, ports) and the `_StateResolver` proxy that resolves transitions on every `onUpdate` while the project is running.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/states.lua:385
function flowgraph_states:buildStates() end

--- Destroys the resolver proxy and all the states' extension proxies, refreshes the dependencies of `core_flowgraphManager` and empties `states` and `hookExists`.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/states.lua:21
function flowgraph_states:clear() end

--- Destroys the manager (calls `clear`).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/states.lua:17
function flowgraph_states:destroy() end

--- Searches the root state graph for the `states/stateNode` node whose target graph has the given id.
---Source: lua/ge/extensions/flowgraph/states.lua:440
---@param targetGraphId integer Target graph id.
---@return table|nil  Node found.
function flowgraph_states:findStateNodeInStateGraph(targetGraphId) end

--- Recursive version of the search, on a graph and its children.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/states.lua:444
---@param graph table Graph to search in.
---@param id integer Target graph id.
---@return table|nil  Node found.
function flowgraph_states:findStateNodeInStateGraphRecursive(graph, id) end

--- Clears the state then recursively walks the root state graph to list nodes, links and groups.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/states.lua:159
---@return table  nodes.
---@return table  links.
---@return table  group (state groups).
function flowgraph_states:gatherNodesAndLinks() end

--- Recursive walk of a graph: skips comments, marks connectors (groups, entry/exit), roots and links to shorten; skips an invalid group (entry connected directly to an exit).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/states.lua:167
---@param graph table Current graph.
---@param nodes table Output table of nodes.
---@param links table Output list of links.
---@param group table Table of groups.
---@param depth table List of parent graph ids.
function flowgraph_states:gatherNodesAndLinksRecursion(graph, nodes, links, group, depth) end

--- Returns the id of the state whose graph is the root graph of the given node, or -1.
---Source: lua/ge/extensions/flowgraph/states.lua:424
---@param node table Any node.
---@return integer  State id or -1.
function flowgraph_states:getStateIdForNode(node) end

--- Returns the ids of the states contained in the group matching the given depth (last id of the list).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/states.lua:547
---@param depth table List of graph ids.
---@return integer[]  State ids.
function flowgraph_states:getStateIdsForDepth(depth) end

--- Supposed to return a state's node; returns `states[id].node`, a field never set (always nil).
---Source: lua/ge/extensions/flowgraph/states.lua:431
---@param id integer State id.
---@return table|nil  Always nil in the current code.
function flowgraph_states:getStateNode(id) end

--- Deprecated: logs an error and returns nothing.
---Source: lua/ge/extensions/flowgraph/states.lua:435
---@param node table Node.
function flowgraph_states:getStateNodeByNode(node) end

--- Returns a state's transition data stack (empty table if unknown).
---Source: lua/ge/extensions/flowgraph/states.lua:420
---@param id integer State id.
---@return table  transitionStack.
function flowgraph_states:getTransitionStack(id) end

--- For a state node, groups the outgoing links of its graph by transition name (name of the source pin): {name -> [{targetName, link}]}.
---Source: lua/ge/extensions/flowgraph/states.lua:48
---@param node table State node.
---@return table<string, table[]>  Transitions by name.
function flowgraph_states:getTransitions(node) end

--- Tells whether at least one node of a state has a method matching this hook (`onXxx`).
---Source: lua/ge/extensions/flowgraph/states.lua:577
---@param functionName string Hook name.
---@return boolean|nil  true if it exists.
function flowgraph_states:hasNodeForHook(functionName) end

--- Constructor: stores the manager and initializes the tables.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/states.lua:9
---@param mgr table Flowgraph manager.
function flowgraph_states:init(mgr) end

--- Tells whether the state is active.
---Source: lua/ge/extensions/flowgraph/states.lua:581
---@param id integer State id.
---@return boolean  true if active.
function flowgraph_states:isRunning(id) end

--- Flattens the links that cross connectors (state groups, entries/exits) into direct virtual links between real states.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/states.lua:247
---@param nodes table Collected nodes.
---@param links table Collected links.
---@param group table Groups.
---@return table  List of flattened links.
function flowgraph_states:resolveInterHops(nodes, links, group) end

--- Resolves all queued transitions: determines the states to stop and start, applies group stop depths, updates the `transitionStack`s, stops the project if a final state is reached with no other start, then empties the queue. Called on every `onUpdate` while the project is running.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/states.lua:466
function flowgraph_states:resolveTransitions() end

--- Starts all states marked `autoStart` (those connected to the root entry).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/states.lua:109
function flowgraph_states:startAutoStartStates() end

--- Activates a state: connects its proxy to the hooks and dependencies, calls the proxy's `onStateStarted` and `onStateStartedTrigger`, then `activity:onFlowgraphStateStarted(name, state, transData)` if the project is linked to an activity.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/states.lua:117
---@param id integer State node id.
---@param transData table|nil Transition data (see the bug in the notes).
function flowgraph_states:startState(id, transData) end

--- Deactivates a state: calls `onStateStopped`, `onStateStoppedTrigger`, `activity:onFlowgraphStateStopped`, then disconnects its proxy.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/states.lua:138
---@param id integer State id.
function flowgraph_states:stopState(id) end

--- Queues a transition that will be resolved at the end of the frame; records it in the manager's events.
---Source: lua/ge/extensions/flowgraph/states.lua:458
---@param sourceStateId integer Source state id.
---@param transitionName string Name of the pin/transition to follow.
---@param transitionData table|nil Data added to the target's transition stack.
---@param sourceNode table|nil Originating node, for the log.
function flowgraph_states:transition(sourceStateId, transitionName, transitionData, sourceNode) end

