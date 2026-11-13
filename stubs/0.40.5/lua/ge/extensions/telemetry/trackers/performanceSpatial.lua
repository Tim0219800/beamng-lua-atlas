---@meta
-- tim19Atlas stub generated from lua/ge/extensions/telemetry/trackers/performanceSpatial.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Suiveur de télémétrie des performances « spatiales » : relie le framerate à l'endroit où se trouve le joueur. Il interroge le FPS instantané toutes les 0,13 s (dans un niveau suivi, monde prêt, fenêtre au premier plan, simulation non en pause) et émet, selon la config serveur (module performanceSpatial) : « performanceDip » (chute de FPS détectée par performanceSpatialDetector, avec l'instantané du pire moment), « performanceSpatial » (échantillons périodiques de position/performance et exposition finale), « shaderGeneration » (nouveaux shaders générés), « vehicleRecovery » (récupérations de véhicule) et « gameplayActivityExit » (sortie d'une activité, via performanceSpatialGameplayExit). Chaque fonctionnalité est activable séparément.
--- Accès : extension `telemetry_trackers_performanceSpatial` : `extensions.load("telemetry_trackers_performanceSpatial")`, puis la globale `telemetry_trackers_performanceSpatial`
---@class telemetry_trackers_performanceSpatial
---@field dependencies string[] telemetry_core et core_camera.
telemetry_trackers_performanceSpatial = {}

--- Hook appelé à la fin du niveau : clôt le contexte courant (dernier dip et exposition finale).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/telemetry/trackers/performanceSpatial.lua:316
function telemetry_trackers_performanceSpatial.onClientEndMission() end

--- Hook appelé à la fermeture du jeu : clôt le contexte courant.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/telemetry/trackers/performanceSpatial.lua:316
function telemetry_trackers_performanceSpatial.onExit() end

--- Hook appelé au chargement : lit la config du module performanceSpatial, active les fonctionnalités demandées, prépare le détecteur et le GPU actif, restaure l'état d'un rechargement Lua.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/telemetry/trackers/performanceSpatial.lua:246
---@param data table|nil Données de onSerialize d'un rechargement précédent (completedMissionId, eventCount, cooldownUntilMs).
---@return boolean|nil  false si aucune fonctionnalité n'est activée (l'extension se décharge).
function telemetry_trackers_performanceSpatial.onExtensionLoaded(data) end

--- Hook appelé au déchargement : clôt le contexte courant.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/telemetry/trackers/performanceSpatial.lua:316
function telemetry_trackers_performanceSpatial.onExtensionUnloaded() end

--- Hook appelé avant déchargement : pour un rechargement Lua, clôt le contexte et renvoie l'état à restaurer.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/telemetry/trackers/performanceSpatial.lua:305
---@param reason string Raison ; seul « reload » est traité.
---@return table|nil  {completedMissionId, eventCount, cooldownUntilMs}
function telemetry_trackers_performanceSpatial.onSerialize(reason) end

--- Hook appelé à chaque image : à chaque intervalle de 0,13 s, lit le FPS instantané, détecte les chutes, compte les shaders générés et émet les échantillons spatiaux.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/telemetry/trackers/performanceSpatial.lua:178
---@param dtReal number Delta temps réel (s).
---@param dtSim number Delta temps simulé (s) ; <= 0 ferme le contexte.
function telemetry_trackers_performanceSpatial.onUpdate(dtReal, dtSim) end

--- Enregistre un évènement « vehicleRecovery » (niveau et position du véhicule du joueur 0) si le suivi des récupérations est activé et que le niveau est suivi.
---Source : lua/ge/extensions/telemetry/trackers/performanceSpatial.lua:101
function telemetry_trackers_performanceSpatial.trackVehReset() end

