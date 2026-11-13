---@meta
-- tim19Atlas stub generated from lua/ge/extensions/mcp/tools/telemetry.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Outils MCP de télémétrie véhicule : valeurs électriques (régime, vitesse, rapport, carburant…), résumé de dommages, et instantané d'état global côté GE.
--- Accès : extension `mcp_tools_telemetry` : `extensions.load("mcp_tools_telemetry")`, puis la globale `mcp_tools_telemetry`
---@class mcp_tools_telemetry
---@field cb table<string, function> Callback `electrics(vid, json)` : stocke le JSON dans shared.asyncResults.electrics.
---@field schemas table<string, table> Schémas des outils de télémétrie.
mcp_tools_telemetry = {}

--- Récupère electrics.values d'un véhicule (asynchrone).
---Source : lua/ge/extensions/mcp/tools/telemetry.lua:15
---@param args table|nil {keys?: string[], id?: integer}
---@return string  JSON précédent ou message « requested (async) ».
---@return boolean  true si le véhicule n'existe pas.
function mcp_tools_telemetry.get_electrics(args) end

--- Instantané : sim {physicsRunning, timeScale}, vehicleCount, level, camera {mode, pos}, vehicle joueur {id, jbeam, configKey, pos, speed (m/s), damage}.
---Source : lua/ge/extensions/mcp/tools/telemetry.lua:43
---@return string  JSON.
---@return boolean  false.
function mcp_tools_telemetry.get_status() end

--- Résumé de dommages : id et damageSum (veh:getSectionDamageSum()).
---Source : lua/ge/extensions/mcp/tools/telemetry.lua:32
---@param args table|nil {id?: integer}
---@return string  JSON.
---@return boolean  true si le véhicule n'existe pas.
function mcp_tools_telemetry.get_vehicle_damage(args) end

