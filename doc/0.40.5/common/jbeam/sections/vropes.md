# `jbeam_sections_vropes`

*File: `lua/common/jbeam/sections/vropes.lua` · VM: Common (GE + vehicle) · 128 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("jbeam/sections/vropes")`

Processes the jbeam "vropes" section (simulated visual ropes, without physical beams). For each entry that has anchorAProp and anchorBProp (vehicle prop names), creates an engine-side visual rope (createRopeVisual/getRopeVisual), attaches it to both props (vehiclePropIdA/B) and applies its properties with default values, then calls rope:rebuild(). The list of created ids is stored in vehicleObj.ropeIds for automatic rendering.

## Notes

- Default values: dirA/dirB (0,0,-1), nodeCount 16, lengthScale 1.2, diameter 0.05, damping 0.995, bendStiffness 0.8, useXPBD false, useBending true, bendSegmentLength 2, useWorldCollision false, useSelfCollision false, useStrainLimit true, maxStrainLimit 2.0, totalMass 0.5, massFalloff 0.0, iterations 1, youngsModulus 1e6, renderRope true, windScale 0.5, windDrag 0.5, materialName '', anchorAFixed/anchorBFixed false, simFPS 60.
- Props are found by their name field; a prop that cannot be found logs an error and the rope is ignored. The success message says 'nodes' but they are props.
- findPropIdByName returns the prop's cid (prop id), not a node id.
- Only runs if the engine vehicle object is available (GE VM).

## Functions

| Function | Description | Line |
|---|---|---|
| `jbeam_sections_vropes.process(objID, vehicleObj, vehicle)` | Creates the visual ropes described by vehicle.vropes and stores their ids in vehicleObj.ropeIds. *(internal)* | 117 |

### Parameter details

#### `jbeam_sections_vropes.process(objID, vehicleObj, vehicle)`

Creates the visual ropes described by vehicle.vropes and stores their ids in vehicleObj.ropeIds.

- `objID` (*integer*) : Vehicle identifier (unused).
- `vehicleObj` (*userdata*) : Engine vehicle object.
- `vehicle` (*table*) : jbeam data (vropes, props).

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/common/jbeam/sections/vropes.lua`.*
