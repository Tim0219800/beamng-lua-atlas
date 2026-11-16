# `editor_ezObjectSelect_selectionDebug`

*File: `lua/ge/extensions/editor/ezObjectSelect/selectionDebug.lua` · VM: Game Engine (GE) · 284 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_ezObjectSelect_selectionDebug`: `extensions.load("editor_ezObjectSelect_selectionDebug")`, then the global `editor_ezObjectSelect_selectionDebug`

Debug and visual feedback drawing of the Easy Select tool in the 3D world (debugDrawer): boxes of discovered objects, of the candidate stack, of the chosen object, of selected or dragged objects, objects filtered out for being too large, selection axes (X red, Y green, Z blue) and maximum distance ring around the camera. The 2D debug drawing is delegated to the selectionScreenDebug module.

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_ezObjectSelect_selectionDebug.drawScreen(snapshot, options)` | Delegates the 2D overlay debug to selectionScreenDebug.draw(snapshot, options). | 275 |
| `editor_ezObjectSelect_selectionDebug.drawWorld(snapshot, options)` | Draws in the world the boxes and axes described by the selection snapshot and the options. Boxes are drawn as lines if options.outlineMode == 1 (otherwise filled). | 177 |
| `editor_ezObjectSelect_selectionDebug.reset()` | Resets the state of selectionScreenDebug. | 279 |

### Parameter details

#### `editor_ezObjectSelect_selectionDebug.drawScreen(snapshot, options)`

Delegates the 2D overlay debug to selectionScreenDebug.draw(snapshot, options).

- `snapshot` (*table|nil*) : Snapshot
- `options` (*table*) : Options

#### `editor_ezObjectSelect_selectionDebug.drawWorld(snapshot, options)`

Draws in the world the boxes and axes described by the selection snapshot and the options. Boxes are drawn as lines if options.outlineMode == 1 (otherwise filled).

- `snapshot` (*table|nil*) : Selection state: discovery, candidates, pick, filteredLarge, camera
- `options` (*table*) : outlineMode, selectedIds, draggingIds, depthTest, dragDepthTest, selectedDepthTest, showFilteredLarge, debugEnabled, maxDiscoveryOutlines, maxStackOutlines, showSelectionAxes, axisLocal, axisLengthScale, axisLineWidth, showDistanceRing, maxDistance

## Calls into the engine (C++)

- `debugDrawer:` `drawLineInstance`, `drawTextAdvanced`, `drawTriSolid`
- `obj:` `getPosition`, `getTransform`, `getWorldBox`
- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/ezObjectSelect/selectionDebug.lua`.*
