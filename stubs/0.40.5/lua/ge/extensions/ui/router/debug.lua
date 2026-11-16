---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/router/debug.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- ImGui "Router Debugger" window to inspect the UI router: current route, pending route, breadcrumb, input field to navigate to a route or go back, and tree of registered routes grouped by module (prefix before the first dot). Development tool; loaded on demand (the load line in ui_router is commented out).
--- Access: extension `ui_router_debug`: `extensions.load("ui_router_debug")`, then the global `ui_router_debug`
---@class ui_router_debug
---@field dependencies table<integer, string> Declared dependency: ui_imgui (indicated by the auto-generated page).
ui_router_debug = {}

--- Closes the debug window.
---Source: lua/ge/extensions/ui/router/debug.lua:282
function ui_router_debug.close() end

--- Hook called on load: requests the automatic opening of the window unless disableHwWarnings is true.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/router/debug.lua:237
function ui_router_debug.onExtensionLoaded() end

--- Hook called every frame: opens the window if requested, then draws "Router Debugger" (initial size 450x600) with current route, pending route, breadcrumb, actions and route modules.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/router/debug.lua:242
function ui_router_debug.onUpdate() end

--- Opens the debug window.
---Source: lua/ge/extensions/ui/router/debug.lua:274
function ui_router_debug.open() end

--- Toggles the open state of the debug window.
---Source: lua/ge/extensions/ui/router/debug.lua:288
function ui_router_debug.toggle() end

