# `ui_router_guards_photomode`

*File: `lua/ge/extensions/ui/router/guards/photomode.lua` · VM: Game Engine (GE) · 48 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `ui_router_guards_photomode`: `extensions.load("ui_router_guards_photomode")`, then the global `ui_router_guards_photomode`

Exit guard "confirmPhotomodeExit": prevents leaving photo mode without confirmation. It allows navigation if the target route is still within photo mode (route "<profile>.photomode" or its sub-routes, the profile coming from ui_photomode_shared.S.activeProfile, "pause" by default), if no photo session is active, if the persistent session is enabled, or if the confirmation bypass is armed. Otherwise it requests confirmation via ui_photomode_session.requestExitConfirmation and blocks the navigation (returns false).

## Fields

| Field | Type | Description |
|---|---|---|
| `guards` | table<string, function> | Table of exposed guards: {confirmPhotomodeExit = function(route, params, context) -> boolean}. |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/ui/router/guards/photomode.lua`.*
