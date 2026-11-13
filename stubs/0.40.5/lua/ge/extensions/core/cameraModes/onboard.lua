---@meta
-- tim19Atlas stub generated from lua/ge/extensions/core/cameraModes/onboard.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Caméra embarquée. Champs jbeam : refNodes{ref,left,back}, offset{x,y,z}, rotation, fov, name, idRef/idUp/idBack, canRotate.
---@class core_cameraModes_onboard
local core_cameraModes_onboard = {}

--- Crée le manualzoom, applique la configuration véhicule et réinitialise.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/cameraModes/onboard.lua:22
function core_cameraModes_onboard:init() end

--- Hook : recalcule hidden, icône et canUseVehicleTriggerCrosshair d'après le nom.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/cameraModes/onboard.lua:30
function core_cameraModes_onboard:onVehicleCameraConfigChanged() end

--- Remet la rotation de tête à zéro et le zoom par défaut.
---Source : lua/ge/extensions/core/cameraModes/onboard.lua:46
function core_cameraModes_onboard:reset() end

--- Définit les nœuds de référence.
---Source : lua/ge/extensions/core/cameraModes/onboard.lua:117
---@param centerNodeID integer nœud du centre/caméra
---@param leftNodeID integer nœud gauche
---@param backNodeID integer nœud arrière
function core_cameraModes_onboard:setRefNodes(centerNodeID, leftNodeID, backNodeID) end

--- Place la caméra et applique rotation et zoom à data.res.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/cameraModes/onboard.lua:53
---@param data table camData
---@return boolean  false si les nœuds de référence sont dégénérés, sinon true
function core_cameraModes_onboard:update(data) end

