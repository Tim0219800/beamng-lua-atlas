# `editor_decalSpline_splineMgr`

*Fichier : `lua/ge/extensions/editor/decalSpline/splineMgr.lua` · VM : Game Engine (GE) · 755 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_decalSpline_splineMgr` : `extensions.load("editor_decalSpline_splineMgr")`, puis la globale `editor_decalSpline_splineMgr`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_decalSpline_splineMgr.addNewDecalSpline()` | Adds a new decal spline. | 83 |
| `editor_decalSpline_splineMgr.convertPathsToDecalSplines(paths)` | Converts the given paths (traced from a bitmap) to decal splines. | 608 |
| `editor_decalSpline_splineMgr.copyDecalSplineProfile(spline)` | Copies the profile of the given decal spline. | 466 |
| `editor_decalSpline_splineMgr.deepCopyDecalSpline(spline)` | Deep copies the given decal spline. | 198 |
| `editor_decalSpline_splineMgr.deepCopyDecalSplineState()` | Deep copies the full decal spline state. | 210 |
| `editor_decalSpline_splineMgr.deserializeDecalSpline(data, isCreateObject)` | Deserialises a decal spline. `data` is either the editor's buffer-encoded blob (string) or a plain table straight from a JSON<br> session file. On the JSON path the derived scratch tables are empty and node positions arrive as plain {x,y,z}, so guarantee<br> the tables exist and rehydrate them to vec3 before the first build. | 546 |
| `editor_decalSpline_splineMgr.getCurrentDecalSplineList()` | Returns the current list of decal splines. | 641 |
| `editor_decalSpline_splineMgr.getDecalSplines()` | Fetches the decal splines. | 61 |
| `editor_decalSpline_splineMgr.getDefaultSliderParams()` | Returns the default slider parameters. | 80 |
| `editor_decalSpline_splineMgr.getEditModeKey()` | Fetches the edit mode key. | 58 |
| `editor_decalSpline_splineMgr.getSplineMap()` | Fetches the decal spline map. | 64 |
| `editor_decalSpline_splineMgr.getToolPrefixStr()` | Fetches the tool prefix string. | 55 |
| `editor_decalSpline_splineMgr.isLinked(id)` | Returns true if the given decal spline is linked, false otherwise. | 655 |
| `editor_decalSpline_splineMgr.joinDecalSplines(splineIdx1, nodeIdx1, splineIdx2, nodeIdx2)` | Joins two unlooped Decal Splines into one, modifying spline1 and deleting spline2. | 335 |
| `editor_decalSpline_splineMgr.pasteDecalSplineProfile(spline, profile)` | Pastes the profile to the given decal spline. | 481 |
| `editor_decalSpline_splineMgr.recomputeIdMap()` | Recompute the spline id -> index map (called by the shared session helper after a load appends the loaded splines). | 565 |
| `editor_decalSpline_splineMgr.removeAllDecalSplines(isIncludeDisabled)` | Removes all decal splines.<br> [If isIncludeDisabled is true, then all decal splines will be removed, including disabled ones.]<br> [If isIncludeDisabled is false, then only enabled decal splines will be removed.] | 179 |
| `editor_decalSpline_splineMgr.removeDecalSpline(idx)` | Removes the decal spline with the given index. | 158 |
| `editor_decalSpline_splineMgr.removeLinkedDecalSpline(splineId)` | Removes a linked decal spline by ID (called from master spline layer removal). | 169 |
| `editor_decalSpline_splineMgr.serializeDecalSpline(spline)` | Serialises a decal spline to a table. | 524 |
| `editor_decalSpline_splineMgr.serializeDecalSplineToTable(spline)` | Serialises a decal spline to a portable plain table for a session file (see toolUtilities/session): derived geometry emptied<br> (rebuilt by the dirty pass), runtime scene handle dropped, live spline never mutated. | 537 |
| `editor_decalSpline_splineMgr.setDecalSpline(spline, idx)` | Sets the decal spline with the given index. | 67 |
| `editor_decalSpline_splineMgr.setDecalSplines(splines)` | Sets the decal splines (full table). | 73 |
| `editor_decalSpline_splineMgr.setLink(id, groupId, isLink)` | Sets the given linked decal spline to be linked or not. | 661 |
| `editor_decalSpline_splineMgr.singleSplineEditRedo(decalSplineData)` | Handles the redo for a single decal spline. | 434 |
| `editor_decalSpline_splineMgr.singleSplineEditUndo(decalSplineData)` | Handles the undo for a single decal spline. | 426 |
| `editor_decalSpline_splineMgr.splitDecalSpline(selectedSplineIdx, selectedNodeIdx)` | Splits the selected decal spline into two, at the selected node. | 219 |
| `editor_decalSpline_splineMgr.transSplineEditRedo(data)` | Handles the redo for trans decal spline edits. | 454 |
| `editor_decalSpline_splineMgr.transSplineEditUndo(data)` | Handles the undo for trans decal spline edits. | 442 |
| `editor_decalSpline_splineMgr.unlinkAll()` | Unlinks all decal splines. | 698 |
| `editor_decalSpline_splineMgr.updateDirtyDecalSplines()` | Updates the geometry and templates/instances of any dirty decal splines. | 568 |
| `editor_decalSpline_splineMgr.updateLinkedDecalSpline(id, points, widths, nmls, isLoop, isConformToTerrain)` | Updates the given linked decal spline with the given geometry. | 676 |

## Appels vers le moteur (C++)

- `Engine.` `generateUUID`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/decalSpline/splineMgr.lua`.*
