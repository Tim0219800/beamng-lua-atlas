---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/pursuit/proceduralMode.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Empty skeleton intended for procedurally generated pursuit scenarios and random events. The code comment says the traffic's random suspect logic should be moved here. No logic is implemented.
--- Access: extension `gameplay_pursuit_proceduralMode`: `extensions.load("gameplay_pursuit_proceduralMode")`, then the global `gameplay_pursuit_proceduralMode`
---@class gameplay_pursuit_proceduralMode
gameplay_pursuit_proceduralMode = {}

--- Hook after Lua reload; does nothing.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/pursuit/proceduralMode.lua:20
function gameplay_pursuit_proceduralMode.onDeserialized() end

--- Serialization hook before Lua reload; does nothing.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/pursuit/proceduralMode.lua:17
function gameplay_pursuit_proceduralMode.onSerialize() end

--- Hook called every frame; does nothing.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/pursuit/proceduralMode.lua:14
---@param dt number Real time delta (s).
---@param dtSim number Simulated time delta (s).
function gameplay_pursuit_proceduralMode.onUpdate(dt, dtSim) end

