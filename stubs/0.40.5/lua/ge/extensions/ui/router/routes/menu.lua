---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/router/routes/menu.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Main menu routes (Vue): game selectors (freeroam, quickrace, lightrunner, bus, scenarios, experiences, rally), levels, vehicles and configuration (vehicleconfig, partpacks), options (audio, camera, controls, display, gameplay, graphics, language, others, interface), mods, discover, replay, credits, version info, UI sounds. Several subtrees are mounted via `include` (mods, freeroamLevels, quickraceWizard, lightrunnerWizard, busRouteWizard, multiplayer). The root's back goes through `mainmenuExitHandler`.
--- Access: extension `ui_router_routes_menu`: `extensions.load("ui_router_routes_menu")`, then the global `ui_router_routes_menu`
---@class ui_router_routes_menu
---@field Children table<string, table> Among others: bigmapMenu, campaigns, dragRaceOverview, careerPause, freeroamconfigurator, freeroamselector, quickraceWizard, lightrunnerWizard, busRouteWizard, environment, discover (> details, multiseat), gameplay, rallySelector, experiencesSelector, photomode, rally, levels, levelDetails, others, credits, modsDetails (Angular), options (abstract), release-info, replay, scenarios, threeElementSelect, uiSounds, vehicleconfig, vehicles, vehiclesdetails, vehiclesnew.
---@field Root table {screenId = "menu", title = "ui.common.menu", scopeTree root, back = handler mainmenuExitHandler, ui = Vue only}
ui_router_routes_menu = {}

