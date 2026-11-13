---@meta
-- tim19Atlas stub generated from lua/ge/extensions/core/cameraModes/steadycam.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Mode steadycam. Champs : pos (vec3 yeux), yaw, pitch (radians), vel, vz, grounded, walkSpeed, groundWalk, eyeHeight, manualzoom, bobbing.
---@class core_cameraModes_steadycam
local core_cameraModes_steadycam = {}

--- Restaure l'état (accepte l'ancienne clé bob).
---Source : lua/ge/extensions/core/cameraModes/steadycam.lua:129
---@param s table table de serialize
function core_cameraModes_steadycam:deserialize(s) end

--- Définit groupe, constantes de sensation et crée zoom et bobbing.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/cameraModes/steadycam.lua:30
function core_cameraModes_steadycam:init() end

--- Réglages UI : height, walkSpeed, walkBob, standingBob, groundWalk, fov.
---Source : lua/ge/extensions/core/cameraModes/steadycam.lua:104
---@return table[]  descripteurs
function core_cameraModes_steadycam:listParams() end

--- Hook : pousse l'action map « Steadycam » au gain de focus et la retire à la perte.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/cameraModes/steadycam.lua:94
---@param focused boolean vrai si le mode prend le focus
function core_cameraModes_steadycam:onCameraChanged(focused) end

--- Hook : relit hauteur des yeux, FOV et réglages de bobbing.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/cameraModes/steadycam.lua:55
function core_cameraModes_steadycam:onSettingsChanged() end

--- Annule vitesses, saut et état au sol, réinitialise bobbing et zoom.
---Source : lua/ge/extensions/core/cameraModes/steadycam.lua:65
function core_cameraModes_steadycam:reset() end

--- État pour les vues flux vidéo.
---Source : lua/ge/extensions/core/cameraModes/steadycam.lua:124
---@return table  {fov, height, walkSpeed, walkBob, standingBob, groundWalk}
function core_cameraModes_steadycam:serialize() end

--- Fixe le FOV configuré (10 à 140).
---Source : lua/ge/extensions/core/cameraModes/steadycam.lua:87
---@param fov number|nil degrés
function core_cameraModes_steadycam:setFOV(fov) end

--- Modifie un réglage de listParams.
---Source : lua/ge/extensions/core/cameraModes/steadycam.lua:115
---@param key string height, walkSpeed, walkBob, standingBob, groundWalk, fov
---@param value any nouvelle valeur
function core_cameraModes_steadycam:setParam(key, value) end

--- Place la caméra (alimenté à l'entrée du groupe de caméras pour ne pas sauter) et annule la vitesse.
---Source : lua/ge/extensions/core/cameraModes/steadycam.lua:80
---@param p vec3 position des yeux monde
function core_cameraModes_steadycam:setPosition(p) end

--- Oriente le regard depuis un quaternion (la caméra regarde vers +Y).
---Source : lua/ge/extensions/core/cameraModes/steadycam.lua:81
---@param q quat orientation monde
function core_cameraModes_steadycam:setRotation(q) end

--- Intègre regard, marche, gravité, saut et écrit data.res (pos, rot, fov, targetPos 10 m devant).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/cameraModes/steadycam.lua:139
---@param data table camData
---@return boolean  true
function core_cameraModes_steadycam:update(data) end

