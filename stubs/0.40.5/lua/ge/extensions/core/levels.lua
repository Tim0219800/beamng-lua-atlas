---@meta
-- tim19Atlas stub generated from lua/ge/extensions/core/levels.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- GE extension `core_levels`: catalog of levels (folders in /levels/), reading of their info.json, and launching a level (startLevel). A modder uses it to list the available maps (including those from mods), find a map's title or preview, or load a map by script. The list is computed once (slow disk read) then cached; the cache is invalidated when a file under /levels/ changes.
--- Access: extension `core_levels`: `extensions.load("core_levels")`, then the global `core_levels`
---@class core_levels
---@field dependencies string[] Extensions loaded before this one: { "freeroam_levelStats" }.
---@field levelsDir string Always '/levels/', kept for compatibility with old scripts.
core_levels = {}

--- Resolves a level file name: returns as is an existing folder, otherwise the expanded file if it exists, otherwise tries the .level.json and .mis variants.
---Source: lua/ge/extensions/core/levels.lua:443
---@param missionFileName string Level path (folder, .mis, .level.json or without extension).
---@return string|nil  Existing path found, or nil (no explicit return).
function core_levels.expandMissionFileName(missionFileName) end

--- Looks up a level by its folder name, case-insensitively.
---Source: lua/ge/extensions/core/levels.lua:246
---@param levelName string Level name (e.g. 'west_coast_usa').
---@return table|nil  The getList entry, or nil if not found.
function core_levels.getLevelByName(levelName) end

--- Extracts the level name from a path of the form '/levels/<name>/...'.
---Source: lua/ge/extensions/core/levels.lua:512
---@param path string Virtual path containing levels/<name>/.
---@return string|nil  Level name, or nil if the pattern does not match.
function core_levels.getLevelName(path) end

--- Returns only the names (levelName) of the levels, in getList order.
---Source: lua/ge/extensions/core/levels.lua:225
---@return string[]  Level folder names.
function core_levels.getLevelNames() end

--- Returns the level folders, each ending with '/'.
---Source: lua/ge/extensions/core/levels.lua:233
---@return string[]  Paths like '/levels/gridmap_v2/'.
function core_levels.getLevelPaths() end

--- Returns the first preview image path of the level. Result cached; writes a line to the log on every computation.
---Source: lua/ge/extensions/core/levels.lua:281
---@param levelName string|nil Level name.
---@return string|nil  Image path, or nil.
function core_levels.getLevelPreview(levelName) end

--- Returns the level's displayable title (title field, otherwise levelName). Result cached.
---Source: lua/ge/extensions/core/levels.lua:256
---@param levelName string|nil Level name; nil returns nil.
---@return string|nil  Title, or nil if the level is unknown.
function core_levels.getLevelTitle(levelName) end

--- Returns the array of all valid levels, sorted by name case-insensitively. Built on the first call (slow, disk access) then cached. Returns {} if /levels/ does not exist.
---Source: lua/ge/extensions/core/levels.lua:74
---@return table[]  List of level infos (enriched info.json, see notes).
function core_levels.getList() end

--- Returns the levels list with the UI statistics provided by freeroam_levelStats.
---Source: lua/ge/extensions/core/levels.lua:567
---@return table  { levels = getList(), uiStats = freeroam_levelStats.getUiStats() }
function core_levels.getListWithStats() end

--- Alias of getLevelNames, kept for compatibility.
---Source: lua/ge/extensions/core/levels.lua:225
---@return string[]  Level folder names.
function core_levels.getSimpleList() end

--- Returns the time-of-day choices offered for the level (taken from core_environment.getDefaultTimeOfDayOptions), only if the level has supportsTimeOfDay. Sorted: values > 0.5 first (ascending), then values <= 0.5 (ascending).
---Source: lua/ge/extensions/core/levels.lua:311
---@param levelName string|nil Level name; nil returns {}.
---@return table[]  Elements { key, value, label }. Empty if unsupported or level unknown.
function core_levels.getTimeOfDayOptions(levelName) end

--- Indicates whether the levels list cache is already built.
---Source: lua/ge/extensions/core/levels.lua:220
---@return boolean  true if getList has already been computed and not invalidated since.
function core_levels.isListLoaded() end

--- Spawns the player vehicle ('thePlayer') chosen via startLevel (or the default vehicle) at the 'player' spawn point, adds it to MissionCleanup and MissionGroup and marks it canSave = false. Called by the level loading flow.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/levels.lua:382
function core_levels.maybeSpawnDefaultVehicle() end

--- Hook called after a level starts on the client side: regenerates all DecalRoads in the scene.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/levels.lua:434
function core_levels.onClientPostStartMission() end

--- Hook called when files change. If a path starts with '/levels/', clears all caches and sends the list back to the interface (onLevelsChanged).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/levels.lua:359
---@param files table[] Elements with a filename field.
function core_levels.onFilesChanged(files) end

--- Hook to collect a level's points of interest: adds to `elements` a POI of type spawnPoint (big map marker, fast travel) for each spawnPoint that has an objectname found in the scene. In career mode, only discovered points are added.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/levels.lua:539
---@param levelIdentifier string Level name.
---@param elements table[] POI list to complete (modified in place).
function core_levels.onGetRawPoiListForLevel(levelIdentifier, elements) end

--- Alias of notifyUI: sends to the interface the list with statistics via guihooks.trigger('onLevelsChanged', levels, uiStats).
---Source: lua/ge/extensions/core/levels.lua:241
function core_levels.requestData() end

--- Loads a level with the 'levels' loading screen. Disconnects first if a level is already loaded. Ignored if a loading is already in progress.
---Source: lua/ge/extensions/core/levels.lua:516
---@param levelPath string Level folder or main.level.json file (converted to a folder if the file does not exist).
---@param delayedStart boolean|nil If true, first ends the active game mode (endActiveGameMode) then loads.
---@param customLoadingFunction function|nil Passed to server.createGame to replace the standard loading (inferred from code).
---@param spawnVehicle table|false|nil Vehicle to spawn on load: { model, options }; false = none; nil = default vehicle.
---@return any  Result of the disconnection or loading; false if the path is invalid; nil otherwise.
function core_levels.startLevel(levelPath, delayedStart, customLoadingFunction, spawnVehicle) end

