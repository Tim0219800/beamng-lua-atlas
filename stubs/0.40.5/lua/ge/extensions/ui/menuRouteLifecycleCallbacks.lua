---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/menuRouteLifecycleCallbacks.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Small extension that links game events to UI navigation. Currently it contains only one hook: on entering photo mode, it opens the "pause.photomode" route via ui_router.
--- Access: extension `ui_menuRouteLifecycleCallbacks`: `extensions.load("ui_menuRouteLifecycleCallbacks")`, then the global `ui_menuRouteLifecycleCallbacks`
---@class ui_menuRouteLifecycleCallbacks
ui_menuRouteLifecycleCallbacks = {}

--- Hook called on entering photo mode; navigates to the UI's "pause.photomode" route.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/menuRouteLifecycleCallbacks.lua:7
---@return any  Result of ui_router.navigate (inferred from code).
function ui_menuRouteLifecycleCallbacks.onPhotomodeEnter() end

