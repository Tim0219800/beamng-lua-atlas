# `editor_treeSpline_splineMgr`

*Fichier : `lua/ge/extensions/editor/treeSpline/splineMgr.lua` · VM : Game Engine (GE) · 470 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_treeSpline_splineMgr` : `extensions.load("editor_treeSpline_splineMgr")`, puis la globale `editor_treeSpline_splineMgr`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_treeSpline_splineMgr.addNewTreeSpline()` | Adds a new (empty) tree spline; the user then clicks on the terrain to place its nodes. | 83 |
| `editor_treeSpline_splineMgr.copyTreeSplineProfile(spline)` | Profile copy/paste (foliage params only; splineInput needs these callbacks). Geometry is left untouched. | 259 |
| `editor_treeSpline_splineMgr.deepCopyTreeSpline(spline)` | Deep copies a single tree spline (geometry + runtime handles stripped: they rebuild from nodes/params). | 142 |
| `editor_treeSpline_splineMgr.deepCopyTreeSplineState()` | Deep copies the whole tree spline list (for trans-spline undo/redo). | 162 |
| `editor_treeSpline_splineMgr.deserializeTreeSpline(data)` | `data` is either the editor's buffer-encoded blob (string) or a plain table straight from a JSON session file. Either way the<br> derived scratch/scatter tables are (re)initialised; on the JSON path node positions arrive as plain {x,y,z} so rehydrate them. | 296 |
| `editor_treeSpline_splineMgr.getCurrentTreeSplineList()` | Returns the current list of tree splines (for Master Spline linking; each entry carries the type prefix). | 364 |
| `editor_treeSpline_splineMgr.getEditModeKey()` | Fetches the edit mode key. | 49 |
| `editor_treeSpline_splineMgr.getFoliageParamDefaults()` | Numeric distribution defaults for a fresh tree spline (no scenetree access, safe to read at module load). | 58 |
| `editor_treeSpline_splineMgr.getSplineMap()` | Returns the id -> index map. | 55 |
| `editor_treeSpline_splineMgr.getState()` | Full-state snapshot as plain data (all splines) for onSerialize. | 317 |
| `editor_treeSpline_splineMgr.getToolPrefixStr()` | Fetches the tool prefix string. | 46 |
| `editor_treeSpline_splineMgr.getTreeSplines()` | Returns the list of tree splines. | 52 |
| `editor_treeSpline_splineMgr.isLinked(id)` | Returns true if the given tree spline is linked, false otherwise. | 377 |
| `editor_treeSpline_splineMgr.makeFoliageDefaults()` | Builds the default foliage distribution for a fresh tree spline (a single ticked species so it plants). | 72 |
| `editor_treeSpline_splineMgr.pasteTreeSplineProfile(spline, profile)` |  | 265 |
| `editor_treeSpline_splineMgr.recomputeIdMap()` | Recompute the spline id -> index map (called by the shared session helper after a load appends the loaded splines). | 314 |
| `editor_treeSpline_splineMgr.removeAllTreeSplines(isIncludeDisabled)` | Removes all tree splines and their planted instances. | 131 |
| `editor_treeSpline_splineMgr.removeLinkedTreeSpline(splineId)` | Removes a linked tree spline by id (called from Master Spline layer removal). | 414 |
| `editor_treeSpline_splineMgr.removeTreeSpline(idx)` | Removes the tree spline (and its planted instances) at the given index. | 122 |
| `editor_treeSpline_splineMgr.serializeTreeSpline(spline)` | Serialize / deserialize (session hot-reload persistence via the tool's onSerialize/onDeserialized). | 274 |
| `editor_treeSpline_splineMgr.serializeTreeSplineToTable(spline)` | Portable plain table for a session file (see toolUtilities/session). serializeTreeSpline already whitelists just the primary<br> fields (no derived geometry / runtime handles), so decode its blob to a plain table; jsonWriteFile flattens the vec3 nodes. | 290 |
| `editor_treeSpline_splineMgr.setLink(id, groupId, isLink)` | Sets the given tree spline to be linked (or not) to a Master Spline group. | 383 |
| `editor_treeSpline_splineMgr.setState(state)` | Restores the whole tree spline list from a plain snapshot (flags all dirty so they re-scatter). | 324 |
| `editor_treeSpline_splineMgr.setTreeSpline(spline, idx)` | Replaces a single tree spline record (used by the object-select undo path in splineInput). | 203 |
| `editor_treeSpline_splineMgr.setTreeSplines(splines)` | Replaces the whole tree spline list (used by trans-spline undo/redo). | 215 |
| `editor_treeSpline_splineMgr.singleSplineEditRedo(splineData)` |  | 244 |
| `editor_treeSpline_splineMgr.singleSplineEditUndo(splineData)` | Undo/redo for a single tree spline edit. | 243 |
| `editor_treeSpline_splineMgr.splitTreeSpline(selIdx, nodeIdx)` | Splits the selected tree spline into two at the selected node (open splines), or unwraps a loop in place.<br> Both halves inherit the source's foliage params + conform setting. Returns the new selected index. | 180 |
| `editor_treeSpline_splineMgr.transSplineEditRedo(data)` |  | 252 |
| `editor_treeSpline_splineMgr.transSplineEditUndo(data)` | Undo/redo for trans-spline edits (add / remove / reorder across the whole list). | 247 |
| `editor_treeSpline_splineMgr.unlinkAll()` | Unlinks all tree splines. | 422 |
| `editor_treeSpline_splineMgr.updateDirtyTreeSplines()` | Rebuilds geometry and re-plants any dirty tree splines. Safe to call every frame. | 332 |
| `editor_treeSpline_splineMgr.updateLinkedTreeSpline(id, points, widths, nmls, isLoop, isConformToTerrain)` | Updates the given linked tree spline with the geometry pushed from the Master Spline. Tree rows always drape onto the surface<br> (2D on terrain, like roadSpline), so the master's conform flag is intentionally ignored. | 395 |

## Appels vers le moteur (C++)

- `Engine.` `generateUUID`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/treeSpline/splineMgr.lua`.*
