---@meta
-- tim19Atlas stub generated from lua/vehicle/controller/pneumatics/airbrakes.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Contrôleur auxiliaire de freins pneumatiques (poids lourds). Simule la pression des cylindres de frein de service et des freins à ressort (parking) alimentés par un réservoir d'air (energyStorage), convertit la pression en couple de frein via des courbes jbeam et remplace la mise à jour du frein des roues listées dans brakedWheels (avec ou sans ABS). Applique automatiquement le frein de parking si la pression d'alimentation tombe sous un seuil. Joue un son de purge lors du relâchement. Publie la pression des cylindres dans electrics.values.<nom>_pressure_service et <nom>_pressure_parking.
--- Accès : contrôleur `pneumatics/airbrakes` déclaré dans le jbeam (`controller`), accessible par `controller.getController("nom")`
---@class controller_pneumatics_airbrakes
---@field type string "auxiliary".
local controller_pneumatics_airbrakes = {}

--- Lit les clés jbeam, construit les courbes pression -> coefficient de couple, calcule les volumes/sections du circuit, installe les fonctions de frein sur les roues listées et initialise le son.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/pneumatics/airbrakes.lua:328
---@param jbeamData table Données jbeam du contrôleur.
function controller_pneumatics_airbrakes.init(jbeamData) end

--- Ramène les pressions à la pression ambiante, réinstalle les fonctions de frein des roues et remet les états de son à zéro.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/pneumatics/airbrakes.lua:303
function controller_pneumatics_airbrakes.reset() end

--- Pas physique : met à jour la pression des cylindres de service (selon electrics brake et le régulateur) et des freins à ressort (selon parkingbrake et la pression d'alimentation), prélève l'énergie dans le réservoir.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/pneumatics/airbrakes.lua:286
---@param dt number Pas physique en secondes.
function controller_pneumatics_airbrakes.updateFixedStep(dt) end

--- Chaque frame : détecte un relâchement rapide du frein de service ou de parking et joue le son de purge.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/pneumatics/airbrakes.lua:291
---@param dt number Pas de temps en secondes.
function controller_pneumatics_airbrakes.updateGFX(dt) end

return controller_pneumatics_airbrakes
