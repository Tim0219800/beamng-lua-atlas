# `career_startingModes_sandbox`

*File: `lua/ge/extensions/career/startingModes/sandbox.lua` · VM: Game Engine (GE) · 18 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `career_startingModes_sandbox`: `extensions.load("career_startingModes_sandbox")`, then the global `career_startingModes_sandbox`

Career starting mode "sandbox" (tier minor, order 400): 50 million money, "everything unlocked" according to its description. Description table loaded by career/career.lua, not an extension. The field ignore = true indicates that this mode is ignored (not offered) in this version.

## Notes

- ignore = true: the mode exists in the code but is hidden from the starting choice (behavior inferred from the field name, to verify in career.lua).
- title and description are hardcoded strings (not translated).

## Functions

| Function | Description | Line |
|---|---|---|
| `career_startingModes_sandbox.initPlayerAttributes(playerAttributes)` | Initializes money to 50,000,000. *(internal)* | 9 |
| `career_startingModes_sandbox.setupInventory()` | Teleports the player to (-808.56, 898.56, 75.51) and sets their orientation. *(internal)* | 12 |

### Parameter details

#### `career_startingModes_sandbox.initPlayerAttributes(playerAttributes)`

Initializes money to 50,000,000.

- `playerAttributes` (*table*) : Module career_modules_playerAttributes.

## Fields

| Field | Type | Description |
|---|---|---|
| `description` | string | "Start with 50 million bucks and everthing unlocked." (spelling mistake in the code). |
| `id` | string | "sandbox". |
| `ignore` | boolean | true. |
| `image` | string | images/career/start_sandbox.jpg. |
| `order` | number | 400. |
| `tier` | string | "minor". |
| `title` | string | "Sandbox". |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/career/startingModes/sandbox.lua`.*
