---@meta
-- tim19Atlas stub generated from lua/vehicle/controller/mechanics/beamLengthTrigger.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Contrôleur de mécanique (type "auxiliary") qui met une valeur electrics à une valeur de déclenchement quand la longueur d'une ou plusieurs poutres (par tag) devient plus courte ou plus longue qu'un seuil, sinon à 0.
--- Accès : contrôleur `mechanics/beamLengthTrigger` déclaré dans le jbeam (`controller`), accessible par `controller.getController("nom")`
---@class controller_mechanics_beamLengthTrigger
---@field type string "auxiliary".
local controller_mechanics_beamLengthTrigger = {}

--- Lit la configuration, retrouve les poutres et choisit les fonctions de comparaison et d'agrégation.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/mechanics/beamLengthTrigger.lua:71
---@param jbeamData table Données jbeam du contrôleur.
function controller_mechanics_beamLengthTrigger.init(jbeamData) end

--- Remet la valeur electrics à 0.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/mechanics/beamLengthTrigger.lua:65
---@param jbeamData table Données jbeam du contrôleur.
function controller_mechanics_beamLengthTrigger.reset(jbeamData) end

--- Écrit la valeur electrics selon la longueur mesurée. (assignée dynamiquement)
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/mechanics/beamLengthTrigger.lua:dyn
---@param dt number Pas de temps (s).
function controller_mechanics_beamLengthTrigger.updateGFX(dt) end

return controller_mechanics_beamLengthTrigger
