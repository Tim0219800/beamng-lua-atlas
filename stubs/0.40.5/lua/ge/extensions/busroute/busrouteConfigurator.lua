---@meta
-- tim19Atlas stub generated from lua/ge/extensions/busroute/busrouteConfigurator.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Backend of the "preview / options" step of the Bus Route View wizard. It describes the "busRoute" mode (descriptor) and passes it to oneshotRaceCore.createConfigurator, whose result is the exported module. Here the "middle" choice is a full scenario file (scenario_scenariosLoader.getLevels("bus")); the vehicle choice is limited to public transport buses (vehicleRestrictionMode = "busRoute"). The settings are: strictStop (strict stop, true by default) and traffic (traffic, false by default). Nothing is saved (in memory only).
--- Access: extension `busroute_busrouteConfigurator`: `extensions.load("busroute_busrouteConfigurator")`, then the global `busroute_busrouteConfigurator`
---@class busroute_busrouteConfigurator
---@field dependencies table<integer, string> Extensions loaded beforehand: scenario_scenariosLoader, core_highscores, ui_vehicleSelector_general, ui_busRouteSelector_general.
busroute_busrouteConfigurator = {}

