# `career_modules_debug_marketplaceDebug`

*File: `lua/ge/extensions/career/modules/debug/marketplaceDebug.lua` · VM: Game Engine (GE) · 114 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `career_modules_debug_marketplaceDebug`: `extensions.load("career_modules_debug_marketplaceDebug")`, then the global `career_modules_debug_marketplaceDebug`

"Marketplace" career debug tab. Shows the inventory vehicles (and whether they are for sale via career_modules_marketplace.findVehicleListing), the current listings with their offers (value, gap, remaining time) and Accept/Decline buttons, plus a 'Generate Random Offer' button.

## Notes

- Probable bug: drawDebugMenu reads the global variables listedVehicles and offerTTL, which are not defined anywhere in this file (nil); the 'Current Listings' section raises an error or shows nothing useful unless they are global elsewhere.
- Development tool; debugOrder = 0.

## Functions

| Function | Description | Line |
|---|---|---|
| `career_modules_debug_marketplaceDebug.drawDebugMenu()` | Draws the 'Vehicle Inventory' and 'Current Listings' sections (offers with Accept/Decline via career_modules_marketplace.acceptOffer/declineOffer) and the 'Generate Random Offer' button (generateOffer). *(internal)* | 42 |
| `career_modules_debug_marketplaceDebug.onCareerActivated()` | Career hook; empty body. *(internal)* *(hook)* | 111 |

## Fields

| Field | Type | Description |
|---|---|---|
| `debugName` | string | 'Marketplace'. |
| `debugOrder` | number | Sort order (0). |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/career/modules/debug/marketplaceDebug.lua`.*
