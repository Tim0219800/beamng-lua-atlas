# `jbeam_interaction`

*File: `lua/common/jbeam/interaction.lua` · VM: Common (GE + vehicle) · 75 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("jbeam/interaction")`

Jbeam post-processing step that loads the *.interaction.json files (folder /vehicles/common/ then the vehicle folder) and merges their interaction groups, action categories and actions. Produces vehicle.interactionGroups, vehicle.actionCategories and vehicle.inputActions, used afterwards by the input actions system (lua/ge/extensions/core/input/actions.lua according to the code comment).

## Notes

- Only files whose fileversion is 2 are accepted; the others are ignored with an error in the log.
- Each action receives a field source = name of the file that defines it.
- The merge is done with tableMerge: the vehicle file, read last, overrides the common definitions.
- vehicle.components.actionIconOverrides (table actionName -> icon) replaces the icon of existing actions.
- The module only runs where FS (file system) is available.

## Functions

| Function | Description | Line |
|---|---|---|
| `jbeam_interaction.process(vehicle)` | Reads the interaction files, applies the icon overrides and stores the results in vehicle.interactionGroups, vehicle.actionCategories and vehicle.inputActions. *(internal)* | 26 |

### Parameter details

#### `jbeam_interaction.process(vehicle)`

Reads the interaction files, applies the icon overrides and stores the results in vehicle.interactionGroups, vehicle.actionCategories and vehicle.inputActions.

- `vehicle` (*table*) : Vehicle data (vehicleDirectory required; modified in place).

## Calls into the engine (C++)

- `FS:` `findFiles`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/common/jbeam/interaction.lua`.*
