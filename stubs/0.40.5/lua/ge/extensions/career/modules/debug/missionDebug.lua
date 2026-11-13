---@meta
-- tim19Atlas stub generated from lua/ge/extensions/career/modules/debug/missionDebug.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Onglet de debug carrière « Missions ». Deux entrées : '> Reload Missions' (gameplay_missions_missions.reloadCompleteMissionSystem) et '> Make All Missions Startable' (force startable et visible sur toutes les missions via gameplay_missions_unlocks.overrideStartable/overrideVisible puis vide gameplay_rawPois).
--- Accès : extension `career_modules_debug_missionDebug` : `extensions.load("career_modules_debug_missionDebug")`, puis la globale `career_modules_debug_missionDebug`
---@class career_modules_debug_missionDebug
---@field debugName string 'Missions'.
---@field debugOrder number Ordre de tri (3).
career_modules_debug_missionDebug = {}

--- Dessine les deux entrées de menu de debug des missions (rechargement, déblocage de toutes les missions).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/debug/missionDebug.lua:9
function career_modules_debug_missionDebug.drawDebugFunctions() end

