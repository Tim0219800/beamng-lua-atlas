# `jbeam_sections_wheelTypes_pressureWheels`

*File: `lua/common/jbeam/sections/wheelTypes/pressureWheels.lua` · VM: Common (GE + vehicle) · 868 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("jbeam/sections/wheelTypes/pressureWheels")`

Handler for the 'pressureWheels' wheel type: the most recent and most complete wheel model, with air pressure simulated by pressurized TRIANGLES (one pressure group per wheel) instead of pressurized beams. It creates the tread ring (if a tire exists), the hub ring, an optional stabilizer node, hubcaps, many beam families (rim, sides, periphery, reinforcements, tread, L-beams, support) and the tire and hub triangles. Called by jbeam/sections/wheels.lua during loading.

## Example

```lua
-- called by the dispatcher: process(vehicle, wheelKey, wheel)
```

## Notes

- A tire only exists if radius AND pressurePSI are defined and wheel.hasTire is not false; otherwise only the hub is created (radius is set to 0.5 as a fallback).
- Stabilizer node: wheel.nodeStabilizer (or the old alias nodeS, then cleared); value 9999 or a nonexistent node = no stabilizer; in that case hubStabilizer* beams are added from the outer hub nodes.
- Geometry: wheelAngle (degrees) offsets the initial angle of the rays, conicityFactor (clamped to [0.5,1.5]) deforms the tire conicity between the two sides, offsetFromNode (1 or 2) positions the middle of the wheel relative to a node using hubWidth, wheelOffset shifts along the axle, tireWidth places the tire rings. hubWeight / tireWeight give a total weight distributed per node (hubNodeWeight = hubWeight/(2*numRays), nodeWeight = tireWeight/(2*numRays)) and hubWeightGainRatio ([0,1[) transfers part of the tire weight to the hub.
- For an even number of rays, each tread node receives oppositeTreadNodeCid (opposite node, to measure the tire's dynamic radius).
- The tire options are copied into a stripped-down 'cleanwheel' (brakes, thermal, enable options, hasTire...) then cleanupWheelOptions removes the hub-specific options (hub*, hubcap*...) to obtain the tire node options; the hub nodes receive the hub* options.
- Triangles: pressure group '_wheelPressureGroup<wheelID>'; addPressTri (with pressureGroup, pressurePSI, skinDragCoef) for the tire triangles (tread, two sides) and the hub; addTri (no pressure) for the non-pressurized hub triangles. Triangle collision: triangleCollision (default false = NONCOLLIDABLE), treadTriangleCollision, side1TriangleCollision, side2TriangleCollision, hubTriangleCollision, hubSide1TriangleCollision, hubSide2TriangleCollision. Triangles are added to vehicle.triangles.
- Enable options read: enableTireReinfBeams / enableTireLbeams (X or L reinforcements), enableTireSideReinfBeams, enableTirePeripheryReinfBeams, enableTreadReinfBeams, enableTireSupportBeams, enableHubcaps (even number of rays), enableExtraHubcapBeams.
- Result in the wheel: wheel.nodes (hub), wheel.treadNodes, wheel.rimBeams, wheel.sideBeams, wheel.peripheryBeams, wheel.reinfBeams, wheel.treadBeams, wheel.pressureGroup. wheel.collision forced to true; wheel.hubWidth receives axis:length() (which is 1 after normalization!) if hubWidth is not provided.
- Probable BUG: `wheel.hubWidth = wheel.hubWidth or axis:length()` is evaluated AFTER axis:normalize(), so the default hub width is 1 m instead of the node1-node2 distance.
- Hardcoded C constants: NORMALTYPE 0, BEAM_ANISOTROPIC 1, NONCOLLIDABLE 2, BEAM_LBEAM 4, BEAM_SUPPORT 7.

## Functions

| Function | Description | Line |
|---|---|---|
| `jbeam_sections_wheelTypes_pressureWheels.process(vehicle, wheelKey, wheel)` | Creates nodes, beams and triangles of a pressureWheels wheel (alias of addPressureWheel). Warning 'invalid pressureWheel' and exits if node1 or node2 is missing. *(internal)* | 166 |

### Parameter details

#### `jbeam_sections_wheelTypes_pressureWheels.process(vehicle, wheelKey, wheel)`

Creates nodes, beams and triangles of a pressureWheels wheel (alias of addPressureWheel). Warning 'invalid pressureWheel' and exits if node1 or node2 is missing.

- `vehicle` (*table*) : vehicle under construction (nodes, triangles, maxIDs...)
- `wheelKey` (*integer*) : index of the wheel in its section
- `wheel` (*table*) : jbeam definition of the wheel (many fields, see notes); modified with nodes, treadNodes, rimBeams, sideBeams, peripheryBeams, reinfBeams, treadBeams, pressureGroup

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/common/jbeam/sections/wheelTypes/pressureWheels.lua`.*
