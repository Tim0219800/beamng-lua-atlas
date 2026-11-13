---@meta
-- tim19Atlas stub generated from lua/ge/extensions/telemetry/trackers/performance.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Suiveur de télémétrie des performances : rapporte le framerate des joueurs à partir de ce que le moteur mesure déjà pour la surcouche cyclée par Ctrl+F ($fps::avg, min, p99, cpuTime, gpuTime). Un évènement « performance » par lecture, sans moyenne ni jugement : c'est le serveur qui décide quel framerate est trop bas. L'intervalle (sampleIntervalSeconds, 300 s par défaut, borné entre 5 et 3600) vient de la config serveur.
--- Accès : extension `telemetry_trackers_performance` : `extensions.load("telemetry_trackers_performance")`, puis la globale `telemetry_trackers_performance`
---@class telemetry_trackers_performance
---@field dependencies string[] telemetry_core.
telemetry_trackers_performance = {}

--- Hook appelé au chargement : lit sampleIntervalSeconds dans la config du module « performance » et passe en déchargement manuel.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/telemetry/trackers/performance.lua:64
function telemetry_trackers_performance.onExtensionLoaded() end

--- Hook appelé à chaque image : un seul appel d'horloge et une comparaison ; prend une lecture quand l'intervalle est écoulé.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/telemetry/trackers/performance.lua:56
---@param dtReal number Delta temps réel (s).
---@param dtSim number Delta temps simulé (s) ; <= 0 marque la lecture comme paused.
---@param dtRaw number Delta temps brut (s).
function telemetry_trackers_performance.onUpdate(dtReal, dtSim, dtRaw) end

