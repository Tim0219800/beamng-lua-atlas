---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/missions/missions.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Central registry of BeamNG missions. It discovers file missions (folders /gameplay/missions/<level>/<type>/.../info.json) and procedural missions (generators in the proceduralMissionGenerators folder), loads them, sanitizes them, builds the mission object with its type's constructor (/gameplay/missionTypes/<type>/constructor.lua), loads the progress save, and provides the missions' POIs for the map. A modder uses it to list, find, create or save missions.
--- Access: extension `gameplay_missions_missions`: `extensions.load("gameplay_missions_missions")`, then the global `gameplay_missions_missions`
---@class gameplay_missions_missions
---@field dependencies string[] Extensions loaded beforehand: gameplay_missions_startTrigger, gameplay_missions_progress, gameplay_rawPois.
---@field onModManagerReady function Alias of clearCache: the registry is cleared when the mod manager is ready (hook). Static analysis typed it as "any".
gameplay_missions_missions = {}

--- Indicates whether getAllMissions has already been run.
---Source: lua/ge/extensions/gameplay/missions/missions.lua:1024
---@return boolean  true if the full list is cached.
function gameplay_missions_missions.areAllMissionsLoaded() end

--- Shortcut to the missionTypes/baseMission factory: to be used in the constructor.lua of a simple mission type.
---Source: lua/ge/extensions/gameplay/missions/missions.lua:1311
---@param C table Derived class of the type.
---@param ... any Options (mission data).
---@return table  Mission.
---@return any  Value returned by init.
function gameplay_missions_missions.baseMission(C, ...) end

--- Clears all registry caches (missions, file data, locations, available levels): missions will be reread on next access.
---Source: lua/ge/extensions/gameplay/missions/missions.lua:1298
function gameplay_missions_missions.clearCache() end

--- Creates and saves a new mission in /gameplay/missions/<id> with default values (flowgraph type, level-type startTrigger on gridmap, vehicleDriven startCondition), then reloads it and adds it to the caches.
---Source: lua/ge/extensions/gameplay/missions/missions.lua:855
---@param id string Mission id (level/type/name).
---@param data table|nil Initial data.
---@return table  Loaded mission data.
function gameplay_missions_missions.createMission(id, data) end

--- Shortcut to the editor/util/editorElementHelper factory preconfigured with the 'mission' context; used to write the editor of a mission type.
---Source: lua/ge/extensions/gameplay/missions/missions.lua:1313
---@param C table Derived editor class.
---@param ... any Options.
---@return table  Editor.
function gameplay_missions_missions.editorHelper(C, ...) end

