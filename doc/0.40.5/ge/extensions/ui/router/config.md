# `ui_router_config`

*File: `lua/ge/extensions/ui/router/config.lua` · VM: Game Engine (GE) · 46 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `ui_router_config`: `extensions.load("ui_router_config")`, then the global `ui_router_config`

Configuration constants of the UI router (ui_router): default main route, transition timeouts (flat for Angular/legacy, per phase for the Vue acknowledgment flow), source of the context decorator and default UI values merged into a route's configuration. Pure data module, no function.

## Notes

- Timeout = 3 s: flat forced-end delay for non-phased transitions (Angular/legacy).
- PhaseTimeouts (seconds): startupResendInterval = 1.0 (the startup phase resends the route change event at a fixed interval, never expiring, because mod Vue routes may register late), routeCommit = 3.0, mountReady = 3.0, total = 8.0 (emergency cap on the phases after startup; the startup wait does not count toward it).
- The phases: startup (waits for routeNavigationStarted), routeCommit (waits for routeChangeComplete), mountReady (waits for routeMounted when a mount acknowledgment is required).
- RouteUiDefaults = {uiNav = true}: gamepad/keyboard navigation is enabled unless the route (or its parents) disables it.
- MainRoute is "menu" (original value; no use is visible in this file).

## Fields

| Field | Type | Description |
|---|---|---|
| `ContextDecoratorDefaultSource` | string | Default source of the context decorator: "core_gamestate.gameStateDecorator". |
| `MainRoute` | string | Default route when no route is specified: "menu". |
| `PhaseTimeouts` | table<string, number> | Phased transition (Vue) timeouts: startupResendInterval, routeCommit, mountReady, total (seconds). |
| `RouteUiDefaults` | table | Default UI values added to the route configuration if it does not define them: {uiNav = true}. |
| `ShowContextDecoratorInBreadcrumbs` | boolean | false: the context decorator is not shown by default in the breadcrumb. |
| `Timeout` | number | Delay in seconds (3) before forced end of a non-phased transition (Angular/legacy). |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/ui/router/config.lua`.*
