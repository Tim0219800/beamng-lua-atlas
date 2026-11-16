# `gameplay_sites_location`

*File: `lua/ge/extensions/gameplay/sites/location.lua` · VM: Game Engine (GE) · 116 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/gameplay/sites/location")` (file under extensions/ but not a regular extension)

"Location" class of a sites set (*.sites.json file): a named map point with a position, a radius and a color. Used to mark places (start, finish, point of interest) in scenarios, missions and traffic. The module returns a constructor: require('/lua/ge/extensions/gameplay/sites/location')(sites, name, forceId).

## Example

```lua
local loc = require('/lua/ge/extensions/gameplay/sites/location')(sitesObj, 'Garage')
loc:set(vec3(0,0,0), 8)
local info = loc:findClosestRoadInfo()
```

## Notes

- Default radius 5 m; default drawMode 'faded'; default sortOrder 999999.
- onDeserialized sets the radius via set(...) then rewrites it with "data.radius or 5"; if data.radius is nil, set() first sets radius to nil before the correction.
- findClosestRoadInfo requires the global map module (returns nil otherwise).

## Class `C`

Location object. Fields: sites, id, name, color (vec3), pos (vec3), radius, customFields (gameplay/util/customFields).

The module returns a constructor: `local obj = require("gameplay_sites_location")(options)`.

| Method | Description | Line |
|---|---|---|
| `C:drawDebug(drawMode, clr)` | Draws a debug sphere (and the name if the mode is not 'faded'). In 'highlight' mode, also draws the closest road. Nothing beyond the view distance (300 m, or the editor preference). | 45 |
| `C:findClosestRoadInfo()` | Looks for the closest road segment via map.findClosestRoad and returns the point projected onto that segment, with the interpolated radius. Nodes a and b are swapped so that a is the closest. | 81 |
| `C:init(sites, name, forceId)` | Constructor called by the module. Takes a unique identifier from the sites object if forceId is absent, default name "Location <id>". | 8 |
| `C:onDeserialized(data)` | Restores name, color, position, radius and custom fields from a serialized table. | 32 |
| `C:onSerialize()` | Returns a serializable table (name, pos, radius, color, oldId, customFields). | 20 |
| `C:set(pos, radius)` | Sets the position and radius of the location. | 40 |

## Calls into the engine (C++)

- `debugDrawer:` `drawCylinder`, `drawSphere`, `drawTextAdvanced`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/gameplay/sites/location.lua`.*
