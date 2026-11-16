# `ui_router_routeHandlers_radialExitHandlers`

*File: `lua/ge/extensions/ui/router/routeHandlers/radialExitHandlers.lua` · VM: Game Engine (GE) · 33 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `ui_router_routeHandlers_radialExitHandlers`: `extensions.load("ui_router_routeHandlers_radialExitHandlers")`, then the global `ui_router_routeHandlers_radialExitHandlers`

Back handler of the radial menu (quick access).

## Functions

| Function | Description | Line |
|---|---|---|
| `ui_router_routeHandlers_radialExitHandlers.radialBackHandler()` | Back in the radial menu: calls core_quickAccess.back(); if that returns nothing truthy, closes the menu with core_quickAccess.setEnabled(false, "", false). Fails with reason="quick_access_unavailable" if core_quickAccess is unavailable. | 7 |

### Parameter details

#### `ui_router_routeHandlers_radialExitHandlers.radialBackHandler()`

Back in the radial menu: calls core_quickAccess.back(); if that returns nothing truthy, closes the menu with core_quickAccess.setEnabled(false, "", false). Fails with reason="quick_access_unavailable" if core_quickAccess is unavailable.

- **returns**: table {result=true, success=true, data=nil} or {result=false, success=false, reason="quick_access_unavailable"}.

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/ui/router/routeHandlers/radialExitHandlers.lua`.*
