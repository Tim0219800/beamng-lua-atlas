---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/router/guards/legal.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Entry guard "onlineConsentSet": allows navigation to a route only if online consent has been given, i.e. if the onlineFeatures and telemetry settings are no longer "ask". Routes of the "legal" module (first segment of the route name) are always allowed so that the consent wizard can finish. The guards are registered by GuardManager from M.guards.
--- Access: extension `ui_router_guards_legal`: `extensions.load("ui_router_guards_legal")`, then the global `ui_router_guards_legal`
---@class ui_router_guards_legal
---@field guards table<string, function> Table of exposed guards: {onlineConsentSet = function(route) -> boolean}.
ui_router_guards_legal = {}

