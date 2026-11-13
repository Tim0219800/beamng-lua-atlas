---@meta
-- tim19Atlas stub generated from lua/ge/extensions/core/cameraModes/relative.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Mode relatif. Champs : pos (vec3 repère véhicule), rot (vec3 degrés), slots, lightIntensity, nearClip (nil = niveau), manualzoom, camMaxDist.
---@class core_cameraModes_relative
local core_cameraModes_relative = {}

--- Applique une intensité (>= 0) à la lumière de la caméra, la crée si besoin.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/cameraModes/relative.lua:48
---@param intensity number|nil lumens ; nil = garde la valeur actuelle
function core_cameraModes_relative:_updateLight(intensity) end

--- Restaure l'état de serialize.
---Source : lua/ge/extensions/core/cameraModes/relative.lua:202
---@param s table table de serialize
function core_cameraModes_relative:deserialize(s) end

--- Raccourci clavier d'emplacement ; ignoré sans focus.
---Source : lua/ge/extensions/core/cameraModes/relative.lua:236
---@param hotkey integer numéro d'emplacement
---@param modifier integer 0 = charger, 1 = enregistrer
function core_cameraModes_relative:hotkey(hotkey, modifier) end

--- Valeurs par défaut (resetCameraOnVehicleReset = false, disabledByDefault, canUseVehicleTriggerCrosshair) puis onVehicleCameraConfigChanged et reset.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/cameraModes/relative.lua:23
function core_cameraModes_relative:init() end

--- Réglages UI : light, nearClip, slots, fov.
---Source : lua/ge/extensions/core/cameraModes/relative.lua:214
---@return table[]  descripteurs
function core_cameraModes_relative:listParams() end

--- Charge un emplacement ; message UI si vide.
---Source : lua/ge/extensions/core/cameraModes/relative.lua:159
---@param slot integer|string numéro ou nom d'emplacement
---@return boolean  true si chargé
function core_cameraModes_relative:loadSlot(slot) end

--- Hook : au gain de focus, ajoute les menus et rallume la lumière ; à la perte, éteint la lumière.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/cameraModes/relative.lua:250
---@param focused boolean vrai si le mode prend le focus
function core_cameraModes_relative:onCameraChanged(focused) end

--- Hook : garantit refNodes (défaut 0,1,2) et planifie le recalcul de caméra.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/cameraModes/relative.lua:39
function core_cameraModes_relative:onVehicleCameraConfigChanged() end

--- Revient à la position et rotation initiales et recrée les lisseurs.
---Source : lua/ge/extensions/core/cameraModes/relative.lua:259
function core_cameraModes_relative:reset() end

--- Remet la lumière mémorisée par storeLightInfo.
---Source : lua/ge/extensions/core/cameraModes/relative.lua:143
function core_cameraModes_relative:restoreLightInfo() end

--- Enregistre position, rotation et FOV dans l'emplacement indiqué.
---Source : lua/ge/extensions/core/cameraModes/relative.lua:150
---@param slot integer numéro d'emplacement (1 à 10)
function core_cameraModes_relative:saveSlot(slot) end

--- Ajoute les entrées du menu radial quickAccess (lumière, nearClip, emplacements) tant que la caméra a le focus.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/cameraModes/relative.lua:64
function core_cameraModes_relative:sendMenus() end

--- État pour les vues flux vidéo : pos, rot, fov, light, nearClip.
---Source : lua/ge/extensions/core/cameraModes/relative.lua:192
---@return table  état
function core_cameraModes_relative:serialize() end

--- Fixe le FOV du zoom manuel.
---Source : lua/ge/extensions/core/cameraModes/relative.lua:178
---@param fov number degrés
function core_cameraModes_relative:setFOV(fov) end

--- Limite l'éloignement par rapport au nœud ref.
---Source : lua/ge/extensions/core/cameraModes/relative.lua:269
---@param d number|nil mètres, nil = illimité
function core_cameraModes_relative:setMaxDistance(d) end

--- Fixe la position de la caméra dans le repère du véhicule.
---Source : lua/ge/extensions/core/cameraModes/relative.lua:186
---@param pos vec3 position relative
function core_cameraModes_relative:setOffset(pos) end

--- Modifie light, nearClip, fov ou slots (enregistre ou charge l'emplacement donné).
---Source : lua/ge/extensions/core/cameraModes/relative.lua:226
---@param key string light, nearClip, fov, slots
---@param value any nouvelle valeur
function core_cameraModes_relative:setParam(key, value) end

--- Définit les nœuds de référence du véhicule.
---Source : lua/ge/extensions/core/cameraModes/relative.lua:389
---@param centerNodeID integer nœud centre
---@param leftNodeID integer nœud gauche
---@param backNodeID integer nœud arrière
function core_cameraModes_relative:setRefNodes(centerNodeID, leftNodeID, backNodeID) end

--- Fixe la rotation de la caméra.
---Source : lua/ge/extensions/core/cameraModes/relative.lua:182
---@param rot vec3 x lacet, y tangage, z roulis en degrés
function core_cameraModes_relative:setRotation(rot) end

--- Mémorise l'intensité et éteint la lumière.
---Source : lua/ge/extensions/core/cameraModes/relative.lua:245
function core_cameraModes_relative:storeLightInfo() end

--- Intègre les entrées, déplace la caméra dans le repère du véhicule et écrit data.res (pos, rot, nearClip) ; positionne la lumière.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/cameraModes/relative.lua:273
---@param data table camData
---@return boolean  false si les nœuds sont dégénérés, sinon true
function core_cameraModes_relative:update(data) end

