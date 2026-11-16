# `ui_router_routeHandlers_rootExitHandlers`

*File: `lua/ge/extensions/ui/router/routeHandlers/rootExitHandlers.lua` · VM: Game Engine (GE) · 23 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `ui_router_routeHandlers_rootExitHandlers`: `extensions.load("ui_router_routeHandlers_rootExitHandlers")`, then the global `ui_router_routeHandlers_rootExitHandlers`

Exit handler of the root routes (garage / menu).

## Functions

| Function | Description | Line |
|---|---|---|
| `ui_router_routeHandlers_rootExitHandlers.garageExitHandler()` | Toggles between "menu" and "garage": with no current route, navigates to "menu"; if the current route is "menu", navigates to "garage"; otherwise navigates to "menu". | 7 |

### Parameter details

#### `ui_router_routeHandlers_rootExitHandlers.garageExitHandler()`

Toggles between "menu" and "garage": with no current route, navigates to "menu"; if the current route is "menu", navigates to "garage"; otherwise navigates to "menu".

- **returns**: boolean|nil true in the first two cases, nil in the last.

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/ui/router/routeHandlers/rootExitHandlers.lua`.*
