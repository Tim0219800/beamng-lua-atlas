# `gameplay_missions_poiTest`

*File: `lua/ge/extensions/gameplay/missions/poiTest.lua` · VM: Game Engine (GE) · 56 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `gameplay_missions_poiTest`: `extensions.load("gameplay_missions_poiTest")`, then the global `gameplay_missions_poiTest`

Test extension for the point-of-interest (POI) system. It adds a dummy "poiTest" POI on each parking spot defined in the file gameplay/parkingSpotTests.sites.json, and a "Do the Test" button in the POI detail window that only prints "Test Successfull!" to the log. It is only for the game's developers to test gameplay_markerInteraction / rawPois; a modder can use it as a minimal example of a POI provider.

## Example

```lua
-- Minimal example of a POI provider (same structure as poiTest)
local function onGetRawPoiListForLevel(levelIdentifier, elements)
  table.insert(elements, {id='monPoi', pos=vec3(0,0,0), rot=quat(0,0,0,1), scl=vec3(1,1,1), radius=3, visibleInPlayMode=true, interactableInPlayMode=true, clusterType='parkingMarker', data={type='monPoi', id='monPoi', name='Mon POI'}})
end
```

## Notes

- The sites file gameplay/parkingSpotTests.sites.json is loaded via gameplay_sites_sitesManager.loadSites on every call of onGetRawPoiListForLevel; if it does not exist, accessing .parkingSpots.sorted may raise an error (inferred from code).
- Each POI created has the id "Test-PS-<parking spot id>", a radius of 3 and clusterType "parkingMarker".
- On load, onExtensionLoaded clears the gameplay_markerInteraction cache to force the POI list to be rebuilt.

## Functions

| Function | Description | Line |
|---|---|---|
| `gameplay_missions_poiTest.onExtensionLoaded()` | Called when the extension loads: clears the gameplay_markerInteraction cache (clearCache) so that the test POIs appear. *(internal)* *(hook)* | 50 |
| `gameplay_missions_poiTest.onGetRawPoiListForLevel(levelIdentifier, elements)` | Hook called by the POI system (gameplay_rawPois) when it rebuilds a level's POI list. Adds to `elements` one "poiTest" type POI per parking spot of the test file (fields id, pos, rot, scl, radius=3, visibleInPlayMode, interactableInPlayMode, clusterType, data). *(internal)* *(hook)* | 7 |
| `gameplay_missions_poiTest.onPoiDetailPromptOpening(elemData, promptData)` | Hook called when a POI's detail window opens. If one of the elements is of type "poiTest", adds to `promptData` a "Do the Test" button whose action writes "Test Successfull!" to the console. *(internal)* *(hook)* | 31 |

### Parameter details

#### `gameplay_missions_poiTest.onGetRawPoiListForLevel(levelIdentifier, elements)`

Hook called by the POI system (gameplay_rawPois) when it rebuilds a level's POI list. Adds to `elements` one "poiTest" type POI per parking spot of the test file (fields id, pos, rot, scl, radius=3, visibleInPlayMode, interactableInPlayMode, clusterType, data).

- `levelIdentifier` (*string*) : Level identifier (not used by this function).
- `elements` (*table*) : POI list to fill (table.insert).

#### `gameplay_missions_poiTest.onPoiDetailPromptOpening(elemData, promptData)`

Hook called when a POI's detail window opens. If one of the elements is of type "poiTest", adds to `promptData` a "Do the Test" button whose action writes "Test Successfull!" to the console.

- `elemData` (*table*) : List of the POI data (`data`) under the cursor / in the cluster.
- `promptData` (*table*) : List of buttons to complete ({label, buttonText, buttonFun}).

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/gameplay/missions/poiTest.lua`.*
