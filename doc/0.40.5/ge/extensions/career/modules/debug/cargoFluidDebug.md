# `career_modules_debug_cargoFluidDebug`

*File: `lua/ge/extensions/career/modules/debug/cargoFluidDebug.lua` · VM: Game Engine (GE) · 164 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `career_modules_debug_cargoFluidDebug`: `extensions.load("career_modules_debug_cargoFluidDebug")`, then the global `career_modules_debug_cargoFluidDebug`

"Delivery > Fluid Cargo" career debug tab. 'Fluid CargoDebug' ImGui window that shows, per delivery facility (all, the nearest or a chosen one), the material (fluid) storages: suppliers, rates and connections, relying on career_modules_delivery_* and career_modules_debug_parcelDebug.

## Notes

- Development tool; the references to the delivery modules are taken in onCareerActivated, so it is unusable before career is activated.
- debugOrder = 11.

## Functions

| Function | Description | Line |
|---|---|---|
| `career_modules_debug_cargoFluidDebug.drawDebugFunctions()` | Debug functions submenu; empty in this module. *(internal)* | 35 |
| `career_modules_debug_cargoFluidDebug.drawDebugMenu()` | Draws the 'Fluid CargoDebug' window: delivery time, facility choice (all, auto, or a facility with materialStorages) and a Fluid / Rate / Connections table per facility. *(internal)* | 111 |
| `career_modules_debug_cargoFluidDebug.onCareerActivated()` | Career hook: stores the delivery modules (parcelManager, cargoScreen, general, generator, progress, vehicleOfferManager) and career_modules_debug_parcelDebug. *(internal)* *(hook)* | 13 |

## Fields

| Field | Type | Description |
|---|---|---|
| `debugName` | string | 'Delivery > Fluid Cargo'. |
| `debugOrder` | number | Sort order in the debug window (11). |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/career/modules/debug/cargoFluidDebug.lua`.*
