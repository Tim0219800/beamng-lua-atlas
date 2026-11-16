# `career_modules_debug_vehicleShoppingDebug`

*File: `lua/ge/extensions/career/modules/debug/vehicleShoppingDebug.lua` · VM: Game Engine (GE) · 226 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `career_modules_debug_vehicleShoppingDebug`: `extensions.load("career_modules_debug_vehicleShoppingDebug")`, then the global `career_modules_debug_vehicleShoppingDebug`

"Vehicle Shopping" career debug tab. Re-reads the current level's *.facilities.json files to get the dealerships, simulates the vehicle draw (util/configListGenerator) and shows, per dealership and per subfilter, the matching configurations (model, config, name) with normalized probability, number of eligible entries and computation time.

## Notes

- Development tool; debugOrder = 0.
- Loads util/configListGenerator and freeroam/facilities as needed.
- The search field filters by substring on model, config and name.

## Functions

| Function | Description | Line |
|---|---|---|
| `career_modules_debug_vehicleShoppingDebug.drawDebugMenu()` | Draws the 'Vehicle Shopping - SubFilter Matches' window: Refresh button (recompute), counters, Search field and results per dealership/subfilter. *(internal)* | 127 |

## Fields

| Field | Type | Description |
|---|---|---|
| `debugName` | string | 'Vehicle Shopping'. |
| `debugOrder` | number | Sort order (0). |

## Calls into the engine (C++)

- `FS:` `findFiles`

**Loads extensions:** `freeroam/facilities`, `util/configListGenerator`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/career/modules/debug/vehicleShoppingDebug.lua`.*
