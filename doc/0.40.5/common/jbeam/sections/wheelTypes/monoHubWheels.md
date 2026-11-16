# `jbeam_sections_wheelTypes_monoHubWheels`

*File: `lua/common/jbeam/sections/wheelTypes/monoHubWheels.lua` · VM: Common (GE + vehicle) · 206 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("jbeam/sections/wheelTypes/monoHubWheels")`

Handler for the 'monoHubWheels' wheel type: a single-hub wheel. A tire ring (2 x numRays nodes) linked to the two axle nodes by sides and support beams, plus ONE single ring of numRays hub nodes placed at the middle of the axle and linked to node1, node2 and the tire by anisotropic reinforcement beams. Called by jbeam/sections/wheels.lua during vehicle loading.

## Example

```lua
-- called by the dispatcher: process(vehicle, wheelKey, wheel)
```

## Notes

- Parameters read: node1, node2 (required), radius (0.5), hubRadius (0.65*radius), numRays (10), tireWidth, wheelOffset, wheelSideBeam*, wheelTreadBeam*, wheelPeripheryBeam*, wheelReinforcementBeam*, hubBeam*, hubNodeWeight, hubCollision, hubNodeMaterial, hubFrictionCoef. The hub nodes are offset by half an angular step (initial rotation 2*pi/(4*numRays)).
- BEAM_SUPPORT (7) support beams between node1/node2 and the tire with beamPrecompression = 0.75*hubRadius/radius + 0.25 (always created, unlike the hubWheels* types).
- Result: wheel.nodes = hub nodes (numRays nodes). wheel.collision forced to true. C constants: NORMALTYPE 0, BEAM_ANISOTROPIC 1, BEAM_SUPPORT 7.
- The tire nodes are created before the hub ones: their ids start at maxIDs.nodes before creation.

## Functions

| Function | Description | Line |
|---|---|---|
| `jbeam_sections_wheelTypes_monoHubWheels.process(vehicle, wheelKey, wheel)` | Creates nodes and beams of a monoHubWheels wheel (alias of addMonoHubWheel). Warning 'invalid monohub wheel' and exits if node1 or node2 is missing. *(internal)* | 19 |

### Parameter details

#### `jbeam_sections_wheelTypes_monoHubWheels.process(vehicle, wheelKey, wheel)`

Creates nodes and beams of a monoHubWheels wheel (alias of addMonoHubWheel). Warning 'invalid monohub wheel' and exits if node1 or node2 is missing.

- `vehicle` (*table*) : vehicle under construction
- `wheelKey` (*integer*) : index of the wheel in its section
- `wheel` (*table*) : jbeam definition of the wheel (modified: collision, radius, hubRadius, numRays, nodes)

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/common/jbeam/sections/wheelTypes/monoHubWheels.lua`.*
