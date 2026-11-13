---@meta
-- tim19Atlas stub generated from lua/ge/extensions/core/cameraModes/bigMap.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Instance de la caméra bigMap. Champs : fovMin (25), fovMax (42), angle (53), rotAngle (25), posTransitionTime (2.4), transitionActive, movementSpeed (20), nearClipValue (100), drawIcons, initialCamData, mapBoundaries (Box3F), manualzoom, bigMapCamPosition, bigMapCamRotation.
---@class core_cameraModes_bigMap
local core_cameraModes_bigMap = {}

--- Niveau de zoom relatif en trois étages d'après le FOV : 0 (proche, <= 33 %), 0.5, 1 (large).
---Source : lua/ge/extensions/core/cameraModes/bigMap.lua:102
---@param fov number FOV courant (degrés)
---@return number  0, 0.5 ou 1
function core_cameraModes_bigMap:getZoomStage(fov) end

--- Initialise les paramètres par défaut, marque la caméra globale et cachée, crée le zoom manuel (de fovMax vers fovMin).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/cameraModes/bigMap.lua:18
function core_cameraModes_bigMap:init() end

--- Appelée par camera.lua quand la caméra gagne ou perd le focus : à l'activation, mémorise et porte la distance de rendu du véhicule à 5000 ; à la désactivation, restaure la distance et abandonne un éventuel glisser de souris.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/cameraModes/bigMap.lua:46
---@param focused boolean true si la caméra devient active
function core_cameraModes_bigMap:onCameraChanged(focused) end

--- Après rechargement Lua : réinitialise (init) et reconstruit mapBoundaries en Box3F.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/cameraModes/bigMap.lua:218
function core_cameraModes_bigMap:onDeserialized() end

--- Appelée à l'appui/relâchement du bouton de souris : démarre ou arrête le glisser de la carte.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/cameraModes/bigMap.lua:203
---@param buttonDown boolean true à l'appui
---@param mouseDragging boolean Indicateur de glisser (non utilisé)
function core_cameraModes_bigMap:onMouseButton(buttonDown, mouseDragging) end

--- Prépare la sérialisation avant rechargement Lua : convertit mapBoundaries (Box3F) en table.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/cameraModes/bigMap.lua:212
function core_cameraModes_bigMap:onSerialize() end

--- Recentre en douceur la caméra pour que la position monde (au sol) soit au centre de l'écran (bigMapPan.setTarget).
---Source : lua/ge/extensions/core/cameraModes/bigMap.lua:110
---@param worldPos vec3 Position monde
function core_cameraModes_bigMap:panToWorldPos(worldPos) end

--- Remet le zoom manuel à zéro.
---Source : lua/ge/extensions/core/cameraModes/bigMap.lua:38
function core_cameraModes_bigMap:reset() end

--- Reçoit les données d'activation {initialCamData = {pos, rot}} de setByName, calcule le vecteur caméra vers le point regardé et prépare le zoom.
---Source : lua/ge/extensions/core/cameraModes/bigMap.lua:88
---@param data table|nil {initialCamData = {pos = vec3, rot = quat}}
function core_cameraModes_bigMap:setCustomData(data) end

--- Réinitialise (appelle init) pour appliquer les propriétés du niveau (taille de carte).
---Source : lua/ge/extensions/core/cameraModes/bigMap.lua:42
function core_cameraModes_bigMap:setLevelProperties() end

--- Calcul par frame : applique zoom, glisser de souris, déplacement clavier (MoveManager.forward/backward/left/right), recentrage animé, limites de carte, puis écrit data.res.pos, rot, fov et nearClip (100).
---Source : lua/ge/extensions/core/cameraModes/bigMap.lua:118
---@param data table Données de frame : dtReal, res {pos, rot, fov, nearClip}
---@return boolean  Toujours true
function core_cameraModes_bigMap:update(data) end

--- Applique un cran de zoom (molette) : accélère progressivement et mémorise le point de sol sous la souris pour garder le curseur en place.
---Source : lua/ge/extensions/core/cameraModes/bigMap.lua:74
---@param value number Cran de molette signé (0 = rien)
function core_cameraModes_bigMap:zoom(value) end

--- Zoome en douceur vers un facteur donné (bigMapPan.zoomToFactor).
---Source : lua/ge/extensions/core/cameraModes/bigMap.lua:114
---@param factor number Facteur de zoom
function core_cameraModes_bigMap:zoomToFactor(factor) end

