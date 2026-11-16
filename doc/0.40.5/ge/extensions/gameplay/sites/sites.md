# `gameplay_sites_sites`

*File: `lua/ge/extensions/gameplay/sites/sites.lua` · VM: Game Engine (GE) · 233 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/gameplay/sites/sites")` (file under extensions/ but not a regular extension)

"Sites" class: container of a *.sites.json file. Groups three sorted lists (locations, zones, parkingSpots), tag indexes and spatial trees (kd-trees) for position queries. The module returns a constructor; it is usually obtained via gameplay_sites_sitesManager.loadSites. After loading, finalizeSites() computes the zone/location/spot links and the indexes.

## Example

```lua
local sites = gameplay_sites_sitesManager.loadSites(path)
local list = sites:getRadialParkingSpots(pos, 0, 50)
for _, e in ipairs(list) do print(e.ps.name, math.sqrt(e.squaredDistance)) end
```

## Notes

- The _uid identifier counter is local to the module and shared by all sites objects: identifiers are globally unique, not per file.
- onDeserialized clears locations and zones but not parkingSpots before reloading.
- Radial queries work in 2D (z ignored); the returned distances are squared.
- Spatial queries (getRadial*, getClosestParkingSpot, getZonesForPosition) only work after finalizeSites().

## Class `C`

Sites object. Fields: name, description, id, locations / zones / parkingSpots (gameplay/util/sortedList, with .sorted and .objects), tags, sortedTags, tagsToZones, tagsToLocations, quadtreeLocations, quadtreeZones, quadtreeParkingSpots, dir, filename.

The module returns a constructor: `local obj = require("gameplay_sites_sites")(options)`.

| Method | Description | Line |
|---|---|---|
| `C:drawDebug()` | Draws all locations, zones and parking spots in debug. | 26 |
| `C:finalizeSites()` | To call after loading. Generates multiple spots, sorts, builds the name and tag indexes, attaches locations and spots to the zones that contain them (2D test) and builds the kd-trees. | 59 |
| `C:getClosestParkingSpot(pos)` | Parking spot closest to pos (3D kd-tree). | 173 |
| `C:getNextUniqueIdentifier()` | Increments and returns the global counter of sites object identifiers. | 11 |
| `C:getRadialLocations(pos, minRadius, maxRadius)` | Lists the locations whose 2D distance to pos is between minRadius and maxRadius. | 135 |
| `C:getRadialParkingSpots(pos, minRadius, maxRadius)` | Lists the parking spots whose 2D distance to pos is between minRadius and maxRadius. | 155 |
| `C:getTagsForZonesAtPosition(pos)` | Gathers the tags of all zones that contain pos. | 209 |
| `C:getZonesForPosition(pos)` | Zones whose 2D outline contains pos. | 178 |
| `C:init(name)` | Constructor: creates the three sorted lists and a default name "Sites". | 16 |
| `C:onDeserialized(data, oldIdMap)` | Reloads the sites set from a serialized table (literal "\n" in the description become real line breaks). | 45 |
| `C:onSerialize()` | Serializes name, description, the three lists, dir and filename. | 32 |
| `C:zonesForPositionIterator(pos, ctx)` | Generic iterator over the zones containing pos, to use in a for: for id, zone in sites:zonesForPositionIterator(pos) do. Avoids allocating a table; ctx can be reused. | 201 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/gameplay/sites/sites.lua`.*
