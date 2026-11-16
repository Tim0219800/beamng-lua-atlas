# `flowgraph_baseStateNode`

*File: `lua/ge/extensions/flowgraph/baseStateNode.lua` · VM: Game Engine (GE) · 96 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `flowgraph_baseStateNode`: `extensions.load("flowgraph_baseStateNode")`, then the global `flowgraph_baseStateNode`

Base class of the nodes of a flowgraph state graph. It extends flowgraph/basenode by adding eight "transition" pins on the node's edges (inputs and outputs N, E, S, W) and drawing them in the editor. A modder does not call it directly: it is used by state nodes.

## Notes

- The created pins are named tInN/tInE/tInS/tInW and tOutN/tOutE/tOutS/tOutW, of type 'transition'.
- Input pins are drawn with an arrow (PinArrowSize/Width = 20) and a LinkStrength of 0; output pins have no arrow.
- M.createBase copies the methods of C directly into the object (o[k] = v): C:init therefore replaces basenode's init. basenode's init is indeed called first by basenode.createBase, but C:init(mgr) is then called with the same arguments and uses self.graph, which is already defined.

## Functions

| Function | Description | Line |
|---|---|---|
| `flowgraph_baseStateNode.createBase(...)` | Creates a basenode node, copies the state class methods (init, customDrawEnd, drawTransitionPin) onto it, then calls init(...). *(internal)* | 67 |
| `flowgraph_baseStateNode.use(mgr, graph, forceId, derivedClass)` | Creates a state node, applies derivedClass on top, then runs _preInit, init (if redefined) and _postInit like basenode.use. *(internal)* | 80 |

### Parameter details

#### `flowgraph_baseStateNode.createBase(...)`

Creates a basenode node, copies the state class methods (init, customDrawEnd, drawTransitionPin) onto it, then calls init(...).

- `...` (*any*) : arguments of basenode.createBase: mgr, graph, forceId
- **returns**: table state node

#### `flowgraph_baseStateNode.use(mgr, graph, forceId, derivedClass)`

Creates a state node, applies derivedClass on top, then runs _preInit, init (if redefined) and _postInit like basenode.use.

- `mgr` (*table*) : flowgraph manager
- `graph` (*table*) : graph that contains the node
- `forceId` (*integer|nil*) : forced identifier, otherwise the manager assigns one
- `derivedClass` (*table*) : methods/fields of the concrete node type
- **returns**: table initialized node

## Class `C`

Methods added to state nodes.

| Method | Description | Line |
|---|---|---|
| `C:customDrawEnd(builder)` | Called by the builder at the end of node drawing (builder:End). Draws the 8 transition pins along the edges of the node rectangle (inputs on the counterclockwise sides, outputs on the clockwise sides). | 35 |
| `C:drawTransitionPin(pin, kind, pos, size)` | Draws a rectangular transition pin at the given position with ui_flowgraph_editor (BeginPin, PinRect, PinPivotRect, EndPin) and stores pin.imPos. | 10 |
| `C:init(mgr)` | Creates the 8 transition pins (4 inputs, 4 outputs: N, E, S, W) via flowgraph/pin and stores them in self.transitionPins._in and ._out. | 23 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/baseStateNode.lua`.*
