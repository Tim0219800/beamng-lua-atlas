---@meta
-- tim19Atlas stub generated from lua/ge/extensions/mcp/tools/world.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Outils MCP « monde » : lister et charger des niveaux, déclencher une action d'entrée liée (comme une touche), récupérer ou supprimer un véhicule, et interroger le sol (hauteur, adhérence/drivabilité) en un point.
--- Accès : extension `mcp_tools_world` : `extensions.load("mcp_tools_world")`, puis la globale `mcp_tools_world`
---@class mcp_tools_world
---@field schemas table<string, table> Schémas des outils monde.
mcp_tools_world = {}

--- Hauteur de surface sous un point (be:getSurfaceHeightBelow) et drivabilité du terrain (be:getTerrainDrivability) dans un rayon.
---Source : lua/ge/extensions/mcp/tools/world.lua:67
---@param args table|nil {pos?: {x,y,z} (défaut position du véhicule joueur), radius?: number m (défaut 2)}
---@return string  JSON {pos, surfaceHeight, drivability}.
---@return boolean  true si aucun point.
function mcp_tools_world.get_ground_at_point(args) end

--- Liste les niveaux installés : name (levelName), title, file (fullfilename ou misFilePath).
---Source : lua/ge/extensions/mcp/tools/world.lua:12
---@return string  JSON.
---@return boolean  true si core_levels indisponible.
function mcp_tools_world.list_levels() end

--- Charge un niveau (core_levels.startLevel) par chemin ou par nom.
---Source : lua/ge/extensions/mcp/tools/world.lua:22
---@param args table {path?: string, name?: string}
---@return string  « loading level: … ».
---@return boolean  true en cas d'erreur.
function mcp_tools_world.load_level(args) end

--- Replace le véhicule sur la dernière route et le répare (spawn.teleportToLastRoad avec resetVehicle).
---Source : lua/ge/extensions/mcp/tools/world.lua:49
---@param args table|nil {id?: integer}
---@return string  Message.
---@return boolean  true en cas d'erreur.
function mcp_tools_world.recover_vehicle(args) end

--- Supprime un véhicule (veh:delete()).
---Source : lua/ge/extensions/mcp/tools/world.lua:58
---@param args table|nil {id?: integer}
---@return string  Message.
---@return boolean  true si le véhicule n'existe pas.
function mcp_tools_world.remove_vehicle(args) end

--- Déclenche une action d'entrée du jeu par son nom (ex. recover_vehicle, toggleCamera, switch_next_vehicle).
---Source : lua/ge/extensions/mcp/tools/world.lua:38
---@param args table {action: string, state?: 'down'|'up'}
---@return string  Message.
---@return boolean  true en cas d'erreur.
function mcp_tools_world.trigger_action(args) end

