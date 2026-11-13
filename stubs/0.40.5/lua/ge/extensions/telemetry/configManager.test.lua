---@meta
-- tim19Atlas stub generated from lua/ge/extensions/telemetry/configManager.test.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Test unitaire de telemetry/configManager (extensions.testFramework_TestManager:runTestFiles("configManager")).
--- Accès : extension `telemetry_configManager.test` : `extensions.load("telemetry_configManager.test")`, puis la globale `telemetry_configManager.test`
---@class telemetry_configManager.test
telemetry_configManager.test = {}

--- Vérifie qu'un tracker inconnu est désactivé par défaut et que getModuleConfig renvoie la même table à chaque appel (pas d'allocation).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/telemetry/configManager.test.lua:7
---@param ctx table Contexte du framework de test.
function telemetry_configManager.test.testMissingTrackerConfigIsDisabledAndAllocationFree(ctx) end

