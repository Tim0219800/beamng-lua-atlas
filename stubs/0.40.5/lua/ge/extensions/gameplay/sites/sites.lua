---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/sites/sites.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Objet sites. Champs : name, description, id, locations / zones / parkingSpots (gameplay/util/sortedList, avec .sorted et .objects), tags, sortedTags, tagsToZones, tagsToLocations, quadtreeLocations, quadtreeZones, quadtreeParkingSpots, dir, filename.
---@class gameplay_sites_sites
local gameplay_sites_sites = {}

--- Dessine en debug toutes les locations, zones et places de parking.
---Source : lua/ge/extensions/gameplay/sites/sites.lua:26
function gameplay_sites_sites:drawDebug() end

--- À appeler après chargement. Génère les places multiples, trie, construit les index de noms et de tags, rattache les locations et places aux zones qui les contiennent (test 2D) et construit les kd-trees.
---Source : lua/ge/extensions/gameplay/sites/sites.lua:59
function gameplay_sites_sites:finalizeSites() end

--- Place de parking la plus proche de pos (kd-tree 3D).
---Source : lua/ge/extensions/gameplay/sites/sites.lua:173
---@param pos vec3 Position de référence.
---@return table|nil  Objet parkingSpot.
---@return number  Distance renvoyée par findNearest du kd-tree.
function gameplay_sites_sites:getClosestParkingSpot(pos) end

--- Incrémente et renvoie le compteur global d'identifiants d'objets de sites.
---Source : lua/ge/extensions/gameplay/sites/sites.lua:11
---@return integer  Nouvel identifiant.
function gameplay_sites_sites:getNextUniqueIdentifier() end

--- Liste les locations dont la distance 2D à pos est comprise entre minRadius et maxRadius.
---Source : lua/ge/extensions/gameplay/sites/sites.lua:135
---@param pos vec3 Centre de recherche.
---@param minRadius number Distance minimale en mètres.
---@param maxRadius number Distance maximale en mètres.
---@return table[]  Éléments {loc, squaredDistance} (distance au carré).
function gameplay_sites_sites:getRadialLocations(pos, minRadius, maxRadius) end

--- Liste les places de parking dont la distance 2D à pos est comprise entre minRadius et maxRadius.
---Source : lua/ge/extensions/gameplay/sites/sites.lua:155
---@param pos vec3 Centre de recherche.
---@param minRadius number Distance minimale en mètres.
---@param maxRadius number Distance maximale en mètres.
---@return table[]  Éléments {ps, squaredDistance} (distance au carré).
function gameplay_sites_sites:getRadialParkingSpots(pos, minRadius, maxRadius) end

--- Réunit les tags de toutes les zones qui contiennent pos.
---Source : lua/ge/extensions/gameplay/sites/sites.lua:209
---@param pos vec3 Position à tester.
---@return table<string, integer>  Ensemble des tags (valeur 1).
---@return string[]  Tags triés alphabétiquement.
function gameplay_sites_sites:getTagsForZonesAtPosition(pos) end

--- Zones dont le contour 2D contient pos.
---Source : lua/ge/extensions/gameplay/sites/sites.lua:178
---@param pos vec3 Position à tester.
---@return table[]  Liste d'objets zone.
function gameplay_sites_sites:getZonesForPosition(pos) end

--- Constructeur : crée les trois listes triées et un nom par défaut « Sites ».
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/sites/sites.lua:16
---@param name string|nil Nom du jeu de sites.
function gameplay_sites_sites:init(name) end

--- Recharge le jeu de sites depuis une table sérialisée (les « \n » littéraux de la description deviennent de vrais retours à la ligne).
---Source : lua/ge/extensions/gameplay/sites/sites.lua:45
---@param data table|nil Données du fichier .sites.json.
---@param oldIdMap table|nil Correspondance ancien id -> nouvel id, remplie par les listes.
function gameplay_sites_sites:onDeserialized(data, oldIdMap) end

--- Sérialise name, description, les trois listes, dir et filename.
---Source : lua/ge/extensions/gameplay/sites/sites.lua:32
---@return table  Données JSON-compatibles.
function gameplay_sites_sites:onSerialize() end

--- Itérateur générique sur les zones contenant pos, à utiliser dans un for : for id, zone in sites:zonesForPositionIterator(pos) do. Évite d'allouer une table ; ctx peut être réutilisé.
---Source : lua/ge/extensions/gameplay/sites/sites.lua:201
---@param pos vec3 Position à tester.
---@param ctx table|nil Table de contexte réutilisable.
---@return function  Fonction itératrice (ctx) -> id, zone.
---@return table  Contexte.
function gameplay_sites_sites:zonesForPositionIterator(pos, ctx) end

