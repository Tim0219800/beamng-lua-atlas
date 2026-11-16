# `jbeam_sections_occupantFaces`

*File: `lua/common/jbeam/sections/occupantFaces.lua` · VM: Common (GE + vehicle) · 72 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("jbeam/sections/occupantFaces")`

Handles occupant faces (character heads). Loads, once, the parts of the 'skin_character_face' slot of the /vehicles/unicycle/ vehicle to build the list of available faces and the material associated with each (base 'character_display'). Provides utilities for the UI and random picking, and a process step that registers all the face materials on each 'character_head' prop of a vehicle whose occupant system is enabled.

## Notes

- A face's material is 'character_display.skin_character_face.<skinName>' if the part has skinName, otherwise 'character_display'.
- getFaceOptions returns a shared table (sorted by label): do not modify it.
- getRandomFacePart crashes if no face is available (random index on an empty list).
- process does nothing if vehicle.occupantSystem does not exist or is not enabled (see jbeam/sections/occupantSlots); it sets prop.faceMaterialSwitch on each head.
- Material instances only exist for materials known at the end of vehicle loading, hence all faces are registered on each head.

## Functions

| Function | Description | Line |
|---|---|---|
| `jbeam_sections_occupantFaces.getFaceMaterial(partName)` | Material to use for a face (base material if the part is unknown). | 43 |
| `jbeam_sections_occupantFaces.getFaceOptions()` | List of faces {value = part name, label = display name}, sorted by label. Shared table, do not modify. | 33 |
| `jbeam_sections_occupantFaces.getRandomFacePart()` | Name of a randomly picked face part. | 38 |
| `jbeam_sections_occupantFaces.isFacePart(partName)` | Tells whether the part name is a known face. | 27 |
| `jbeam_sections_occupantFaces.process(vehicleObj, vehicle)` | Registers all face materials on the vehicle's occupant heads. *(internal)* | 49 |

### Parameter details

#### `jbeam_sections_occupantFaces.getFaceMaterial(partName)`

Material to use for a face (base material if the part is unknown).

- `partName` (*string*) : Face part name.
- **returns**: string Material name.

#### `jbeam_sections_occupantFaces.getFaceOptions()`

List of faces {value = part name, label = display name}, sorted by label. Shared table, do not modify.

- **returns**: table[] Face options.

#### `jbeam_sections_occupantFaces.getRandomFacePart()`

Name of a randomly picked face part.

- **returns**: string Part name.

#### `jbeam_sections_occupantFaces.isFacePart(partName)`

Tells whether the part name is a known face.

- `partName` (*string*) : Part name.
- **returns**: boolean true if it is a face.

#### `jbeam_sections_occupantFaces.process(vehicleObj, vehicle)`

Registers all face materials on the vehicle's occupant heads.

- `vehicleObj` (*userdata*) : Engine vehicle object.
- `vehicle` (*table*) : jbeam data (occupantSystem, props).

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/common/jbeam/sections/occupantFaces.lua`.*
