# `jbeam_sections_assorted`

*File: `lua/common/jbeam/sections/assorted.lua` · VM: Common (GE + vehicle) · 35 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("jbeam/sections/assorted")`

Post-processing of two miscellaneous jbeam sections. (1) Engine section: builds engine.waterDamage.nodes by concatenating the node lists coming from the group links _group_nodes and _engineGroup_nodes of waterDamage (nodes whose drowning damages the engine). (2) Soundscape section: transforms the list of entries into a dictionary indexed by their name field. Called by the loader after the group link resolution.

## Notes

- If vehicle.engine exists but without waterDamage, an empty waterDamage table is created; nodes becomes a list (possibly empty).
- For soundscape, two entries with the same name overwrite each other (the last iterated wins); an entry without name is stored under the nil key, which raises a Lua error.

## Functions

| Function | Description | Line |
|---|---|---|
| `jbeam_sections_assorted.process(vehicle)` | Applies the two post-processings (engine.waterDamage.nodes and soundscape) in place on the vehicle data. *(internal)* | 10 |

### Parameter details

#### `jbeam_sections_assorted.process(vehicle)`

Applies the two post-processings (engine.waterDamage.nodes and soundscape) in place on the vehicle data.

- `vehicle` (*table*) : Vehicle jbeam data.

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/common/jbeam/sections/assorted.lua`.*
