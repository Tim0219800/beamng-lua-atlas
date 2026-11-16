---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/drag/saveSystem.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Loading and saving of drag data. Reads the tracks (*.strip.json and *.dragSettings.json files, or old format converted), rebuilds lanes, waypoints, zones and timers, synchronizes the waypoints with the BeamNGWaypoint objects of the scene, precomputes the AI stop point, and spawns/removes the prefabs (tree, signs, decorations, paths). Also manages the player's files: best times per vehicle (dial book) and slip history, in the user's settings/ folder.
--- Access: extension `gameplay_drag_saveSystem`: `extensions.load("gameplay_drag_saveSystem")`, then the global `gameplay_drag_saveSystem`
---@class gameplay_drag_saveSystem
---@field DEFAULT_TIMERS table[] Default timers of a track: {id, label, labelKey, shortLabel, type = 'distanceTimer'|'velocity', distance (m), important}.
gameplay_drag_saveSystem = {}

--- Converts the old track format (stripInfo, strip.lanes) into the current structure (strip, lanes, waypoints), adds the default timers and synchronizes the waypoints with the scene.
---Source: lua/ge/extensions/gameplay/drag/saveSystem.lua:415
---@param legacyData table Data in the old format.
---@return table|nil  Converted data, nil if legacyData is nil.
function gameplay_drag_saveSystem.convertLegacyData(legacyData) end

--- Loads the dial book once per session (settings/dragDialTimes.json, .jsonl history, best times overlay) and migrates the old history out of the main JSON.
---Source: lua/ge/extensions/gameplay/drag/saveSystem.lua:614
---@return table  Cache keyed by vehicle config hash ({time_1_4, ..., history}).
function gameplay_drag_saveSystem.ensureDialCache() end

