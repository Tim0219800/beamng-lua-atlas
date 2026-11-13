---@meta
-- tim19Atlas stub generated from lua/vehicle/controller/hydraulics/truckCabTiltControl.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Contrôleur auxiliaire pour la bascule de cabine d'un camion : quand au moins un verrou de cabine (contrôleur de groupe) est « attached », les vérins de bascule sont en mode de vanne "float" ; sinon "closed" (modes réglables).
--- Accès : contrôleur `hydraulics/truckCabTiltControl` déclaré dans le jbeam (`controller`), accessible par `controller.getController("nom")`
---@class controller_hydraulics_truckCabTiltControl
---@field type string "auxiliary".
local controller_hydraulics_truckCabTiltControl = {}

--- Lit les noms de contrôleurs de verrou, de vérins et les modes de vanne.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/hydraulics/truckCabTiltControl.lua:43
---@param jbeamData table Données jbeam du contrôleur.
function controller_hydraulics_truckCabTiltControl.init(jbeamData) end

--- Ne fait rien.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/hydraulics/truckCabTiltControl.lua:40
---@param jbeamData table Données jbeam.
function controller_hydraulics_truckCabTiltControl.reset(jbeamData) end

--- Chaque image : règle le type de vanne des vérins selon l'état des verrous.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/hydraulics/truckCabTiltControl.lua:16
---@param dt number Pas de temps (s).
function controller_hydraulics_truckCabTiltControl.updateGFX(dt) end

return controller_hydraulics_truckCabTiltControl
