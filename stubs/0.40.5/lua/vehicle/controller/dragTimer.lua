---@meta
-- tim19Atlas stub generated from lua/vehicle/controller/dragTimer.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Contrôleur auxiliaire de chronométrage de drag (accélération). Machine à états ready, countdown, measuring, done : quand le transbrake est actif et l'accélérateur appuyé, un compte à rebours de 3 s démarre ; à la fin, il relâche le transbrake (contrôleur nommé "transbrake") et mesure les temps au 60 pieds (18,288 m), 1/8 de mile (201,168 m) et 1/4 de mile (402,336 m) ainsi que les vitesses à ces deux derniers repères, puis affiche les résultats dans la console (en mph). Ordre lié au périphérique `gearbox`.
--- Accès : contrôleur `dragTimer` déclaré dans le jbeam (`controller`), accessible par `controller.getController("nom")`
---@class controller_dragTimer
---@field relevantDevice string "gearbox" : périphérique powertrain utilisé pour l'ordre d'appel.
---@field type string "auxiliary".
local controller_dragTimer = {}

--- Remet la machine à l'état ready et tous les temps à 0.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/dragTimer.lua:93
---@param jbeamData table Données jbeam (non utilisées).
function controller_dragTimer.init(jbeamData) end

--- Pas physique : fait avancer la machine à états (armement, compte à rebours, mesure, affichage des résultats).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/dragTimer.lua:28
---@param dt number Pas physique en secondes.
function controller_dragTimer.update(dt) end

--- Vide (le travail est fait dans update).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/dragTimer.lua:25
---@param dt number Pas de temps en secondes.
function controller_dragTimer.updateGFX(dt) end

return controller_dragTimer