--- Stable hash of the vehicle's config (hash of the .pc file) serving as the key for dial and history; cached. Returns 'vehicle_<id>' if the details or the file are unavailable.
---Source: lua/ge/extensions/gameplay/drag/saveSystem.lua:723
---@param vehicleId integer|nil Vehicle ID (default: player 0's vehicle).
---@return string  Hash or fallback key.
function gameplay_drag_saveSystem.generateHashFromFile(vehicleId) end

--- All the lanes of all the tracks (*.strip.json) of the current level, with _stripId and _stripName added.
---Source: lua/ge/extensions/gameplay/drag/saveSystem.lua:887
---@return table[]  Lanes.
function gameplay_drag_saveSystem.getAllLanes() end

--- Raw data of all the *.strip.json tracks of the current level's dragstrips folder (with _filePath).
---Source: lua/ge/extensions/gameplay/drag/saveSystem.lua:870
---@return table[]  Tracks.
function gameplay_drag_saveSystem.getAllStrips() end

--- Path /levels/<level>/dragstrips/ of the current level.
---Source: lua/ge/extensions/gameplay/drag/saveSystem.lua:261
---@return string|nil  Path, nil (E log) if the level is unknown.
function gameplay_drag_saveSystem.getCurrentLevelDragPath() end

--- Current career save path.
---Source: lua/ge/extensions/gameplay/drag/saveSystem.lua:752
---@return string  Path, empty string outside career.
function gameplay_drag_saveSystem.getCurrentSavePath() end

--- Best times per config hash, without the history; time_1_4 is at least 10 by default.
---Source: lua/ge/extensions/gameplay/drag/saveSystem.lua:706
---@return table<string, table>  Table hash to {time_1_4, other timers}.
function gameplay_drag_saveSystem.getDialTimes() end

--- History of the recorded slips. With id, filters on the matching track of the current level (by dragSettings id, file name or strip id).
---Source: lua/ge/extensions/gameplay/drag/saveSystem.lua:770
---@param id string|nil Track/facility identifier; nil = whole history.
---@return table  {history = tickets[]}.
function gameplay_drag_saveSystem.getHistory(id) end

--- The last count slips across all tracks, from most recent to oldest (stripInfo.timestamp).
---Source: lua/ge/extensions/gameplay/drag/saveSystem.lua:851
---@param count integer Maximum number of slips.
---@return table[]  Slips.
function gameplay_drag_saveSystem.getRecentHistory(count) end

--- Canonical name in the scene of a lane waypoint: <stripId>_wp_<type>_<lane> (the "_wp_" avoids collision with the tree lights).
---Source: lua/ge/extensions/gameplay/drag/saveSystem.lua:118
---@param stripId string Track identifier.
---@param wpType string Waypoint type (stage, endLine...).
---@param laneIndex integer Lane index.
---@return string  Object name.
function gameplay_drag_saveSystem.laneWaypointSceneName(stripId, wpType, laneIndex) end

--- Loads a full track from a .strip.json file: lanes (waypoints, boundary, zone, stageToEndNormalized), track waypoints, track zone, default phases/prefabs/timers; then synchronizes with the scene.
---Source: lua/ge/extensions/gameplay/drag/saveSystem.lua:267
---@param stripId string Path of the strip JSON file.
---@return table|nil  Full data, nil (E log) on read failure.
function gameplay_drag_saveSystem.loadCompleteDragRaceData(stripId) end

--- Loads a track settings file: modular format (stripId field pointing to a .strip.json, plus dragType, context, phases, prefabs, timers) or old format converted by convertLegacyData.
---Source: lua/ge/extensions/gameplay/drag/saveSystem.lua:375
---@param filepath string Path of the JSON file (.dragSettings.json).
---@return table|nil  Track data or nil.
function gameplay_drag_saveSystem.loadDragStripData(filepath) end

--- Spawns in the scene the prefabs in use from data.prefabs (christmasTree, displaySign, decorations, paths) at the origin and stores their prefabId.
---Source: lua/ge/extensions/gameplay/drag/saveSystem.lua:919
---@param data table Track data with prefabs[key] = {isUsed, path, treeType}.
function gameplay_drag_saveSystem.loadPrefabs(data) end

--- Career activated hook; does nothing.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/drag/saveSystem.lua:867
function gameplay_drag_saveSystem.onCareerActive() end

--- Hook: when the profile is saved, copies the dial book into the save folder (saveDialFile).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/drag/saveSystem.lua:863
---@param currentSavePath string|nil Current save folder.
function gameplay_drag_saveSystem.onSaveCurrentProfile(currentSavePath) end

--- Precomputes for each lane the name of the navigation node where the AI must stop (lane.autoStopName), more than 350 m from the finish line. Does nothing if the track has a drag_stop waypoint or if the graph does not exist.
---Source: lua/ge/extensions/gameplay/drag/saveSystem.lua:239
---@param dragData table Track data.
function gameplay_drag_saveSystem.resolveAutoStopWaypoints(dragData) end

--- Writes the dial book to <dir>/dragDialTimes.json.
---Source: lua/ge/extensions/gameplay/drag/saveSystem.lua:758
---@param dir string Target folder.
---@return boolean  Write success.
function gameplay_drag_saveSystem.saveDialFile(dir) end

--- For each playable racer, updates its best time (important timer) if beaten, and adds the slip to the history (memory and .jsonl file, with configHash per driver). Writes settings/dragDialBest.json if a record changes.
---Source: lua/ge/extensions/gameplay/drag/saveSystem.lua:650
---@param dragData table Current race data.
---@param timeslip table|nil Slip to record in the history.
function gameplay_drag_saveSystem.saveDialTimes(dragData, timeslip) end

--- Writes a lane as JSON (human-readable formatting).
---Source: lua/ge/extensions/gameplay/drag/saveSystem.lua:915
---@param lane table Lane.
---@param filePath string Target file.
---@return boolean  Success.
function gameplay_drag_saveSystem.saveLane(lane, filePath) end

--- Writes a track as JSON after renaming each lane's waypoints according to laneWaypointSceneName.
---Source: lua/ge/extensions/gameplay/drag/saveSystem.lua:901
---@param strip table Track (id, lanes with waypoints[] having a type).
---@param filePath string Target file.
---@return boolean  Success.
function gameplay_drag_saveSystem.saveStrip(strip, filePath) end

--- For each lane and track waypoint, finds the scene's BeamNGWaypoint by its canonical name, renames it if needed, re-reads its position/rotation/scale, and computes lane.stageToEndNormalized. Rebuilds the navigation graph (map.reset) if a rename took place.
---Source: lua/ge/extensions/gameplay/drag/saveSystem.lua:158
---@param dragData table Track data (strip.id required).
function gameplay_drag_saveSystem.syncDragStripWaypointsWithSceneTree(dragData) end

--- Removes the prefabs in use from the scene (by prefabId) and clears prefabId.
---Source: lua/ge/extensions/gameplay/drag/saveSystem.lua:938
---@param data table Track data with prefabs.
function gameplay_drag_saveSystem.unloadPrefabs(data) end

