# `ui_router_routeHandlers`

*File: `lua/ge/extensions/ui/router/routeHandlers.lua` · VM: Game Engine (GE) · 40 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `ui_router_routeHandlers`: `extensions.load("ui_router_routeHandlers")`, then the global `ui_router_routeHandlers`

Registry of the routes' named back/exit handlers. A route whose back is in "handler" mode designates a name (for example garageExitHandler); router.back() fetches it via getHandler and calls it. Most handlers are defined in routeHandlers/*ExitHandlers.lua or delegate to gameplay modules (career, inventory, vehicle purchase, vehicle configuration guard).

## Notes

- Registered handlers: firstDriveLockedHandler (first_drive_locked failure), previousRouteBackHandler (back to the previous entry with restoreLastScope, otherwise "menu"), garageExitHandler, mainmenuExitHandler, missionDetailsExitHandler, pauseExitHandler, vehicleConfigurationBackHandler, missionVehicleSelectorBackHandler, careerProfilesExitHandler, careerBranchPageBackHandler, radialBackHandler, partShoppingExitHandler, partInventoryExitHandler, vehicleShoppingExitHandler, vehicleShoppingVehicleListExitHandler, vehiclePurchaseExitHandler, negotiationExitHandler, vehicleInventoryExitHandler.
- Handlers that delegate to a module (vehicleConfigurationBackHandler, part/vehicle Shopping, partInventory, vehicleInventory) are wrapper functions that resolve the module at call time; the others are read from extensions.ui_router_routeHandlers_* when the file loads.
- This module exports only getHandler; the handler table is local.

## Functions

| Function | Description | Line |
|---|---|---|
| `ui_router_routeHandlers.getHandler(handlerName)` | Returns the handler registered under this name. | 36 |

### Parameter details

#### `ui_router_routeHandlers.getHandler(handlerName)`

Returns the handler registered under this name.

- `handlerName` (*string*) : Handler name declared in the route (back.handler).
- **returns**: function|nil Handler, or nil if the name is unknown.

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/ui/router/routeHandlers.lua`.*
