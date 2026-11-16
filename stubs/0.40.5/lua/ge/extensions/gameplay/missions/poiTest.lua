---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/missions/poiTest.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Test extension for the point-of-interest (POI) system. It adds a dummy "poiTest" POI on each parking spot defined in the file gameplay/parkingSpotTests.sites.json, and a "Do the Test" button in the POI detail window that only prints "Test Successfull!" to the log. It is only for the game's developers to test gameplay_markerInteraction / rawPois; a modder can use it as a minimal example of a POI provider.
--- Access: extension `gameplay_missions_poiTest`: `extensions.load("gameplay_missions_poiTest")`, then the global `gameplay_missions_poiTest`
---@class gameplay_missions_poiTest
gameplay_missions_poiTest = {}

--- Called when the extension loads: clears the gameplay_markerInteraction cache (clearCache) so that the test POIs appear.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/missions/poiTest.lua:50
function gameplay_missions_poiTest.onExtensionLoaded() end

--- Hook called by the POI system (gameplay_rawPois) when it rebuilds a level's POI list. Adds to `elements` one "poiTest" type POI per parking spot of the test file (fields id, pos, rot, scl, radius=3, visibleInPlayMode, interactableInPlayMode, clusterType, data).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/missions/poiTest.lua:7
---@param levelIdentifier string Level identifier (not used by this function).
---@param elements table POI list to fill (table.insert).
function gameplay_missions_poiTest.onGetRawPoiListForLevel(levelIdentifier, elements) end

--- Hook called when a POI's detail window opens. If one of the elements is of type "poiTest", adds to `promptData` a "Do the Test" button whose action writes "Test Successfull!" to the console.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/missions/poiTest.lua:31
---@param elemData table List of the POI data (`data`) under the cursor / in the cluster.
---@param promptData table List of buttons to complete ({label, buttonText, buttonFun}).
function gameplay_missions_poiTest.onPoiDetailPromptOpening(elemData, promptData) end

