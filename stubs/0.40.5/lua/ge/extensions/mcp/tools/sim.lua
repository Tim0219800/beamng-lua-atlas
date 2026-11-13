---@meta
-- tim19Atlas stub generated from lua/ge/extensions/mcp/tools/sim.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Outils MCP de contrôle de la simulation : lire l'état, changer l'échelle de temps, mettre la physique en pause, la reprendre, ou l'avancer pas à pas. S'appuie sur l'objet moteur `be`.
--- Accès : extension `mcp_tools_sim` : `extensions.load("mcp_tools_sim")`, puis la globale `mcp_tools_sim`
---@class mcp_tools_sim
---@field schemas table<string, table> Schémas des outils de simulation.
mcp_tools_sim = {}

--- État de la simulation en JSON : physicsRunning, timeScale, speedFactor, deterministic, enabled (be:getPhysicsRunning, getSimulationTimeScale, getPhysicsSpeedFactor, getPhysicsDeterministic, getEnabled).
---Source : lua/ge/extensions/mcp/tools/sim.lua:9
---@return string  JSON.
---@return boolean  false.
function mcp_tools_sim.get_simulation_state() end

--- Met la physique en pause (be:setPhysicsRunning(false)).
---Source : lua/ge/extensions/mcp/tools/sim.lua:26
---@return string  Message.
---@return boolean  false.
function mcp_tools_sim.pause_physics() end

--- Reprend la physique (be:setPhysicsRunning(true)).
---Source : lua/ge/extensions/mcp/tools/sim.lua:31
---@return string  Message.
---@return boolean  false.
function mcp_tools_sim.resume_physics() end

--- Règle l'échelle de temps de la simulation (be:setSimulationTimeScale).
---Source : lua/ge/extensions/mcp/tools/sim.lua:19
---@param args table {scale: number} 1 = normal, <1 ralenti, >1 accéléré.
---@return string  Confirmation.
---@return boolean  true si scale manquant.
function mcp_tools_sim.set_simulation_speed(args) end

--- Met la physique en pause puis avance de N ticks (be:physicsStep) ; elle reste en pause.
---Source : lua/ge/extensions/mcp/tools/sim.lua:37
---@param args table|nil {steps?: integer} nombre de ticks physiques (défaut 1, minimum 1).
---@return string  Message.
---@return boolean  false.
function mcp_tools_sim.step_physics(args) end

