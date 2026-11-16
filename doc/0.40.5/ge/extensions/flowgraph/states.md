# `flowgraph_states`

*File: `lua/ge/extensions/flowgraph/states.lua` · VM: Game Engine (GE) · 591 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/states")` (file under extensions/ but not a regular extension)

State management ("state machine") for a flowgraph project based on state graphs (`states/stateNode`, `states/stateEntry`, `states/stateExit` nodes and state groups). The module returns a constructor: `require('flowgraph_states')(mgr)`. It flattens the hierarchy of state graphs into direct links between states (`buildStates`), creates for each state an extension proxy that only receives hooks while the state is active, queues the transitions requested by nodes and resolves them at the end of the frame (`resolveTransitions`, via a `_StateResolver` proxy on `onUpdate`).

## Notes

- Cycle: `buildStates` → `startAutoStartStates` → while running, `transition(...)` queues → `resolveTransitions` (in `onUpdate`) stops the source states, starts the targets, merges transition data into `transitionStack`.
- A state reaching a root `stateExit` stops the project (`mgr:setRunning(false)`), unless another state starts in the same frame.
- A direct link between `stateEntry` and `stateExit` makes the group invalid and it is ignored (E log).
- Bug: `resolveTransitions` calls `self:startState(id, transData)` while `transData` is not defined anywhere (nil global); transition data is therefore not passed to the activity's `onFlowgraphStateStarted` callback.
- Bug: `getStateNode(id)` returns `self.states[id].node`, a field never set by `addStateFromPortedNode`: always returns nil.
- Bug: in `addStateFromPortedNode`, if `node.targetGraph` is nil, the code then calls `node.targetGraph:plan()` (error).
- `getStateNodeByNode` is deprecated (error log, returns nothing).
- `table.sort(transitions)` in `getTransitions` has no effect (table with string keys).

## Class `C`

State manager of a flowgraph project. Fields: mgr, states (node id -> state {id, depth, graph, name, autoStart, extProxy, active, ports, transitionStack, extHooks, extDeps}), queuedTransitions, hookExists, resolveExtProxy, stateGraph.

The module returns a constructor: `local obj = require("flowgraph_states")(options)`.

| Method | Description | Line |
|---|---|---|
| `C:addStateFromPortedNode(pnode)` | Creates a state from a node with ports: dedicated extension proxy, collects the hooks and dependencies of the target graph (`getRecursiveHooksAndDependencies`), records the existing `onXxx` hooks in `hookExists`. | 64 |
| `C:broadcastCall(functionName, ...)` | Calls the `functionName` hook on the proxy of every state that has it. | 560 |
| `C:broadcastCallReturn(functionName, results, ...)` | Like `broadcastCall`, but passes the `results` table as first argument so the states can put results in it. | 568 |
| `C:buildPortsAndStarts(nodes, links)` | Fills in each node's ports (transition name -> targets, stop depth, project stop) and marks the starting states (connected to the root nodes). | 347 |
| `C:buildStates()` | Builds all the project's states (collection, flattening, ports) and the `_StateResolver` proxy that resolves transitions on every `onUpdate` while the project is running. | 385 |
| `C:clear()` | Destroys the resolver proxy and all the states' extension proxies, refreshes the dependencies of `core_flowgraphManager` and empties `states` and `hookExists`. | 21 |
| `C:destroy()` | Destroys the manager (calls `clear`). | 17 |
| `C:findStateNodeInStateGraph(targetGraphId)` | Searches the root state graph for the `states/stateNode` node whose target graph has the given id. | 440 |
| `C:findStateNodeInStateGraphRecursive(graph, id)` | Recursive version of the search, on a graph and its children. | 444 |
| `C:gatherNodesAndLinks()` | Clears the state then recursively walks the root state graph to list nodes, links and groups. | 159 |
| `C:gatherNodesAndLinksRecursion(graph, nodes, links, group, depth)` | Recursive walk of a graph: skips comments, marks connectors (groups, entry/exit), roots and links to shorten; skips an invalid group (entry connected directly to an exit). | 167 |
| `C:getStateIdForNode(node)` | Returns the id of the state whose graph is the root graph of the given node, or -1. | 424 |
| `C:getStateIdsForDepth(depth)` | Returns the ids of the states contained in the group matching the given depth (last id of the list). | 547 |
| `C:getStateNode(id)` | Supposed to return a state's node; returns `states[id].node`, a field never set (always nil). | 431 |
| `C:getStateNodeByNode(node)` | Deprecated: logs an error and returns nothing. | 435 |
| `C:getTransitionStack(id)` | Returns a state's transition data stack (empty table if unknown). | 420 |
| `C:getTransitions(node)` | For a state node, groups the outgoing links of its graph by transition name (name of the source pin): {name -> [{targetName, link}]}. | 48 |
| `C:hasNodeForHook(functionName)` | Tells whether at least one node of a state has a method matching this hook (`onXxx`). | 577 |
| `C:init(mgr)` | Constructor: stores the manager and initializes the tables. | 9 |
| `C:isRunning(id)` | Tells whether the state is active. | 581 |
| `C:resolveInterHops(nodes, links, group)` | Flattens the links that cross connectors (state groups, entries/exits) into direct virtual links between real states. | 247 |
| `C:resolveTransitions()` | Resolves all queued transitions: determines the states to stop and start, applies group stop depths, updates the `transitionStack`s, stops the project if a final state is reached with no other start, then empties the queue. Called on every `onUpdate` while the project is running. | 466 |
| `C:startAutoStartStates()` | Starts all states marked `autoStart` (those connected to the root entry). | 109 |
| `C:startState(id, transData)` | Activates a state: connects its proxy to the hooks and dependencies, calls the proxy's `onStateStarted` and `onStateStartedTrigger`, then `activity:onFlowgraphStateStarted(name, state, transData)` if the project is linked to an activity. | 117 |
| `C:stopState(id)` | Deactivates a state: calls `onStateStopped`, `onStateStoppedTrigger`, `activity:onFlowgraphStateStopped`, then disconnects its proxy. | 138 |
| `C:transition(sourceStateId, transitionName, transitionData, sourceNode)` | Queues a transition that will be resolved at the end of the frame; records it in the manager's events. | 458 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/states.lua`.*
