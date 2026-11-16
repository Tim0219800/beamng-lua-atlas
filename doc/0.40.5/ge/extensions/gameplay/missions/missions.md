# `gameplay_missions_missions`

*File: `lua/ge/extensions/gameplay/missions/missions.lua` · VM: Game Engine (GE) · 1315 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `gameplay_missions_missions`: `extensions.load("gameplay_missions_missions")`, then the global `gameplay_missions_missions`

Central registry of BeamNG missions. It discovers file missions (folders /gameplay/missions/<level>/<type>/.../info.json) and procedural missions (generators in the proceduralMissionGenerators folder), loads them, sanitizes them, builds the mission object with its type's constructor (/gameplay/missionTypes/<type>/constructor.lua), loads the progress save, and provides the missions' POIs for the map. A modder uses it to list, find, create or save missions.

## Example

```lua
local m = gameplay_missions_missions.getMissionById('west_coast_usa/timeTrial/xyz')
for _, mi in ipairs(gameplay_missions_missions.getMissionsOfLevel('gridmap_v2')) do print(mi.id, mi.missionType) end
```

## Notes

- A mission's id is the folder path minus the /gameplay/missions/ prefix. The part before the first "/" must be a known level (case-insensitive comparison), otherwise the mission is ignored with a warning. The path must not contain spaces.
- getAllMissions loads all missions of all levels on the first call (expensive); getMissionsOfLevel / getMissionById load only what is requested. getAllMissions also fills the per-level cache.
- A mission type is a folder /gameplay/missionTypes/<type>/ containing constructor.lua (required), and optionally editor.lua, progressSetup.json, staticData.json, preview.jpg.
- A mission-specific constructor.lua (<mission folder>/constructor.lua) can merge its keys (except init) into the mission object.
- sanitizeMissionAfterCreation replaces missing methods (onStart, onUpdate, onStop, stateChanged, getCommonSettingsData, etc.) with nop, computes the star cache (careerSetup._activeStarCache) and adds the mod info (modID, modName, modTitle).
- The tables returned by getMissionById / getAllMissions are cached and shared: do not modify them without clearCache.
- Probable bug in createMission: `table.insert(loaded, data)` adds the data table as a positional element of the loaded mission (the intent was probably to merge it).
- In constructMissionFromFileData, `infoPath` is computed with the module's local variable missionDir (the string "/gameplay/missions") and not the mission folder: the path shown in the "did not specify a valid missionType" error message is therefore wrong.
- getAllIdsOfLevel exists locally but is not exported.
- M.editorHelper actually returns the editor/util/editorElementHelper class (with the 'mission' parameter), not the file missionTypes/editorHelper.lua.

**Dependencies (loaded first):** `gameplay_missions_startTrigger`, `gameplay_missions_progress`, `gameplay_rawPois`

## Functions

