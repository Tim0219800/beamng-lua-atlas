---@meta
-- tim19Atlas stub generated from lua/vehicle/controller/hydraulics/closedLoopLinearControl.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Régulateur en boucle fermée de vérin hydraulique linéaire (type "auxiliary"). Un PID compare l'extension moyenne des vérins (hydraulic consumers du powertrain) à une cible et écrit la commande de vanne dans electrics.values. Un moddeur fixe la cible avec setCylinderTargetExtendPercent.
--- Accès : contrôleur `hydraulics/closedLoopLinearControl` déclaré dans le jbeam (`controller`), accessible par `controller.getController("nom")`
---@class controller_hydraulics_closedLoopLinearControl
---@field type string "auxiliary".
local controller_hydraulics_closedLoopLinearControl = {}

--- Crée le PID, retrouve les vérins et lit les paramètres.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/hydraulics/closedLoopLinearControl.lua:47
---@param jbeamData table Données jbeam du contrôleur.
function controller_hydraulics_closedLoopLinearControl.init(jbeamData) end

--- Remet la vanne à 0, la cible à la valeur initiale et le PID à zéro.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/hydraulics/closedLoopLinearControl.lua:41
---@param jbeamData table Données jbeam.
function controller_hydraulics_closedLoopLinearControl.reset(jbeamData) end

--- Fixe l'extension cible des vérins.
---Source : lua/vehicle/controller/hydraulics/closedLoopLinearControl.lua:20
---@param extendPercent number Extension 0..1, bornée par cylinderPositionMin/Max.
function controller_hydraulics_closedLoopLinearControl.setCylinderTargetExtendPercent(extendPercent) end

--- Calcule la commande de vanne à partir de l'extension moyenne des vérins et l'écrit dans electrics.values.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/hydraulics/closedLoopLinearControl.lua:24
---@param dt number Pas de temps (s).
function controller_hydraulics_closedLoopLinearControl.updateFixedStep(dt) end

return controller_hydraulics_closedLoopLinearControl
