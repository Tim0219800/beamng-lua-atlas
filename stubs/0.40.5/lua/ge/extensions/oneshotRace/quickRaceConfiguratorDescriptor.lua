---@meta
-- tim19Atlas stub generated from lua/ge/extensions/oneshotRace/quickRaceConfiguratorDescriptor.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Fabrique le descripteur commun aux configurateurs de course rapide (quickrace, Light Runner). Le descripteur est consommé par oneshotRaceCore.createConfigurator : il définit les réglages par défaut (reverse, rollingStart, lapCount, tod, seed), la façon de résumer niveau et piste pour l'interface, la clé de meilleurs scores et le démarrage via scenario_quickRaceLoader.startQuickrace.
--- Accès : extension `oneshotRace_quickRaceConfiguratorDescriptor` : `extensions.load("oneshotRace_quickRaceConfiguratorDescriptor")`, puis la globale `oneshotRace_quickRaceConfiguratorDescriptor`
---@class oneshotRace_quickRaceConfiguratorDescriptor
oneshotRace_quickRaceConfiguratorDescriptor = {}

--- Construit le descripteur de configurateur de course rapide.
---Source : lua/ge/extensions/oneshotRace/quickRaceConfiguratorDescriptor.lua:13
---@param opts table {logTag, gridBackendName, routeDataKey, vehicleRestrictionMode (facultatif), getDefaultSelection (facultatif), raceType (facultatif)}
---@return table  Descripteur pour oneshotRaceCore.createConfigurator.
function oneshotRace_quickRaceConfiguratorDescriptor.build(opts) end

