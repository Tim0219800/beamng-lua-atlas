# `jbeam_sections_occupantSlots`

*File: `lua/common/jbeam/sections/occupantSlots.lua` · VM: Common (GE + vehicle) · 89 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("jbeam/sections/occupantSlots")`

Processes the jbeam "occupantSlots" section (occupant seats). Normalizes each entry: id (id, name or table key), defaultPermissionMode (driver, passenger or unrestricted; otherwise inferred from the camera), seatSide (left/right/center, inferred from exitSide, driverSide or the L/R suffix of the id), cameraName 'occupant.<id>', entryTrigger 'enterSeat_<id>', cargoGroup '<id>Occupant' and actionMaps (always a table). Produces vehicle.occupantSlotsById and enables vehicle.occupantSystem.enabled if there are seats or if an active part exposes a slot of type 'seat_occupant'.

## Notes

- Duplicate ids are rejected with a log error (the second entry is ignored).
- An invalid defaultPermissionMode produces a warning and is then replaced: 'driver' if cameraName is 'driver', otherwise 'passenger'.
- cameraName is always rewritten to 'occupant.<id>', whatever the original value; the original value is only used to infer the permission mode.
- The first parameter (objID) is ignored; only called on the GE side (vmType == 'game').

## Functions

| Function | Description | Line |
|---|---|---|
| `jbeam_sections_occupantSlots.process(_, vehicle, activePartsData)` | Normalizes the vehicle's occupantSlots and enables the occupant system if needed. *(internal)* | 32 |

### Parameter details

#### `jbeam_sections_occupantSlots.process(_, vehicle, activePartsData)`

Normalizes the vehicle's occupantSlots and enables the occupant system if needed.

- `_` (*any*) : Vehicle id (ignored).
- `vehicle` (*table*) : jbeam data (occupantSlots, occupantSystem).
- `activePartsData` (*table<string, table>|nil*) : Active parts (used to detect a seat_occupant slot).

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/common/jbeam/sections/occupantSlots.lua`.*
