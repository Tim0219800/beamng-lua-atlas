# `ui_router_guards_legal`

*File: `lua/ge/extensions/ui/router/guards/legal.lua` · VM: Game Engine (GE) · 33 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `ui_router_guards_legal`: `extensions.load("ui_router_guards_legal")`, then the global `ui_router_guards_legal`

Entry guard "onlineConsentSet": allows navigation to a route only if online consent has been given, i.e. if the onlineFeatures and telemetry settings are no longer "ask". Routes of the "legal" module (first segment of the route name) are always allowed so that the consent wizard can finish. The guards are registered by GuardManager from M.guards.

## Notes

- The settings are read with core_settings_settings.getValue("onlineFeatures") and ("telemetry").

## Fields

| Field | Type | Description |
|---|---|---|
| `guards` | table<string, function> | Table of exposed guards: {onlineConsentSet = function(route) -> boolean}. |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/ui/router/guards/legal.lua`.*
