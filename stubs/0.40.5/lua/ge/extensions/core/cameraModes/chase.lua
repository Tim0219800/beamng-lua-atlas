---@meta
-- tim19Atlas stub generated from lua/ge/extensions/core/cameraModes/chase.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Instance du mode 'chase' pour un véhicule. Champs principaux : defaultRotation, camRot, distance, defaultDistance, camMinDist, camDist, mode, fov, offset, refNodes {ref,left,back}, forwardLooking, rollSmoothing, collision.
---@class core_cameraModes_chase
local core_cameraModes_chase = {}

--- Initialise les lisseurs, l'état de suivi, le module de collision et applique la configuration, les réglages et un reset. Appelé par le constructeur.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/cameraModes/chase.lua:13
function core_cameraModes_chase:init() end

--- Renvoie la liste des réglages ajustables pour l'UI de contrôle de caméra / flux vidéo : uniquement le FOV (10 à 140 degrés, pas 1, défaut 65) car la distance est recalculée à chaque frame.
---Source : lua/ge/extensions/core/cameraModes/chase.lua:62
---@return table  Liste de descripteurs {key='fov', icon, title, kind='range', type='int', value, default, min, max, step, unit}
function core_cameraModes_chase:listParams() end

--- Hook appelé quand la souris est verrouillée ou libérée : à la libération, remet à zéro l'entrée relative accumulée (relYaw, relPitch).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/cameraModes/chase.lua:261
---@param locked boolean true si la souris est verrouillée
function core_cameraModes_chase:mouseLocked(locked) end

--- Relit les réglages (cameraOrbitRelaxation, cameraChaseRollSmoothing), prévient le module de collision et fait un reset. Appelé quand les réglages changent.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/cameraModes/chase.lua:54
function core_cameraModes_chase:onSettingsChanged() end

--- Applique la configuration jbeam de la caméra : defaultRotation (y inversé, défaut (0,-17,0)), distances, mode ('ref' par défaut), FOV (65 par défaut), offset. Appelé à la création et quand les données jbeam du véhicule changent.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/cameraModes/chase.lua:35
function core_cameraModes_chase:onVehicleCameraConfigChanged() end

--- Remet la caméra derrière le véhicule (rotation par défaut, x à 0, regard vers l'avant) et force un recalage au prochain frame.
---Source : lua/ge/extensions/core/cameraModes/chase.lua:72
function core_cameraModes_chase:reset() end

--- Applique un réglage ajustable. Seule la clé 'fov' est gérée.
---Source : lua/ge/extensions/core/cameraModes/chase.lua:68
---@param key string Clé du réglage ('fov')
---@param value number|string Nouvelle valeur (convertie par tonumber)
function core_cameraModes_chase:setParam(key, value) end

--- Mémorise les noeuds de référence du véhicule (centre, gauche, arrière), appelé par camera.lua à la création de la caméra.
---Source : lua/ge/extensions/core/cameraModes/chase.lua:254
---@param centerNodeID integer Noeud central (ref)
---@param leftNodeID integer Noeud à gauche
---@param backNodeID integer Noeud à l'arrière
function core_cameraModes_chase:setRefNodes(centerNodeID, leftNodeID, backNodeID) end

--- Calcul par frame, appelé par cameraUpdate quand ce mode est la caméra focalisée : lit les entrées MoveManager, calcule la direction et le haut du véhicule depuis les noeuds de référence, positionne la caméra derrière la cible (lissage de rotation et de distance) et écrit data.res.pos, rot, fov, targetPos, puis applique la collision.
---Source : lua/ge/extensions/core/cameraModes/chase.lua:82
---@param data table Données de frame : veh, pos, dt, res {pos, rot, fov, targetPos...}
---@return boolean  true si le résultat est valide, false si les noeuds de référence sont dégénérés
function core_cameraModes_chase:update(data) end

