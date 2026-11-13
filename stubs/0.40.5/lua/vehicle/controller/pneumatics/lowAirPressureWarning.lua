---@meta
-- tim19Atlas stub generated from lua/vehicle/controller/pneumatics/lowAirPressureWarning.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Contrôleur auxiliaire d'alerte de basse pression d'air (poids lourds). Surveille la pression d'un réservoir : sous airTooLowPressure et contact mis (ignitionLevel > 0), il met l'electric d'alerte à 1, joue une boucle sonore et affiche un message ; au-dessus de airOkPressure ou contact coupé il remet tout à zéro (hystérésis).
--- Accès : contrôleur `pneumatics/lowAirPressureWarning` déclaré dans le jbeam (`controller`), accessible par `controller.getController("nom")`
---@class controller_pneumatics_lowAirPressureWarning
---@field type string "auxiliary".
local controller_pneumatics_lowAirPressureWarning = {}

--- Lit les seuils de pression et le réservoir surveillé.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/pneumatics/lowAirPressureWarning.lua:60
---@param jbeamData table Données jbeam du contrôleur.
function controller_pneumatics_lowAirPressureWarning.init(jbeamData) end

--- Crée la source sonore d'alerte (si lowAirWarningSoundEvent est défini) et règle son volume. Appelé par le moteur à l'initialisation des sons.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/pneumatics/lowAirPressureWarning.lua:47
---@param jbeamData table Données jbeam.
function controller_pneumatics_lowAirPressureWarning.initSounds(jbeamData) end

--- Remet l'electric d'alerte à 0.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/pneumatics/lowAirPressureWarning.lua:43
---@param jbeamData table Données jbeam.
function controller_pneumatics_lowAirPressureWarning.reset(jbeamData) end

--- Arrête le son d'alerte et réinitialise l'état de lecture.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/pneumatics/lowAirPressureWarning.lua:36
---@param jbeamData table Données jbeam.
function controller_pneumatics_lowAirPressureWarning.resetSounds(jbeamData) end

--- Chaque frame : compare la pression du réservoir aux seuils et met à jour l'electric d'alerte, le son et le message.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/pneumatics/lowAirPressureWarning.lua:18
---@param dt number Pas de temps en secondes.
function controller_pneumatics_lowAirPressureWarning.updateGFX(dt) end

return controller_pneumatics_lowAirPressureWarning
