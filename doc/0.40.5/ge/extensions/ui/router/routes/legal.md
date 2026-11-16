# `ui_router_routes_legal`

*File: `lua/ge/extensions/ui/router/routes/legal.lua` · VM: Game Engine (GE) · 60 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `ui_router_routes_legal`: `extensions.load("ui_router_routes_legal")`, then the global `ui_router_routes_legal`

Legal routes (Vue, abstract): online consent wizard in three steps onlineFeatures -> telemetry -> confirmation, each step having the exit guard `onlineConsentSet` and keeping the gamepad help bar.

## Notes

- Route configuration module: it exports no function. routeManager reads it (via the ui_router_routes_<name> extension) when routes.lua includes it with `{ include = "<name>" }`.
- The keys of `Children` form the segments of the dotted name: "<module>.<child>". `children` (lowercase) in a node designates its sub-routes; `include` mounts another module there.
- `ui` is inherited by child routes (uiTypes, uiTypesFilter, infoBar, topBar, uiApps, uiNav, triggerPause): a child redefines it only for what changes.
- exitGuards = {"onlineConsentSet"}: exit guard preventing leaving the wizard until consent is set (inferred from the name).

## Fields

| Field | Type | Description |
|---|---|---|
| `Children` | table<string, table> | onlineFeatures (no backTarget), telemetry (back to onlineFeatures), confirmation (back to telemetry); default infoBar restored for the gamepad. |
| `ModuleName` | string | Name of the routes module (first segment of the dotted name). |
| `Root` | table | {abstract = true, ui = Vue only, infoBar and topBar hidden, default uiApps} |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/ui/router/routes/legal.lua`.*
