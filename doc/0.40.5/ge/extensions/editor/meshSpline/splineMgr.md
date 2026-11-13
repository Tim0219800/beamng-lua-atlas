# `editor_meshSpline_splineMgr`

*Fichier : `lua/ge/extensions/editor/meshSpline/splineMgr.lua` · VM : Game Engine (GE) · 1410 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_meshSpline_splineMgr` : `extensions.load("editor_meshSpline_splineMgr")`, puis la globale `editor_meshSpline_splineMgr`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_meshSpline_splineMgr.addNewMeshSpline()` | Adds a new mesh spline. | 610 |
| `editor_meshSpline_splineMgr.conformNodesToTerrain(spline)` | One-shot: drops the spline's control nodes onto the surface below (raycast). The build stays free in 3D, so this simply moves<br> the nodes down to the terrain/objects; run it again after terraforming to re-snap. | 1246 |
| `editor_meshSpline_splineMgr.convertPathsToMeshSplines(paths)` | Converts the given paths (traced from a bitmap) to mesh splines. | 1256 |
| `editor_meshSpline_splineMgr.copyMeshSplineProfile(spline)` | Copies the profile of the given mesh spline. | 1083 |
| `editor_meshSpline_splineMgr.deepCopyMeshSpline(spline)` | Deep copies the given mesh spline. | 707 |
| `editor_meshSpline_splineMgr.deepCopyMeshSplineState()` | Deep copies the full mesh spline state. | 719 |
| `editor_meshSpline_splineMgr.deserializeMeshSpline(data, isCreateObject)` | Deserializes a mesh spline. `data` is either the editor's buffer-encoded blob (string) or a plain table straight from a JSON<br> session file. On the JSON path the derived scratch tables are empty and node positions arrive as plain {x,y,z}, so guarantee<br> the tables exist and rehydrate them to vec3 before the first build. | 1180 |
| `editor_meshSpline_splineMgr.findMeshSpline(id)` | Finds a live mesh spline by id (nil if not present). | 672 |
| `editor_meshSpline_splineMgr.getCurrentMeshSplineList()` | Returns the current list of mesh splines. | 1289 |
| `editor_meshSpline_splineMgr.getDefaultSliderParams()` | Returns the default slider parameters. | 607 |
| `editor_meshSpline_splineMgr.getEditModeKey()` | Fetches the edit mode key. | 476 |
| `editor_meshSpline_splineMgr.getMeshSplines()` | Fetches the mesh splines. | 479 |
| `editor_meshSpline_splineMgr.getSplineMap()` | Fetches the mesh spline map. | 482 |
| `editor_meshSpline_splineMgr.getToolPrefixStr()` | Fetches the tool prefix string. | 473 |
| `editor_meshSpline_splineMgr.isLinked(id)` | Returns true if the given mesh spline is linked, false otherwise. | 1303 |
| `editor_meshSpline_splineMgr.joinMeshSplines(splineIdx1, nodeIdx1, splineIdx2, nodeIdx2)` | Joins two unlooped Mesh Splines into one, modifying spline1 and deleting spline2. | 885 |
| `editor_meshSpline_splineMgr.objectSelectRedo(data)` | Redo callback for object select operations. | 1080 |
| `editor_meshSpline_splineMgr.objectSelectUndo(data)` | Undo callback for object select operations. | 1077 |
| `editor_meshSpline_splineMgr.pasteMeshSplineProfile(spline, profile)` | Pastes the profile to the given mesh spline. | 1098 |
| `editor_meshSpline_splineMgr.presetSelectionRedo(meshSplineData)` | Handles the redo for preset selection (removes meshes before applying). | 1029 |
| `editor_meshSpline_splineMgr.presetSelectionUndo(meshSplineData)` | Handles the undo for preset selection (removes meshes before applying). | 1015 |
| `editor_meshSpline_splineMgr.recomputeIdMap()` | Recompute the spline id -> index map (called by the shared session helper after a load appends the loaded splines). | 1063 |
| `editor_meshSpline_splineMgr.removeAllMeshSplines(isIncludeDisabled)` | Removes all mesh splines.<br> [If isIncludeDisabled is true, then all mesh splines will be removed, including disabled ones.]<br> [If isIncludeDisabled is false, then only enabled mesh splines will be removed.] | 688 |
| `editor_meshSpline_splineMgr.removeLinkedMeshSpline(splineId)` | Removes a linked mesh spline by ID (called from master spline layer removal). | 678 |
| `editor_meshSpline_splineMgr.removeMeshSpline(idx)` | Removes the mesh spline with the given index. | 656 |
| `editor_meshSpline_splineMgr.serializeMeshSpline(spline)` | Serializes a mesh spline to a table. | 1158 |
| `editor_meshSpline_splineMgr.serializeMeshSplineToTable(spline)` | Serialises a mesh spline to a portable plain table for a session file (see toolUtilities/session). Deep-copied through the<br> codec so the live spline is never mutated; derived geometry is emptied (rebuilt by the dirty pass) and the runtime scene<br> handle dropped. | 1171 |
| `editor_meshSpline_splineMgr.setLink(id, groupId, isLink)` | Sets the given linked mesh spline to be linked or not. | 1309 |
| `editor_meshSpline_splineMgr.setMeshSpline(spline, idx)` | Sets the mesh spline with the given index. | 485 |
| `editor_meshSpline_splineMgr.setMeshSplines(splines)` | Sets the mesh splines (full table). | 505 |
| `editor_meshSpline_splineMgr.setPreset(spline, presetStr)` | Sets the given spline to the given preset. | 512 |
| `editor_meshSpline_splineMgr.singleSplineEditRedo(meshSplineData)` | Handles the redo for a single mesh spline. | 1007 |
| `editor_meshSpline_splineMgr.singleSplineEditUndo(meshSplineData)` | Handles the undo for a single mesh spline. | 999 |
| `editor_meshSpline_splineMgr.splitMeshSpline(selectedSplineIdx, selectedNodeIdx)` | Splits the selected mesh spline into two, at the selected node. | 728 |
| `editor_meshSpline_splineMgr.transSplineEditRedo(data)` | Handles the redo for trans-meshspline edits. | 1053 |
| `editor_meshSpline_splineMgr.transSplineEditUndo(data)` | Handles the undo for trans-meshspline edits. | 1043 |
| `editor_meshSpline_splineMgr.unlinkAll()` | Unlinks all mesh splines. | 1347 |
| `editor_meshSpline_splineMgr.updateDirtyMeshSplines()` | Updates the geometry and meshes of any dirty mesh splines. | 1218 |
| `editor_meshSpline_splineMgr.updateLinkedMeshSpline(id, points, widths, nmls, isLoop, isConformToTerrain)` | Updates the given linked mesh spline with the given geometry. | 1324 |

## Appels vers le moteur (C++)

- `Engine.` `generateUUID`
- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/meshSpline/splineMgr.lua`.*
