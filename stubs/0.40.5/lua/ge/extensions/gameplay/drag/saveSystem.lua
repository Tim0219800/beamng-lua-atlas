---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/drag/saveSystem.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `gameplay_drag_saveSystem` : `extensions.load("gameplay_drag_saveSystem")`, puis la globale `gameplay_drag_saveSystem`
---@class gameplay_drag_saveSystem
---@field DEFAULT_TIMERS table
gameplay_drag_saveSystem = {}

--- Converts legacy drag strip format to current strip/lanes/waypoints structure.
---  legacyData: table in old format
---Source : lua/ge/extensions/gameplay/drag/saveSystem.lua:415
---@param legacyData any
function gameplay_drag_saveSystem.convertLegacyData(legacyData) end

--- Loads dial times once per session. Legacy history is moved out of the pretty JSON file so later finishes do not rewrite it.
---Source : lua/ge/extensions/gameplay/drag/saveSystem.lua:614
function gameplay_drag_saveSystem.ensureDialCache() end

--- Generates a stable hash from the vehicle's config file for dial/history keys.
---  vehicleId: vehicle ID (defaults to player vehicle)
---Source : lua/ge/extensions/gameplay/drag/saveSystem.lua:723
---@param vehicleId any
function gameplay_drag_saveSystem.generateHashFromFile(vehicleId) end

--- Returns all lanes from all strips in current level.
---Source : lua/ge/extensions/gameplay/drag/saveSystem.lua:887
function gameplay_drag_saveSystem.getAllLanes() end

--- Returns all strip data from current level.
---Source : lua/ge/extensions/gameplay/drag/saveSystem.lua:870
function gameplay_drag_saveSystem.getAllStrips() end

--- Returns path to current level's dragstrips folder, or nil.
---Source : lua/ge/extensions/gameplay/drag/saveSystem.lua:261
function gameplay_drag_saveSystem.getCurrentLevelDragPath() end

--- Returns current career save path, or empty string.
---Source : lua/ge/extensions/gameplay/drag/saveSystem.lua:752
function gameplay_drag_saveSystem.getCurrentSavePath() end

--- Returns dial times keyed by config hash.
---Source : lua/ge/extensions/gameplay/drag/saveSystem.lua:706
function gameplay_drag_saveSystem.getDialTimes() end

--- Returns history entries from dial times. Optionally filters by drag settings id / strip file id on this level.
---Source : lua/ge/extensions/gameplay/drag/saveSystem.lua:770
---@param id any
function gameplay_drag_saveSystem.getHistory(id) end

--- Returns up to `count` saved timeslips across all strips, newest first.
---Source : lua/ge/extensions/gameplay/drag/saveSystem.lua:851
---@param count any
function gameplay_drag_saveSystem.getRecentHistory(count) end

--- Canonical scenetree name for a lane waypoint. Uses _wp_ so types like "stage" never collide with tree lights (<stripId>_stage_<lane>).
---Source : lua/ge/extensions/gameplay/drag/saveSystem.lua:118
---@param stripId any
---@param wpType any
---@param laneIndex any
function gameplay_drag_saveSystem.laneWaypointSceneName(stripId, wpType, laneIndex) end

--- Loads full drag race data from a strip file path (strip + lanes, waypoints, phases).
---  stripId: path to the strip JSON file
---Source : lua/ge/extensions/gameplay/drag/saveSystem.lua:267
---@param stripId any
function gameplay_drag_saveSystem.loadCompleteDragRaceData(stripId) end

--- Loads drag strip data from file path. Supports modular (stripId + dragSettings) and legacy format.
---  filepath: path to JSON file
---Source : lua/ge/extensions/gameplay/drag/saveSystem.lua:375
---@param filepath any
function gameplay_drag_saveSystem.loadDragStripData(filepath) end

--- Spawns prefabs from data.prefabs into the scene.
---  data: drag data with prefabs table
---Source : lua/ge/extensions/gameplay/drag/saveSystem.lua:919
---@param data any
function gameplay_drag_saveSystem.loadPrefabs(data) end

---Source : lua/ge/extensions/gameplay/drag/saveSystem.lua:867
function gameplay_drag_saveSystem.onCareerActive() end

--- Hook: saves dial file when save slot changes.
---  currentSavePath: path to current save directory
---Source : lua/ge/extensions/gameplay/drag/saveSystem.lua:863
---@param currentSavePath any
function gameplay_drag_saveSystem.onSaveCurrentProfile(currentSavePath) end

--- Precomputes each lane's AI stopping point once, at drag data setup time, instead of walking the
---  navgraph on every AI racer's stop phase. Only needed as a fallback when the strip has no explicit
---  strip-level drag_stop waypoint; skipped entirely otherwise.
---Source : lua/ge/extensions/gameplay/drag/saveSystem.lua:239
---@param dragData any
function gameplay_drag_saveSystem.resolveAutoStopWaypoints(dragData) end

--- Copies dial times to a save directory.
---  dir: target directory path
---Source : lua/ge/extensions/gameplay/drag/saveSystem.lua:758
---@param dir any
function gameplay_drag_saveSystem.saveDialFile(dir) end

--- Saves dial times and optional timeslip history for playable racers.
---  dragData: current drag data, timeslip: optional timeslip table to save to history
---Source : lua/ge/extensions/gameplay/drag/saveSystem.lua:650
---@param dragData any
---@param timeslip any
function gameplay_drag_saveSystem.saveDialTimes(dragData, timeslip) end

---Source : lua/ge/extensions/gameplay/drag/saveSystem.lua:915
---@param lane any
---@param filePath any
function gameplay_drag_saveSystem.saveLane(lane, filePath) end

---Source : lua/ge/extensions/gameplay/drag/saveSystem.lua:901
---@param strip any
---@param filePath any
function gameplay_drag_saveSystem.saveStrip(strip, filePath) end

--- Resolves BeamNGWaypoints: lane entries use <stripId>_wp_<type>_<lane>; strip-level use <stripId>_<type>.
---Source : lua/ge/extensions/gameplay/drag/saveSystem.lua:158
---@param dragData any
function gameplay_drag_saveSystem.syncDragStripWaypointsWithSceneTree(dragData) end

--- Removes prefabs from the scene and clears prefabId on data.
---  data: drag data with prefabs table
---Source : lua/ge/extensions/gameplay/drag/saveSystem.lua:938
---@param data any
function gameplay_drag_saveSystem.unloadPrefabs(data) end

