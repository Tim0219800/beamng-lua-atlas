---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/busRouteSelector/general.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Grid selector backend of the "BusRoute" Vue wizard. Describes via a descriptor the levels that have bus routes (scenario_scenariosLoader.getLevels('bus')) and, per level, the list of its routes, then delegates to ui/oneshotRaceSelector/core.createBackend(descriptor). All the public functions of the generated backend are copied into M.
--- Access: extension `ui_busRouteSelector_general`: `extensions.load("ui_busRouteSelector_general")`, then the global `ui_busRouteSelector_general`
---@class ui_busRouteSelector_general
---@field dependencies string[] {"scenario_scenariosLoader"}: extension loaded before this one.
ui_busRouteSelector_general = {}

