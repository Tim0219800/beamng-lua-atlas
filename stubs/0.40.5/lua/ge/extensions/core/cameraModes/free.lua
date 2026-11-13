---@meta
-- tim19Atlas stub generated from lua/ge/extensions/core/cameraModes/free.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Mode caméra libre. Champs : pos (vec3), rot (vec3 radians), velocity, angularVelocity, planarVelocity, manualzoom, smoothed, newtonTranslation, newtonRotation, planarTranslation (et planarTranslationScale/Drag/Response/SpeedMultiplier pour le mode planaire), group = 'world', groupOrder.
---@class core_cameraModes_free
local core_cameraModes_free = {}

--- Annule la vitesse angulaire.
---Source : lua/ge/extensions/core/cameraModes/free.lua:122
function core_cameraModes_free:clearAngularMotion() end

--- Annule les vitesses de translation, planaire et angulaire.
---Source : lua/ge/extensions/core/cameraModes/free.lua:116
function core_cameraModes_free:clearMotion() end

--- Annule l'entrée planaire externe.
---Source : lua/ge/extensions/core/cameraModes/free.lua:135
function core_cameraModes_free:clearPlanarTranslationInput() end

--- Annule la vitesse planaire et l'entrée planaire externe.
---Source : lua/ge/extensions/core/cameraModes/free.lua:140
function core_cameraModes_free:clearPlanarTranslationMotion() end

--- Définit les valeurs par défaut (isGlobal, group, hidden, canUseVehicleTriggerCrosshair, physique non lissée) puis reset.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/cameraModes/free.lua:50
function core_cameraModes_free:init() end

--- Réglages exposés à l'UI de contrôle caméra / flux vidéo : speed (2-100 m/s, lu via core_camera.getSpeed), smooth, newtonRot, newtonTrans, fov (10-140).
---Source : lua/ge/extensions/core/cameraModes/free.lua:92
---@param ctxId any identifiant du contexte de vue (déduit du code)
---@return table[]  descripteurs de paramètres
function core_cameraModes_free:listParams(ctxId) end

--- Hook : au gain de focus, appelle reset.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/cameraModes/free.lua:145
---@param focused boolean vrai si le mode prend le focus
function core_cameraModes_free:onCameraChanged(focused) end

--- Annule vitesses et roulis, recrée le zoom manuel à 65 degrés.
---Source : lua/ge/extensions/core/cameraModes/free.lua:21
function core_cameraModes_free:reset() end

--- Réinitialise le zoom manuel avec ce FOV.
---Source : lua/ge/extensions/core/cameraModes/free.lua:77
---@param fovDeg number degrés
function core_cameraModes_free:setFOV(fovDeg) end

--- Active la rotation avec inertie.
---Source : lua/ge/extensions/core/cameraModes/free.lua:81
---@param enabled boolean activer
function core_cameraModes_free:setNewtonRotation(enabled) end

--- Active la translation avec inertie.
---Source : lua/ge/extensions/core/cameraModes/free.lua:85
---@param enabled boolean activer
function core_cameraModes_free:setNewtonTranslation(enabled) end

--- Modifie un réglage de listParams (speed passe par core_camera.setSpeed).
---Source : lua/ge/extensions/core/cameraModes/free.lua:102
---@param key string speed, smooth, fov, newtonRot, newtonTrans
---@param value any nouvelle valeur
---@param ctxId any contexte de vue
function core_cameraModes_free:setParam(key, value, ctxId) end

--- Fournit une vitesse planaire externe (par exemple depuis un gamepad) pour l'image ; effacée après chaque update.
---Source : lua/ge/extensions/core/cameraModes/free.lua:126
---@param velocity vec3|nil vitesse monde
---@param active boolean vrai pour l'appliquer (sinon remise à zéro)
function core_cameraModes_free:setPlanarTranslationInput(velocity, active) end

--- Fixe la position de la caméra (la table est conservée par référence).
---Source : lua/ge/extensions/core/cameraModes/free.lua:73
---@param position vec3 position monde
function core_cameraModes_free:setPosition(position) end

--- Fixe l'orientation depuis un quaternion.
---Source : lua/ge/extensions/core/cameraModes/free.lua:110
---@param rotation quat orientation monde
function core_cameraModes_free:setRotation(rotation) end

--- Choisit le jeu de paramètres de physique (lissé ou non lissé).
---Source : lua/ge/extensions/core/cameraModes/free.lua:32
---@param smoothed boolean vrai pour le mode cinématique lissé
function core_cameraModes_free:setSmoothedCam(smoothed) end

--- Intègre rotation et translation à partir de MoveManager et écrit data.res.pos / rot, puis applique le zoom.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/cameraModes/free.lua:237
---@param data table camData (data.speed, data.fastSpeedModifier lus)
---@return boolean  true
function core_cameraModes_free:update(data) end

