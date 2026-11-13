---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/rally/driveline/pointList.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Liste de points renvoyée par le constructeur ; attribut self.points.
---@class gameplay_rally_driveline_pointList
local gameplay_rally_driveline_pointList = {}

--- Longueur totale du chemin (0 s'il y a moins de 2 points).
---Source : lua/ge/extensions/gameplay/rally/driveline/pointList.lua:76
---@return number  Longueur en mètres.
function gameplay_rally_driveline_pointList:calculateLength() end

--- Nombre de points.
---Source : lua/ge/extensions/gameplay/rally/driveline/pointList.lua:91
---@return integer  Nombre de points.
function gameplay_rally_driveline_pointList:count() end

--- Crée un point au format standard (normal (0,0,1), pacenoteDistances vide, cachedPacenotes vide). N'ajoute pas le point à la liste.
---Source : lua/ge/extensions/gameplay/rally/driveline/pointList.lua:17
---@param pos vec3 Position.
---@param quat quat|nil Orientation (voir le bug dans notes : ne pas l'omettre).
---@param ts number|nil Horodatage en secondes (0 par défaut).
---@return table  Le point.
function gameplay_rally_driveline_pointList:createPoint(pos, quat, ts) end

--- Stub de compatibilité avec DrivelineRoute : renvoie la liste elle-même (drivelineV3 simplifie déjà).
---Source : lua/ge/extensions/gameplay/rally/driveline/pointList.lua:134
---@return table  self.
function gameplay_rally_driveline_pointList:downsample() end

--- Dessine une sphère par point (couleur recce_driveline_clr, alpha 0,3) et, si demandé, l'horodatage ts en étiquette. À appeler à chaque frame.
---Source : lua/ge/extensions/gameplay/rally/driveline/pointList.lua:139
---@param drawLabels boolean|nil true pour afficher les étiquettes ts.
function gameplay_rally_driveline_pointList:drawDebug(drawLabels) end

--- Point le plus proche d'une position (distance 3D, parcours linéaire).
---Source : lua/ge/extensions/gameplay/rally/driveline/pointList.lua:113
---@param srcPos vec3 Position de référence.
---@return table|nil  Point le plus proche, nil si la liste est vide.
function gameplay_rally_driveline_pointList:findNearestPoint(srcPos) end

--- Point à l'indice donné.
---Source : lua/ge/extensions/gameplay/rally/driveline/pointList.lua:96
---@param index integer Indice à partir de 1.
---@return table|nil  Point.
function gameplay_rally_driveline_pointList:get(index) end

--- Table interne de tous les points (pas une copie).
---Source : lua/ge/extensions/gameplay/rally/driveline/pointList.lua:101
---@return table[]  Points.
function gameplay_rally_driveline_pointList:getAll() end

--- Mémorise la liste de points fournie (vide par défaut) sans calculer relations ni normales.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/rally/driveline/pointList.lua:12
---@param points table[]|nil Points déjà au format standard.
function gameplay_rally_driveline_pointList:init(points) end

--- Remplace tous les points puis recalcule relations et normales.
---Source : lua/ge/extensions/gameplay/rally/driveline/pointList.lua:106
---@param points table[] Nouveaux points.
function gameplay_rally_driveline_pointList:setAll(points) end

--- Calcule la normale de chaque point avec snaproadNormals.forwardNormalVec et crée pacenoteDistances/cachedPacenotes s'ils manquent.
---Source : lua/ge/extensions/gameplay/rally/driveline/pointList.lua:56
function gameplay_rally_driveline_pointList:setupPointNormals() end

--- Renseigne id (indice), prev et next de chaque point.
---Source : lua/ge/extensions/gameplay/rally/driveline/pointList.lua:39
function gameplay_rally_driveline_pointList:setupPointRelationships() end

