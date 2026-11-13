---@meta
-- tim19Atlas stub generated from lua/ge/extensions/telemetry/trackers/memory.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Suiveur de télémétrie mémoire : rapporte la mémoire de la machine, celle que tient le jeu, et si l'OS a commencé à paginer sur disque. Il interroge Engine.Platform.getMemoryInfo toutes les 5 s. L'évènement « memoryPressure » n'est envoyé qu'une fois par session, la première fois que peu de mémoire libre et une pagination soutenue sont vues ensemble. « memorySample » n'existe que si le serveur règle sampleIntervalSeconds (enquête ponctuelle).
--- Accès : extension `telemetry_trackers_memory` : `extensions.load("telemetry_trackers_memory")`, puis la globale `telemetry_trackers_memory`
---@class telemetry_trackers_memory
---@field dependencies string[] telemetry_core.
telemetry_trackers_memory = {}

--- Hook appelé au chargement : réinitialise l'état, lit sampleIntervalSeconds de la config, enregistre le hook onUpdate et passe en déchargement manuel.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/telemetry/trackers/memory.lua:129
function telemetry_trackers_memory.onExtensionLoaded() end

--- Hook appelé à chaque image : cumule le temps réel et déclenche une lecture toutes les 5 s. Retiré dynamiquement quand le suiveur a terminé.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/telemetry/trackers/memory.lua:118
---@param dtReal number Delta temps réel (s).
---@param dtSim number Delta temps simulé (s) ; <= 0 indique la pause.
function telemetry_trackers_memory.onUpdate(dtReal, dtSim) end

