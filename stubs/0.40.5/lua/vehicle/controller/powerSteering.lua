---@meta
-- tim19Atlas stub generated from lua/vehicle/controller/powerSteering.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Contrôleur auxiliaire d'assistance de direction. Règle hydros.wheelPowerSteeringCoef (coefficient d'assistance appliqué par le moteur de direction) : valeur fixe 1 + constantOffset, ou, si les paramètres le permettent, une valeur qui varie linéairement avec la vitesse des roues entre speedSlow et speedFast.
--- Accès : contrôleur `powerSteering` déclaré dans le jbeam (`controller`), accessible par `controller.getController("nom")`
---@class controller_powerSteering
---@field type string "auxiliary".
---@field updateGFX function|nil Fonction de mise à jour de l'assistance selon la vitesse ; nil si le contrôleur ne varie pas.
local controller_powerSteering = {}

--- Lit les clés jbeam, fixe hydros.wheelPowerSteeringCoef = 1 + constantOffset et active updateGFX si l'assistance varie avec la vitesse.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/powerSteering.lua:34
---@param jbeamData table Données jbeam du contrôleur.
function controller_powerSteering.init(jbeamData) end

--- Remet hydros.wheelPowerSteeringCoef à 1 + constantOffset.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/powerSteering.lua:30
function controller_powerSteering.reset() end

return controller_powerSteering
