---@meta
-- tim19Atlas stub generated from lua/ge/extensions/core/cameraModes/scriptedFree.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Mode caméra libre scriptée. Champs : pos (vec3), yawDeg, pitchDeg, rollDeg, fov, locked, driveRot, allowLookWhenLocked, allowLook, allowMove, manualSpeed, lookSens, smoothPos, smoothRot, anim.
---@class core_cameraModes_scriptedFree
local core_cameraModes_scriptedFree = {}

--- Annule l'animation en cours (la caméra reste à sa position actuelle, sans rappel onDone).
---Source : lua/ge/extensions/core/cameraModes/scriptedFree.lua:227
function core_cameraModes_scriptedFree:cancelTarget() end

--- Pose courante.
---Source : lua/ge/extensions/core/cameraModes/scriptedFree.lua:215
---@return vec3  position
---@return number  lacet degrés
---@return number  tangage degrés (vers le bas positif)
---@return number  roulis degrés
function core_cameraModes_scriptedFree:getPose() end

--- Orientation courante en quaternion.
---Source : lua/ge/extensions/core/cameraModes/scriptedFree.lua:219
---@return quat  rotation
function core_cameraModes_scriptedFree:getQuat() end

--- Valeurs par défaut (voir module).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/cameraModes/scriptedFree.lua:78
function core_cameraModes_scriptedFree:init() end

--- Indique si un setTarget est en cours.
---Source : lua/ge/extensions/core/cameraModes/scriptedFree.lua:223
---@return boolean  true si animation
function core_cameraModes_scriptedFree:isAnimating() end

--- Autorise le regard à la souris pendant le verrouillage.
---Source : lua/ge/extensions/core/cameraModes/scriptedFree.lua:202
---@param enabled boolean activer
function core_cameraModes_scriptedFree:setAllowLookWhenLocked(enabled) end

--- Applique en une fois des réglages (appelé par setByName / setGlobalCameraByName) : pos, yawDeg, pitchDeg, rollDeg, locked, driveRot, allowLookWhenLocked, manualSpeed, lookSens, fov, allowLook, allowMove, smoothPos, smoothRot ; les clés absentes sont inchangées.
---Source : lua/ge/extensions/core/cameraModes/scriptedFree.lua:104
---@param data table|nil options
function core_cameraModes_scriptedFree:setCustomData(data) end

--- Autorise setPose/setTarget à piloter la rotation.
---Source : lua/ge/extensions/core/cameraModes/scriptedFree.lua:198
---@param enabled boolean activer
function core_cameraModes_scriptedFree:setDriveRot(enabled) end

--- Fixe le FOV.
---Source : lua/ge/extensions/core/cameraModes/scriptedFree.lua:210
---@param fovDeg number degrés
function core_cameraModes_scriptedFree:setFOV(fovDeg) end

--- Verrouille la position (le script la possède, pas de WASD).
---Source : lua/ge/extensions/core/cameraModes/scriptedFree.lua:194
---@param locked boolean verrouiller
function core_cameraModes_scriptedFree:setLocked(locked) end

--- Vitesse de déplacement manuelle.
---Source : lua/ge/extensions/core/cameraModes/scriptedFree.lua:206
---@param mps number mètres par seconde
function core_cameraModes_scriptedFree:setManualSpeed(mps) end

--- Fixe la pose cible (instantanée, ou lissée si smoothPos/smoothRot > 0) et annule une animation en cours. La rotation est ignorée si driveRot est faux.
---Source : lua/ge/extensions/core/cameraModes/scriptedFree.lua:163
---@param pos vec3|nil position monde
---@param yawDeg number|nil lacet
---@param pitchDeg number|nil tangage vers le bas
---@param rollDeg number|nil roulis
function core_cameraModes_scriptedFree:setPose(pos, yawDeg, pitchDeg, rollDeg) end

--- Place la caméra (et son but de lissage) sans animation ; ignore nil.
---Source : lua/ge/extensions/core/cameraModes/scriptedFree.lua:127
---@param position vec3|nil position monde
function core_cameraModes_scriptedFree:setPosition(position) end

--- Oriente la caméra depuis un quaternion.
---Source : lua/ge/extensions/core/cameraModes/scriptedFree.lua:135
---@param rotation quat|nil orientation monde
function core_cameraModes_scriptedFree:setRotation(rotation) end

--- Temps de lissage continu (secondes pour atteindre ~63 %) ; 0 = setPose instantané.
---Source : lua/ge/extensions/core/cameraModes/scriptedFree.lua:189
---@param posSec number|nil pour la position
---@param rotSec number|nil pour la rotation
function core_cameraModes_scriptedFree:setSmooth(posSec, rotSec) end

--- Vol vers une pose pendant une durée. Sans durée (<= 0), applique la pose immédiatement puis appelle onDone.
---Source : lua/ge/extensions/core/cameraModes/scriptedFree.lua:249
---@param opts table pos (vec3), orientation par lookAt (vec3) ou dir (vec3) ou rot (quat) ou yawDeg/pitchDeg/rollDeg, time ou duration (s), ease (linear, smoothstep, easeInOut, easeIn, easeOut ; smoothstep par défaut), fov, onDone (fonction), lockDuring (défaut true), forceRot (applique la rotation même si driveRot est faux)
function core_cameraModes_scriptedFree:setTarget(opts) end

--- Fixe les angles (les arguments nil sont inchangés).
---Source : lua/ge/extensions/core/cameraModes/scriptedFree.lua:148
---@param yawDeg number|nil lacet en degrés
---@param pitchDownDeg number|nil tangage en degrés, positif vers le bas
---@param rollDeg number|nil roulis en degrés
function core_cameraModes_scriptedFree:setYawPitchRollDeg(yawDeg, pitchDownDeg, rollDeg) end

--- Applique l'animation, le regard, le déplacement manuel ou le lissage et écrit data.res.pos / rot / fov.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/cameraModes/scriptedFree.lua:380
---@param data table camData
---@return boolean  true
function core_cameraModes_scriptedFree:update(data) end

