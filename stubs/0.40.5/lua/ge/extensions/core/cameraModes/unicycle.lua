---@meta
-- tim19Atlas stub generated from lua/ge/extensions/core/cameraModes/unicycle.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Mode caméra piéton. Champs : pos (vec3), rotVec (vec3 degrés, y = 180 pour regarder à l'horizontale).
---@class core_cameraModes_unicycle
local core_cameraModes_unicycle = {}

--- Position et rotation courantes de la caméra.
---Source : lua/ge/extensions/core/cameraModes/unicycle.lua:164
---@return vec3  position
---@return quat  rotation
function core_cameraModes_unicycle:getPosRot() end

--- Prépare le lissage du zoom et lit les réglages.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/cameraModes/unicycle.lua:20
function core_cameraModes_unicycle:init() end

--- Hook : charge ou quitte la disposition d'interface « unicycle » (voir notes).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/cameraModes/unicycle.lua:33
---@param focused boolean vrai si le mode prend le focus
function core_cameraModes_unicycle:onCameraChanged(focused) end

--- Hook : relit les réglages snap turn OpenXR.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/cameraModes/unicycle.lua:28
function core_cameraModes_unicycle:onSettingsChanged() end

--- Remet le lissage du zoom à zéro.
---Source : lua/ge/extensions/core/cameraModes/unicycle.lua:47
function core_cameraModes_unicycle:reset() end

--- Fixe la position et/ou l'orientation initiales ; appelé par setGlobalCameraByName.
---Source : lua/ge/extensions/core/cameraModes/unicycle.lua:153
---@param customData table|nil pos (vec3, ramenée au niveau des yeux), front et up (vec3, direction de départ)
function core_cameraModes_unicycle:setCustomData(customData) end

--- Applique rotation, zoom et position, et envoie la rotation au contrôleur du joueur.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/cameraModes/unicycle.lua:173
---@param data table camData (data.unicycleZoom, data.player lus)
---@return boolean  true
function core_cameraModes_unicycle:update(data) end

