---@meta
-- tim19Atlas stub generated from lua/ge/extensions/oneshotRace/oneshotRaceCore.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `oneshotRace_oneshotRaceCore` : `extensions.load("oneshotRace_oneshotRaceCore")`, puis la globale `oneshotRace_oneshotRaceCore`
---@class oneshotRace_oneshotRaceCore
---@field todNames table
oneshotRace_oneshotRaceCore = {}

--- descriptor contract:
---    logTag: string
---    gridBackendName: ui_gridSelector backend name (levels + tracks/routes source of truth)
---    routeDataKey: key under router route-data payloads (e.g. "quickraceWizard")
---    vehicleRestrictionMode: optional, passed to
---      ui_vehicleSelector_general.setVehicleRestrictionMode() while the wizard's
---      vehicle route is active (e.g. "lightRunner", "busRoute"); nil means no restriction
---    defaultSettings(): -> table
---    onSelectMiddle(settings, middle): mutate `settings` in place from the newly selected middle item
---    onUpdateSetting(settings, key, value, middle): optional, extra side effects on setting change
---    extraSettingKeys: optional table of setting keys allowed beyond defaultSettings()'s own keys (e.g. {seed = true})
---    buildLevelSummary(level) -> table
---    buildMiddleSummary(middle, selection) -> table (must include a `settings` field)
---    getHighscoreKey(selection, middle) -> {levelName, scenarioName, configKey} or nil to skip highscores
---    start(level, middle, settings, vehicleFile, selection): actually starts the race/route
---    getDefaultSelection(selector): optional, called once when the wizard is
---      entered with nothing selected yet (e.g. lightRunner defaults to
---      "glow_city"); `selector` is the ui_gridSelector backend (findLevel/
---      findMiddle) for gridBackendName. -> {levelName, middleName, vehicle =
---      {model, config}} or nil for "no default" (quickrace/busRoute)
---Source : lua/ge/extensions/oneshotRace/oneshotRaceCore.lua:78
---@param descriptor any
function oneshotRace_oneshotRaceCore.createConfigurator(descriptor) end

