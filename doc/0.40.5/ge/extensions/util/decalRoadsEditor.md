# `util_decalRoadsEditor`

*File: `lua/ge/extensions/util/decalRoadsEditor.lua` · VM: Game Engine (GE) · 118 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `util_decalRoadsEditor`: `extensions.load("util_decalRoadsEditor")`, then the global `util_decalRoadsEditor`

Debug visualization, dynamically loaded by the engine or the world editor: every frame, it draws the scene's AIPath objects (traffic paths) near the camera: red spheres at the nodes, blue prisms between nodes, and arrow decals per lane (cyan for the left lane, red for the right, reversed if flipDirection). Only AIPaths with drivability > 0 are displayed.

## Notes

- Display distance: visibility fading from 400 m to 500 m from the camera (fadeStart 200 and fadeEnd 250, doubled in the computation); beyond about 500 m nothing is drawn.
- The number of lanes comes from lanesLeft and lanesRight of each AIPath; the arrows are added via Engine.Render.DynamicDecalMgr.addDecal with the texture art/arrow_waypoint_1.dds.
- Despite its file name (decalRoads), the tool handles the AIPath class, and its logs carry the label 'AIPathEditor'.
- Cost: all AIPaths and their nodes are traversed every frame, with decals recreated each time: development tool, not for production.

## Functions

| Function | Description | Line |
|---|---|---|
| `util_decalRoadsEditor.onExtensionLoaded()` | Load hook: logs "module loaded". *(internal)* *(hook)* | 109 |
| `util_decalRoadsEditor.onExtensionUnloaded()` | Unload hook: logs "module unloaded". *(internal)* *(hook)* | 106 |
| `util_decalRoadsEditor.onPreRender(dt)` | Hook called before each render: draws the AIPaths near the camera (nodes, segments, lane arrows). *(internal)* *(hook)* | 9 |

### Parameter details

#### `util_decalRoadsEditor.onPreRender(dt)`

Hook called before each render: draws the AIPaths near the camera (nodes, segments, lane arrows).

- `dt` (*number*) : Frame duration (s); unused.

## Calls into the engine (C++)

- `debugDrawer:` `drawSphere`, `drawSquarePrism`
- `scenetree.` `findClassObjects`, `findObject`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/util/decalRoadsEditor.lua`.*
