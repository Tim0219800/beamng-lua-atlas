---@meta
-- tim19Atlas stub generated from lua/ge/server/server.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Loading and unloading of a level on the game's "server" side (solo/freeroam mode). `createGame` opens the loading screen then runs the complete sequence: datablocks and materials, creation of the physics world, loading of the level objects (main/ JSON folder, or old .mis format), decals, starting the physics, creation of the camera and the player, then fade-out. `destroy` does the reverse. The duration of each step is logged.
--- Access: global `server`
---@class server
---@field loadingProgress any Exported at module initialization, hence nil (see notes); the real value is the local LoadingManager handle.
server = {}

--- Loads a level. Requests the loading screen from core_gamestate, then runs createGameActual (datablocks, materials, objects, physics, camera and player spawn). If customLoadingFunction is given, the fade-out is delayed: that function must call server.fadeoutLoadingScreen.
---Source: lua/ge/server/server.lua:405
---@param levelPath string level path (info.json, .mis or folder/level name; lowercased)
---@param customLoadingFunction function|nil called instead of the automatic fade-out
function server.createGame(levelPath, customLoadingFunction) end

--- Destroys the session: sets $missionRunning to false, ends the level (endMission), destroys the physics world, deletes the datablocks and increments $Server::Session.
---Source: lua/ge/server/server.lua:376
---@param p table|nil optional profiler exposing :add(name) to mark the steps
function server.destroy(p) end

--- Finishes the loading: requests leaving the loading screen, calls clientPostStartMission/clientStartMission (unless skipStart), ends the loading, emits onLoadingScreenFadeout and logs the duration. No effect (warning) if no loading is in progress.
---Source: lua/ge/server/server.lua:338
---@param skipStart boolean|nil if true, skips clientPostStartMission/clientStartMission and triggers guihooks MenuHide
function server.fadeoutLoadingScreen(skipStart) end

--- Sets a global offset applied to the tile transform of the next loaded level. Calling without an argument removes the offset; with incomplete arguments, logs an error.
---Source: lua/ge/server/server.lua:61
---@param x number|nil X offset in meters; nil cancels the offset
---@param y number|nil Y offset in meters
---@param z number|nil Z offset in meters
function server.setLevelOffset(x, y, z) end

