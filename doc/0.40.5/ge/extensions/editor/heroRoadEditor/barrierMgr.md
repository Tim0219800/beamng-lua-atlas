# `editor_heroRoadEditor_barrierMgr`

*File: `lua/ge/extensions/editor/heroRoadEditor/barrierMgr.lua` · VM: Game Engine (GE) · 182 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_heroRoadEditor_barrierMgr`: `extensions.load("editor_heroRoadEditor_barrierMgr")`, then the global `editor_heroRoadEditor_barrierMgr`

Manager of the roadside furniture (guardrails, fences, lampposts) of a Hero Road Editor group. It reads the group's mesh edges (meshEdgeL/R, meshEdgeDirL/R, meshEdgeUp) and places pieces via editor/toolUtilities/roadsideProps (transient pools identified by id..'bL', 'fL', 'lL'...). It handles the rails of the whole road (Furniture tab) and the placed barrier segments (Features tab, group.barriers).

## Notes

- Vertical offset (burial) per barrier type: guardrail -0.35 m, jersey 0.0, plastic -0.15 m; added to the segment's zOffsetM.
- Group defaults: barrierOffsetM 0.5, fenceOffsetM 0.7, lampOffsetM 1.0 (meters, lateral offset outward from the edge).
- The types are 'none' if absent; 'none' places nothing. The lampposts are anchored at both ends (lockEnds) with spacing group.lampSpacingM.
- A baked road no longer has pieces in the pools: counts then returns 0.

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_heroRoadEditor_barrierMgr.burnGroup(group)` | "Burn": makes the current pieces persistent (canSave=true) via props.commitPool and detaches them from the transient pools. Returns the manifest of names, which exportMgr stores during the bake. | 159 |
| `editor_heroRoadEditor_barrierMgr.counts(group)` | Number of pieces currently placed for the group, per category, both sides combined. Reads the transient pools (so the editable preview). | 146 |
| `editor_heroRoadEditor_barrierMgr.removeGroup(group)` | Removes all the furniture placed for the group (teardown or fewer than 2 nodes). | 131 |
| `editor_heroRoadEditor_barrierMgr.updateGroup(group)` | (Re)builds the group's barriers, fences and lampposts from the current mesh edges and the selections. Called after the mesh is rebuilt; does nothing if the group has no scenetree folder (sceneTreeFolderId). | 111 |

### Parameter details

#### `editor_heroRoadEditor_barrierMgr.burnGroup(group)`

"Burn": makes the current pieces persistent (canSave=true) via props.commitPool and detaches them from the transient pools. Returns the manifest of names, which exportMgr stores during the bake.

- `group` (*table*) : Hero Road group.
- **returns**: table Array of identifiers/names of created scene objects (empty if the group is invalid).

#### `editor_heroRoadEditor_barrierMgr.counts(group)`

Number of pieces currently placed for the group, per category, both sides combined. Reads the transient pools (so the editable preview).

- `group` (*table*) : Hero Road group.
- **returns**: integer Number of barriers.
- **returns**: integer Number of fences.
- **returns**: integer Number of lampposts.

#### `editor_heroRoadEditor_barrierMgr.removeGroup(group)`

Removes all the furniture placed for the group (teardown or fewer than 2 nodes).

- `group` (*table*) : Hero Road group.

#### `editor_heroRoadEditor_barrierMgr.updateGroup(group)`

(Re)builds the group's barriers, fences and lampposts from the current mesh edges and the selections. Called after the mesh is rebuilt; does nothing if the group has no scenetree folder (sceneTreeFolderId).

- `group` (*table*) : Hero Road group (id, sceneTreeFolderId, meshEdgeL/R, barrierLeftType, fenceLeftType, lampLeftType, barriers...).

## Calls into the engine (C++)

- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/heroRoadEditor/barrierMgr.lua`.*
