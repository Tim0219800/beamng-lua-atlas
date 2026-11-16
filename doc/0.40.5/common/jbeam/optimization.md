# `jbeam_optimization`

*File: `lua/common/jbeam/optimization.lua` · VM: Common (GE + vehicle) · 242 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("jbeam/optimization")`

Finalization steps of the jbeam data before sending to the physics. assignCIDs numbers each row of the "valid" sections with a continuous cid (0, 1, 2...) in a deterministic order (sorted keys) and computes vehicle.maxIDs. process reorders the beams' nodes (id1 < id2), removes fields not needed at runtime, replaces object references with cids (hydros, wheels), removes disabled sections (disableSection) then deletes vehicle.validTables.

## Notes

- Node cid order: first the fixed nodes, then the nodes without collision (collision == false), then all the others (non-fixed nodes at the end), each group sorted by key.
- Sections other than nodes are numbered in alphabetical order of the row keys.
- optimize swaps a beam's id1/id2 when id1 > id2 and updates its cid with the table key; it is not exported.
- cleanup (not exported) removes group and engineGroup (except in debug mode), empty strings (except the mesh key), and resets the default values of nodes, beams and triangles to nil to lighten the data.
- dereference (not exported) replaces hydro.beam with hydro.beamCID and the wheels' beam/node lists with cids.
- A section whose row at index 0 contains disableSection is removed from the vehicle.

## Functions

| Function | Description | Line |
|---|---|---|
| `jbeam_optimization.assignCIDs(vehicle)` | Assigns a continuous cid to each row of the sections listed in vehicle.validTables and records the number of rows per section in vehicle.maxIDs. *(internal)* | 53 |
| `jbeam_optimization.process(vehicle, debugEnabled)` | Optimizes and cleans the vehicle data: beams id1<id2, default value cleanup, dereferencing to cids, removal of disabled sections and validTables. *(internal)* | 218 |

### Parameter details

#### `jbeam_optimization.assignCIDs(vehicle)`

Assigns a continuous cid to each row of the sections listed in vehicle.validTables and records the number of rows per section in vehicle.maxIDs.

- `vehicle` (*table*) : Vehicle jbeam data (with validTables), modified in place.
- **returns**: boolean Always true.

#### `jbeam_optimization.process(vehicle, debugEnabled)`

Optimizes and cleans the vehicle data: beams id1<id2, default value cleanup, dereferencing to cids, removal of disabled sections and validTables.

- `vehicle` (*table*) : Vehicle jbeam data.
- `debugEnabled` (*boolean|nil*) : If true, keeps the group and engineGroup fields.
- **returns**: boolean Always true.

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/common/jbeam/optimization.lua`.*
