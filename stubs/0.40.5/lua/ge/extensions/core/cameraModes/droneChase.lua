---@meta
-- tim19Atlas stub generated from lua/ge/extensions/core/cameraModes/droneChase.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Mode drone. Champs : camDist, height, fov, bank, floating, safeDist, positionOffset, orbitYaw, orbitPitch, pos, vel, head.
---@class core_cameraModes_droneChase
local core_cameraModes_droneChase = {}

--- Garde la distance de sécurité par rapport aux maillages statiques : reste du côté du véhicule d'un mur éventuel, et repousse hors de tout obstacle à moins de safeDist (6 sondes horizontales).
---Source : lua/ge/extensions/core/cameraModes/droneChase.lua:158
---@param x number x monde
---@param y number y monde
---@param z number z monde
---@param car vec3 centre du véhicule
---@return number  x corrigé
---@return number  y corrigé
---@return number  z corrigé
function core_cameraModes_droneChase:avoid(x, y, z, car) end

--- Corrige l'altitude pour suivre le véhicule : sous couvert reste entre sol+2 m et plafond-0.8 m ; à ciel ouvert monte pour survoler les collines.
---Source : lua/ge/extensions/core/cameraModes/droneChase.lua:96
---@param x number x monde
---@param y number y monde
---@param z number altitude souhaitée
---@param car vec3 centre de la boîte englobante du véhicule
---@return number  altitude corrigée
function core_cameraModes_droneChase:clampAltitude(x, y, z, car) end

--- Restaure l'état sauvegardé et force le replacement.
---Source : lua/ge/extensions/core/cameraModes/droneChase.lua:141
---@param s table table renvoyée par serialize
function core_cameraModes_droneChase:deserialize(s) end

--- Définit les valeurs par défaut et appelle reset.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/cameraModes/droneChase.lua:57
function core_cameraModes_droneChase:init() end

--- Liste des réglages exposés à l'UI de contrôle caméra / flux vidéo (dist, height, bank, float, safeDist, fov).
---Source : lua/ge/extensions/core/cameraModes/droneChase.lua:114
---@return table[]  descripteurs {key, title, kind, type, value, default, min, max, step, unit}
function core_cameraModes_droneChase:listParams() end

--- Hook : au gain de focus, le drone est replacé.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/cameraModes/droneChase.lua:86
---@param focused boolean vrai si le mode prend le focus
function core_cameraModes_droneChase:onCameraChanged(focused) end

--- Place le drone instantanément à une position et annule sa vitesse.
---Source : lua/ge/extensions/core/cameraModes/droneChase.lua:88
---@param position vec3 position monde
function core_cameraModes_droneChase:placeInit(position) end

--- Remet le drone à replacer, annule vitesse, décalage et orbite.
---Source : lua/ge/extensions/core/cameraModes/droneChase.lua:73
function core_cameraModes_droneChase:reset() end

--- Sauvegarde l'état du mode (distance, fov, hauteur, bank, float, safeDist, positionOffset, orbite).
---Source : lua/ge/extensions/core/cameraModes/droneChase.lua:134
---@return table  état
function core_cameraModes_droneChase:serialize() end

--- Fixe la distance de suivi bornée à [4, 80] m.
---Source : lua/ge/extensions/core/cameraModes/droneChase.lua:84
---@param d number|nil distance en mètres
function core_cameraModes_droneChase:setDistance(d) end

--- Fixe le champ de vision.
---Source : lua/ge/extensions/core/cameraModes/droneChase.lua:85
---@param fov number degrés
function core_cameraModes_droneChase:setFOV(fov) end

--- Modifie un réglage listParams (valeurs bornées).
---Source : lua/ge/extensions/core/cameraModes/droneChase.lua:125
---@param key string dist, fov, height, bank, float ou safeDist
---@param value number|string nouvelle valeur (convertie en nombre)
function core_cameraModes_droneChase:setParam(key, value) end

--- Calcule la pose du drone et l'écrit dans data.res (pos, rot, fov, targetPos).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/cameraModes/droneChase.lua:183
---@param data table camData
---@return boolean  true
function core_cameraModes_droneChase:update(data) end

---@type number
i = nil
