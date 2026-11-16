# `gameplay_markers_invisibleTrigger`

*File: `lua/ge/extensions/gameplay/markers/invisibleTrigger.lua` · VM: Game Engine (GE) · 104 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `gameplay_markers_invisibleTrigger`: `extensions.load("gameplay_markers_invisibleTrigger")`, then the global `gameplay_markers_invisibleTrigger`

Invisible spherical trigger: from an invisibleTrigger POI (pos, radius, onEnter, onInside, onExit), calls the Lua callbacks when a player's vehicle enters the sphere, stays in it, or leaves it. The inside/outside state is tracked per player (multiseat) and kept by cluster id. The module returns {create, cluster}. Useful for gameplay triggers without any visual.

## Example

```lua
-- POI providing markerInfo.invisibleTrigger
markerInfo = { invisibleTrigger = {
  pos = vec3(0,0,0), radius = 10,
  onEnter = function(interactData) log('I','', 'enters') end,
  onExit  = function(interactData) log('I','', 'exits') end
}}
```

## Notes

- The callbacks receive interactData: vehPos, isWalking, playerIndex (0 if absent), etc.
- Nothing is triggered when the player is walking (isWalking); the inside/outside state is then not updated.
- The insideByCluster state is kept across marker recreations (POI regeneration) so as not to retrigger onEnter for a player already inside; hide() clears this state for the cluster.
- Cluster: one per POI, id 'invisibleTrigger#<poi.id>', visibilityRadius = 0, showOnMinimap = false.

## Functions

| Function | Description | Line |
|---|---|---|
| `gameplay_markers_invisibleTrigger.cluster(pois, allClusters)` | Turns each invisibleTrigger POI into a distinct cluster (no merging) and adds it to allClusters. *(internal)* | 81 |
| `gameplay_markers_invisibleTrigger.create(...)` | Builds an invisible trigger marker (instance of C). | 72 |

### Parameter details

#### `gameplay_markers_invisibleTrigger.cluster(pois, allClusters)`

Turns each invisibleTrigger POI into a distinct cluster (no merging) and adds it to allClusters.

- `pois` (*table[]*) : POIs with markerInfo.invisibleTrigger {pos, radius, onEnter, onInside, onExit}.
- `allClusters` (*table[]*) : List of clusters completed in place.

#### `gameplay_markers_invisibleTrigger.create(...)`

Builds an invisible trigger marker (instance of C).

- `...` (*any*) : Arguments passed to C:init (unused).
- **returns**: table Marker instance.

## Class `C`

Spherical trigger without visual.

| Method | Description | Line |
|---|---|---|
| `C:clearObjects()` | Does nothing. | 68 |
| `C:createObjects()` | Does nothing. | 60 |
| `C:hide()` | Clears the inside/outside state of all players for this cluster. | 63 |
| `C:init()` | Does nothing. | 11 |
| `C:instantFade(visible)` | Does nothing. | 70 |
| `C:interactInPlayMode(interactData, interactableElements)` | Does nothing. | 23 |
| `C:interactWhileMoving(interactData)` | Called every frame: if the player's vehicle is in the sphere, calls onEnter (on the first frame inside) then onInside; when leaving, calls onExit. | 24 |
| `C:setHidden(value)` | Does nothing. | 61 |
| `C:setup(cluster)` | Stores cluster, pos, radius and the three callbacks; links the per-player inside/outside state to that of the cluster id. | 48 |
| `C:show()` | Does nothing. | 62 |
| `C:update(data)` | Does nothing (the debug drawing is commented out). | 14 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/gameplay/markers/invisibleTrigger.lua`.*
