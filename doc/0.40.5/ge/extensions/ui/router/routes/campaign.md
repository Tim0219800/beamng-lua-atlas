# `ui_router_routes_campaign`

*File: `lua/ge/extensions/ui/router/routes/campaign.lua` · VM: Game Engine (GE) · 41 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `ui_router_routes_campaign`: `extensions.load("ui_router_routes_campaign")`, then the global `ui_router_routes_campaign`

Abstract "campaign" routes module (Vue, bars hidden). Its children (components, ui-apps-test, comic) actually have the screenIds "debug.components", "debug.ui-apps-test" and "comic" (Angular screen): it looks like a copy-paste of the debug module.

## Notes

- Route configuration module: it exports no function. routeManager reads it (via the ui_router_routes_<name> extension) when routes.lua includes it with `{ include = "<name>" }`.
- The keys of `Children` form the segments of the dotted name: "<module>.<child>". `children` (lowercase) in a node designates its sub-routes; `include` mounts another module there.
- `ui` is inherited by child routes (uiTypes, uiTypesFilter, infoBar, topBar, uiApps, uiNav, triggerPause): a child redefines it only for what changes.
- Possible inconsistency: the "campaign" module does not contain campaign routes but debug routes (screenId "debug.*"); campaigns go through "menu.campaigns".

## Fields

| Field | Type | Description |
|---|---|---|
| `Children` | table<string, table> | components -> screenId debug.components; ui-apps-test -> debug.ui-apps-test; comic -> screenId comic, Angular interface only. |
| `Root` | table | {abstract = true, ui = Vue, infoBar and topBar hidden, default uiApps} |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/ui/router/routes/campaign.lua`.*
