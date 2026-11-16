---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/router/guards/photomode.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Exit guard "confirmPhotomodeExit": prevents leaving photo mode without confirmation. It allows navigation if the target route is still within photo mode (route "<profile>.photomode" or its sub-routes, the profile coming from ui_photomode_shared.S.activeProfile, "pause" by default), if no photo session is active, if the persistent session is enabled, or if the confirmation bypass is armed. Otherwise it requests confirmation via ui_photomode_session.requestExitConfirmation and blocks the navigation (returns false).
--- Access: extension `ui_router_guards_photomode`: `extensions.load("ui_router_guards_photomode")`, then the global `ui_router_guards_photomode`
---@class ui_router_guards_photomode
---@field guards table<string, function> Table of exposed guards: {confirmPhotomodeExit = function(route, params, context) -> boolean}.
ui_router_guards_photomode = {}

