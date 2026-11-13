---@meta
-- tim19Atlas stub generated from lua/ge/extensions/core/cameraModes/bigMapOrtho.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Instance de la caméra bigMapOrtho. Champs : fovMin (50), fovMax (1000, remplacé par la taille de carte), angle, rotAngle, posTransitionTime (2.4), movementSpeed (20), nearClipValue, drawIcons, initialCamData, mapBoundaries, manualzoom, bigMapCamPosition, bigMapCamRotation.
---@class core_cameraModes_bigMapOrtho
local core_cameraModes_bigMapOrtho = {}

--- Niveau de zoom relatif en trois étages : 0, 0.5 ou 1.
---Source : lua/ge/extensions/core/cameraModes/bigMapOrtho.lua:108
---@param fov number Taille ortho courante
---@return number  0, 0.5 ou 1
function core_cameraModes_bigMapOrtho:getZoomStage(fov) end

--- Initialise les paramètres par défaut, marque la caméra globale et cachée, crée le zoom manuel.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/cameraModes/bigMapOrtho.lua:19
function core_cameraModes_bigMapOrtho:init() end

--- Gain ou perte de focus : distance de rendu du véhicule portée à 5000 (puis restaurée) ; à la perte de focus, désactive la caméra orthographique (core_orthoCamera.enable(false)) et abandonne le glisser.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/cameraModes/bigMapOrtho.lua:47
---@param focused boolean true si la caméra devient active
function core_cameraModes_bigMapOrtho:onCameraChanged(focused) end

--- Après rechargement Lua : init puis reconstruit mapBoundaries en Box3F.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/cameraModes/bigMapOrtho.lua:230
function core_cameraModes_bigMapOrtho:onDeserialized() end

--- Début/fin du glisser de carte.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/cameraModes/bigMapOrtho.lua:215
---@param buttonDown boolean true à l'appui
---@param mouseDragging boolean Non utilisé
function core_cameraModes_bigMapOrtho:onMouseButton(buttonDown, mouseDragging) end

--- Convertit mapBoundaries (Box3F) en table avant rechargement Lua.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/cameraModes/bigMapOrtho.lua:224
function core_cameraModes_bigMapOrtho:onSerialize() end

--- Recentre en douceur sur une position monde (bigMapPan.setTarget).
---Source : lua/ge/extensions/core/cameraModes/bigMapOrtho.lua:116
---@param worldPos vec3 Position monde
function core_cameraModes_bigMapOrtho:panToWorldPos(worldPos) end

--- Remet le zoom manuel à zéro.
---Source : lua/ge/extensions/core/cameraModes/bigMapOrtho.lua:39
function core_cameraModes_bigMapOrtho:reset() end

--- Reçoit {initialCamData = {pos, rot}}, calcule le point regardé, active la caméra orthographique à la taille moyenne de la carte et règle fovMax.
---Source : lua/ge/extensions/core/cameraModes/bigMapOrtho.lua:90
---@param data table|nil {initialCamData = {pos = vec3, rot = quat}}
function core_cameraModes_bigMapOrtho:setCustomData(data) end

--- Réinitialise (appelle init) pour appliquer les propriétés du niveau.
---Source : lua/ge/extensions/core/cameraModes/bigMapOrtho.lua:43
function core_cameraModes_bigMapOrtho:setLevelProperties() end

--- Calcul par frame (comme bigMap) puis règle les options de la caméra ortho (size, nearClip, farClip) via core_orthoCamera.setOptions.
---Source : lua/ge/extensions/core/cameraModes/bigMapOrtho.lua:125
---@param data table Données de frame : dtReal, res {pos, rot, fov}
---@return boolean  Toujours true
function core_cameraModes_bigMapOrtho:update(data) end

--- Applique un cran de zoom (molette) avec accélération et mémorise le point de sol sous la souris.
---Source : lua/ge/extensions/core/cameraModes/bigMapOrtho.lua:76
---@param value number Cran de molette signé
function core_cameraModes_bigMapOrtho:zoom(value) end

--- Zoome en douceur vers un facteur donné.
---Source : lua/ge/extensions/core/cameraModes/bigMapOrtho.lua:120
---@param factor number Facteur de zoom
function core_cameraModes_bigMapOrtho:zoomToFactor(factor) end

