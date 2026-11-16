# `gameplay_rawPois`

*File: `lua/ge/extensions/gameplay/rawPois.lua` · VM: Game Engine (GE) · 197 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `gameplay_rawPois`: `extensions.load("gameplay_rawPois")`, then the global `gameplay_rawPois`

Cache of "raw" points of interest (POI) per level. It collects POIs by emitting the hook `onGetRawPoiListForLevel(levelIdentifier, elements)` to all extensions, filters the list according to context (career/tutorial, test drive, delivery, discovery tutorials, multiseat) and caches the result with a generation number. A modder who adds POIs implements the hook in their extension and adds their elements to the received table.

## Example

```lua
-- in an extension
M.onGetRawPoiListForLevel = function(level, elements)
  table.insert(elements, {id = 'monPoi', data = {type = 'monType', id = 'monPoi'}, clusterType = 'x', markerInfo = {}})
end
```

## Notes

- A valid element must have `data` with `id` or `missionId`, a `clusterType`, and `markerInfo`; the standard filter loop accesses e.markerInfo.bigmapMarker without checking markerInfo, so an element without markerInfo causes an error.
- validateRawPoiElement is defined but never called; it does not set valid to false when clusterType is missing (only the log reports the problem).
- With multiseat active, only elements with a markerInfo[type].multiseat == true are kept. A multiseat state change clears the cache.
- In career on west_coast_usa: during the tutorial, only the onGetRawPoiListForTutorial hook is used; before the starter vehicle is purchased, only POIs of type dealership, inspectVehicle and computer are returned (not cached).
- The bigmapMarker.cluster field is true by default when not defined.
- If a type whitelist is active (test drive: testDriveEnd; delivery: deliveryTargetArea, deliveryVehicle; discovery tutorials: tutorialLesson, firstDriveDestination...), only those types (or whitelisted mission ids) are kept.

## Functions

| Function | Description | Line |
|---|---|---|
| `gameplay_rawPois.clear()` | Clears the POI cache of all levels and increments the generation number (consumers thus detect that they must reload). | 11 |
| `gameplay_rawPois.getRawPoiGeneration()` | Current generation number of the cache (after synchronizing the multiseat state). | 188 |
| `gameplay_rawPois.getRawPoiListByLevel(levelIdentifier)` | Returns the filtered POI list of a level, building it (hook onGetRawPoiListForLevel) if it is not cached. | 75 |

### Parameter details

#### `gameplay_rawPois.getRawPoiGeneration()`

Current generation number of the cache (after synchronizing the multiseat state).

- **returns**: integer Generation.

#### `gameplay_rawPois.getRawPoiListByLevel(levelIdentifier)`

Returns the filtered POI list of a level, building it (hook onGetRawPoiListForLevel) if it is not cached.

- `levelIdentifier` (*string|nil*) : Level identifier; if nil, returns an empty list.
- **returns**: table[] List of POI elements.
- **returns**: integer Generation number.

## Fields

| Field | Type | Description |
|---|---|---|
| `onModManagerReady` | function | Alias of clear: the cache is cleared when the mod manager is ready. |
| `showMissionMarkersToggled` | function | Alias of clear: the cache is cleared when the mission marker display changes. |

## Emitted hooks

Events broadcast to extensions by `extensions.hook`:

- `onGetRawPoiListForLevel` — listened to by 15 module(s)
- `onGetRawPoiListForTutorial` — listened to by 4 module(s)

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/gameplay/rawPois.lua`.*
