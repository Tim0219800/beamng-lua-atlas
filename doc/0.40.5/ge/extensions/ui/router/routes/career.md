# `ui_router_routes_career`

*File: `lua/ge/extensions/ui/router/routes/career.lua` · VM: Game Engine (GE) · 556 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `ui_router_routes_career`: `extensions.load("ui_router_routes_career")`, then the global `ui_router_routes_career`

Career mode routes (Vue): career computer (career.computer and its screens: vehicle inventory, part shopping, repair, tuning, painting, part inventory, insurance, performance, vehicle marketplace with purchase and negotiation), refueling, cargo depot and overview, my cargo, progression and branches, organizations, save profiles (new, saves, save as). Mostly defines gamepad navigation scopeTrees and back handlers (`back.handler`) and onEnter/onMount/onLeave hooks to career_modules_*.

## Notes

- Route configuration module: it exports no function. routeManager reads it (via the ui_router_routes_<name> extension) when routes.lua includes it with `{ include = "<name>" }`.
- The keys of `Children` form the segments of the dotted name: "<module>.<child>". `children` (lowercase) in a node designates its sub-routes; `include` mounts another module there.
- `ui` is inherited by child routes (uiTypes, uiTypesFilter, infoBar, topBar, uiApps, uiNav, triggerPause): a child redefines it only for what changes.
- Dynamic titles use `{mode = "dynamic", source = "module.function", paramKey, fallback}`: the title is computed by the Lua function, with `fallback` if it returns nothing.
- `back = {mode = "handler", handler = "..."}` delegates back to a UI-side handler (e.g. partShoppingExitHandler, vehicleShoppingExitHandler, careerProfilesExitHandler); `mode = "rootExit"` leaves the navigation stack.
- In scopeTree, `optional = true` avoids the scope validator warning for a block that is only sometimes mounted; `preferAutoFocus` gives initial focus; `backTargetType` is "scope" or "route".

## Fields

| Field | Type | Description |
|---|---|---|
| `Children` | table<string, table> | pauseBigMiddlePanel, logbook, refueling (back to play), computer (rootExit back; children vehicleInventory, partShopping > category > slot, repair, tuning, painting, partInventory, insurances > chooseInsurance, playerAbstract, vehiclePerformance > certificationTest, vehicleShopping > vehicles > vehiclePurchase > (negotiation, chooseInsurance), negotiation), cargoDropOff, cargoOverview (> organizations), myCargo, progressLanding, domainSelection, organizations, branchPage, profiles (> new, saves, saveAs). |
| `ModuleName` | string | Name of the routes module (first segment of the dotted name). |
| `Root` | table | {abstract = true, title = "ui.playmodes.career", ui = Vue only, default infoBar, hidden topBar, default uiApps} |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/ui/router/routes/career.lua`.*