| Function | Description | Line |
|---|---|---|
| `gameplay_missions_missions.areAllMissionsLoaded()` | Indicates whether getAllMissions has already been run. | 1024 |
| `gameplay_missions_missions.baseMission(C, ...)` | Shortcut to the missionTypes/baseMission factory: to be used in the constructor.lua of a simple mission type. | 1311 |
| `gameplay_missions_missions.clearCache()` | Clears all registry caches (missions, file data, locations, available levels): missions will be reread on next access. | 1298 |
| `gameplay_missions_missions.createMission(id, data)` | Creates and saves a new mission in /gameplay/missions/<id> with default values (flowgraph type, level-type startTrigger on gridmap, vehicleDriven startCondition), then reloads it and adds it to the caches. | 855 |
| `gameplay_missions_missions.editorHelper(C, ...)` | Shortcut to the editor/util/editorElementHelper factory preconfigured with the 'mission' context; used to write the editor of a mission type. | 1313 |
| `gameplay_missions_missions.existsMission(id)` | Tests whether a mission exists without loading it (valid level and id present in the level's info list). | 1289 |
| `gameplay_missions_missions.flowMission(C, ...)` | Shortcut to the missionTypes/flowMission factory: to be used in the constructor.lua of a flowgraph mission type. | 1312 |
| `gameplay_missions_missions.formatMissionToRawPoi(m, elements, levelIdentifier)` | Adds to `elements` one POI per "coordinates" start zone of the mission in the given level, if the mission is startable and visible (gameplay_missions_unlocks). The id is the mission id, suffixed with -<i> if there are several zones. | 1113 |
| `gameplay_missions_missions.getAdditionalAttributes()` | Returns the displayable additional attributes (vehicle: own/provided/choice/multi/none; difficulty: veryLow to veryHigh) with icon and translation keys. | 75 |
| `gameplay_missions_missions.getAllIds()` | Returns the ids of all missions (without loading them), sorted. | 1028 |
| `gameplay_missions_missions.getAllMissions()` | Returns all missions of all levels, sorted by id. Expensive on the first call (loads everything); updates the progress of util_asyncBulkLoader if it is active. | 999 |
| `gameplay_missions_missions.getFilesData(skipThumbnail)` | Returns the raw data (sanitized info.json, or procedural missions) of all missions, sorted by id, with a separate cache depending on skipThumbnail. | 834 |
| `gameplay_missions_missions.getLocations(mission)` | Returns (with cache) the start zones of a mission via gameplay_missions_startTrigger.parseMission, adding mission and name. | 1071 |
| `gameplay_missions_missions.getMissionById(id, infoData)` | Returns the constructed mission object for an id (with cache), or nil if it does not exist or its construction fails. | 967 |
| `gameplay_missions_missions.getMissionEditorForType(missionTypeName)` | Returns the mission editor of the type (require of <type>/editor.lua then call). If it does not exist, creates a default editor based on editorHelper. Used by logMissionIssues and by the editor. | 157 |
| `gameplay_missions_missions.getMissionPreviewFilepath(missionData)` | Looks for preview.jpg/png/jpeg in the mission folder, then in the mission type folder; otherwise returns the default preview. | 189 |
| `gameplay_missions_missions.getMissionProgressSetupData(missionTypeName)` | Reads and caches progressSetup.json of the mission type ({} if it does not exist or is unreadable). | 118 |
| `gameplay_missions_missions.getMissionStaticData(missionTypeName)` | Reads and caches staticData.json of the mission type ({} by default). | 138 |
| `gameplay_missions_missions.getMissionTypeConstructor(missionTypeName)` | Loads (require) and caches the constructor of a mission type. Logs an error and returns nil if the file is not found. | 98 |
| `gameplay_missions_missions.getMissionTypeFromMissionId(missionId)` | Extracts the mission type from an id: the second path segment (after the level), or an empty string. | 701 |
| `gameplay_missions_missions.getMissionTypes()` | Lists the mission types (names of the /gameplay/missionTypes folders containing constructor.lua). Result cached. | 83 |
| `gameplay_missions_missions.getMissionsByFilter(filters)` | Filters all missions by level (startTrigger.level) and/or by missionType. | 1046 |
| `gameplay_missions_missions.getMissionsByMissionType(type)` | Filters all missions by their missionType. | 1036 |
| `gameplay_missions_missions.getMissionsOfLevel(levelIdentifier)` | Returns all constructed missions of a level, sorted by id (with cache). | 980 |
| `gameplay_missions_missions.getNoPreviewFilepath()` | Default preview image path: /ui/images/noPreview.jpg. | 185 |
| `gameplay_missions_missions.getNoThumbFilepath()` | Default thumbnail path: /ui/images/noThumb.jpg. | 186 |
| `gameplay_missions_missions.getNoVehicleThumbFilepath()` | Path of the "player vehicle" thumbnail: /ui/images/playerVehicle.jpg. | 187 |
| `gameplay_missions_missions.getRecommendedAttributesList()` | List of possible recommended attributes for a mission: durability, offroading, rock crawling, acceleration, top speed, nimble. | 11 |
| `gameplay_missions_missions.loadMission(missionDir, skipThumbnail)` | Loads a mission from its folder (info.json) without cache: checks that the folder is under /gameplay/missions/ and has no spaces, sets id and missionFolder, sanitizes the data. This is the raw data, not the constructed mission object. | 581 |
| `gameplay_missions_missions.logMissionIssues(mission)` | Computes (only once) then logs the list of configuration issues of a mission, via its type's editor (checkContainer and calculateMissionIssues). Severities: unknown, minor, warning, error, critical. | 1213 |
| `gameplay_missions_missions.onActivityAcceptGatherData(elemData, activityData)` | Hook called when the player opens an activity's acceptance window: for each "mission" type POI, adds a card (title, stars, additional attributes, "see details" button that opens mission.details). *(internal)* *(hook)* | 1145 |
| `gameplay_missions_missions.onExtensionLoaded()` | Loads (require) all generators from the proceduralMissionGenerators folder; those without generate get nop. *(internal)* *(hook)* | 1093 |
| `gameplay_missions_missions.onGetRawPoiListForLevel(levelIdentifier, elements)` | POI system hook: adds the POIs of all missions of the level (current level if nil). *(internal)* *(hook)* | 1134 |
| `gameplay_missions_missions.recursiveRemoveNestedFromCondition(mId, cond)` | Recursively cleans a condition: converts an old branchId of a branchLevel condition to the new format (career_branches.oldAttributeNamesToNewNames) and removes "nested" from conditions that are not multiAnd/multiOr (warning). | 347 |
| `gameplay_missions_missions.reloadCompleteMissionSystem()` | Immediately stops the current mission, clears the caches of gameplay_markerInteraction, unlocks and missions (development tool). | 1272 |
| `gameplay_missions_missions.sanitizeMissionAfterCreation(mission)` | Completes the mission after construction: official, date, mod info, default map icon (mission_primary_triangle), active star cache, rewards (rewardAmount nil -> 0 with an error logged) and default methods (nop) or default hints. | 272 |
| `gameplay_missions_missions.saveMission(missionData, newFolder)` | Writes info.json (indented) for the mission data: name, description, missionType, retryBehaviour, startCondition, visibleCondition, startTrigger, missionTypeData, careerSetup (without _activeStarCache, with the original rewards restored), setupModules, etc. | 617 |

### Parameter details

#### `gameplay_missions_missions.areAllMissionsLoaded()`

Indicates whether getAllMissions has already been run.

- **returns**: boolean true if the full list is cached.

#### `gameplay_missions_missions.baseMission(C, ...)`

Shortcut to the missionTypes/baseMission factory: to be used in the constructor.lua of a simple mission type.

- `C` (*table*) : Derived class of the type.
- `...` (*any*) : Options (mission data).
- **returns**: table Mission.
- **returns**: any Value returned by init.

#### `gameplay_missions_missions.createMission(id, data)`

Creates and saves a new mission in /gameplay/missions/<id> with default values (flowgraph type, level-type startTrigger on gridmap, vehicleDriven startCondition), then reloads it and adds it to the caches.

- `id` (*string*) : Mission id (level/type/name).
- `data` (*table|nil*) : Initial data.
- **returns**: table Loaded mission data.

#### `gameplay_missions_missions.editorHelper(C, ...)`

Shortcut to the editor/util/editorElementHelper factory preconfigured with the 'mission' context; used to write the editor of a mission type.

- `C` (*table*) : Derived editor class.
- `...` (*any*) : Options.
- **returns**: table Editor.

#### `gameplay_missions_missions.existsMission(id)`

Tests whether a mission exists without loading it (valid level and id present in the level's info list).

- `id` (*string*) : Mission id.
- **returns**: boolean true if it exists.

#### `gameplay_missions_missions.flowMission(C, ...)`

Shortcut to the missionTypes/flowMission factory: to be used in the constructor.lua of a flowgraph mission type.

- `C` (*table*) : Derived class of the type.
- `...` (*any*) : Options (mission data).
- **returns**: table Mission.
- **returns**: any Value returned by init.

#### `gameplay_missions_missions.formatMissionToRawPoi(m, elements, levelIdentifier)`

Adds to `elements` one POI per "coordinates" start zone of the mission in the given level, if the mission is startable and visible (gameplay_missions_unlocks). The id is the mission id, suffixed with -<i> if there are several zones.

- `m` (*table*) : Mission.
- `elements` (*table*) : POI list to complete.
- `levelIdentifier` (*string*) : Level concerned.

#### `gameplay_missions_missions.getAdditionalAttributes()`

Returns the displayable additional attributes (vehicle: own/provided/choice/multi/none; difficulty: veryLow to veryHigh) with icon and translation keys.

- **returns**: table Table key -> {valuesSorted, valuesByKey, icon, label, translationKey}.
- **returns**: string[] Sorted keys: {"vehicle","difficulty"}.

#### `gameplay_missions_missions.getAllIds()`

Returns the ids of all missions (without loading them), sorted.

- **returns**: string[] Ids.

#### `gameplay_missions_missions.getAllMissions()`

Returns all missions of all levels, sorted by id. Expensive on the first call (loads everything); updates the progress of util_asyncBulkLoader if it is active.

- **returns**: table[] Missions.

#### `gameplay_missions_missions.getFilesData(skipThumbnail)`

Returns the raw data (sanitized info.json, or procedural missions) of all missions, sorted by id, with a separate cache depending on skipThumbnail.

- `skipThumbnail` (*boolean|nil*) : true for a lighter list without thumbnails.
- **returns**: table[] List of mission data.

#### `gameplay_missions_missions.getLocations(mission)`

Returns (with cache) the start zones of a mission via gameplay_missions_startTrigger.parseMission, adding mission and name.

- `mission` (*table*) : Built mission.
- **returns**: table[] Locations {type, level, pos, rot, radius, check, displayMarker, mission, name}.

#### `gameplay_missions_missions.getMissionById(id, infoData)`

Returns the constructed mission object for an id (with cache), or nil if it does not exist or its construction fails.

- `id` (*string*) : Mission id.
- `infoData` (*table|nil*) : Already-known info {dir|data, level, procedural} to avoid the lookup.
- **returns**: table|nil Mission.

#### `gameplay_missions_missions.getMissionEditorForType(missionTypeName)`

Returns the mission editor of the type (require of <type>/editor.lua then call). If it does not exist, creates a default editor based on editorHelper. Used by logMissionIssues and by the editor.

- `missionTypeName` (*string*) : Type name.
- **returns**: table Editor object.

#### `gameplay_missions_missions.getMissionPreviewFilepath(missionData)`

Looks for preview.jpg/png/jpeg in the mission folder, then in the mission type folder; otherwise returns the default preview.

- `missionData` (*table*) : Mission data (missionFolder, missionType).
- **returns**: string Image path.

#### `gameplay_missions_missions.getMissionProgressSetupData(missionTypeName)`

Reads and caches progressSetup.json of the mission type ({} if it does not exist or is unreadable).

- `missionTypeName` (*string*) : Type name.
- **returns**: table Progress configuration data.

#### `gameplay_missions_missions.getMissionStaticData(missionTypeName)`

Reads and caches staticData.json of the mission type ({} by default).

- `missionTypeName` (*string*) : Type name.
- **returns**: table Static data of the type.

#### `gameplay_missions_missions.getMissionTypeConstructor(missionTypeName)`

Loads (require) and caches the constructor of a mission type. Logs an error and returns nil if the file is not found.

- `missionTypeName` (*string*) : Type name (folder).
- **returns**: function|nil Mission factory of the type.

#### `gameplay_missions_missions.getMissionTypeFromMissionId(missionId)`

Extracts the mission type from an id: the second path segment (after the level), or an empty string.

- `missionId` (*string*) : Mission id.
- **returns**: string Mission type.

#### `gameplay_missions_missions.getMissionTypes()`

Lists the mission types (names of the /gameplay/missionTypes folders containing constructor.lua). Result cached.

- **returns**: string[] Type names.

#### `gameplay_missions_missions.getMissionsByFilter(filters)`

Filters all missions by level (startTrigger.level) and/or by missionType.

- `filters` (*table|nil*) : {level=string, missionType=string}.
- **returns**: table[] Matching missions.

#### `gameplay_missions_missions.getMissionsByMissionType(type)`

Filters all missions by their missionType.

- `type` (*string*) : Mission type.
- **returns**: table[] Missions of this type.

#### `gameplay_missions_missions.getMissionsOfLevel(levelIdentifier)`

Returns all constructed missions of a level, sorted by id (with cache).

- `levelIdentifier` (*string*) : Level identifier.
- **returns**: table[] Missions of the level.

#### `gameplay_missions_missions.getNoPreviewFilepath()`

Default preview image path: /ui/images/noPreview.jpg.

- **returns**: string Path.

#### `gameplay_missions_missions.getNoThumbFilepath()`

Default thumbnail path: /ui/images/noThumb.jpg.

- **returns**: string Path.

#### `gameplay_missions_missions.getNoVehicleThumbFilepath()`

Path of the "player vehicle" thumbnail: /ui/images/playerVehicle.jpg.

- **returns**: string Path.

#### `gameplay_missions_missions.getRecommendedAttributesList()`

List of possible recommended attributes for a mission: durability, offroading, rock crawling, acceleration, top speed, nimble.

- **returns**: string[] Attribute names.

#### `gameplay_missions_missions.loadMission(missionDir, skipThumbnail)`

Loads a mission from its folder (info.json) without cache: checks that the folder is under /gameplay/missions/ and has no spaces, sets id and missionFolder, sanitizes the data. This is the raw data, not the constructed mission object.

- `missionDir` (*string*) : Mission folder, starting with /gameplay/missions/.
- `skipThumbnail` (*boolean|nil*) : true to not resolve the thumbnail.
- **returns**: table|nil Mission data, or nil on error.

#### `gameplay_missions_missions.logMissionIssues(mission)`

Computes (only once) then logs the list of configuration issues of a mission, via its type's editor (checkContainer and calculateMissionIssues). Severities: unknown, minor, warning, error, critical.

- `mission` (*table*) : Mission (receives the _issueList field).

#### `gameplay_missions_missions.onActivityAcceptGatherData(elemData, activityData)`

Hook called when the player opens an activity's acceptance window: for each "mission" type POI, adds a card (title, stars, additional attributes, "see details" button that opens mission.details).

- `elemData` (*table*) : Data of the POIs concerned.
- `activityData` (*table*) : List of cards to complete.

#### `gameplay_missions_missions.onGetRawPoiListForLevel(levelIdentifier, elements)`

POI system hook: adds the POIs of all missions of the level (current level if nil).

- `levelIdentifier` (*string|nil*) : Level; nil = current level.
- `elements` (*table*) : POI list to complete.

#### `gameplay_missions_missions.recursiveRemoveNestedFromCondition(mId, cond)`

Recursively cleans a condition: converts an old branchId of a branchLevel condition to the new format (career_branches.oldAttributeNamesToNewNames) and removes "nested" from conditions that are not multiAnd/multiOr (warning).

- `mId` (*string*) : Mission id (for logs).
- `cond` (*table*) : Condition to clean (modified in place).

#### `gameplay_missions_missions.sanitizeMissionAfterCreation(mission)`

Completes the mission after construction: official, date, mod info, default map icon (mission_primary_triangle), active star cache, rewards (rewardAmount nil -> 0 with an error logged) and default methods (nop) or default hints.

- `mission` (*table*) : Constructed mission object (modified in place).

#### `gameplay_missions_missions.saveMission(missionData, newFolder)`

Writes info.json (indented) for the mission data: name, description, missionType, retryBehaviour, startCondition, visibleCondition, startTrigger, missionTypeData, careerSetup (without _activeStarCache, with the original rewards restored), setupModules, etc.

- `missionData` (*table*) : Mission data.
- `newFolder` (*string|nil*) : Target folder; defaults to missionData.missionFolder.

## Fields

| Field | Type | Description |
|---|---|---|
| `dependencies` | string[] | Extensions loaded beforehand: gameplay_missions_startTrigger, gameplay_missions_progress, gameplay_rawPois. |
| `onModManagerReady` | function | Alias of clearCache: the registry is cleared when the mod manager is ready (hook). Static analysis typed it as "any". |

**UI events (guihooks.trigger):** `MenuOpenModule`

## Calls into the engine (C++)

- `FS:` `fileExists`, `findFiles`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/gameplay/missions/missions.lua`.*
