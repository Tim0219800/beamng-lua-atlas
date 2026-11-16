# `ui_menuRouteLifecycleCallbacks`

*File: `lua/ge/extensions/ui/menuRouteLifecycleCallbacks.lua` · VM: Game Engine (GE) · 12 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `ui_menuRouteLifecycleCallbacks`: `extensions.load("ui_menuRouteLifecycleCallbacks")`, then the global `ui_menuRouteLifecycleCallbacks`

Small extension that links game events to UI navigation. Currently it contains only one hook: on entering photo mode, it opens the "pause.photomode" route via ui_router.

## Functions

| Function | Description | Line |
|---|---|---|
| `ui_menuRouteLifecycleCallbacks.onPhotomodeEnter()` | Hook called on entering photo mode; navigates to the UI's "pause.photomode" route. *(internal)* *(hook)* | 7 |

### Parameter details

#### `ui_menuRouteLifecycleCallbacks.onPhotomodeEnter()`

Hook called on entering photo mode; navigates to the UI's "pause.photomode" route.

- **returns**: any Result of ui_router.navigate (inferred from code).

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/ui/menuRouteLifecycleCallbacks.lua`.*
