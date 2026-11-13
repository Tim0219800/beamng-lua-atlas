---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/race/startPosition.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Position de départ. Champs : race, id (race:getNextUniqueIdentifier()), name (« Start Position <id> » par défaut), group, pos (vec3), rot (quat), sortOrder, routePoint, originalDistToTarget, staticRoutePoint, staticOriginalDistToTarget.
---@class gameplay_race_startPosition
local gameplay_race_startPosition = {}

--- Calcule la position et la rotation à donner à un véhicule pour qu'il garde son décalage relatif par rapport à sa boîte d'apparition, centrée sur la ligne.
---Source : lua/ge/extensions/gameplay/race/startPosition.lua:139
---@param vehId integer Id du véhicule.
---@param lowPrecision boolean|nil true pour un véhicule chargé à la première image.
---@return vec3|nil  Nouvelle position.
---@return quat|nil  Nouvelle rotation.
function gameplay_race_startPosition:calculateVehiclePosRot(vehId, lowPrecision) end

--- Dessine la ligne de départ (triangles pleins), un prisme rouge en mode highlight et le nom.
---Source : lua/ge/extensions/gameplay/race/startPosition.lua:63
---@param drawMode string|nil 'none', 'faded', 'normal', 'highlight'.
---@param clr number[]|nil Couleur {r,g,b,a} entre 0 et 1.
function gameplay_race_startPosition:drawDebug(drawMode, clr) end

--- Coins de la zone devant la position : deux listes, l'une de quatre points (largeur et longueur, vers l'arrière de la ligne selon -Y), l'autre de deux points à 0,4 m.
---Source : lua/ge/extensions/gameplay/race/startPosition.lua:52
---@param width number|nil Demi-largeur (défaut 1).
---@param length number|nil Longueur (défaut 1).
---@return table  { {4 vec3}, {2 vec3} }
function gameplay_race_startPosition:getFrontCorners(width, length) end

--- Point de route associé.
---Source : lua/ge/extensions/gameplay/race/startPosition.lua:218
---@return table|nil  Point de route.
function gameplay_race_startPosition:getRoutePoint() end

--- Point de route statique.
---Source : lua/ge/extensions/gameplay/race/startPosition.lua:227
---@return table|nil  Point de route.
function gameplay_race_startPosition:getStaticRoutePoint() end

--- Constructeur : id, nom, groupe 'start', position et rotation nulles.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/race/startPosition.lua:7
---@param race table Course ou chemin propriétaire.
---@param name string|nil Nom.
function gameplay_race_startPosition:init(race, name) end

--- Déplace un véhicule sur la position de départ. Par défaut avec réparation (setPositionRotation) ; avec repair = false, téléportation sûre.
---Source : lua/ge/extensions/gameplay/race/startPosition.lua:170
---@param vehId integer Id du véhicule.
---@param lowPrecision boolean|nil Voir calculateVehiclePosRot.
---@param repair boolean|nil Défaut true ; false = téléportation sûre sans réparation.
---@return vec3|nil  Position appliquée.
---@return quat|nil  Rotation calculée.
function gameplay_race_startPosition:moveResetVehicleTo(vehId, lowPrecision, repair) end

--- Restaure la position à partir de données sérialisées (groupe déduit du nom si absent).
---Source : lua/ge/extensions/gameplay/race/startPosition.lua:36
---@param data table Données de onSerialize.
function gameplay_race_startPosition:onDeserialized(data) end

--- Sérialise name, group, pos, rot (x,y,z,w) et oldId.
---Source : lua/ge/extensions/gameplay/race/startPosition.lua:25
---@return table  Données JSON.
function gameplay_race_startPosition:onSerialize() end

--- Définit la position et la rotation.
---Source : lua/ge/extensions/gameplay/race/startPosition.lua:47
---@param pos vec3 Position.
---@param rot quat Rotation.
function gameplay_race_startPosition:set(pos, rot) end

--- Mémorise le point de route associé et sa distance d'origine à la cible (distToTarget).
---Source : lua/ge/extensions/gameplay/race/startPosition.lua:211
---@param rp table Point de route.
function gameplay_race_startPosition:setRoutePoint(rp) end

--- Mémorise le point de route statique et sa distance d'origine.
---Source : lua/ge/extensions/gameplay/race/startPosition.lua:222
---@param rp table Point de route.
function gameplay_race_startPosition:setStaticRoutePoint(rp) end

--- Aligne la position de départ sur un véhicule : centre de son avant, orientation du véhicule (ou du terrain sous lui).
---Source : lua/ge/extensions/gameplay/race/startPosition.lua:190
---@param vehId integer Id du véhicule.
function gameplay_race_startPosition:setToVehicle(vehId) end

