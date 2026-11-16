---@meta
-- tim19Atlas stub generated from lua/ge/extensions/oneshotRace/oneshotRaceCore.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Common core of the "one shot" race wizards: from a descriptor, createConfigurator() returns an object that holds the selection (level, track/"middle", settings, vehicle), summarizes it for the interface (getConfiguration), provides the best scores and starts the race. Used by quickraceConfigurator and lightrunnerConfigurator; a modder can use it to create a new selection wizard.
--- Access: extension `oneshotRace_oneshotRaceCore`: `extensions.load("oneshotRace_oneshotRaceCore")`, then the global `oneshotRace_oneshotRaceCore`
---@class oneshotRace_oneshotRaceCore
---@field todNames string[] Names of the proposed times of day (night, sunrise, morning, earlyNoon, noon, lateNoon, afternoon, evening, sunset), 1-based (tod = 3 corresponds to morning).
oneshotRace_oneshotRaceCore = {}

--- Creates a configurator bound to a descriptor. The returned object (Cfg) has: getSelection, selectLevel(levelName), selectMiddle(levelName, middleName), selectVehicle(model, config, additionalData), updateSetting(key, value), toggleShowLapRecords(), getHighscores(), getConfiguration(), onWizardRouteEnter / onWizardLevelRouteEnter / onWizardMiddleRouteEnter / onWizardVehicleRouteEnter(context, toRoute, fromRoute, data), start().
---Source: lua/ge/extensions/oneshotRace/oneshotRaceCore.lua:78
---@param descriptor table Descriptor following the contract described in the notes.
---@return table  Configurator (Cfg). getConfiguration returns {level, middle, vehicle, highscores, showLapRecords, isDisabled, todOptionKeys}; isDisabled is true until level, track and vehicle are all set.
function oneshotRace_oneshotRaceCore.createConfigurator(descriptor) end

