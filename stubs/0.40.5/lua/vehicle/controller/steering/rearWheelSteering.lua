---@meta
-- tim19Atlas stub generated from lua/vehicle/controller/steering/rearWheelSteering.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Contrôleur auxiliaire de direction des roues arrière. En mode feedForward, il calcule une sortie de braquage arrière à partir d'une carte (vitesse des roues, braquage avant) et la publie dans electrics.values.rws (nom configurable) pour qu'un contrôle de direction jbeam l'utilise. Le mode closedLoop n'est pas implémenté.
--- Accès : contrôleur `steering/rearWheelSteering` déclaré dans le jbeam (`controller`), accessible par `controller.getController("nom")`
---@class controller_steering_rearWheelSteering
---@field type string "auxiliary".
---@field updateGFX function|nil Affecté dans init selon le mode.
local controller_steering_rearWheelSteering = {}

--- Choisit la fonction de mise à jour selon le mode et charge la carte feedForward.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/steering/rearWheelSteering.lua:35
---@param jbeamData table Données jbeam.
function controller_steering_rearWheelSteering.init(jbeamData) end

--- Remet l'electric de sortie à 0.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/steering/rearWheelSteering.lua:31
---@param jbeamData table Données jbeam.
function controller_steering_rearWheelSteering.reset(jbeamData) end

return controller_steering_rearWheelSteering
