# `jbeam_sections_meshs`

*File: `lua/common/jbeam/sections/meshs.lua` · VM: Common (GE + vehicle) · 382 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("jbeam/sections/meshs")`

Processes the jbeam sections that concern the vehicle's 3D meshes: triangles (physical collision triangles), props (rigid meshes attached to three reference nodes, including SPOTLIGHT/POINTLIGHT lights) and flexbodies (deformable meshes linked to node groups). First applies the component's rotations/translations to the flexbodies' positions/rotations, asks the engine to load the meshes in a group, creates the physical triangles, the props and the flexmeshes with their transformations, then validates (meshCommit).

## Notes

- Props: require idRef, idX, idY, translation and rotation (otherwise error and the prop is ignored). Rotation in degrees in the jbeam, converted to radians; baseRotation/baseRotationGlobal too. If the engine renames the mesh, the original name is stored in originalMesh and mesh is updated. The user parameter "disableSteeringwheel" disables the props whose func == 'steering'.
- Prop default values: min 0, max 100, offset 0, multiplier 1; they are created visible with data value 0. prop.pid and prop.slotID receive the engine identifier.
- Lights (mesh SPOTLIGHT or POINTLIGHT): lightInnerAngle (40), lightOuterAngle (45), lightBrightness (1) or lightIntensityCd / lightIntensityLm (converted to brightness / 5000), lightRange (10), lightCastShadows (false), flareName ('vehicleDefaultLightflare'), flareScale 1, cookieName, animationType/Period/Phase, texSize 256, shadowSoftness 1, lightColor ({r,g,b,a} table 0-255 or string '#RRGGBBAA'), lightAttenuation (0,1,1), lightSourceRadius (in meters, -1 by default).
- materialOverride (props and flexbodies) must be an array of {old, new} pairs; a single pair {a, b} causes a log error.
- Flexbodies: created only if they have at least one node in _group_nodes; pos/rot (degrees)/scale optional, applied via setInitialTransformation (optional flatMap). Renamed meshes are tracked as for props.
- Degenerate triangles (two identical indices) are ignored.
- The module does nothing engine-side if vehicleObj is nil (vehicle VM).

## Functions

| Function | Description | Line |
|---|---|---|
| `jbeam_sections_meshs.process(objID, vehicleObj, vehicle)` | Loads and configures the vehicle's triangles, props and flexbodies in the engine. *(internal)* | 322 |

### Parameter details

#### `jbeam_sections_meshs.process(objID, vehicleObj, vehicle)`

Loads and configures the vehicle's triangles, props and flexbodies in the engine.

- `objID` (*integer*) : Vehicle identifier (unused).
- `vehicleObj` (*userdata|nil*) : Engine vehicle object.
- `vehicle` (*table*) : Vehicle jbeam data (modified in place: pid, fid, mesh, rotation...).

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/common/jbeam/sections/meshs.lua`.*
