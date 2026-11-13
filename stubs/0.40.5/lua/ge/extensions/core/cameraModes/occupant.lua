---@meta
-- tim19Atlas stub generated from lua/ge/extensions/core/cameraModes/occupant.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Mode caméra occupant. Champs : camRot, relativeYaw/Pitch, seatPosition (vec3), seatRotation (degrés), manualzoom, occupantDetached, icon 'personSolid', canUseVehicleTriggerCrosshair = true.
---@class core_cameraModes_occupant
local core_cameraModes_occupant = {}

--- Crée lissages, profils d'épaule et paramètres, puis appelle onVehicleCameraConfigChanged et onSettingsChanged.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/cameraModes/occupant.lua:60
function core_cameraModes_occupant:init() end

--- Indique que la souris est verrouillée ou non ; au déverrouillage avec recentrage automatique et véhicule en mouvement, recentre la tête.
---Source : lua/ge/extensions/core/cameraModes/occupant.lua:451
---@param locked boolean vrai si verrouillée
function core_cameraModes_occupant:mouseLocked(locked) end

--- Hook : au gain de focus pousse l'action map « DriverCameraZoom » ; à la perte, la retire et remet le zoom conducteur à 0.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/cameraModes/occupant.lua:108
---@param focused boolean vrai si le mode prend le focus
function core_cameraModes_occupant:onCameraChanged(focused) end

--- Hook : après rechargement d'extensions, recharge la config et réinitialise.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/cameraModes/occupant.lua:161
function core_cameraModes_occupant:onDeserialized() end

--- Hook : l'occupant est détaché (groupe de rupture « ocpAttach<seatId> ») : la caméra suivra les nœuds occupant.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/cameraModes/occupant.lua:100
---@param breakGroup string nom du groupe cassé
function core_cameraModes_occupant:onOccupantDetached(breakGroup) end

--- Hook : relit les réglages cameraDriver* et OpenXR.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/cameraModes/occupant.lua:123
function core_cameraModes_occupant:onSettingsChanged() end

--- Hook : réinitialise la position du siège et les nœuds de référence occupant ; rechargera la config de siège au prochain update.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/cameraModes/occupant.lua:88
function core_cameraModes_occupant:onVehicleCameraConfigChanged() end

--- Hook : le véhicule a été remis à neuf, l'occupant n'est plus détaché.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/cameraModes/occupant.lua:104
function core_cameraModes_occupant:onVehicleResetted() end

--- Recentre la tête, remet le balancement et le zoom conducteur à zéro.
---Source : lua/ge/extensions/core/cameraModes/occupant.lua:153
function core_cameraModes_occupant:reset() end

--- Remet le siège (position, inclinaison) à zéro pour ce véhicule et l'enregistre immédiatement.
---Source : lua/ge/extensions/core/cameraModes/occupant.lua:136
function core_cameraModes_occupant:resetSeat() end

--- Remet le siège à zéro et efface la config de siège de tous les véhicules (cameraDriverVehicleConfigs = {}).
---Source : lua/ge/extensions/core/cameraModes/occupant.lua:145
function core_cameraModes_occupant:resetSeatAll() end

--- Définit les nœuds de référence ; si l'un des trois est nil, utilise les nœuds idRef/Left/BackOccupant.
---Source : lua/ge/extensions/core/cameraModes/occupant.lua:443
---@param centerNodeID integer|nil nœud centre
---@param leftNodeID integer|nil nœud gauche
---@param backNodeID integer|nil nœud arrière
function core_cameraModes_occupant:setRefNodes(centerNodeID, leftNodeID, backNodeID) end

--- Calcule position et orientation de la tête et le FOV, gère réglage du siège et sauvegarde différée (1 s), écrit data.res.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/cameraModes/occupant.lua:179
---@param data table camData (data.driverZoom, data.lookBack, data.player, data.speed, data.fastSpeedModifier lus)
function core_cameraModes_occupant:update(data) end

