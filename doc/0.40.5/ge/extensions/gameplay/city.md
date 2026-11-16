# `gameplay_city`

*File: `lua/ge/extensions/gameplay/city.lua` · VM: Game Engine (GE) · 140 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `gameplay_city`: `extensions.load("gameplay_city")`, then the global `gameplay_city`

Extension that loads the current level's city.sites.json file (via gameplay_sites_sitesManager) and offers queries on its zones and parking spots: highest-priority zone at a position, merged values of zones' custom fields, and drawing of two distant parking spots. A zone's priority is the custom field 'priority' (0 by default). The sites are loaded at level start and freed at the end.

## Example

```lua
local zone = gameplay_city.getHighestPrioZone(getPlayerVehicle(0):getPosition())
```

## Notes

- loadSites() with no argument uses the folder of getMissionFilename() + 'city.sites.json'; nothing is loaded if the file does not exist.
- getMergedFieldsFromZones does ipairs(getHighestPrioZone(pos)), but that function returns a single zone (non-array table) or nil: ipairs on nil causes an error and on a zone iterates nothing useful. Probable game bug.
- getRandomParkingSpots uses sites directly without a nil test; it crashes if no sites are loaded.
- Zone fields are read with the suffixes '', '1', '2', '3', '4' (up to 5 groups per zone).

**Dependencies (loaded first):** `gameplay_sites_sitesManager`

## Functions

| Function | Description | Line |
|---|---|---|
| `gameplay_city.getHighestPrioZone(pos)` | Returns the first highest-priority zone that contains the position. | 30 |
| `gameplay_city.getMergedFieldsFromZones(pos, fieldName)` | Should return the unique, sorted values of the custom fields fieldName (with suffixes '' to '4') of the highest-priority zone at the position. See notes: the implementation iterates over the result of getHighestPrioZone. | 47 |
| `gameplay_city.getRandomParkingSpots(minDist, startName)` | Draws two parking spots at random whose distance is at least minDist, and gives the highest-priority zone of each. | 61 |
| `gameplay_city.getSites()` | Returns the currently loaded sites object. | 112 |
| `gameplay_city.getZonesByPrioForPosition(pos)` | Groups the zones containing the position by priority. | 13 |
| `gameplay_city.loadSites(file)` | Loads a sites file via sitesManager.loadSites. With no argument, loads the current level's city.sites.json (unless already loaded). | 97 |
| `gameplay_city.onClientEndMission(levelPath)` | Hook called at the end of a level: calls reset(). *(internal)* *(hook)* | 124 |
| `gameplay_city.onClientStartMission(levelPath)` | Hook called when a level starts: loads the default sites. *(internal)* *(hook)* | 120 |
| `gameplay_city.reset()` | Forgets the loaded sites (sites = nil). | 116 |

### Parameter details

#### `gameplay_city.getHighestPrioZone(pos)`

Returns the first highest-priority zone that contains the position.

- `pos` (*vec3*) : World position.
- **returns**: table|nil Zone, or nil if no sites loaded or no zone.

#### `gameplay_city.getMergedFieldsFromZones(pos, fieldName)`

Should return the unique, sorted values of the custom fields fieldName (with suffixes '' to '4') of the highest-priority zone at the position. See notes: the implementation iterates over the result of getHighestPrioZone.

- `pos` (*vec3*) : World position.
- `fieldName` (*string*) : Base name of the custom field (e.g. 'vehicleGroup').
- **returns**: table Sorted array of values; empty if pos or fieldName is missing.

#### `gameplay_city.getRandomParkingSpots(minDist, startName)`

Draws two parking spots at random whose distance is at least minDist, and gives the highest-priority zone of each.

- `minDist` (*number|nil*) : Minimum distance in meters (300 by default).
- `startName` (*string|nil*) : Name imposed for the start spot, if it exists.
- **returns**: string|nil Start spot name.
- **returns**: string End spot name.
- **returns**: string Start zone name.
- **returns**: string End zone name.

#### `gameplay_city.getSites()`

Returns the currently loaded sites object.

- **returns**: table|nil Sites object, or nil.

#### `gameplay_city.getZonesByPrioForPosition(pos)`

Groups the zones containing the position by priority.

- `pos` (*vec3*) : World position.
- **returns**: table<number, table[]> Dictionary priority -> list of zones (the key -math.huge always exists, with an empty list).
- **returns**: number Highest priority found (-math.huge if none).

#### `gameplay_city.loadSites(file)`

Loads a sites file via sitesManager.loadSites. With no argument, loads the current level's city.sites.json (unless already loaded).

- `file` (*string|nil*) : Path of the .sites.json file.

#### `gameplay_city.onClientEndMission(levelPath)`

Hook called at the end of a level: calls reset().

- `levelPath` (*string*) : Level path.

#### `gameplay_city.onClientStartMission(levelPath)`

Hook called when a level starts: loads the default sites.

- `levelPath` (*string*) : Level path.

## Fields

| Field | Type | Description |
|---|---|---|
| `dependencies` | table<integer, string> | Extensions loaded before: {"gameplay_sites_sitesManager"}. |

## Calls into the engine (C++)

- `FS:` `fileExists`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/gameplay/city.lua`.*
