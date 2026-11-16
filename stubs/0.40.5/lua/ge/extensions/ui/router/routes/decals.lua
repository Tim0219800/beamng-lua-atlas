---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/router/routes/decals.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Route subtree of the livery decal editor (included by liveries.edit.decals). Add flow: decals -> camera (view choice) -> selector (decal grid) -> transform -> settings; separate branches for material, mirror and transform of an already selected decal. The hooks point to ui_liveries_routeLifecycleCallbacks.
--- Access: extension `ui_router_routes_decals`: `extensions.load("ui_router_routes_decals")`, then the global `ui_router_routes_decals`
---@class ui_router_routes_decals
---@field Children table<string, table> camera (> selector > transform > settings), material, mirror, transform (> settings), each with a backTarget to the previous level.
---@field ModuleName string Name of the routes module (first segment of the dotted name).
---@field Root table {screenId = "liveries.edit.decals", title = "ui.liveries.edit.decals", backTarget = "liveries.edit", targetScope = "layers-manager", scopeTree (liveries-decals-hidden, layers-manager), onEnter onDecalsEnter, onMount onDecalsMount, onLeave onDecalsLeave}
ui_router_routes_decals = {}

