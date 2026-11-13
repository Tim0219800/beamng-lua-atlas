# `editor_assemblySpline_splineMgr`

*Fichier : `lua/ge/extensions/editor/assemblySpline/splineMgr.lua` · VM : Game Engine (GE) · 863 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_assemblySpline_splineMgr` : `extensions.load("editor_assemblySpline_splineMgr")`, puis la globale `editor_assemblySpline_splineMgr`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_assemblySpline_splineMgr.addNewAssemblySpline()` | Adds a new assembly spline. | 174 |
| `editor_assemblySpline_splineMgr.conformNodesToTerrain(spline)` | One-shot: drops the spline's control nodes onto the surface below (raycast). The build stays free in 3D, so this simply moves<br> the nodes down to the terrain/objects; run it again after terraforming to re-snap. | 702 |
| `editor_assemblySpline_splineMgr.convertPathsToAssemblySplines(paths)` | Converts the given paths (traced from a bitmap) to assembly splines. | 712 |
| `editor_assemblySpline_splineMgr.copyAssemblySplineProfile(spline)` | Copies the profile of the given assembly spline. | 554 |
| `editor_assemblySpline_splineMgr.deepCopyAssemblySpline(spline)` | Deep copies the given assembly spline. | 304 |
| `editor_assemblySpline_splineMgr.deepCopyAssemblySplineState()` | Deep copies the full assembly spline state. | 316 |
| `editor_assemblySpline_splineMgr.deserializeAssemblySpline(data, isCreateObject)` | Deserializes an assembly spline. `data` is either the editor's buffer-encoded blob (string) or a plain table straight from a<br> JSON session file. On the JSON path the derived scratch tables are empty and node positions arrive as plain {x,y,z}, so<br> guarantee the tables exist and rehydrate them to vec3 before the first build. | 624 |
| `editor_assemblySpline_splineMgr.findAssemblySpline(id)` | Finds a live assembly spline by id (nil if not present). | 269 |
| `editor_assemblySpline_splineMgr.getAssemblySplines()` | Fetches the assembly splines. | 94 |
| `editor_assemblySpline_splineMgr.getCurrentAssemblySplineList()` | Returns the current list of assembly splines. | 744 |
| `editor_assemblySpline_splineMgr.getDefaultSliderParams()` | Returns the default slider parameters (from the wooden fence preset). | 127 |
| `editor_assemblySpline_splineMgr.getEditModeKey()` | Fetches the edit mode key. | 91 |
| `editor_assemblySpline_splineMgr.getSplineMap()` | Fetches the assembly spline map. | 97 |
| `editor_assemblySpline_splineMgr.getToolPrefixStr()` | Fetches the tool prefix string. | 88 |
| `editor_assemblySpline_splineMgr.isLinked(id)` | Returns true if the given assembly spline is linked, false otherwise. | 758 |
| `editor_assemblySpline_splineMgr.joinAssemblySplines(splineIdx1, nodeIdx1, splineIdx2, nodeIdx2)` | Joins two unlooped Assembly Splines into one, modifying spline1 and deleting spline2. | 414 |
| `editor_assemblySpline_splineMgr.objectSelectRedo(data)` | Redo callback for object select operations. | 551 |
| `editor_assemblySpline_splineMgr.objectSelectUndo(data)` | Undo callback for object select operations. | 548 |
| `editor_assemblySpline_splineMgr.pasteAssemblySplineProfile(spline, profile)` | Pastes the profile to the given assembly spline. | 578 |
| `editor_assemblySpline_splineMgr.recomputeIdMap()` | Recompute the spline id -> index map (called by the shared session helper after a load appends the loaded splines). | 659 |
| `editor_assemblySpline_splineMgr.removeAllAssemblySplines(isIncludeDisabled)` | Removes all assembly splines.<br> [If isIncludeDisabled is true, then all assembly splines will be removed, including disabled ones.]<br> [If isIncludeDisabled is false, then only enabled assembly splines will be removed.] | 285 |
| `editor_assemblySpline_splineMgr.removeAssemblySpline(idx)` | Removes the assembly spline with the given index. | 253 |
| `editor_assemblySpline_splineMgr.removeLinkedAssemblySpline(splineId)` | Removes a linked assembly spline by ID (called from master spline layer removal). | 275 |
| `editor_assemblySpline_splineMgr.serializeAssemblySpline(spline)` | Serializes an assembly spline to a table. | 603 |
| `editor_assemblySpline_splineMgr.serializeAssemblySplineToTable(spline)` | Serialises an assembly spline to a portable plain table for a session file (see toolUtilities/session): derived geometry<br> emptied (rebuilt by the dirty pass), runtime scene handle dropped, live spline never mutated. | 615 |
| `editor_assemblySpline_splineMgr.setAssemblySpline(spline, idx)` | Sets the assembly spline with the given index. | 100 |
| `editor_assemblySpline_splineMgr.setAssemblySplines(splines)` | Sets the assembly splines (full table). | 120 |
| `editor_assemblySpline_splineMgr.setLink(id, groupId, isLink)` | Sets the given linked assembly spline to be linked or not. | 764 |
| `editor_assemblySpline_splineMgr.setPreset(spline, presetStr)` | Sets the given spline to the given preset. | 142 |
| `editor_assemblySpline_splineMgr.singleSplineEditRedo(assemblySplineData)` | Handles the redo for a single assembly spline. | 505 |
| `editor_assemblySpline_splineMgr.singleSplineEditUndo(assemblySplineData)` | Handles the undo for a single assembly spline. | 497 |
| `editor_assemblySpline_splineMgr.splitAssemblySpline(selectedSplineIdx, selectedNodeIdx)` | Splits the selected assembly spline into two, at the selected node. | 325 |
| `editor_assemblySpline_splineMgr.transSplineEditRedo(data)` | Handles the redo for trans assembly spline edits. | 525 |
| `editor_assemblySpline_splineMgr.transSplineEditUndo(data)` | Handles the undo for trans assembly spline edits. | 513 |
| `editor_assemblySpline_splineMgr.unlinkAll()` | Unlinks all assembly splines. | 802 |
| `editor_assemblySpline_splineMgr.updateDirtyAssemblySplines()` | Updates the geometry and meshes of any dirty assembly splines. | 662 |
| `editor_assemblySpline_splineMgr.updateLinkedAssemblySpline(id, points, widths, nmls, isLoop, isConformToTerrain)` | Updates the given linked assembly spline with the given geometry. | 779 |

## Appels vers le moteur (C++)

- `Engine.` `generateUUID`
- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/assemblySpline/splineMgr.lua`.*
