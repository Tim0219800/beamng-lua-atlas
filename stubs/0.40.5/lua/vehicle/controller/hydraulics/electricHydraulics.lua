---@meta
-- tim19Atlas stub generated from lua/vehicle/controller/hydraulics/electricHydraulics.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Petit contrôleur auxiliaire pour un groupe hydraulique électrique : met la valeur electrics motorThrottleElectricsName à 1 dès qu'une des valeurs de commande listées est non nulle, sinon à 0 (pour alimenter le moteur de la pompe seulement quand une fonction hydraulique est demandée).
--- Accès : contrôleur `hydraulics/electricHydraulics` déclaré dans le jbeam (`controller`), accessible par `controller.getController("nom")`
---@class controller_hydraulics_electricHydraulics
---@field type string "auxiliary".
local controller_hydraulics_electricHydraulics = {}

--- Lit les noms electrics.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/hydraulics/electricHydraulics.lua:26
---@param jbeamData table Données jbeam du contrôleur.
function controller_hydraulics_electricHydraulics.init(jbeamData) end

--- Ne fait rien.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/hydraulics/electricHydraulics.lua:23
---@param jbeamData table Données jbeam du contrôleur.
function controller_hydraulics_electricHydraulics.reset(jbeamData) end

--- Met à jour la valeur de sortie 0/1.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/hydraulics/electricHydraulics.lua:13
---@param dt number Pas de temps (s).
function controller_hydraulics_electricHydraulics.updateGFX(dt) end

return controller_hydraulics_electricHydraulics
