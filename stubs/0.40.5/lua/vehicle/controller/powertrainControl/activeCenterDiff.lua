---@meta
-- tim19Atlas stub generated from lua/vehicle/controller/powertrainControl/activeCenterDiff.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Contrôleur auxiliaire de différentiel central piloté. Chaque pas physique, il combine plusieurs cartes jbeam (gaz, glissement entre essieux, frein, frein du pied gauche, braquage, frein à main) pour calculer un taux de blocage souhaité 0..1 et l'écrit dans centerDiff.activeLockCoef. En accélération la consigne mélange sous-virage/survirage (biasOversteerVsTraction) et traction ; en décélération elle dépend du frein et du braquage.
--- Accès : contrôleur `powertrainControl/activeCenterDiff` déclaré dans le jbeam (`controller`), accessible par `controller.getController("nom")`
---@class controller_powertrainControl_activeCenterDiff
---@field type string "auxiliary".
local controller_powertrainControl_activeCenterDiff = {}

--- Charge les sept cartes jbeam et récupère le différentiel central et les deux différentiels d'essieu.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/powertrainControl/activeCenterDiff.lua:86
---@param jbeamData table Données jbeam du contrôleur.
function controller_powertrainControl_activeCenterDiff.init(jbeamData) end

--- Ne fait rien.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/powertrainControl/activeCenterDiff.lua:80
---@param jbeamData table Données jbeam.
function controller_powertrainControl_activeCenterDiff.reset(jbeamData) end

--- Pas physique : calcule le blocage souhaité et le fixe sur centerDiff.activeLockCoef.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/powertrainControl/activeCenterDiff.lua:28
---@param dt number Pas physique en secondes.
function controller_powertrainControl_activeCenterDiff.updateFixedStep(dt) end

--- Ne fait rien.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/powertrainControl/activeCenterDiff.lua:77
---@param dt number Pas de temps en secondes.
function controller_powertrainControl_activeCenterDiff.updateGFX(dt) end

return controller_powertrainControl_activeCenterDiff
