# `ui_router_guards_vehicleConfiguration`

*File: `lua/ge/extensions/ui/router/guards/vehicleConfiguration.lua` · VM: Game Engine (GE) · 19 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `ui_router_guards_vehicleConfiguration`: `extensions.load("ui_router_guards_vehicleConfiguration")`, then the global `ui_router_guards_vehicleConfiguration`

Exit guard "confirmVehicleConfigurationCombinedExit": delegates to ui_pause_vehicleConfigurationGuard.confirmExit(route, params, context) the exit confirmation of the vehicle configuration screen; allows if this module is not loaded.

## Fields

| Field | Type | Description |
|---|---|---|
| `guards` | table<string, function> | Table of exposed guards: {confirmVehicleConfigurationCombinedExit = function(route, params, context)}. |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/ui/router/guards/vehicleConfiguration.lua`.*
