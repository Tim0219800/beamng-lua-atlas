# `editor_aiViz`

*File: `lua/ge/extensions/editor/aiViz.lua` · VM: Game Engine (GE) · 410 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_aiViz`: `extensions.load("editor_aiViz")`, then the global `editor_aiViz`

Visualization of the AI navgraph in the editor. When a draw mode is active, draws the navigation map nodes (map.getMap().nodes) as spheres, the links (prisms colored according to the mode), the lanes and direction arrows (lanes or oneWay), and highlights the node or link hovered by the mouse. Four exclusive modes: drivability, type (public/private), speedLimit and hiddenInNavi. Nearby links (less than 100 m in path distance from the hovered node) are also drawn in green. Nodes are indexed in a quadtree.

## Example

```lua
editor_aiViz.enableDrawMode("speedLimit", true)
print(editor_aiViz.getDrawMode())
```

## Notes

- enableDrawMode disables the other modes when one is enabled; with an unknown mode, an error is logged.
- Colors: drivability as a rainbow (value clamped 0-1), speedLimit clamped to 0-36 m/s, link text in g or "m/s" (value in m/s).
- Nodes are not drawn as spheres when the current edit mode is "Edit Road".
- The node lists are reloaded after the onNavgraphReloaded hook.

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_aiViz.enableDrawMode(mode, enabled)` | Enables or disables a draw mode; enabling a mode disables the others. | 389 |
| `editor_aiViz.getDrawMode()` | Returns the active draw mode. | 401 |
| `editor_aiViz.onEditorGui()` | Editor drawing hook: handles hovering (camera/mouse ray against nodes and links) and draws the nodes near the camera according to the mode. *(internal)* *(hook)* | 305 |
| `editor_aiViz.onNavgraphReloaded()` | Hook emitted when the navgraph is reloaded: empties the node cache and rebuilds the quadtree. *(internal)* *(hook)* | 300 |

### Parameter details

#### `editor_aiViz.enableDrawMode(mode, enabled)`

Enables or disables a draw mode; enabling a mode disables the others.

- `mode` (*string*) : "drivability", "type", "speedLimit" or "hiddenInNavi".
- `enabled` (*boolean*) : Enable or disable.

#### `editor_aiViz.getDrawMode()`

Returns the active draw mode.

- **returns**: string|nil Mode name or nil if nothing is drawn.

## Calls into the engine (C++)

- `debugDrawer:` `drawCylinder`, `drawSphere`, `drawSquarePrism`, `drawText`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/aiViz.lua`.*
