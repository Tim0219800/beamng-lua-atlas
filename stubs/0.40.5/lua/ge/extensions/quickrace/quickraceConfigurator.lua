---@meta
-- tim19Atlas stub generated from lua/ge/extensions/quickrace/quickraceConfigurator.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Configurateur de l'assistant de course rapide (quickrace) : niveau, piste, véhicule et réglages (marche arrière, départ lancé, nombre de tours, heure du jour, graine). Il construit un descripteur via quickRaceConfiguratorDescriptor (backend quickraceSelector, clé de route quickraceWizard, sans type de course ni restriction de véhicule) et le passe à oneshotRaceCore.createConfigurator. Le module renvoyé expose l'API du configurateur décrite dans oneshotRaceCore.
--- Accès : extension `quickrace_quickraceConfigurator` : `extensions.load("quickrace_quickraceConfigurator")`, puis la globale `quickrace_quickraceConfigurator`
---@class quickrace_quickraceConfigurator
---@field dependencies string[] scenario_quickRaceLoader, core_highscores, ui_vehicleSelector_general, ui_quickraceSelector_general.
quickrace_quickraceConfigurator = {}

