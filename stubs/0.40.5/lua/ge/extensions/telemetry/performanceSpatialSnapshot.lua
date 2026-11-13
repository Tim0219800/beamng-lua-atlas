---@meta
-- tim19Atlas stub generated from lua/ge/extensions/telemetry/performanceSpatialSnapshot.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Module utilitaire (chargé par require) qui construit l'instantané de performance envoyé par le tracker performanceSpatial : FPS (instantané, moyenne, min, p99), temps de frame, CPU/GPU, cause du plafond de FPS, position et réglages de la caméra, état du monde (échelle de temps, nombre de véhicules, écran partagé, trafic) et, sur option, répartition du temps par phase de frame et statistiques de rendu. Les valeurs sont arrondies.
--- Accès : extension `telemetry_performanceSpatialSnapshot` : `extensions.load("telemetry_performanceSpatialSnapshot")`, puis la globale `telemetry_performanceSpatialSnapshot`
---@class telemetry_performanceSpatialSnapshot
telemetry_performanceSpatialSnapshot = {}

--- Renvoie une table d'événement : level, fpsInstant, fpsAvg, fpsMin, fpsP99, frameMs, cpuMs, gpuMs, gpuWaitMs, limitedBy, activeGpu, position, camera, textureStreaming, worldReadyState, simTimeScale, vehicleCount, splitScreenPlayers, trafficCount, et facultativement framePhases et renderStats.
---Source : lua/ge/extensions/telemetry/performanceSpatialSnapshot.lua:168
---@param level string Nom du niveau courant.
---@param fpsInstant number FPS instantanés.
---@param frameMs number Durée de frame en ms.
---@param activeGpu any Description du GPU actif, recopiée telle quelle.
---@param options table|nil renderTimingTrackingEnabled, sceneComplexityTrackingEnabled.
---@return table  Événement de performance.
function telemetry_performanceSpatialSnapshot.capture(level, fpsInstant, frameMs, activeGpu, options) end

