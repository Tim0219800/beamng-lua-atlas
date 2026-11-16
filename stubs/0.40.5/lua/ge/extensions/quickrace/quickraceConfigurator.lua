---@meta
-- tim19Atlas stub generated from lua/ge/extensions/quickrace/quickraceConfigurator.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Configurator of the quick race (quickrace) wizard: level, track, vehicle and settings (reverse, rolling start, lap count, time of day, seed). It builds a descriptor via quickRaceConfiguratorDescriptor (backend quickraceSelector, route key quickraceWizard, no race type or vehicle restriction) and passes it to oneshotRaceCore.createConfigurator. The returned module exposes the configurator API described in oneshotRaceCore.
--- Access: extension `quickrace_quickraceConfigurator`: `extensions.load("quickrace_quickraceConfigurator")`, then the global `quickrace_quickraceConfigurator`
---@class quickrace_quickraceConfigurator
---@field dependencies string[] scenario_quickRaceLoader, core_highscores, ui_vehicleSelector_general, ui_quickraceSelector_general.
quickrace_quickraceConfigurator = {}

