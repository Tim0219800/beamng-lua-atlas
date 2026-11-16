# `ui_router_debug`

*File: `lua/ge/extensions/ui/router/debug.lua` · VM: Game Engine (GE) · 297 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `ui_router_debug`: `extensions.load("ui_router_debug")`, then the global `ui_router_debug`

ImGui "Router Debugger" window to inspect the UI router: current route, pending route, breadcrumb, input field to navigate to a route or go back, and tree of registered routes grouped by module (prefix before the first dot). Development tool; loaded on demand (the load line in ui_router is commented out).

## Example

```lua
extensions.load("ui_router_debug")
ui_router_debug.toggle()
```

## Notes

- On load, the window opens automatically unless the global disableHwWarnings is true.
- Tables are displayed recursively except the "children" key.
- The Navigate button calls extensions.ui_router.navigate(name) then clears the input; Back calls extensions.ui_router.back(). The last result is displayed.

**Dependencies (loaded first):** `ui_imgui`

## Functions

| Function | Description | Line |
|---|---|---|
| `ui_router_debug.close()` | Closes the debug window. | 282 |
| `ui_router_debug.onExtensionLoaded()` | Hook called on load: requests the automatic opening of the window unless disableHwWarnings is true. *(internal)* *(hook)* | 237 |
| `ui_router_debug.onUpdate()` | Hook called every frame: opens the window if requested, then draws "Router Debugger" (initial size 450x600) with current route, pending route, breadcrumb, actions and route modules. *(internal)* *(hook)* | 242 |
| `ui_router_debug.open()` | Opens the debug window. | 274 |
| `ui_router_debug.toggle()` | Toggles the open state of the debug window. | 288 |

## Fields

| Field | Type | Description |
|---|---|---|
| `dependencies` | table<integer, string> | Declared dependency: ui_imgui (indicated by the auto-generated page). |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/ui/router/debug.lua`.*
