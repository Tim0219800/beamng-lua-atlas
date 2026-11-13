---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/sites/parkingSpot.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Objet place de parking. Champs : sites, id, name, color, vertices (4 coins 2D), pos, rot, scl, isMultiSpot, multiSpotData {spotAmount, spotOffset, spotDirection, spotRotation}, wasGenerated, isProcedural, customFields.
---@class gameplay_sites_parkingSpot
local gameplay_sites_parkingSpot = {}

--- Teste si une boîte de dimensions données rentre dans les dimensions de la place (comparaison par axe, sans rotation).
---Source : lua/ge/extensions/gameplay/sites/parkingSpot.lua:347
---@param extentsX number Largeur.
---@param extentsY number Longueur.
---@param extentsZ number Hauteur.
---@return boolean  true si ça rentre.
function gameplay_sites_parkingSpot:boxFits(extentsX, extentsY, extentsZ) end

--- Recalcule les 4 coins 2D (vertices) à partir de pos, rot et scl.
---Source : lua/ge/extensions/gameplay/sites/parkingSpot.lua:244
function gameplay_sites_parkingSpot:calcVerts() end

--- Vérifie si un véhicule est correctement garé : vitesse faible, orienté dans l'axe de la place (|cos| >= 0,707) et coins de sa boîte englobante à l'intérieur. Avec precision <= 0, seul le centre du véhicule est testé.
---Source : lua/ge/extensions/gameplay/sites/parkingSpot.lua:294
---@param vehId integer Identifiant du véhicule.
---@param precision number|nil Fraction (0..1) du centre vers chaque coin à tester ; défaut 0,8.
---@param drivingSpeed number|nil Vitesse max (m/s) pour tester ; défaut 5.
---@param parkingSpeed number|nil Vitesse max (m/s) pour être valide ; défaut 1.
---@return boolean  true si garé.
---@return boolean[]  État des 4 coins (ordre dépendant de l'avant/arrière).
function gameplay_sites_parkingSpot:checkParking(vehId, precision, drivingSpeed, parkingSpeed) end

--- Teste si un point est dans le volume de la place (boîte orientée, avec contrôle rapide par rayon).
---Source : lua/ge/extensions/gameplay/sites/parkingSpot.lua:257
---@param pos vec3 Point monde.
---@return boolean  true si dans la place.
function gameplay_sites_parkingSpot:containsPoint(pos) end

--- Dessine la place en debug (surface, direction, nom selon le mode). Ignore les places procédurales.
---Source : lua/ge/extensions/gameplay/sites/parkingSpot.lua:87
---@param drawMode string|nil 'none', 'faded', 'normal' ou 'highlight'.
---@param clr table|nil Couleur {r,g,b}.
---@param customHeight number|nil Hauteur de dessin personnalisée.
---@param drawDirection boolean|nil Dessiner la flèche de direction (défaut true).
function gameplay_sites_parkingSpot:drawDebug(drawMode, clr, customHeight, drawDirection) end

--- Dessine un côté vertical de la place entre deux points (aide au debug).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/sites/parkingSpot.lua:176
---@param a vec3 Premier point.
---@param b vec3 Second point.
---@param z number Hauteur du côté.
---@param clrI any Couleur ColorI (déduit du code).
function gameplay_sites_parkingSpot:drawSide(a, b, z, clrI) end

--- Pour une place multi-spot, crée les places supplémentaires (nom « <nom>.<n> ») décalées selon spotDirection/spotOffset, avec la rotation spotRotation, et copie tags et champs personnalisés. N'agit qu'une fois (wasGenerated).
---Source : lua/ge/extensions/gameplay/sites/parkingSpot.lua:198
---@param parkingSpotList table Liste triée (sites.parkingSpots) où créer les places.
---@param skipSort boolean|nil Ne pas retrier à chaque création.
function gameplay_sites_parkingSpot:generateMultiSpots(parkingSpotList, skipSort) end

--- Identifiant textuel de la place : dossier + fichier du jeu de sites + « # » + nom.
---Source : lua/ge/extensions/gameplay/sites/parkingSpot.lua:83
---@return string  Chemin de la forme dir..filename#name.
function gameplay_sites_parkingSpot:getPath() end

--- Indique si un véhicule actif occupe la place (centre de la boîte englobante dedans ; pour les véhicules suivis par map, test des arêtes aussi).
---Source : lua/ge/extensions/gameplay/sites/parkingSpot.lua:359
---@param playerId integer|nil Identifiant d'un véhicule à ignorer.
---@return boolean  true si au moins un véhicule.
---@return integer[]  Identifiants des véhicules présents (peut contenir des doublons).
function gameplay_sites_parkingSpot:hasAnyVehicles(playerId) end

--- Constructeur. Nom par défaut « Parking <id> ».
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/sites/parkingSpot.lua:17
---@param sites table Objet sites parent.
---@param name string|nil Nom.
---@param forceId integer|nil Identifiant imposé.
function gameplay_sites_parkingSpot:init(sites, name, forceId) end

--- Place un véhicule sur la place, aligné sur sa rotation. Avec useSafeTeleport, passe par spawn.safeTeleport ; sinon calcule le décalage de la boîte englobante, positionne le véhicule, réinitialise le flexmesh et appelle autoplace.
---Source : lua/ge/extensions/gameplay/sites/parkingSpot.lua:399
---@param vehId integer Identifiant du véhicule.
---@param lowPrecision boolean|nil À utiliser si le véhicule vient d'être chargé à la première frame (OOBB invalide) : place le véhicule 2 m derrière et 0,5 m au-dessus.
---@param backwards boolean|nil Orienter le véhicule dans le sens opposé.
---@param addedOffsetPos vec3|nil Décalage de position (repère véhicule, x/y).
---@param addedOffsetRot quat|nil Rotation additionnelle.
---@param useSafeTeleport boolean|nil Utiliser spawn.safeTeleport.
---@param removeTraffic boolean|nil Transmis à safeTeleport.
---@param resetVehicleInSafeTeleport boolean|nil Transmis à safeTeleport.
---@param options table|nil Options ; skipVehicleIntersectionCheck est transmis à safeTeleport.
---@return vec3|nil  Nouvelle position (nil si véhicule introuvable).
---@return quat  Rotation appliquée.
function gameplay_sites_parkingSpot:moveResetVehicleTo(vehId, lowPrecision, backwards, addedOffsetPos, addedOffsetRot, useSafeTeleport, removeTraffic, resetVehicleInSafeTeleport, options) end

--- Restaure la place depuis les données et recalcule les coins.
---Source : lua/ge/extensions/gameplay/sites/parkingSpot.lua:55
---@param data table Données de onSerialize.
function gameplay_sites_parkingSpot:onDeserialized(data) end

--- Sérialise la place (position, rotation d'origine, dimensions, paramètres multi-spot, couleur, champs personnalisés).
---Source : lua/ge/extensions/gameplay/sites/parkingSpot.lua:35
---@return table  Données JSON-compatibles.
function gameplay_sites_parkingSpot:onSerialize() end

--- Modifie position, rotation et/ou dimensions (valeurs nil ignorées) et recalcule les coins.
---Source : lua/ge/extensions/gameplay/sites/parkingSpot.lua:70
---@param pos vec3|nil Position du centre.
---@param rot quat|nil Rotation.
---@param scl vec3|nil Dimensions (largeur, longueur, hauteur).
function gameplay_sites_parkingSpot:set(pos, rot, scl) end

--- Teste si le véhicule rentre (boîte englobante initiale des noeuds, initialNodePosBB).
---Source : lua/ge/extensions/gameplay/sites/parkingSpot.lua:351
---@param vehId integer Identifiant du véhicule.
---@return boolean  true si ça rentre ; false si le véhicule n'existe pas.
function gameplay_sites_parkingSpot:vehicleFits(vehId) end

