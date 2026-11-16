# `flowgraph_link`

*File: `lua/ge/extensions/flowgraph/link.lua` · VM: Game Engine (GE) · 292 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/link")` (file under extensions/ but not a regular extension)

Flowgraph 'link' class: a link between an output pin (sourcePin) and an input pin (targetPin) of two nodes of a graph. On creation, it registers itself in graph.links, writes the source pin into targetNode.pinIn, maintains the multiple-flow list (_mInFlow) for flow pins, notifies pins and nodes (_onLink) and picks its color from the pin type. It also draws the link in the editor (imgui / ui_flowgraph_editor). The module returns a constructor: require('/lua/ge/extensions/flowgraph/link')(graph, sourcePin, targetPin).

## Notes

- A link has two ids: id and hiddenId (used for highlighting), both requested from mgr:getNextFreePinLinkId().
- Compact serialization: {source node id, source pin name, target node id, target pin name, hidden}.
- A 'state' → 'state' link is drawn between the transition pins (N/S/E/W) according to the relative position of the nodes, with a label showing the source pin name.
- convertToQuickAccess replaces the links from the same source pin with a quick access (quickAccess + unique accessName, numeric suffix if the name exists) then deletes the selection.

## Class `C`

Link object returned by the constructor.

The module returns a constructor: `local obj = require("flowgraph_link")(options)`.

| Method | Description | Line |
|---|---|---|
| `C:__onDeserialized(data)` | Restores the hidden state from data[5]. | 280 |
| `C:__onSerialize()` | Returns {sourceNode.id, sourcePin.name, targetNode.id, targetPin.name, hidden}. | 270 |
| `C:convertToQuickAccess()` | Turns the links leaving the source pin into a named quick access (see notes) then deletes the selection. | 233 |
| `C:doFlow()` | Requests a flow animation on the next draw frame. | 182 |
| `C:draw()` | Draws the link in the editor with a flow animation when the source pin is active in the current frame (never if the manager is stopped, zero speed when paused). | 111 |
| `C:drawLabel(sPin, tPin)` | Draws the label (source pin name) in the middle of a state link. | 186 |
| `C:drawLinkTooltip()` | Shows the tooltip of the hovered link: icon and type of the source pin and its current value. | 68 |
| `C:getDirPins()` | For state links: returns the pair of directions ('E','W' / 'W','E' / 'S','N' / 'N','S') according to the position of the nodes, or nil,nil without positions. | 92 |
| `C:init(graph, sourcePin, targetPin)` | Creates the link, registers it in the graph and notifies pins and nodes. | 9 |
| `C:showContextMenu(menuPos)` | Context menu of the link: hide / show, delete (if editing is allowed) and, if the preference flowgraph.debug.displayIds is active, ids. | 214 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/link.lua`.*
