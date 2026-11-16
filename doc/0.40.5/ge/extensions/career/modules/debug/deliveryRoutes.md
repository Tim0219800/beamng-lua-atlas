# `career_modules_debug_deliveryRoutes`

*File: `lua/ge/extensions/career/modules/debug/deliveryRoutes.lua` · VM: Game Engine (GE) · 207 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `career_modules_debug_deliveryRoutes`: `extensions.load("career_modules_debug_deliveryRoutes")`, then the global `career_modules_debug_deliveryRoutes`

"Delivery > Routes" career debug tab. 'Delivery Access Points' ImGui window listing the delivery facilities and their access points (accessPointsByName), with selection of a point. Also contains a mouse raycast (updateMouseInfo) and an arc drawing helper, largely unfinished.

## Notes

- Development tool, partly unfinished: drawRoute is empty, drawArc is not called anywhere, the 'mouse clicking' block is empty.
- updateMouseInfo disables then re-enables forest collision around the mouse raycast.
- debugOrder = 10.

## Functions

| Function | Description | Line |
|---|---|---|
| `career_modules_debug_deliveryRoutes.drawDebugFunctions()` | Debug functions submenu; empty. *(internal)* | 29 |
| `career_modules_debug_deliveryRoutes.drawDebugMenu(dt)` | Draws the 'Delivery Access Points' window: tree of facilities (career_modules_delivery_generator.getFacilities) with their selectable access points. *(internal)* | 63 |
| `career_modules_debug_deliveryRoutes.onCareerActivated()` | Career hook: stores the delivery modules (parcelManager, cargoScreen, general, generator, progress, vehicleOfferManager). *(internal)* *(hook)* | 12 |
| `career_modules_debug_deliveryRoutes.updateMouseInfo()` | Updates the local mouseInfo table: camera position, mouse ray, result of cameraMouseRayCast, down/hold/up states of the left button (outside ImGui capture) and click, hold and release positions/normals. *(internal)* | 172 |

### Parameter details

#### `career_modules_debug_deliveryRoutes.drawDebugMenu(dt)`

Draws the 'Delivery Access Points' window: tree of facilities (career_modules_delivery_generator.getFacilities) with their selectable access points.

- `dt` (*number*) : Time delta (unused).

## Fields

| Field | Type | Description |
|---|---|---|
| `debugName` | string | 'Delivery > Routes'. |
| `debugOrder` | number | Sort order in the debug window (10). |

## Calls into the engine (C++)

- `debugDrawer:` `drawLine`, `drawLineInstance`, `drawSphere`, `drawTextAdvanced`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/career/modules/debug/deliveryRoutes.lua`.*
