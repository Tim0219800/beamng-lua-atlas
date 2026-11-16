# `ui_router_guards_multiseat`

*File: `lua/ge/extensions/ui/router/guards/multiseat.lua` · VM: Game Engine (GE) · 31 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `ui_router_guards_multiseat`: `extensions.load("ui_router_guards_multiseat")`, then the global `ui_router_guards_multiseat`

Exit guard "confirmMultiseatSettingsExit": when leaving the multi-seat settings screen, delegates the confirmation to ui_multiseat_multiseatSettings.confirmExit(route, params, context). Moves between pause.multiseatSettings and pause.multiseatSettings.vehicleSelector stay in the flow and are allowed; if ui_multiseat_multiseatSettings is not loaded, the exit is allowed.

## Fields

| Field | Type | Description |
|---|---|---|
| `guards` | table<string, function> | Table of exposed guards: {confirmMultiseatSettingsExit = function(route, params, context)}. |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/ui/router/guards/multiseat.lua`.*
