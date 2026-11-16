# `editor_roadArchitect_decals`

*File: `lua/ge/extensions/editor/roadArchitect/decals.lua` · VM: Game Engine (GE) · 508 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_roadArchitect_decals`: `extensions.load("editor_roadArchitect_decals")`, then the global `editor_roadArchitect_decals`

Road Architect decal management. For a given road, creates a "decal set": invisible DecalRoads (road_invisible material) per section of road_lane type lanes, used for the navigation graph, plus the visual layers (road, centerline, edges, lane dividers, start/end junction lines) placed as DecalRoads or decal instances via the editor. It keeps the asphalt sections, decals and templates in memory by road name, and can remove everything from the scene.

## Notes

- Editor module: uses the global editor object (editor.addRoadNode, editor.addDecalInstanceWithTan, editor.deleteDecalInstance) and createObject('DecalRoad'), so it is only usable with the world editor loaded.
- DecalRoad nodes are raised by 4.2 m in z (raised) and nodes less than 1 m from the previous one are skipped.
- For sections with positive lanes only, the node order is reversed.
- removeTemplates must be called after all decal instances have been removed (tryRemoveAll respects this order).

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_roadArchitect_decals.createDecal(road, folder)` | Creates the decal set of a road: computes the road_lane sections, creates a DecalRoad for each (if road.isDrivable) with left/right lanes, one-way and drivability 1, then the visual layers enabled by the user. The created objects are added to the given folder. | 91 |
| `editor_roadArchitect_decals.removeTemplates()` | Deletes all decal templates (the instances must already have been deleted) and empties the template tables. | 477 |
| `editor_roadArchitect_decals.tryRemove(name)` | Tries to remove the decal set with this name from the scene: deletes the main DecalRoads, the DecalRoad layers and the decal instances, then empties the associated tables. No effect if the name is unknown. | 447 |
| `editor_roadArchitect_decals.tryRemoveAll()` | Removes all known decal sets from the scene (asphalt, then decals), empties the tables, then deletes the templates. | 488 |

### Parameter details

#### `editor_roadArchitect_decals.createDecal(road, folder)`

Creates the decal set of a road: computes the road_lane sections, creates a DecalRoad for each (if road.isDrivable) with left/right lanes, one-way and drivability 1, then the visual layers enabled by the user. The created objects are added to the given folder.

- `road` (*table*) : Road Architect road (name, profile, renderData, isDrivable, isOverObject...).
- `folder` (*any*) : Folder object (SimGroup) in the scene receiving the created DecalRoads (inferred from code: calls folder:addObject).

#### `editor_roadArchitect_decals.tryRemove(name)`

Tries to remove the decal set with this name from the scene: deletes the main DecalRoads, the DecalRoad layers and the decal instances, then empties the associated tables. No effect if the name is unknown.

- `name` (*string*) : Name of the road whose decals are removed.

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/roadArchitect/decals.lua`.*
