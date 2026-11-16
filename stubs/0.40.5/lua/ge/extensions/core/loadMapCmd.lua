---@meta
-- tim19Atlas stub generated from lua/ge/extensions/core/loadMapCmd.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- GE extension `core_loadMapCmd`: executes the 'openMap' launch command (link of the form beamng:v1/openMap/{level:"levels/gridmap/info.json",camPos:[x,y,z],camRot:[x,y,z,w]}). It waits for the mod manager to be ready, starts the requested level in freeroam, then, once the world is ready, places the free camera, sets the FOV, the time and optionally loads a track (trackBuilder). A modder rarely uses it directly, but can call set() to open a map with a given camera.
--- Access: extension `core_loadMapCmd`: `extensions.load("core_loadMapCmd")`, then the global `core_loadMapCmd`
---@class core_loadMapCmd
core_loadMapCmd = {}

--- Hook called after a level starts; does nothing.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/loadMapCmd.lua:89
function core_loadMapCmd.onClientPostStartMission() end

--- After a Lua reload: restores the ignoreStartupCmd flag.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/loadMapCmd.lua:133
---@param d table Table returned by onSerialize.
function core_loadMapCmd.onDeserialized(d) end

--- Hook called when the extension loads; does nothing.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/loadMapCmd.lua:79
function core_loadMapCmd.onExtensionLoaded() end

--- Hook called when the extension unloads; does nothing.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/loadMapCmd.lua:82
function core_loadMapCmd.onExtensionUnloaded() end

--- Hook emitted by core_modmanager when the mods are mounted: retries the map change.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/loadMapCmd.lua:85
function core_loadMapCmd.onModManagerReady() end

--- Before a Lua reload: returns { ignoreStartupCmd = true } so the launch command is not replayed.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/loadMapCmd.lua:129
---@return table  { ignoreStartupCmd = true }
function core_loadMapCmd.onSerialize() end

--- Hook called on every frame: retries the map change as long as it is pending.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/loadMapCmd.lua:93
---@param dtReal number Elapsed real time (s), unused.
---@param dtSim number Elapsed simulation time (s), unused.
---@param dtRaw number Raw time (s), unused.
function core_loadMapCmd.onUpdate(dtReal, dtSim, dtRaw) end

--- Hook called when the world state changes. At state 2 (world ready), applies camPos/camRot (free camera), fov, timeOfDay and loads the requested track, then forgets the command.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/loadMapCmd.lua:97
---@param state integer Loading step; only the value 2 triggers the action.
function core_loadMapCmd.onWorldReadyState(state) end

--- Registers a map opening command and tries to launch it (the map starts as soon as the target exists and the mods are ready).
---Source: lua/ge/extensions/core/loadMapCmd.lua:64
---@param data table|nil See notes: { level, camPos, camRot, fov, timeOfDay, track }. nil: does nothing.
---@param startCmd boolean|nil True if the command comes from the startup command line: ignored after a Lua reload.
function core_loadMapCmd.set(data, startCmd) end

