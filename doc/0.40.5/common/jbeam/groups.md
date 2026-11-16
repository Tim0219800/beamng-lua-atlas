# `jbeam_groups`

*File: `lua/common/jbeam/groups.lua` · VM: Common (GE + vehicle) · 58 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("jbeam/groups")`

Jbeam loading post-processing step for the "group" column/field of rows (nodes, beams, etc.). Converts each list group = {"a","b"} into a table indexed by a global group number and assigns the row firstGroup (number of the first non-empty group). Produces vehicle.groups, the table group name to number (numbering starting at 0).

## Notes

- Walks all the vehicle's sections (tables) and all their rows (tables) that have a group field of type table; empty strings are ignored.
- After processing, row.group becomes a dictionary {number = name} and row.firstGroup the number of the first group; if the row has no non-empty group, it stays unchanged.
- Group numbers are assigned in discovery order during the traversal (pairs), so they are not stable from one run to another.

## Functions

| Function | Description | Line |
|---|---|---|
| `jbeam_groups.process(vehicle)` | Numbers the vehicle's jbeam groups: fills vehicle.groups (name -> number) and transforms the group fields of the rows. *(internal)* | 10 |

### Parameter details

#### `jbeam_groups.process(vehicle)`

Numbers the vehicle's jbeam groups: fills vehicle.groups (name -> number) and transforms the group fields of the rows.

- `vehicle` (*table*) : Merged jbeam data of the vehicle (modified in place).

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/common/jbeam/groups.lua`.*
