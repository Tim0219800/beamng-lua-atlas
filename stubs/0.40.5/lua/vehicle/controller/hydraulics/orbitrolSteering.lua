---@meta
-- tim19Atlas stub generated from lua/vehicle/controller/hydraulics/orbitrolSteering.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Régulateur de direction hydraulique de type orbitrol (type "auxiliary"). Un PID compare la position moyenne des vérins de direction (normalisée -1..1) à l'entrée de direction (electrics.values.steering_input par défaut) et écrit la commande de vanne dans electrics.values.
--- Accès : contrôleur `hydraulics/orbitrolSteering` déclaré dans le jbeam (`controller`), accessible par `controller.getController("nom")`
---@class controller_hydraulics_orbitrolSteering
---@field type string "auxiliary".
local controller_hydraulics_orbitrolSteering = {}

--- Crée le PID et retrouve les vérins.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/hydraulics/orbitrolSteering.lua:40
---@param jbeamData table Données jbeam du contrôleur.
function controller_hydraulics_orbitrolSteering.init(jbeamData) end

--- Remet la vanne et le PID à zéro.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/hydraulics/orbitrolSteering.lua:35
---@param jbeamData table Données jbeam.
function controller_hydraulics_orbitrolSteering.reset(jbeamData) end

--- Calcule et écrit la commande de vanne de direction.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/hydraulics/orbitrolSteering.lua:19
---@param dt number Pas de temps (s).
function controller_hydraulics_orbitrolSteering.updateFixedStep(dt) end

return controller_hydraulics_orbitrolSteering
