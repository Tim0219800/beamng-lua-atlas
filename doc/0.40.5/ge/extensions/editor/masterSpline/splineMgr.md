# `editor_masterSpline_splineMgr`

*Fichier : `lua/ge/extensions/editor/masterSpline/splineMgr.lua` · VM : Game Engine (GE) · 1343 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_masterSpline_splineMgr` : `extensions.load("editor_masterSpline_splineMgr")`, puis la globale `editor_masterSpline_splineMgr`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_masterSpline_splineMgr.addNewMasterSpline(name)` | Adds a new Master Spline. | 84 |
| `editor_masterSpline_splineMgr.addToMasterSplineArray(spline)` | Adds a Master Spline to the Master Splines array. | 152 |
| `editor_masterSpline_splineMgr.captureLinkedSplinesState()` | Captures the state of all linked splines across all master splines. | 261 |
| `editor_masterSpline_splineMgr.captureTransTierState()` | Captures the full trans tier state including both master splines and linked splines. | 345 |
| `editor_masterSpline_splineMgr.convertPathsToMasterSplines(paths)` | Converts the given paths (traced from a bitmap) to Master Splines. | 1259 |
| `editor_masterSpline_splineMgr.deepCopyAllMasterSplines()` | Deep copies the full master spline state. | 255 |
| `editor_masterSpline_splineMgr.deepCopyMasterSpline(spline)` | Deep copies the given master spline. | 252 |
| `editor_masterSpline_splineMgr.deserializeMasterSpline(data)` | Deserialises a Master Spline. | 614 |
| `editor_masterSpline_splineMgr.getEditModeKey()` | Returns the edit mode key. | 66 |
| `editor_masterSpline_splineMgr.getIdToIdxMap()` | Gets the Master Spline id -> index map. | 72 |
| `editor_masterSpline_splineMgr.getMasterSplines()` | Gets the array of Master Splines. | 69 |
| `editor_masterSpline_splineMgr.getToolPrefixStr()` | Returns the tool prefix string. | 63 |
| `editor_masterSpline_splineMgr.joinMasterSplines(splineIdx1, nodeIdx1, splineIdx2, nodeIdx2)` | Joins two unlooped Master Splines into one, modifying spline1 and deleting spline2. | 539 |
| `editor_masterSpline_splineMgr.lightSplineRedo(data)` | Handles the redo for light Master Spline changes. | 765 |
| `editor_masterSpline_splineMgr.lightSplineUndo(data)` | Handles the undo/redo for light Master Spline changes. | 762 |
| `editor_masterSpline_splineMgr.loadSessionState(state, replace)` | loadWhole for the shared session helper. Mints fresh ids for every master + child, remaps the layer links, inserts the children<br> into their tools and the masters here, then relinks. `replace` first wipes the whole current master graph (masters + their linked<br> children). Returns the number of masters loaded. | 1030 |
| `editor_masterSpline_splineMgr.manageLiveOptimise(selectedSplineIdx)` | Manages the Live Optimise of the selected Master Spline only. | 243 |
| `editor_masterSpline_splineMgr.recomputeIdMap()` | Recompute the Master Spline id -> index map (called by the shared session helper after a load appends the loaded splines). | 258 |
| `editor_masterSpline_splineMgr.redoAddNewMasterSpline(data)` | Redo callback for adding a new master spline. | 1241 |
| `editor_masterSpline_splineMgr.redoLayerAdd(data)` |  | 1117 |
| `editor_masterSpline_splineMgr.redoLayerRemove(data)` |  | 1206 |
| `editor_masterSpline_splineMgr.removeAllMasterSplines()` | Removes all Master Splines from the session. | 165 |
| `editor_masterSpline_splineMgr.removeMasterSpline(idx)` | Removes the Master Spline at the given index. | 155 |
| `editor_masterSpline_splineMgr.serializeMasterSpline(spline)` | Serialises a Master Spline. | 570 |
| `editor_masterSpline_splineMgr.serializeSessionState()` | getState for the shared session helper: bundle all masters + each linked child (deduped by id), all JSON-safe. | 1005 |
| `editor_masterSpline_splineMgr.singleMasterSplineEditRedo(data)` | Redefine the redo functions to include enhanced functionality. | 940 |
| `editor_masterSpline_splineMgr.singleMasterSplineEditUndo(data)` | Handles the undo/redo for single Master Spline edits. | 831 |
| `editor_masterSpline_splineMgr.splitMasterSpline(spline, splineIdx, selectedNodeIdx)` | Splits the given Master Spline at the selected node index. | 353 |
| `editor_masterSpline_splineMgr.transMasterSplineEditRedo(splinesData)` |  | 966 |
| `editor_masterSpline_splineMgr.transMasterSplineEditUndo(splinesData)` | Handles the undo/redo for trans-Master Spline edits. | 935 |
| `editor_masterSpline_splineMgr.undoAddNewMasterSpline(data)` | Undo callback for adding a new master spline. | 1232 |
| `editor_masterSpline_splineMgr.undoLayerAdd(data)` | Layer-specific undo/redo operations for adding layers. | 1095 |
| `editor_masterSpline_splineMgr.undoLayerRemove(data)` | Layer-specific undo/redo operations for removing layers. | 1162 |
| `editor_masterSpline_splineMgr.unlinkAllSplines(masterSpline)` | Unlinks all splines from the given Master Spline (separated so as not to be called with undo/redo). | 1248 |
| `editor_masterSpline_splineMgr.updateDirtyMasterSplines(isSplineAnalysisEnabled)` | Updates the dirty Master Splines. | 173 |
| `editor_masterSpline_splineMgr.updateLinkedSplineName(splineId, linkType, newName)` | Updates a linked spline's name to match a layer name. | 1229 |

## Appels vers le moteur (C++)

- `Engine.` `generateUUID`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/masterSpline/splineMgr.lua`.*
