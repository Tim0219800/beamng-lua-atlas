---@meta
-- tim19Atlas stub generated from lua/ge/extensions/mcp/tools/env.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Outils MCP pour l'environnement : lire et régler l'heure du jour et les paramètres astronomiques (latitude, longitude, date, décalage UTC, profil céleste) via core_environment. Disponible seulement dans un niveau.
--- Accès : extension `mcp_tools_env` : `extensions.load("mcp_tools_env")`, puis la globale `mcp_tools_env`
---@class mcp_tools_env
---@field schemas table<string, table> Schémas des outils get_time_of_day et set_time_of_day.
mcp_tools_env = {}

--- Renvoie en JSON core_environment.getTimeOfDay() : time, play, dayLength, startTime, latitude, longitude, date, utcOffset, dstRule, celestialProfile.
---Source : lua/ge/extensions/mcp/tools/env.lua:9
---@return string  JSON ou erreur « core_environment unavailable ».
---@return boolean  true en cas d'erreur.
function mcp_tools_env.get_time_of_day() end

--- Modifie l'heure et les champs astronomiques fournis puis appelle core_environment.setTimeOfDay.
---Source : lua/ge/extensions/mcp/tools/env.lua:15
---@param args table|nil {time?: 0..1, play?: boolean, dayLength?: number s réelles, startTime?: number, latitude?: number°, longitude?: number°, year?, month?, day?, utcOffset?: number h, dstRule?: string, celestialProfile?: string}
---@return string  « time of day set: time=… ».
---@return boolean  true en cas d'erreur.
function mcp_tools_env.set_time_of_day(args) end

