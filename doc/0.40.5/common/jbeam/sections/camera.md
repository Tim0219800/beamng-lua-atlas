# `jbeam_sections_camera`

*File: `lua/common/jbeam/sections/camera.lua` · VM: Common (GE + vehicle) · 276 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("jbeam/sections/camera")`

Processes the vehicle's jbeam camera sections (cameras, and the old camerasInternal/cameraExternal/camerasRelative/cameraChase). Migrates the old format to vehicle.cameras.{onboard, orbit, relative, chase}, creates for each onboard camera a camera node linked by beams to the nodes id1..id8, converts 'driver' cameras to occupants, builds the cameras per occupant seat (cameras.occupant) from the occupantSlots, computes the relative cameras with respect to the reference node and produces vehicle.cameraData, a lightened copy (indices 1..N) sent to the camera extension. Called in the GE VM only.

## Notes

- Migrations: camerasInternal -> cameras.onboard, cameraExternal -> cameras.orbit, camerasRelative -> cameras.relative, cameraChase -> cameras.chase. In the old cameras, 'type' becomes 'name', 'dash' becomes 'driver', a cockpitCamera=true without a name becomes 'driver' (only once), and rightHandDoor takes rightHandCamera by default.
- Onboard cameras: if x, y, z are numeric, a node is created at this position (after the component's rotation/translation) with beams to id1..id8, and camNodeID is the created node; otherwise camNodeID = idCam or idRef. Cameras without a name receive 'onboard_N' (with order = N+20), default fov 75, isInside = true for 'driver' and 'rider'. A duplicate name is reported as an error.
- Relative cameras: position recomputed relative to the reference node refNodes[0].ref, with x and y inverted, default fov 70, rotation offset by 180 degrees on y. This emulation also converts the onboard cameras if cameras.relative is absent.
- processOccupantCameras: an onboard camera is associated with a seat by occupantSlotId; it is copied under cameras.occupant[seatId] then removed from onboard. If no anchor exists for a seat, a warning is logged.
- cameraData: deep copy of the cameras with the technical keys removed (group, firstGroup, partPath, partName, slotType, cid, collision, nodeWeight, beamSpring...) to lighten the messages.

## Functions

| Function | Description | Line |
|---|---|---|
| `jbeam_sections_camera.process(objID, vehicle)` | Performs all the conversions and creations related to the vehicle's cameras (vehicle.cameras, vehicle.cameraRefNodes, vehicle.cameraData). *(internal)* | 244 |

### Parameter details

#### `jbeam_sections_camera.process(objID, vehicle)`

Performs all the conversions and creations related to the vehicle's cameras (vehicle.cameras, vehicle.cameraRefNodes, vehicle.cameraData).

- `objID` (*integer*) : Vehicle identifier (unused).
- `vehicle` (*table*) : Vehicle jbeam data (modified in place).

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/common/jbeam/sections/camera.lua`.*