--- Tests whether a mission exists without loading it (valid level and id present in the level's info list).
---Source: lua/ge/extensions/gameplay/missions/missions.lua:1289
---@param id string Mission id.
---@return boolean  true if it exists.
function gameplay_missions_missions.existsMission(id) end

--- Shortcut to the missionTypes/flowMission factory: to be used in the constructor.lua of a flowgraph mission type.
---Source: lua/ge/extensions/gameplay/missions/missions.lua:1312
---@param C table Derived class of the type.
---@param ... any Options (mission data).
---@return table  Mission.
---@return any  Value returned by init.
function gameplay_missions_missions.flowMission(C, ...) end

--- Adds to `elements` one POI per "coordinates" start zone of the mission in the given level, if the mission is startable and visible (gameplay_missions_unlocks). The id is the mission id, suffixed with -<i> if there are several zones.
---Source: lua/ge/extensions/gameplay/missions/missions.lua:1113
---@param m table Mission.
---@param elements table POI list to complete.
---@param levelIdentifier string Level concerned.
function gameplay_missions_missions.formatMissionToRawPoi(m, elements, levelIdentifier) end

--- Returns the displayable additional attributes (vehicle: own/provided/choice/multi/none; difficulty: veryLow to veryHigh) with icon and translation keys.
---Source: lua/ge/extensions/gameplay/missions/missions.lua:75
---@return table  Table key -> {valuesSorted, valuesByKey, icon, label, translationKey}.
---@return string[]  Sorted keys: {"vehicle","difficulty"}.
function gameplay_missions_missions.getAdditionalAttributes() end

--- Returns the ids of all missions (without loading them), sorted.
---Source: lua/ge/extensions/gameplay/missions/missions.lua:1028
---@return string[]  Ids.
function gameplay_missions_missions.getAllIds() end

--- Returns all missions of all levels, sorted by id. Expensive on the first call (loads everything); updates the progress of util_asyncBulkLoader if it is active.
---Source: lua/ge/extensions/gameplay/missions/missions.lua:999
---@return table[]  Missions.
function gameplay_missions_missions.getAllMissions() end

--- Returns the raw data (sanitized info.json, or procedural missions) of all missions, sorted by id, with a separate cache depending on skipThumbnail.
---Source: lua/ge/extensions/gameplay/missions/missions.lua:834
---@param skipThumbnail boolean|nil true for a lighter list without thumbnails.
---@return table[]  List of mission data.
function gameplay_missions_missions.getFilesData(skipThumbnail) end

--- Returns (with cache) the start zones of a mission via gameplay_missions_startTrigger.parseMission, adding mission and name.
---Source: lua/ge/extensions/gameplay/missions/missions.lua:1071
---@param mission table Built mission.
---@return table[]  Locations {type, level, pos, rot, radius, check, displayMarker, mission, name}.
function gameplay_missions_missions.getLocations(mission) end

--- Returns the constructed mission object for an id (with cache), or nil if it does not exist or its construction fails.
---Source: lua/ge/extensions/gameplay/missions/missions.lua:967
---@param id string Mission id.
---@param infoData table|nil Already-known info {dir|data, level, procedural} to avoid the lookup.
---@return table|nil  Mission.
function gameplay_missions_missions.getMissionById(id, infoData) end

--- Returns the mission editor of the type (require of <type>/editor.lua then call). If it does not exist, creates a default editor based on editorHelper. Used by logMissionIssues and by the editor.
---Source: lua/ge/extensions/gameplay/missions/missions.lua:157
---@param missionTypeName string Type name.
---@return table  Editor object.
function gameplay_missions_missions.getMissionEditorForType(missionTypeName) end

--- Looks for preview.jpg/png/jpeg in the mission folder, then in the mission type folder; otherwise returns the default preview.
---Source: lua/ge/extensions/gameplay/missions/missions.lua:189
---@param missionData table Mission data (missionFolder, missionType).
---@return string  Image path.
function gameplay_missions_missions.getMissionPreviewFilepath(missionData) end

--- Reads and caches progressSetup.json of the mission type ({} if it does not exist or is unreadable).
---Source: lua/ge/extensions/gameplay/missions/missions.lua:118
---@param missionTypeName string Type name.
---@return table  Progress configuration data.
function gameplay_missions_missions.getMissionProgressSetupData(missionTypeName) end

--- Reads and caches staticData.json of the mission type ({} by default).
---Source: lua/ge/extensions/gameplay/missions/missions.lua:138
---@param missionTypeName string Type name.
---@return table  Static data of the type.
function gameplay_missions_missions.getMissionStaticData(missionTypeName) end

--- Loads (require) and caches the constructor of a mission type. Logs an error and returns nil if the file is not found.
---Source: lua/ge/extensions/gameplay/missions/missions.lua:98
---@param missionTypeName string Type name (folder).
---@return function|nil  Mission factory of the type.
function gameplay_missions_missions.getMissionTypeConstructor(missionTypeName) end

--- Extracts the mission type from an id: the second path segment (after the level), or an empty string.
---Source: lua/ge/extensions/gameplay/missions/missions.lua:701
---@param missionId string Mission id.
---@return string  Mission type.
function gameplay_missions_missions.getMissionTypeFromMissionId(missionId) end

--- Lists the mission types (names of the /gameplay/missionTypes folders containing constructor.lua). Result cached.
---Source: lua/ge/extensions/gameplay/missions/missions.lua:83
---@return string[]  Type names.
function gameplay_missions_missions.getMissionTypes() end

--- Filters all missions by level (startTrigger.level) and/or by missionType.
---Source: lua/ge/extensions/gameplay/missions/missions.lua:1046
---@param filters table|nil {level=string, missionType=string}.
---@return table[]  Matching missions.
function gameplay_missions_missions.getMissionsByFilter(filters) end

--- Filters all missions by their missionType.
---Source: lua/ge/extensions/gameplay/missions/missions.lua:1036
---@param type string Mission type.
---@return table[]  Missions of this type.
function gameplay_missions_missions.getMissionsByMissionType(type) end

--- Returns all constructed missions of a level, sorted by id (with cache).
---Source: lua/ge/extensions/gameplay/missions/missions.lua:980
---@param levelIdentifier string Level identifier.
---@return table[]  Missions of the level.
function gameplay_missions_missions.getMissionsOfLevel(levelIdentifier) end

--- Default preview image path: /ui/images/noPreview.jpg.
---Source: lua/ge/extensions/gameplay/missions/missions.lua:185
---@return string  Path.
function gameplay_missions_missions.getNoPreviewFilepath() end

--- Default thumbnail path: /ui/images/noThumb.jpg.
---Source: lua/ge/extensions/gameplay/missions/missions.lua:186
---@return string  Path.
function gameplay_missions_missions.getNoThumbFilepath() end

--- Path of the "player vehicle" thumbnail: /ui/images/playerVehicle.jpg.
---Source: lua/ge/extensions/gameplay/missions/missions.lua:187
---@return string  Path.
function gameplay_missions_missions.getNoVehicleThumbFilepath() end

--- List of possible recommended attributes for a mission: durability, offroading, rock crawling, acceleration, top speed, nimble.
---Source: lua/ge/extensions/gameplay/missions/missions.lua:11
---@return string[]  Attribute names.
function gameplay_missions_missions.getRecommendedAttributesList() end

--- Loads a mission from its folder (info.json) without cache: checks that the folder is under /gameplay/missions/ and has no spaces, sets id and missionFolder, sanitizes the data. This is the raw data, not the constructed mission object.
---Source: lua/ge/extensions/gameplay/missions/missions.lua:581
---@param missionDir string Mission folder, starting with /gameplay/missions/.
---@param skipThumbnail boolean|nil true to not resolve the thumbnail.
---@return table|nil  Mission data, or nil on error.
function gameplay_missions_missions.loadMission(missionDir, skipThumbnail) end

--- Computes (only once) then logs the list of configuration issues of a mission, via its type's editor (checkContainer and calculateMissionIssues). Severities: unknown, minor, warning, error, critical.
---Source: lua/ge/extensions/gameplay/missions/missions.lua:1213
---@param mission table Mission (receives the _issueList field).
function gameplay_missions_missions.logMissionIssues(mission) end

--- Hook called when the player opens an activity's acceptance window: for each "mission" type POI, adds a card (title, stars, additional attributes, "see details" button that opens mission.details).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/missions/missions.lua:1145
---@param elemData table Data of the POIs concerned.
---@param activityData table List of cards to complete.
function gameplay_missions_missions.onActivityAcceptGatherData(elemData, activityData) end

--- Loads (require) all generators from the proceduralMissionGenerators folder; those without generate get nop.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/missions/missions.lua:1093
function gameplay_missions_missions.onExtensionLoaded() end

--- POI system hook: adds the POIs of all missions of the level (current level if nil).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/missions/missions.lua:1134
---@param levelIdentifier string|nil Level; nil = current level.
---@param elements table POI list to complete.
function gameplay_missions_missions.onGetRawPoiListForLevel(levelIdentifier, elements) end

--- Recursively cleans a condition: converts an old branchId of a branchLevel condition to the new format (career_branches.oldAttributeNamesToNewNames) and removes "nested" from conditions that are not multiAnd/multiOr (warning).
---Source: lua/ge/extensions/gameplay/missions/missions.lua:347
---@param mId string Mission id (for logs).
---@param cond table Condition to clean (modified in place).
function gameplay_missions_missions.recursiveRemoveNestedFromCondition(mId, cond) end

--- Immediately stops the current mission, clears the caches of gameplay_markerInteraction, unlocks and missions (development tool).
---Source: lua/ge/extensions/gameplay/missions/missions.lua:1272
function gameplay_missions_missions.reloadCompleteMissionSystem() end

--- Completes the mission after construction: official, date, mod info, default map icon (mission_primary_triangle), active star cache, rewards (rewardAmount nil -> 0 with an error logged) and default methods (nop) or default hints.
---Source: lua/ge/extensions/gameplay/missions/missions.lua:272
---@param mission table Constructed mission object (modified in place).
function gameplay_missions_missions.sanitizeMissionAfterCreation(mission) end

--- Writes info.json (indented) for the mission data: name, description, missionType, retryBehaviour, startCondition, visibleCondition, startTrigger, missionTypeData, careerSetup (without _activeStarCache, with the original rewards restored), setupModules, etc.
---Source: lua/ge/extensions/gameplay/missions/missions.lua:617
---@param missionData table Mission data.
---@param newFolder string|nil Target folder; defaults to missionData.missionFolder.
function gameplay_missions_missions.saveMission(missionData, newFolder) end

