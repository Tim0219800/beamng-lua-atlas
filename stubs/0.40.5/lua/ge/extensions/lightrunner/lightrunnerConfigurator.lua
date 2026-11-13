---@meta
-- tim19Atlas stub generated from lua/ge/extensions/lightrunner/lightrunnerConfigurator.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Configurateur de l'assistant (wizard) « Light Runner » : course rapide sur le niveau glow_city. Il construit un descripteur à partir de quickRaceConfiguratorDescriptor (backend de grille lightRunnerSelector, clé de route lightrunnerWizard, type de course lightRunner, restriction de véhicule lightRunner) et le passe à oneshotRaceCore.createConfigurator. Le module renvoyé expose donc l'API du configurateur (getSelection, selectLevel, selectMiddle, selectVehicle, updateSetting, getConfiguration, start, onWizard…RouteEnter) décrite dans oneshotRaceCore.
--- Accès : extension `lightrunner_lightrunnerConfigurator` : `extensions.load("lightrunner_lightrunnerConfigurator")`, puis la globale `lightrunner_lightrunnerConfigurator`
---@class lightrunner_lightrunnerConfigurator
---@field dependencies string[] scenario_quickRaceLoader, core_highscores, ui_vehicleSelector_general, ui_lightRunnerSelector_general.
lightrunner_lightrunnerConfigurator = {}

