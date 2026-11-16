---@meta
-- tim19Atlas stub generated from lua/ge/extensions/mcp/tools/sim.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- MCP simulation control tools: read the state, change the time scale, pause the physics, resume it, or advance it step by step. Relies on the engine object `be`.
--- Access: extension `mcp_tools_sim`: `extensions.load("mcp_tools_sim")`, then the global `mcp_tools_sim`
---@class mcp_tools_sim
---@field schemas table<string, table> Schemas of the simulation tools.
mcp_tools_sim = {}

--- Simulation state as JSON: physicsRunning, timeScale, speedFactor, deterministic, enabled (be:getPhysicsRunning, getSimulationTimeScale, getPhysicsSpeedFactor, getPhysicsDeterministic, getEnabled).
---Source: lua/ge/extensions/mcp/tools/sim.lua:9
---@return string  JSON.
---@return boolean  false.
function mcp_tools_sim.get_simulation_state() end

--- Pauses the physics (be:setPhysicsRunning(false)).
---Source: lua/ge/extensions/mcp/tools/sim.lua:26
---@return string  Message.
---@return boolean  false.
function mcp_tools_sim.pause_physics() end

--- Resumes the physics (be:setPhysicsRunning(true)).
---Source: lua/ge/extensions/mcp/tools/sim.lua:31
---@return string  Message.
---@return boolean  false.
function mcp_tools_sim.resume_physics() end

--- Sets the simulation time scale (be:setSimulationTimeScale).
---Source: lua/ge/extensions/mcp/tools/sim.lua:19
---@param args table {scale: number} 1 = normal, <1 slow motion, >1 sped up.
---@return string  Confirmation.
---@return boolean  true if scale is missing.
function mcp_tools_sim.set_simulation_speed(args) end

--- Pauses the physics then advances N ticks (be:physicsStep); it stays paused.
---Source: lua/ge/extensions/mcp/tools/sim.lua:37
---@param args table|nil {steps?: integer} number of physics ticks (default 1, minimum 1).
---@return string  Message.
---@return boolean  false.
function mcp_tools_sim.step_physics(args) end

