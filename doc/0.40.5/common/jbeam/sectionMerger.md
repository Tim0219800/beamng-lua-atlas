# `jbeam_sectionMerger`

*File: `lua/common/jbeam/sectionMerger.lua` · VM: Common (GE + vehicle) · 87 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("jbeam/sectionMerger")`

Merges jbeam sections together for backward compatibility: the triggers2 section is poured into triggers and rails2 into rails. The merged rows receive originSection (name of the original section), the source section is removed so it is not processed further, and sectionRenames is updated (triggers2 -> triggers, rails2 -> rails).

## Notes

- mergeNumberedSections exists in the code but is local and never called (the code comment says "not tested, be careful").
- If a key already exists in the target section, the row is overwritten with a log warning (the message names the target section twice).
- For rails, isTableCid is false: validTables is not initialized by the function before the access vehicle.validTables[sectionNameSource] = nil; this is only safe if validTables was already created by the previous step (triggers initializes it just before).

## Functions

| Function | Description | Line |
|---|---|---|
| `jbeam_sectionMerger.process(vehicle, sectionRenames)` | Merges triggers2 into triggers and rails2 into rails, and records these renames in sectionRenames. *(internal)* | 70 |

### Parameter details

#### `jbeam_sectionMerger.process(vehicle, sectionRenames)`

Merges triggers2 into triggers and rails2 into rails, and records these renames in sectionRenames.

- `vehicle` (*table*) : Vehicle jbeam data (modified in place).
- `sectionRenames` (*table<string, string>*) : Table old name to new name, completed by the function.
- **returns**: boolean Always true.

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/common/jbeam/sectionMerger.lua`.*
