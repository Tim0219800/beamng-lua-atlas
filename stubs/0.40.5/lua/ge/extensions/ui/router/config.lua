---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/router/config.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Configuration constants of the UI router (ui_router): default main route, transition timeouts (flat for Angular/legacy, per phase for the Vue acknowledgment flow), source of the context decorator and default UI values merged into a route's configuration. Pure data module, no function.
--- Access: extension `ui_router_config`: `extensions.load("ui_router_config")`, then the global `ui_router_config`
---@class ui_router_config
---@field ContextDecoratorDefaultSource string Default source of the context decorator: "core_gamestate.gameStateDecorator".
---@field MainRoute string Default route when no route is specified: "menu".
---@field PhaseTimeouts table<string, number> Phased transition (Vue) timeouts: startupResendInterval, routeCommit, mountReady, total (seconds).
---@field RouteUiDefaults table Default UI values added to the route configuration if it does not define them: {uiNav = true}.
---@field ShowContextDecoratorInBreadcrumbs boolean false: the context decorator is not shown by default in the breadcrumb.
---@field Timeout number Delay in seconds (3) before forced end of a non-phased transition (Angular/legacy).
ui_router_config = {}

