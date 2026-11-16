---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/router/routes/campaign.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Abstract "campaign" routes module (Vue, bars hidden). Its children (components, ui-apps-test, comic) actually have the screenIds "debug.components", "debug.ui-apps-test" and "comic" (Angular screen): it looks like a copy-paste of the debug module.
--- Access: extension `ui_router_routes_campaign`: `extensions.load("ui_router_routes_campaign")`, then the global `ui_router_routes_campaign`
---@class ui_router_routes_campaign
---@field Children table<string, table> components -> screenId debug.components; ui-apps-test -> debug.ui-apps-test; comic -> screenId comic, Angular interface only.
---@field Root table {abstract = true, ui = Vue, infoBar and topBar hidden, default uiApps}
ui_router_routes_campaign = {}

