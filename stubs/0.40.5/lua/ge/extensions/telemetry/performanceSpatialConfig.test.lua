---@meta
-- tim19Atlas stub generated from lua/ge/extensions/telemetry/performanceSpatialConfig.test.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Tests unitaires de telemetry/performanceSpatialConfig (runTestFiles("performanceSpatialConfig")).
--- Accès : extension `telemetry_performanceSpatialConfig.test` : `extensions.load("telemetry_performanceSpatialConfig.test")`, puis la globale `telemetry_performanceSpatialConfig.test`
---@class telemetry_performanceSpatialConfig.test
telemetry_performanceSpatialConfig.test = {}

--- Vérifie qu'avec une config vide, intervalle 0 et tous les suivis avancés sont désactivés.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/telemetry/performanceSpatialConfig.test.lua:11
---@param ctx table Contexte du framework de test.
function telemetry_performanceSpatialConfig.test.testAdvancedCollectionDefaultsOff(ctx) end

--- Vérifie que sceneComplexityTrackingEnabled et renderTimingTrackingEnabled doivent être activés explicitement.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/telemetry/performanceSpatialConfig.test.lua:48
---@param ctx table Contexte du framework de test.
function telemetry_performanceSpatialConfig.test.testDetailedMetricsAreExplicit(ctx) end

--- Vérifie que les seuils de chute hors limites sont ramenés dans leurs bornes.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/telemetry/performanceSpatialConfig.test.lua:71
---@param ctx table Contexte du framework de test.
function telemetry_performanceSpatialConfig.test.testDipSettingsAreClamped(ctx) end

--- Vérifie que gameplayExitTrackingEnabled doit être mis à true explicitement.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/telemetry/performanceSpatialConfig.test.lua:34
---@param ctx table Contexte du framework de test.
function telemetry_performanceSpatialConfig.test.testGameplayExitTrackingIsExplicit(ctx) end

--- Vérifie que la liste levels devient une table de recherche nom -> true.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/telemetry/performanceSpatialConfig.test.lua:60
---@param ctx table Contexte du framework de test.
function telemetry_performanceSpatialConfig.test.testLevelFilterBecomesLookup(ctx) end

--- Vérifie que recoveryTrackingEnabled doit être mis à true explicitement.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/telemetry/performanceSpatialConfig.test.lua:28
---@param ctx table Contexte du framework de test.
function telemetry_performanceSpatialConfig.test.testRecoveryTrackingIsExplicit(ctx) end

--- Vérifie que shaderGenerationTrackingEnabled doit être mis à true explicitement.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/telemetry/performanceSpatialConfig.test.lua:41
---@param ctx table Contexte du framework de test.
function telemetry_performanceSpatialConfig.test.testShaderGenerationTrackingIsExplicit(ctx) end

