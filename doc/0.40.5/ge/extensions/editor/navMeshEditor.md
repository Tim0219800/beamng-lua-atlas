# `editor_navMeshEditor`

*File: `lua/ge/extensions/editor/navMeshEditor.lua` · VM: Game Engine (GE) · 979 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_navMeshEditor`: `extensions.load("editor_navMeshEditor")`, then the global `editor_navMeshEditor`

Editor of the Recast navmesh (AI navigation mesh) in the World Editor, modeled on the river editor: a "Navigation Mesh" edit mode, a toolbar, an interaction in the 3D view and two windows ("NavMesh Overview": 2D grid of the tiles and shapes of the current tile; "navMeshTileView"). Six tools: tiles (selection and locking of tiles so a rebuild does not change them), outline (coverage polygon), areas (typed convex volumes Exclude/Ground/Road/Sidewalk/Water), links (off-mesh jump/drop/climb/teleport links), test (A to B pathfinding) and crowd (live AI agents). Everything is undoable. It drives the C++ functions navmeshEditor* (navmeshEditorBuild, navmeshEditorSave/Load, navmeshEditorFindPath, navmeshEditorCrowd*, etc.). The navmesh is saved with the level (onEditorAfterSaveLevel) and reloaded on opening.

## Notes

- If the function navmeshEditorGetState does not exist (engine without this API), the window displays "NavMesh engine API not found. Rebuild the game (C++)..." and the tool is unusable.
- Shortcuts: left click = select/place, Alt+click = add a node, right click = delete a node or a link. Without an outline polygon, the whole level is covered; with an outline, the outer navmesh is removed at build time.
- Link types (flags): walk 1, swim 2, jump 4, ledge 8, drop 16, climb 32, teleport 64. Area types: 0 Exclude, 1 Ground, 2 Road, 3 Sidewalk, 4 Water.
- The editable build parameters include cs, ch, walkableSlopeAngle, walkableHeight/Climb/Radius (in voxels), tileSize, maxEdgeLen, minRegionArea, maxPolysPerTile, etc. (see CONFIG_FIELDS).

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_navMeshEditor.allowGizmo()` | Indicates whether the transform gizmo is allowed: true only when the current edit mode is "Navigation Mesh". | 971 |
| `editor_navMeshEditor.onEditorAfterOpenLevel()` | Hook called after a level is opened in the editor: resets polygons, areas, selection, tiles and links; the navmesh will be reloaded at the next activation of the mode. *(internal)* *(hook)* | 964 |
| `editor_navMeshEditor.onEditorAfterSaveLevel()` | Hook called after a level is saved in the editor: saves the navmesh with the level. *(internal)* *(hook)* | 963 |
| `editor_navMeshEditor.onEditorGui()` | Editor hook called every frame: draws the Overview and tile view windows when the navmesh mode is active (or the missing API message). *(internal)* *(hook)* | 900 |
| `editor_navMeshEditor.onEditorInitialized()` | Hook called at editor initialization: registers the two windows, the "navMesh" inspector handler, the navMeshEditMode edit mode and the "Navigation Mesh" menu entry (Gameplay group). *(internal)* *(hook)* | 942 |
| `editor_navMeshEditor.show()` | Selects the "Navigation Mesh" edit mode. | 920 |

### Parameter details

#### `editor_navMeshEditor.allowGizmo()`

Indicates whether the transform gizmo is allowed: true only when the current edit mode is "Navigation Mesh".

- **returns**: boolean True if the current edit mode is the navmesh one.

## Calls into the engine (C++)

- `debugDrawer:` `drawLine`, `drawSphere`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/navMeshEditor.lua`.*
