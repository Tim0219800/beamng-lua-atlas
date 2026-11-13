---@meta
-- tim19Atlas stub generated from lua/ge/extensions/mcp/tools/ai.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Outils MCP pour l'IA des véhicules : lire/modifier ses réglages (mode, vitesse, agressivité, cible), l'envoyer vers un point, et inspecter le navgraph (réseau routier de l'IA et du trafic). Module chargé par mcp_tools (require), pas une extension autonome ; chaque fonction M.xxx est un outil MCP dont les arguments arrivent dans la table `args`. Retour des outils : (texte, estErreur).
--- Accès : extension `mcp_tools_ai` : `extensions.load("mcp_tools_ai")`, puis la globale `mcp_tools_ai`
---@class mcp_tools_ai
---@field cb table<string, function> Callbacks : `ai(vid, json)` stocke le JSON dans shared.asyncResults.ai.
---@field schemas table<string, table> Descriptions et inputSchema des outils get_ai, set_ai, drive_to, get_navgraph.
mcp_tools_ai = {}

--- Envoie l'IA vers une destination avec ai.driveUsingPath : 'waypoint' (nom de nœud navgraph), ou 'pos' {x,y,z}, ou 'targetId' (position actuelle d'un autre objet), accrochés au nœud routier le plus proche (map.findClosestRoad). avoidCars vaut 'on' par défaut.
---Source : lua/ge/extensions/mcp/tools/ai.lua:48
---@param args table {waypoint?: string, pos?: {x,y,z}, targetId?: integer, routeSpeed?: number (m/s), routeSpeedMode?: 'limit'|'set' (défaut 'limit'), aggression?: number, avoidCars?: 'on'|'off', driveInLane?: 'on'|'off', id?: integer}
---@return string  Message de confirmation ou d'erreur (aucune route proche, cible manquante).
---@return boolean  true en cas d'erreur.
function mcp_tools_ai.drive_to(args) end

--- Demande l'état de l'IA d'un véhicule (asynchrone). Envoie un snippet à la VM véhicule qui renvoie un JSON {mode, speedMode, routeSpeed, aggression, targetObjectID, avoidCars} (ou {error='ai not loaded'}).
---Source : lua/ge/extensions/mcp/tools/ai.lua:18
---@param args table|nil {id?: integer} véhicule (défaut : joueur).
---@return string  JSON de l'appel précédent, ou message « requested (async) ».
---@return boolean  true si le véhicule n'existe pas.
function mcp_tools_ai.get_ai(args) end

--- Statistiques du navgraph (nodeCount, linkCount, bbox) ; avec 'near'/'radius' ou all=true, ajoute les nœuds proches (nom, pos, radius, liens avec to/drivability/oneWay/speedLimit/len) et la route la plus proche (closestRoad).
---Source : lua/ge/extensions/mcp/tools/ai.lua:76
---@param args table|nil {near?: {x,y,z} (défaut véhicule joueur ou caméra), radius?: number en m (défaut 100), all?: boolean, maxNodes?: integer (défaut 300)}
---@return string  JSON ou message d'erreur (« navgraph not loaded »).
---@return boolean  true en cas d'erreur.
function mcp_tools_ai.get_navgraph(args) end

--- Modifie les réglages de l'IA via ai.setState dans la VM véhicule. Ne transmet que les clés fournies : mode, speedMode, routeSpeed, aggression (-> extAggression), targetObjectID, avoidCars (-> extAvoidCars).
---Source : lua/ge/extensions/mcp/tools/ai.lua:29
---@param args table {mode?, speedMode?, routeSpeed?, aggression?, targetObjectID?, avoidCars?, id?}. Erreur si aucune clé de réglage.
---@return string  Confirmation avec le JSON appliqué.
---@return boolean  true en cas d'erreur.
function mcp_tools_ai.set_ai(args) end

