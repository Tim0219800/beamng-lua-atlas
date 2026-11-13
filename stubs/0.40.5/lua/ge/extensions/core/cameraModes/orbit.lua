---@meta
-- tim19Atlas stub generated from lua/ge/extensions/core/cameraModes/orbit.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Mode orbit. Champs : camRot (vec3 degrés : x lacet, y tangage), camDist, camMinDist, camMaxDist, defaultDistance, defaultRotation, fov, offset, orbitOffset, mode, target, lockCamera, collision (instance du filtre collision), smoothingEnabled.
---@class core_cameraModes_orbit
local core_cameraModes_orbit = {}

--- Calcule (une fois, mis en cache dans dynamicPitchLimit) l'inclinaison maximale vers le bas qui garde le bas de l'arrière du véhicule dans le champ de vision.
---Source : lua/ge/extensions/core/cameraModes/orbit.lua:53
---@param data table camData (utilise data.veh)
---@param targetPos vec3 point visé monde
---@return number  angle en radians (>= 0)
function core_cameraModes_orbit:calculateDynamicPitchLimit(data, targetPos) end

--- Restaure l'état de serialize et garde la rotation restaurée.
---Source : lua/ge/extensions/core/cameraModes/orbit.lua:153
---@param s table table de serialize
function core_cameraModes_orbit:deserialize(s) end

--- Crée l'état, le filtre collision, puis appelle onVehicleCameraConfigChanged, onSettingsChanged et reset.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/cameraModes/orbit.lua:27
function core_cameraModes_orbit:init() end

--- Réglages exposés à l'UI de contrôle caméra : dist, smooth, fov.
---Source : lua/ge/extensions/core/cameraModes/orbit.lua:169
---@return table[]  descripteurs de paramètres
function core_cameraModes_orbit:listParams() end

--- Hook : relit les réglages cameraOrbit* et transmet au filtre collision.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/cameraModes/orbit.lua:115
function core_cameraModes_orbit:onSettingsChanged() end

--- Hook : recharge distances, rotation par défaut, mode, FOV et réinitialise l'inclinaison dynamique.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/cameraModes/orbit.lua:91
function core_cameraModes_orbit:onVehicleCameraConfigChanged() end

--- Hook : transmet au filtre collision.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/cameraModes/orbit.lua:127
function core_cameraModes_orbit:onVehicleSwitched() end

--- Replanifie le recentrage de la caméra (3 images) et réinitialise le filtre collision ; sans effet si un recentrage est déjà en cours.
---Source : lua/ge/extensions/core/cameraModes/orbit.lua:131
function core_cameraModes_orbit:reset() end

--- État pour les vues flux vidéo (core_camera get/setContextCameraState) : rotation, distance, FOV.
---Source : lua/ge/extensions/core/cameraModes/orbit.lua:145
---@return table  {rot={x,y,z}, dist, fov}
function core_cameraModes_orbit:serialize() end

--- Définit la distance par défaut (utilisée au recentrage).
---Source : lua/ge/extensions/core/cameraModes/orbit.lua:210
---@param d number mètres
function core_cameraModes_orbit:setDefaultDistance(d) end

--- Définit la rotation par défaut au recentrage.
---Source : lua/ge/extensions/core/cameraModes/orbit.lua:222
---@param rot vec3 x lacet, y tangage en degrés
function core_cameraModes_orbit:setDefaultRotation(rot) end

--- Définit la distance courante.
---Source : lua/ge/extensions/core/cameraModes/orbit.lua:214
---@param d number mètres
function core_cameraModes_orbit:setDistance(d) end

--- Fixe le FOV de base.
---Source : lua/ge/extensions/core/cameraModes/orbit.lua:164
---@param fov number degrés
function core_cameraModes_orbit:setFOV(fov) end

--- Définit la distance maximale de zoom.
---Source : lua/ge/extensions/core/cameraModes/orbit.lua:218
---@param d number mètres
function core_cameraModes_orbit:setMaxDistance(d) end

--- Définit orbitOffset, décalage monde ajouté à la position de caméra.
---Source : lua/ge/extensions/core/cameraModes/orbit.lua:183
---@param v vec3 décalage (m)
function core_cameraModes_orbit:setOffset(v) end

--- Modifie dist, smooth ou fov.
---Source : lua/ge/extensions/core/cameraModes/orbit.lua:177
---@param key string dist, smooth, fov
---@param value any nouvelle valeur
function core_cameraModes_orbit:setParam(key, value) end

--- Impose le point cible et le repère en coordonnées monde (center nil = retour au suivi des nœuds du véhicule ; un changement déclenche reset).
---Source : lua/ge/extensions/core/cameraModes/orbit.lua:196
---@param center vec3|nil centre monde
---@param left vec3|nil point gauche monde
---@param back vec3|nil point arrière monde
function core_cameraModes_orbit:setRef(center, left, back) end

--- Définit les nœuds de référence du véhicule et le nœud arrière pour le FOV dynamique.
---Source : lua/ge/extensions/core/cameraModes/orbit.lua:187
---@param centerNodeID integer nœud centre
---@param leftNodeID integer nœud gauche
---@param backNodeID integer nœud arrière
---@param dynamicFovRearNodeID integer|nil nœud de l'arrière dont la taille à l'écran reste constante pendant l'effet de FOV dynamique
function core_cameraModes_orbit:setRefNodes(centerNodeID, leftNodeID, backNodeID, dynamicFovRearNodeID) end

--- Fixe la rotation d'orbite.
---Source : lua/ge/extensions/core/cameraModes/orbit.lua:139
---@param rot vec3 x lacet, y tangage en degrés
function core_cameraModes_orbit:setRotation(rot) end

--- Désactive le FOV dynamique selon la vitesse.
---Source : lua/ge/extensions/core/cameraModes/orbit.lua:226
---@param skip boolean vrai pour l'ignorer
function core_cameraModes_orbit:setSkipFovModifier(skip) end

--- Choisit le mode de cible ('ref' par défaut) et la base de décalage de caméra.
---Source : lua/ge/extensions/core/cameraModes/orbit.lua:205
---@param targetMode string par exemple 'ref' ou 'notCenter'
---@param camBase vec3|nil décalage de base dans le repère du véhicule, nil = calculé depuis offset
function core_cameraModes_orbit:setTargetMode(targetMode, camBase) end

--- Calcule la pose de l'orbite et écrit data.res (pos, rot, fov, targetPos, collisionCompatible = true), puis applique le filtre collision.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/cameraModes/orbit.lua:248
---@param data table camData (data.lookBack, data.speed, data.fastSpeedModifier, data.teleported lus)
---@return boolean  false si les nœuds de référence sont dégénérés, sinon true
function core_cameraModes_orbit:update(data) end

