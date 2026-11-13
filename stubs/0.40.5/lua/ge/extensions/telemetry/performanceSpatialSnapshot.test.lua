---@meta
-- tim19Atlas stub generated from lua/ge/extensions/telemetry/performanceSpatialSnapshot.test.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Tests unitaires de telemetry/performanceSpatialSnapshot (runTestFiles("performanceSpatialSnapshot")).
--- Accès : extension `telemetry_performanceSpatialSnapshot.test` : `extensions.load("telemetry_performanceSpatialSnapshot.test")`, puis la globale `telemetry_performanceSpatialSnapshot.test`
---@class telemetry_performanceSpatialSnapshot.test
telemetry_performanceSpatialSnapshot.test = {}

--- Vérifie que framePhases et renderStats sont absents par défaut.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/telemetry/performanceSpatialSnapshot.test.lua:15
---@param ctx table Contexte du framework de test.
function telemetry_performanceSpatialSnapshot.test.testDetailedMetricsDefaultOff(ctx) end

--- Vérifie que renderTimingTrackingEnabled ajoute framePhases sans renderStats.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/telemetry/performanceSpatialSnapshot.test.lua:22
---@param ctx table Contexte du framework de test.
function telemetry_performanceSpatialSnapshot.test.testRenderTimingCanBeEnabledAlone(ctx) end

--- Vérifie que sceneComplexityTrackingEnabled ajoute renderStats (dont visibleObjectCount numérique) sans framePhases.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/telemetry/performanceSpatialSnapshot.test.lua:29
---@param ctx table Contexte du framework de test.
function telemetry_performanceSpatialSnapshot.test.testSceneComplexityCanBeEnabledAlone(ctx) end

