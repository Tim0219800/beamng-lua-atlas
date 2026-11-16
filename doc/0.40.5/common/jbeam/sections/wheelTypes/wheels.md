# `wheels`

*File: `lua/common/jbeam/sections/wheelTypes/wheels.lua` · VM: Common (GE + vehicle) · 168 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** global `wheels`

Handler for the 'wheels' wheel type (jbeam wheels section): the simple wheel. From two axle nodes (node1, node2), it creates a ring of 2 x numRays tire nodes around the axle then the associated beams (sides, X reinforcements, tread, periphery). Called by jbeam/sections/wheels.lua during vehicle loading; useful for understanding how a wheel jbeam is converted into physics.

## Example

```lua
-- called by the dispatcher: process(vehicle, wheelKey, wheel)
```

## Notes

- jbeam parameters read in the wheel: node1, node2 (axle nodes, required, otherwise warning 'invalid wheel' and exit without creating anything), radius (default 0.5 m), numRays (default 10), tireWidth, wheelOffset, and the families wheelSideBeam*, wheelReinforcementBeam*, wheelTreadBeam*, wheelPeripheryBeam* (Spring, Damp, Deform, Strength; Expansion for reinforcement and tread). The tire nodes inherit the wheel's options (via addNodeWithOptions).
- wheel.collision is forced to true (the tire nodes collide). The nodes are created alternating outer/inner; at the end wheel.nodes contains the tire nodes (vehicle.nodes[n]).
- The node1/node2 nodes are swapped if node1.z > node2.z for the computation, but the beams created still use wheel.node1 / wheel.node2 (original names): the swap only affects the geometry of the rings. nodeArm is read but never used.
- Hardcoded C constants: NORMALTYPE = 0, BEAM_ANISOTROPIC = 1 (do not change).

## Functions

| Function | Description | Line |
|---|---|---|
| `wheels.process(vehicle, wheelKey, wheel)` | Creates nodes and beams of a simple wheel (alias of addWheel): 2*numRays tire nodes, then per ray 8 beams (2 sides, 2 X reinforcements, 1 tread, 2 periphery, 1 diagonal). Stores the wheel's vehicle.nodes in wheel.nodes. *(internal)* | 18 |

### Parameter details

#### `wheels.process(vehicle, wheelKey, wheel)`

Creates nodes and beams of a simple wheel (alias of addWheel): 2*numRays tire nodes, then per ray 8 beams (2 sides, 2 X reinforcements, 1 tread, 2 periphery, 1 diagonal). Stores the wheel's vehicle.nodes in wheel.nodes.

- `vehicle` (*table*) : vehicle under construction (nodes, maxIDs...)
- `wheelKey` (*integer*) : index of the wheel in its section
- `wheel` (*table*) : jbeam definition of the wheel (modified: collision, radius, numRays, nodes)

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/common/jbeam/sections/wheelTypes/wheels.lua`.*
