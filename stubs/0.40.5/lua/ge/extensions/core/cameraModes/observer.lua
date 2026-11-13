---@meta
-- tim19Atlas stub generated from lua/ge/extensions/core/cameraModes/observer.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Caméra observateur.
---@class core_cameraModes_observer
local core_cameraModes_observer = {}

--- isGlobal = true, hidden = true, aucun objet caméra associé.
---Source : lua/ge/extensions/core/cameraModes/observer.lua:8
function core_cameraModes_observer:init() end

--- Hook : quand ce mode prend le focus, envoie onCameraNameChanged à l'UI et le hook onCameraModeChanged('observer') ; en le perdant, recharge la disposition d'apps « scenario » et oublie la caméra.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/cameraModes/observer.lua:98
---@param focused boolean vrai si le mode prend le focus
function core_cameraModes_observer:onCameraChanged(focused) end

--- Hook : oublie la caméra si le scénario disparaît.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/cameraModes/observer.lua:111
---@param scenario table|nil nouveau scénario
function core_cameraModes_observer:onScenarioChange(scenario) end

--- Hook : oublie la caméra associée.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/cameraModes/observer.lua:108
function core_cameraModes_observer:onScenarioRestarted() end

--- Choisit l'objet caméra (par son nom), relance le fondu et rétablit la vitesse de simulation normale.
---Source : lua/ge/extensions/core/cameraModes/observer.lua:84
---@param cam any
---@param targetOverride string|nil nom d'un objet de scenetree à viser au lieu du véhicule
function core_cameraModes_observer:setCamera(cam, targetOverride) end

--- Appelé par setGlobalCameraByName lors du passage à ce mode : appelle setCamera(customData.cam, customData.targetOverride).
---Source : lua/ge/extensions/core/cameraModes/observer.lua:80
---@param customData table {cam = objet caméra, targetOverride = nom d'objet à viser}
function core_cameraModes_observer:setCustomData(customData) end

--- Calcule position, rotation et FOV depuis l'objet caméra ; fondu de position vers PositionMove à la vitesse blendSpeed (50).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/cameraModes/observer.lua:17
---@param data table camData
---@return boolean|nil  true si appliqué ; nil sans caméra associée
function core_cameraModes_observer:update(data) end

