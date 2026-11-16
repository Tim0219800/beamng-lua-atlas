# `career_startingModes_freshStart`

*File: `lua/ge/extensions/career/startingModes/freshStart.lua` · VM: Game Engine (GE) · 15 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `career_startingModes_freshStart`: `extensions.load("career_startingModes_freshStart")`, then the global `career_startingModes_freshStart`

Career starting mode "freshStart" (tier minor, order 200, image start_fresh.jpg): start without tutorial with 10,000 money. Description table loaded by career/career.lua, not an extension. The player (on foot) is teleported in front of the dealership, facing it.

## Functions

| Function | Description | Line |
|---|---|---|
| `career_startingModes_freshStart.initPlayerAttributes(playerAttributes)` | Initializes money to 10,000 (label "Starting Capital"). *(internal)* | 6 |
| `career_startingModes_freshStart.setupInventory()` | Teleports the player to (905.54, -542.39, 164.31) and orients them toward the dealership (gameplay_walk.setRot). *(internal)* | 9 |

### Parameter details

#### `career_startingModes_freshStart.initPlayerAttributes(playerAttributes)`

Initializes money to 10,000 (label "Starting Capital").

- `playerAttributes` (*table*) : Module career_modules_playerAttributes.

## Fields

| Field | Type | Description |
|---|---|---|
| `id` | string | "freshStart". |
| `image` | string | images/career/start_fresh.jpg. |
| `order` | number | 200. |
| `tier` | string | "minor". |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/career/startingModes/freshStart.lua`.*
