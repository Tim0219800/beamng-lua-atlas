# `career_startingModes_apmOnboarding`

*File: `lua/ge/extensions/career/startingModes/apmOnboarding.lua` · VM: Game Engine (GE) · 13 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `career_startingModes_apmOnboarding`: `extensions.load("career_startingModes_apmOnboarding")`, then the global `career_startingModes_apmOnboarding`

Career starting mode "apmOnboarding" (tier major, order 100, image start_apm.jpg): this is the start with tutorial. This file does not return an extension module but a simple description table, loaded by career/career.lua from the startingModes folder. It starts the money at 0 and prepares the tutorial vehicles with gameplay_tutorial_setup.setupVehicles().

## Notes

- The fields id, order, tier and image describe the mode; initPlayerAttributes and setupInventory are called by the career startup code.
- The title and description are not defined in this file (present in sandbox and selfMade).

## Functions

| Function | Description | Line |
|---|---|---|
| `career_startingModes_apmOnboarding.initPlayerAttributes(playerAttributes)` | Initializes the player's attributes: money = 0 (label "Starting Capital"). *(internal)* | 6 |
| `career_startingModes_apmOnboarding.setupInventory()` | Prepares the tutorial vehicles (gameplay_tutorial_setup.setupVehicles). *(internal)* | 9 |

### Parameter details

#### `career_startingModes_apmOnboarding.initPlayerAttributes(playerAttributes)`

Initializes the player's attributes: money = 0 (label "Starting Capital").

- `playerAttributes` (*table*) : Module career_modules_playerAttributes (uses setAttributes).

## Fields

| Field | Type | Description |
|---|---|---|
| `id` | string | "apmOnboarding". |
| `image` | string | images/career/start_apm.jpg. |
| `order` | number | 100 (display order). |
| `tier` | string | "major". |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/career/startingModes/apmOnboarding.lua`.*
