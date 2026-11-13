---@meta
-- tim19Atlas stub generated from lua/ge/extensions/mcp/tools/vehicle.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Outils MCP véhicules : lister, détailler, fichiers JBeam et arbre de parts, journal d'instabilité physique, reset/rechargement du véhicule joueur, lecture et écriture de la pose (position + rotation).
--- Accès : extension `mcp_tools_vehicle` : `extensions.load("mcp_tools_vehicle")`, puis la globale `mcp_tools_vehicle`
---@class mcp_tools_vehicle
---@field schemas table<string, table> Schémas des outils véhicule.
mcp_tools_vehicle = {}

--- Renvoie les instabilités physiques journalisées et vide le tampon par défaut.
---Source : lua/ge/extensions/mcp/tools/vehicle.lua:86
---@param args table|nil {clear?: boolean} false pour conserver.
---@return string  JSON {count, events}.
---@return boolean  false.
function mcp_tools_vehicle.get_instability(args) end

--- Config de parts sous forme de table chemin de slot -> nom de part choisie (config.partsTree aplati).
---Source : lua/ge/extensions/mcp/tools/vehicle.lua:72
---@param args table|nil {id?: integer}
---@return string  JSON.
---@return boolean  true si pas d'arbre.
function mcp_tools_vehicle.get_part_tree(args) end

--- Id du véhicule joueur 0 (be:getPlayerVehicleID(0)) sous forme de texte.
---Source : lua/ge/extensions/mcp/tools/vehicle.lua:33
---@return string  Id.
---@return boolean  false.
function mcp_tools_vehicle.get_player_vehicle_id() end

--- Pose d'un véhicule : pos {x,y,z} et rot quaternion {x,y,z,w}.
---Source : lua/ge/extensions/mcp/tools/vehicle.lua:107
---@param args table|nil {id?: integer}
---@return string  JSON {id, pos, rot}.
---@return boolean  true si le véhicule n'existe pas.
function mcp_tools_vehicle.get_position(args) end

--- Détails : id, jbeam, name, configKey, pcFile, position, speed (m/s).
---Source : lua/ge/extensions/mcp/tools/vehicle.lua:37
---@param args table|nil {id?: integer}
---@return string  JSON.
---@return boolean  true si le véhicule n'existe pas.
function mcp_tools_vehicle.get_vehicle(args) end

--- Fichiers utilisés : vehicleDirectory, directoriesLoaded, pcFile et liste triée des fichiers JBeam des parts actives (jbeam/io getPart).
---Source : lua/ge/extensions/mcp/tools/vehicle.lua:55
---@param args table|nil {id?: integer}
---@return string  JSON.
---@return boolean  true si aucune donnée véhicule.
function mcp_tools_vehicle.get_vehicle_files(args) end

--- Liste les véhicules spawnés : id, jbeam, nom d'affichage (marque + nom).
---Source : lua/ge/extensions/mcp/tools/vehicle.lua:18
---@return string  JSON.
---@return boolean  false.
function mcp_tools_vehicle.get_vehicles() end

--- Hook moteur (relayé par mcp_tools) appelé quand la physique détecte un véhicule instable : ajoute {time, vid, jbeam} à shared.instabilityLog (50 max).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/mcp/tools/vehicle.lua:11
---@param vid integer Id du véhicule.
---@param returnData any Fourni par le moteur, non utilisé.
function mcp_tools_vehicle.onInstabilityDetected(vid, returnData) end

--- Recharge le véhicule joueur depuis le disque (core_vehicle_manager.reloadVehicle(0)), ce qui relit ses JBeam.
---Source : lua/ge/extensions/mcp/tools/vehicle.lua:99
---@return string  Message.
---@return boolean  true s'il n'y a pas de véhicule joueur.
function mcp_tools_vehicle.reload_vehicle() end

--- Réinitialise/répare sur place le véhicule joueur (be:resetVehicle(0)).
---Source : lua/ge/extensions/mcp/tools/vehicle.lua:92
---@return string  Message.
---@return boolean  true s'il n'y a pas de véhicule joueur.
function mcp_tools_vehicle.reset_vehicle() end

--- Téléporte un véhicule à une pose via spawn.safeTeleport ; rot facultatif (garde le cap actuel).
---Source : lua/ge/extensions/mcp/tools/vehicle.lua:117
---@param args table {pos: {x,y,z}, rot?: {x,y,z,w}, id?: integer}
---@return string  Message.
---@return boolean  true en cas d'erreur.
function mcp_tools_vehicle.set_position(args) end

