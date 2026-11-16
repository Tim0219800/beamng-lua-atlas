# `career_startingModes_selfMade`

*File: `lua/ge/extensions/career/startingModes/selfMade.lua` · VM: Game Engine (GE) · 198 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `career_startingModes_selfMade`: `extensions.load("career_startingModes_selfMade")`, then the global `career_startingModes_selfMade`

Career starting mode "selfMade" (tier minor, order 300, ignore = true): 1,000 money and a randomly generated old car. setupInventory picks, among the eligible vehicles (util_configListGenerator), those passing a filter (years 1990-2005, value 1000-50000, config types Factory or Service), draws a year, estimates by bisection (28 iterations) the mileage that brings the adjusted value closest to a target of 4000 to 5000, keeps the best candidate, spawns it at (838.51, -522.42, 165.75) with a random paint, adds it to the inventory and fills the tanks to 15%. Description table loaded by career/career.lua, not an extension.

## Notes

- ignore = true: the mode is not offered in this version (inferred from the field name).
- Fallback if no vehicle passes the filter: the tutorial Sunburst (sunburst2, apmTutorial_sunburst.pc, year 2005, mileage 250,000,000).
- The reference year 2023 is hardcoded in the age calculations.
- The entries maxYear, high and rot shown in the auto page are local variables, not module fields.

## Functions

| Function | Description | Line |
|---|---|---|
| `career_startingModes_selfMade.initPlayerAttributes(playerAttributes)` | Initializes money to 1,000. *(internal)* | 9 |
| `career_startingModes_selfMade.setupInventory(inventoryModule)` | Generates and spawns the starting car (see module description) and adds it to the inventory with initPartConditions for the estimated mileage. *(internal)* | 12 |

### Parameter details

#### `career_startingModes_selfMade.initPlayerAttributes(playerAttributes)`

Initializes money to 1,000.

- `playerAttributes` (*table*) : Module career_modules_playerAttributes.

#### `career_startingModes_selfMade.setupInventory(inventoryModule)`

Generates and spawns the starting car (see module description) and adds it to the inventory with initPartConditions for the estimated mileage.

- `inventoryModule` (*table*) : Module career_modules_inventory (uses addVehicle).

## Fields

| Field | Type | Description |
|---|---|---|
| `description` | string | "Start with nothing but a beaten down car, a handful of dollars and a dream." |
| `high` | number |  |
| `id` | string | "selfMade". |
| `ignore` | boolean | true. |
| `image` | string | images/career/start_beater.jpg. |
| `maxYear` | any |  ⚠ reference `maxYear` not defined in the file (probably nil) |
| `order` | number | 300. |
| `rot` | vec3 |  |
| `tier` | string | "minor". |
| `title` | string | "Self-Made". |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/career/startingModes/selfMade.lua`.*
