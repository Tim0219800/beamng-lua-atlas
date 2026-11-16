---@meta
-- tim19Atlas stub generated from lua/ge/extensions/lightrunner/lightrunnerConfigurator.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Configurator of the "Light Runner" wizard: quick race on the glow_city level. It builds a descriptor from quickRaceConfiguratorDescriptor (grid backend lightRunnerSelector, route key lightrunnerWizard, race type lightRunner, vehicle restriction lightRunner) and passes it to oneshotRaceCore.createConfigurator. The returned module therefore exposes the configurator API (getSelection, selectLevel, selectMiddle, selectVehicle, updateSetting, getConfiguration, start, onWizard…RouteEnter) described in oneshotRaceCore.
--- Access: extension `lightrunner_lightrunnerConfigurator`: `extensions.load("lightrunner_lightrunnerConfigurator")`, then the global `lightrunner_lightrunnerConfigurator`
---@class lightrunner_lightrunnerConfigurator
---@field dependencies string[] scenario_quickRaceLoader, core_highscores, ui_vehicleSelector_general, ui_lightRunnerSelector_general.
lightrunner_lightrunnerConfigurator = {}

