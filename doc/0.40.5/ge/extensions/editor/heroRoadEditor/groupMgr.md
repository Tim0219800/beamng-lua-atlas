# `editor_heroRoadEditor_groupMgr`

*Fichier : `lua/ge/extensions/editor/heroRoadEditor/groupMgr.lua` · VM : Game Engine (GE) · 1883 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_heroRoadEditor_groupMgr` : `extensions.load("editor_heroRoadEditor_groupMgr")`, puis la globale `editor_heroRoadEditor_groupMgr`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_heroRoadEditor_groupMgr.addBarrier(group, t01)` | Adds a placeable barrier segment at normalized position t01 (a guardrail run on one side over a length window). | 1218 |
| `editor_heroRoadEditor_groupMgr.addCrossing(group, t01)` | Adds a pedestrian crossing at normalized position t01. Returns the new crossing. | 1097 |
| `editor_heroRoadEditor_groupMgr.addGroupToGroupArray(group)` | Adds a group to the groups array. | 112 |
| `editor_heroRoadEditor_groupMgr.addJunction(group, t01)` | Adds a junction bell-mouth at normalized position t01. | 1246 |
| `editor_heroRoadEditor_groupMgr.addNewGroup(name)` | Adds a new group. | 557 |
| `editor_heroRoadEditor_groupMgr.addPothole(group, t01)` | Adds a procedural pothole at normalized position t01. Returns the new pothole. Shares the crossing frame/projection/clamp<br> (a pothole sits at a station like a crossing); its along-road extent for the end-clearance clamp is ~2*radius (the diameter). | 1154 |
| `editor_heroRoadEditor_groupMgr.addRepair(group, t01)` | Adds a repair-patch cluster at normalized position t01. Returns the new cluster. Shares the crossing frame/projection/<br> clamp (a cluster sits at a station like a crossing); lengthM is its along-road extent for the end-clearance clamp. | 1122 |
| `editor_heroRoadEditor_groupMgr.addWidening(group, t01)` | Adds a placeable widening at normalized position t01. | 1183 |
| `editor_heroRoadEditor_groupMgr.applyProfilePreset(group, key)` | Applies a profile preset (see profilePresets) to the group. | 219 |
| `editor_heroRoadEditor_groupMgr.barrierDefaults()` |  | 1212 |
| `editor_heroRoadEditor_groupMgr.barrierExtent(b)` | The along-road extent of a barrier segment (its length), used to keep it clear of the road ends. | 1215 |
| `editor_heroRoadEditor_groupMgr.clampCrossingT(group, t01, depthM)` | Clamp a normalized crossing position so the band (+ a small clearance) stays clear of both road ends. With no room<br> (too-short road) the crossing still gets placed at mid-road. | 1023 |
| `editor_heroRoadEditor_groupMgr.clearGroupVisuals(group)` | Drag hide: tear down a group's heavy rendered geometry. | 264 |
| `editor_heroRoadEditor_groupMgr.conformGroupToTerrain(group)` | One-shot 'Drape to Terrain'. | 228 |
| `editor_heroRoadEditor_groupMgr.convertPathsToRoadGroups(paths)` | Converts the given paths (traced from a bitmap) to Road Splines. | 1370 |
| `editor_heroRoadEditor_groupMgr.copyGroupProfile(sourceGroup)` | Copies the layer profile from the given group (only the layers). | 784 |
| `editor_heroRoadEditor_groupMgr.crossingFrame(group, t01)` | World frame of a crossing at normalized t01: centre point + carriageway-edge endpoints (p0 = left, p1 = right of<br> travel). nil if the geometry isn't ready. Drives the placement ghost + drag handles + the zebra span. | 1067 |
| `editor_heroRoadEditor_groupMgr.deepCopyAllGroups()` | Deep copies the full group state. | 1287 |
| `editor_heroRoadEditor_groupMgr.deepCopyGroup(group)` |  | 1275 |
| `editor_heroRoadEditor_groupMgr.deserializeGroup(data, isCreateObject)` | Deserialises a group. `data` is either the editor's buffer-encoded blob (string) or a plain table straight from a JSON<br> session file -- so the same backfill + scene-reconcile path serves both the editor's own serialize and Load Session. | 1417 |
| `editor_heroRoadEditor_groupMgr.deserializeSessionGroup(gt)` | Session-load deserialize. | 1607 |
| `editor_heroRoadEditor_groupMgr.ensureCornerArray(group)` | Keeps the sparse per-corner override array index-aligned with the nodes. | 187 |
| `editor_heroRoadEditor_groupMgr.getCurrentRoadSplineList()` | Returns the current list of Road Splines. | 1796 |
| `editor_heroRoadEditor_groupMgr.getEditModeKey()` | Gets the edit mode key for the road spline tool. | 109 |
| `editor_heroRoadEditor_groupMgr.getGroups()` | Gets the current road splines array. | 100 |
| `editor_heroRoadEditor_groupMgr.getIdToIdxMap()` | Gets the group id -> index map. | 103 |
| `editor_heroRoadEditor_groupMgr.getToolPrefixStr()` | Gets the prefix string for the tool. | 106 |
| `editor_heroRoadEditor_groupMgr.isOneWayProfile(group)` | True when the profile is one-way (a side has zero lanes). | 197 |
| `editor_heroRoadEditor_groupMgr.joinRoadSplines(groupIdx1, nodeIdx1, groupIdx2, nodeIdx2)` | Joins two unlooped road group splines into one, modifying group1 and deleting group2. | 1340 |
| `editor_heroRoadEditor_groupMgr.junctionDefaults()` | Default flare/length/bevel for a new junction bell-mouth (also the slider reset-to values in the UI). | 93 |
| `editor_heroRoadEditor_groupMgr.junctionExtent(j)` | Total along-road extent (m) of a junction mouth: near bevel + throat + far bevel. Used for end-clearance clamping and,<br> via the widening trapezoid mapping, for the mesh flare (widthM=flareM, taperIn=taperOut=bevelM, bayLen=lengthM). | 97 |
| `editor_heroRoadEditor_groupMgr.pasteGroupProfile(targetGroup, profile)` | Pastes a layer profile onto the given group. | 898 |
| `editor_heroRoadEditor_groupMgr.rebuildSurfaceOnly(group)` | Light rebuild for groundmodel painting. | 532 |
| `editor_heroRoadEditor_groupMgr.recomputeIdMap()` | Recompute the group id -> index map (called by the shared session helper after a load appends the loaded roads). | 1615 |
| `editor_heroRoadEditor_groupMgr.recreateAutoGeneratedLayers(group)` | Removes all auto-generated (hidden) layers, then recreates them. | 239 |
| `editor_heroRoadEditor_groupMgr.removeAllGroups(isIncludeDisabled)` | Removes all groups from the session. | 167 |
| `editor_heroRoadEditor_groupMgr.removeBarrier(group, idx)` | Removes the barrier at index idx. | 1238 |
| `editor_heroRoadEditor_groupMgr.removeCrossing(group, idx)` | Removes the crossing at index idx. | 1113 |
| `editor_heroRoadEditor_groupMgr.removeGroup(idx)` | Removes the group at the given index. | 135 |
| `editor_heroRoadEditor_groupMgr.removeJunction(group, idx)` | Removes the junction at index idx. | 1268 |
| `editor_heroRoadEditor_groupMgr.removeLinkedRoadSpline(splineId)` | Removes a linked road spline by ID (called from master spline layer removal). | 159 |
| `editor_heroRoadEditor_groupMgr.removePothole(group, idx)` | Removes the pothole at index idx. | 1175 |
| `editor_heroRoadEditor_groupMgr.removeRepair(group, idx)` | Removes the repair cluster at index idx. | 1145 |
| `editor_heroRoadEditor_groupMgr.removeWidening(group, idx)` | Removes the widening at index idx. | 1205 |
| `editor_heroRoadEditor_groupMgr.serializeGroup(group)` | Serialises a group. | 1404 |
| `editor_heroRoadEditor_groupMgr.serializeGroupToTable(group)` | One group as a clean, portable plain table (deep-copied through the buffer codec so the LIVE group is never mutated). | 1583 |
| `editor_heroRoadEditor_groupMgr.setFixedWidth(group, width)` | Sets the width of the group to a fixed value at every node. | 539 |
| `editor_heroRoadEditor_groupMgr.setLaneProfile(group, lanesLeft, lanesRight, laneWidthM)` | Sets the lane profile (lane counts + optional lane width) and marks the group dirty so widths/markings rebuild. | 547 |
| `editor_heroRoadEditor_groupMgr.singleGroupEditRedo(data)` |  | 1774 |
| `editor_heroRoadEditor_groupMgr.singleGroupEditUndo(data)` | Handles the undo/redo for single group edits. | 1772 |
| `editor_heroRoadEditor_groupMgr.splitGroup(group, groupIdx, selectedNodeIdx)` | Splits the given group at the selected node index. | 1296 |
| `editor_heroRoadEditor_groupMgr.syncProfileWidth(group)` | Derives the carriageway width from the lane profile. | 204 |
| `editor_heroRoadEditor_groupMgr.tForPointOnGroup(group, p, depthM)` | Normalized crossing position for a world point projected onto the road (clamped clear of the ends). Used while<br> dragging a crossing handle. nil if no ribbon. | 1059 |
| `editor_heroRoadEditor_groupMgr.transGroupEditRedo(groupsData)` |  | 1793 |
| `editor_heroRoadEditor_groupMgr.transGroupEditUndo(groupsData)` | Handles the undo/redo for trans-group edits. | 1791 |
| `editor_heroRoadEditor_groupMgr.updateDirtyGroups(dragging)` | Updates the dirty groups. | 402 |
| `editor_heroRoadEditor_groupMgr.wideningDefaults()` | Default width/bay/taper for a new widening (also the slider reset-to values in the UI). | 87 |
| `editor_heroRoadEditor_groupMgr.wideningExtent(w)` | Total along-road extent (m) of a widening: entry taper + full-width bay + exit taper. Used for end-clearance clamping. | 90 |

## Champs

| Champ | Type | Description |
|---|---|---|
| `defaultCrossingDepthM` | number | Public interface. |
| `defaultPotholeRadiusM` | number |  |
| `defaultRepairLengthM` | number |  |

## Appels vers le moteur (C++)

- `Engine.` `generateUUID`
- `FS:` `fileExists`
- `be:` `reloadCollision`
- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/heroRoadEditor/groupMgr.lua`.*
