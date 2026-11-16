# `career_modules_debug_vehOfferDebug`

*File: `lua/ge/extensions/career/modules/debug/vehOfferDebug.lua` · VM: Game Engine (GE) · 166 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `career_modules_debug_vehOfferDebug`: `extensions.load("career_modules_debug_vehOfferDebug")`, then the global `career_modules_debug_vehOfferDebug`

"Delivery > Veh Offers" career debug tab. 'Vehicle Offer Debug' window listing, per delivery facility, the non-expired vehicle/trailer offers (career_modules_delivery_vehicleOfferManager). The entry '> Available vehicle/trailer per facility' prints the number of offers per unlock level (1 to 5) via isVehicleTagUnlocked.

## Notes

- Development tool; debugOrder = 11.
- Reuses career_modules_debug_parcelDebug.drawFacilityHeader.

## Functions

| Function | Description | Line |
|---|---|---|
| `career_modules_debug_vehOfferDebug.drawDebugFunctions()` | Entries '> Available vehicle per facility' and '> Available trailer per facility': count the non-expired offers per level and print the sorted result. *(internal)* | 35 |
| `career_modules_debug_vehOfferDebug.drawDebugMenu()` | Draws the 'Vehicle Offer Debug' window: delivery time, facility choice (all, auto or id) and offer tables. *(internal)* | 117 |
| `career_modules_debug_vehOfferDebug.onCareerActivated()` | Hook: stores the delivery modules and parcelDebug. *(internal)* *(hook)* | 13 |

## Fields

| Field | Type | Description |
|---|---|---|
| `debugName` | string | 'Delivery > Veh Offers'. |
| `debugOrder` | number | Sort order (11). |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/career/modules/debug/vehOfferDebug.lua`.*
