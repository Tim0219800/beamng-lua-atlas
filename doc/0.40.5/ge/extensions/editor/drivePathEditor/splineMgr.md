# `editor_drivePathEditor_splineMgr`

*Fichier : `lua/ge/extensions/editor/drivePathEditor/splineMgr.lua` · VM : Game Engine (GE) · 1048 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_drivePathEditor_splineMgr` : `extensions.load("editor_drivePathEditor_splineMgr")`, puis la globale `editor_drivePathEditor_splineMgr`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_drivePathEditor_splineMgr.addNewDrivePathSpline()` | Adds a new drive path spline. | 202 |
| `editor_drivePathEditor_splineMgr.computeActiveVehicles()` | Computes the active vehicles in the scene. | 84 |
| `editor_drivePathEditor_splineMgr.convertPathsToDrivePathSplines(paths)` | Converts the given paths (traced from a bitmap) to drive path splines. | 967 |
| `editor_drivePathEditor_splineMgr.deepCopyDrivePathSpline(spline)` | Deep copies the given drive path spline. | 283 |
| `editor_drivePathEditor_splineMgr.deepCopyDrivePathSplineState()` | Deep copies the full drive path spline state. | 350 |
| `editor_drivePathEditor_splineMgr.deserializeDrivePathSpline(data)` | Deserializes a drive path spline from a table. | 811 |
| `editor_drivePathEditor_splineMgr.flipSpline(spline)` | Flips the geometry of the given drive path spline, such that the nodes are reversed (and so are the widths, normals, velocities and velocity limits). | 577 |
| `editor_drivePathEditor_splineMgr.getActiveVehicles(isForce)` | Returns the active vehicles. | 94 |
| `editor_drivePathEditor_splineMgr.getDefaultSliderParams()` | Returns the default slider parameters. | 183 |
| `editor_drivePathEditor_splineMgr.getDrivePathSplines()` | Fetches the drive path splines. | 65 |
| `editor_drivePathEditor_splineMgr.getEditModeKey()` | Fetches the edit mode key. | 62 |
| `editor_drivePathEditor_splineMgr.getNavGraph()` | Gets the nav graph. | 141 |
| `editor_drivePathEditor_splineMgr.getSplineMap()` | Fetches the drive path spline map. | 68 |
| `editor_drivePathEditor_splineMgr.getToolPrefixStr()` | Fetches the tool prefix string. | 59 |
| `editor_drivePathEditor_splineMgr.getVehicleById(vid)` | Returns the vehicle with the given Id. | 102 |
| `editor_drivePathEditor_splineMgr.joinDrivePathSplines(splineIdx1, nodeIdx1, splineIdx2, nodeIdx2)` | Joins two unlooped Drive Path Splines into one, modifying spline1 and deleting spline2. | 486 |
| `editor_drivePathEditor_splineMgr.linkSpline(spline, vehicle)` | Links the given drive path spline to the given vehicle. | 635 |
| `editor_drivePathEditor_splineMgr.relinkAllVehiclesToSplines()` | Re-link all the vehicles to the drive path splines. | 673 |
| `editor_drivePathEditor_splineMgr.removeAllDrivePathSplines(isIncludeDisabled)` | Removes all drive path splines.<br> [If isIncludeDisabled is true, then all drive path splines will be removed, including disabled ones.]<br> [If isIncludeDisabled is false, then only enabled drive path splines will be removed.] | 264 |
| `editor_drivePathEditor_splineMgr.removeDrivePathSpline(idx)` | Removes the drive path spline with the given index. | 256 |
| `editor_drivePathEditor_splineMgr.resetGeometry(spline)` | Resets all the geometry of the given drive path spline. | 186 |
| `editor_drivePathEditor_splineMgr.resetVehiclePose(spline, vehicle)` | Sets the pose of the given vehicle to the first node of the given drive path spline, pointing towards the second node. | 602 |
| `editor_drivePathEditor_splineMgr.serializeDrivePathSpline(spline)` | Serializes a drive path spline to a table. | 756 |
| `editor_drivePathEditor_splineMgr.setDrivePathSpline(spline, idx)` | Sets the drive path spline with the given index. | 71 |
| `editor_drivePathEditor_splineMgr.setDrivePathSplines(splines)` | Sets the drive path splines (full table). | 77 |
| `editor_drivePathEditor_splineMgr.singleSplineEditRedo(drivePathSplineData)` | Handles the redo for a single drive path spline. | 724 |
| `editor_drivePathEditor_splineMgr.singleSplineEditUndo(drivePathSplineData)` | Handles the undo for a single drive path spline. | 716 |
| `editor_drivePathEditor_splineMgr.splitDrivePathSpline(selectedSplineIdx, selectedNodeIdx)` | Splits the selected drive path spline into two, at the selected node. | 360 |
| `editor_drivePathEditor_splineMgr.transSplineEditRedo(data)` | Handles the redo for trans drive path spline edits. | 744 |
| `editor_drivePathEditor_splineMgr.transSplineEditUndo(data)` | Handles the undo for trans drive path spline edits. | 732 |
| `editor_drivePathEditor_splineMgr.unlinkSpline(spline, vehicle)` | Unlinks the given drive path spline from its vehicle. | 646 |
| `editor_drivePathEditor_splineMgr.updateDirtyDrivePathSplines()` | Updates the geometry of any dirty drive path splines. | 913 |

## Appels vers le moteur (C++)

- `Engine.` `generateUUID`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/drivePathEditor/splineMgr.lua`.*
