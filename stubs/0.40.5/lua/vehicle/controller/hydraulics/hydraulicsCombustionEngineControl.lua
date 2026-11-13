---@meta
-- tim19Atlas stub generated from lua/vehicle/controller/hydraulics/hydraulicsCombustionEngineControl.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Contrôleur auxiliaire qui relève le ralenti d'un moteur thermique et connecte la pompe hydraulique quand une fonction hydraulique est commandée (mode "electricsRaiseAndConnect"). Il surveille des valeurs electrics, impose idleAVOverwrite/maxIdleThrottleOverwrite au moteur, connecte la pompe (setConnected) une fois le régime assez haut et écrit une valeur electrics d'état. Un relèvement de ralenti manuel est aussi possible.
--- Accès : contrôleur `hydraulics/hydraulicsCombustionEngineControl` déclaré dans le jbeam (`controller`), accessible par `controller.getController("nom")`
---@class controller_hydraulics_hydraulicsCombustionEngineControl
---@field type string "auxiliary".
local controller_hydraulics_hydraulicsCombustionEngineControl = {}

--- Renvoie l'état (relèvement manuel).
---Source : lua/vehicle/controller/hydraulics/hydraulicsCombustionEngineControl.lua:113
---@return table  Table d'état.
function controller_hydraulics_hydraulicsCombustionEngineControl.getState() end

--- Lit la configuration, retrouve le moteur et la pompe et active la boucle de contrôle.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/hydraulics/hydraulicsCombustionEngineControl.lua:72
---@param jbeamData table Données jbeam du contrôleur.
function controller_hydraulics_hydraulicsCombustionEngineControl.init(jbeamData) end

--- Désactive le relèvement manuel.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/hydraulics/hydraulicsCombustionEngineControl.lua:68
---@param jbeamData table Données jbeam.
function controller_hydraulics_hydraulicsCombustionEngineControl.reset(jbeamData) end

--- Active/désactive le relèvement manuel du ralenti.
---Source : lua/vehicle/controller/hydraulics/hydraulicsCombustionEngineControl.lua:60
---@param enabled boolean Vrai pour relever.
function controller_hydraulics_hydraulicsCombustionEngineControl.setIdleRaise(enabled) end

--- Restaure l'état renvoyé par getState.
---Source : lua/vehicle/controller/hydraulics/hydraulicsCombustionEngineControl.lua:118
---@param data table|nil Table d'état.
function controller_hydraulics_hydraulicsCombustionEngineControl.setState(data) end

--- Inverse le relèvement manuel du ralenti.
---Source : lua/vehicle/controller/hydraulics/hydraulicsCombustionEngineControl.lua:64
function controller_hydraulics_hydraulicsCombustionEngineControl.toggleIdleRaise() end

--- Applique le relèvement de ralenti et la connexion de pompe (défini dynamiquement à l'init). (assignée dynamiquement)
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/hydraulics/hydraulicsCombustionEngineControl.lua:dyn
---@param dt number Pas de temps (s).
function controller_hydraulics_hydraulicsCombustionEngineControl.updateGFX(dt) end

return controller_hydraulics_hydraulicsCombustionEngineControl
