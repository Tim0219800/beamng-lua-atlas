---@meta
-- tim19Atlas stub generated from lua/vehicle/controller/sound/airbrakes.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Contrôleur auxiliaire de son de purge de freins pneumatiques simple (sans simulation d'air, contrairement à pneumatics/airbrakes). Surveille electrics.values[electricsBrakeName] ; si le frein se relâche de plus de 0.2 par seconde sur une fenêtre de 0.25 s, joue un « pschitt » dont l'intensité dépend de la vitesse de relâchement, puis attend un délai de recharge.
--- Accès : contrôleur `sound/airbrakes` déclaré dans le jbeam (`controller`), accessible par `controller.getController("nom")`
---@class controller_sound_airbrakes
---@field type string "auxiliary".
local controller_sound_airbrakes = {}

--- Lit la configuration jbeam et remet l'état à zéro.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/sound/airbrakes.lua:56
---@param jbeamData table Données jbeam.
function controller_sound_airbrakes.init(jbeamData) end

--- Remet l'état d'échantillonnage à zéro.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/sound/airbrakes.lua:49
function controller_sound_airbrakes.reset() end

--- Chaque frame : détecte un relâchement rapide du frein et joue le son.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/sound/airbrakes.lua:23
---@param dt number Pas de temps en secondes.
function controller_sound_airbrakes.updateGFX(dt) end

return controller_sound_airbrakes
