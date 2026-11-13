---@meta
-- tim19Atlas stub generated from lua/vehicle/controller/gauges/analogOdometer.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Contrôleur auxiliaire pour un compteur kilométrique analogique affiché par une texture HTML (htmlTexture). Il envoie le total (electrics.values.odometer) et le trip (extensions.odometer.getRelativeRecording()) à la page seulement quand l'un d'eux a changé de plus d'un pas de mise à jour (1000 m, ou 1609.34 m en impérial, divisé par 10 avec séparateur décimal).
--- Accès : contrôleur `gauges/analogOdometer` déclaré dans le jbeam (`controller`), accessible par `controller.getController("nom")`
---@class controller_gauges_analogOdometer
---@field init function nop.
---@field type string "auxiliary".
local controller_gauges_analogOdometer = {}

--- Lit la configuration, calcule le pas de mise à jour, crée la texture HTML et envoie la configuration à la page.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/gauges/analogOdometer.lua:50
---@param jbeamData table Données jbeam du contrôleur.
function controller_gauges_analogOdometer.initSecondStage(jbeamData) end

--- Force un nouvel envoi de données au prochain updateGFX.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/gauges/analogOdometer.lua:46
function controller_gauges_analogOdometer.reset() end

--- Ne fait rien.
---Source : lua/vehicle/controller/gauges/analogOdometer.lua:95
---@param parameters table Ignoré.
function controller_gauges_analogOdometer.setParameters(parameters) end

--- Envoie trip et odomètre à la page quand ils ont changé d'au moins un pas.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/gauges/analogOdometer.lua:25
---@param dt number Pas de temps (s).
function controller_gauges_analogOdometer.updateGFX(dt) end

return controller_gauges_analogOdometer
