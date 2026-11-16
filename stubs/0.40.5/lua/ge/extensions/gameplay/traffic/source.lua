---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/traffic/source.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Manages the traffic manager's "sources" (focuses), useful when several players (split screen) must each have traffic around them. A source is a vehicle or a fixed position; the module rotates the traffic focus (gameplay_traffic.setFocus) from source to source at regular intervals. Loaded on demand.
--- Access: extension `gameplay_traffic_source`: `extensions.load("gameplay_traffic_source")`, then the global `gameplay_traffic_source`
---@class gameplay_traffic_source
gameplay_traffic_source = {}

--- Adds a source to traffic. 'vehicle' mode: data is a vehicle id or a {vehId} table. 'custom' mode: data = {pos, dir, speed?}. Other mode (e.g. 'camera'): entry without data.
---Source: lua/ge/extensions/gameplay/traffic/source.lua:34
---@param mode string 'camera', 'vehicle' or 'custom'.
---@param data integer|table|nil Vehicle id, or table {vehId=...} or {pos=vec3, dir=vec3, speed=number}.
---@return table|boolean  The added source entry, or false if the data is invalid (nonexistent vehicle, missing pos/dir).
function gameplay_traffic_source.addSource(mode, data) end

--- Resets the sources then adds each player's vehicle as a source (multiseat), if at least 2 players have joined. Then enables the update mode.
---Source: lua/ge/extensions/gameplay/traffic/source.lua:118
---@param defaultMode string|nil Update mode, 'default' if nil.
function gameplay_traffic_source.autoAddPlayers(defaultMode) end

--- Returns the table of current sources (direct reference, not a copy).
---Source: lua/ge/extensions/gameplay/traffic/source.lua:72
---@return table  List of entries {mode, auto, vehId?, pos?, dirVec?, speed?}.
function gameplay_traffic_source.getSources() end

--- Hook called every frame. Advances the timer; at the interval, calls updateSource then freezes the timer (-1).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/traffic/source.lua:167
---@param dt number Real time delta (s).
---@param dtSim number Simulation delta time (s), used by the timer.
function gameplay_traffic_source.onUpdate(dt, dtSim) end

--- Hook called when a vehicle is reset. If the rotation timer is frozen (-1) and the vehicle is an AI traffic vehicle, restarts the timer at 0.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/traffic/source.lua:157
---@param vehId integer Id of the reset vehicle.
function gameplay_traffic_source.onVehicleResetted(vehId) end

--- Hook called when a player changes vehicle. In split screen, autoAddPlayers is often called before everyone is seated: if the new vehicle is not already a source and there are at least 2 players, calls autoAddPlayers again.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/traffic/source.lua:151
---@param oldId integer Old vehicle id.
---@param newId integer New vehicle id.
---@param player integer Player concerned (unused).
function gameplay_traffic_source.onVehicleSwitched(oldId, newId, player) end

--- Removes the source at the given index; if it was the current rotation index, the rotation restarts at 1.
---Source: lua/ge/extensions/gameplay/traffic/source.lua:65
---@param index integer Index (starting at 1) in the sources list.
function gameplay_traffic_source.removeSource(index) end

--- Removes all sources (resets trafficClearRadius to 0 on the affected vehicles), restores the default traffic focus and re-enables enableDynamicValues.
---Source: lua/ge/extensions/gameplay/traffic/source.lua:17
function gameplay_traffic_source.resetSources() end

--- Sets the sources update mode and resets the rotation state. In 'default' mode, creates a timer and an interval (minimum 1 s, 5 s by default).
---Source: lua/ge/extensions/gameplay/traffic/source.lua:76
---@param mode string 'off' or 'default'.
---@param options table|nil Options; options.interval = rotation interval in seconds.
function gameplay_traffic_source.setSourceMode(mode, options) end

--- Moves to the next source (favoring a source whose vehicle is moving faster than 1 m/s) or to the given index, then calls gameplay_traffic.setFocus(mode, source). Called automatically by onUpdate or manually.
---Source: lua/ge/extensions/gameplay/traffic/source.lua:96
---@param index integer|nil Forced index; if nil, advances to the next source.
function gameplay_traffic_source.updateSource(index) end

