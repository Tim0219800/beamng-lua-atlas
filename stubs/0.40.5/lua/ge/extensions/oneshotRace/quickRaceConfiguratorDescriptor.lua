---@meta
-- tim19Atlas stub generated from lua/ge/extensions/oneshotRace/quickRaceConfiguratorDescriptor.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Builds the descriptor common to the quick race configurators (quickrace, Light Runner). The descriptor is consumed by oneshotRaceCore.createConfigurator: it defines the default settings (reverse, rollingStart, lapCount, tod, seed), how to summarize level and track for the interface, the best scores key and the start via scenario_quickRaceLoader.startQuickrace.
--- Access: extension `oneshotRace_quickRaceConfiguratorDescriptor`: `extensions.load("oneshotRace_quickRaceConfiguratorDescriptor")`, then the global `oneshotRace_quickRaceConfiguratorDescriptor`
---@class oneshotRace_quickRaceConfiguratorDescriptor
oneshotRace_quickRaceConfiguratorDescriptor = {}

--- Builds the quick race configurator descriptor.
---Source: lua/ge/extensions/oneshotRace/quickRaceConfiguratorDescriptor.lua:13
---@param opts table {logTag, gridBackendName, routeDataKey, vehicleRestrictionMode (optional), getDefaultSelection (optional), raceType (optional)}
---@return table  Descriptor for oneshotRaceCore.createConfigurator.
function oneshotRace_quickRaceConfiguratorDescriptor.build(opts) end

