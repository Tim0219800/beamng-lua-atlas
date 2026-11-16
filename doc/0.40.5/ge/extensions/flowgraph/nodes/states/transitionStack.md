# `flowgraph_nodes_states_transitionStack`

*File: `lua/ge/extensions/flowgraph/nodes/states/transitionStack.lua` · VM: Game Engine (GE) · 111 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/states/transitionStack")` (file under extensions/ but not a regular extension)

Stategraph node "Get Transition Variables". Reads the variables passed by the "Transition" node of the previous state (transitionStack of the started state) and exposes them on its custom output pins; the input flow is copied to the output.

## Notes

- work also overwrites pinOut.flow with nil via the loop (self._stack['flow']) before rewriting it at the end: harmless.

## Class `C`

Flowgraph node class (returned by _flowgraph_createNode(C)). The methods are called by the flowgraph manager or the editor.

| Method | Description | Line |
|---|---|---|
| `C:_executionStopped()` | Forgets the stack on stop. | 47 |
| `C:drawCustomProperties()` | Prepares the pin templates if needed. | 90 |
| `C:drawMiddle(builder, style)` | Draws the central content of the node in the editor. | 98 |
| `C:hideProperties()` | Frees the pin template cache. | 94 |
| `C:init()` | savePins = true, allowCustomOutPins = true. | 37 |
| `C:makePinTemplates()` | Builds the pin templates like the transition node. | 60 |
| `C:onStateStarted(state)` | Hook: on entering the state, stores state.transitionStack. | 42 |
| `C:work()` | Copies _stack[name] to each output pin and copies flow. | 51 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/states/transitionStack.lua`.*
