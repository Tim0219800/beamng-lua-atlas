# `jbeam_sections_wheelTypes_hubWheels`

*File: `lua/common/jbeam/sections/wheelTypes/hubWheels.lua` · VM: Common (GE + vehicle) · 385 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("jbeam/sections/wheelTypes/hubWheels")`

Handler for the 'hubWheels' wheel type: a wheel with a hub separate from the tire, with air pressure simulated by pressurized beams between the hub and the tire. It creates a ring of tire nodes, a ring of hub nodes, optionally a hubcap, then the tread, periphery, hub, axle, pressure, reinforcement and support beams. Called by jbeam/sections/wheels.lua during loading.

## Example

```lua
-- called by the dispatcher: process(vehicle, wheelKey, wheel)
```

## Notes

- Parameters read: node1, node2 (required), radius (0.5), hubRadius (0.65*radius), numRays (10), tireWidth, hubWidth, wheelOffset, treadCoef (1), pressurePSI (30), pressureSpring/Damp/Strength/Deform, reinforcementPressure*, wheelSide*, wheelTread*, wheelPeriphery*, wheelTreadReinforcement*, hub*, hubcap* (enableHubcaps, hubcapRadius, hubcapWidth, hubcapOffset, hubcapCenterNodeWeight, hubcapBreakGroup, enableExtraHubcapBeams), enableTireSideVBeams, wheelSideDisplacement, enableTreadReinforcementBeams, enableTireSideSupportBeams.
- Hubcaps are only created if enableHubcaps == true and numRays is even. If enableHubcaps is true and numRays is odd, the hubcap nodes/beams are skipped.
- The hub-tire beams are of type BEAM_PRESSURED (3); volumeCoef is 1; surface computed with tireWidth, hubWidth, radius and hubRadius. The support beams (BEAM_SUPPORT = 7) use beamPrecompression = 0.75*hubRadius/radius + 0.25.
- The tire nodes are linked in pairs by pairedNode (each inner node references the next outer one). Result: wheel.nodes = hub nodes (vehicle.nodes[n]) and wheel.pressuredBeams = the pressurized beams created.
- Hardcoded C constants: NORMALTYPE = 0, BEAM_ANISOTROPIC = 1, BEAM_PRESSURED = 3, BEAM_SUPPORT = 7. wheel.collision is forced to true.
- Minor inconsistency: the code checks `i == 1` (instead of i == 0) to add the hubcap axle beams in enableExtraHubcapBeams mode; they are therefore only added on the second ray.
- hubcapOffset is nil when wheel.hubcapOffset is not defined, but the expression `node1_pos + rayVec - hubcapOffset` uses it: a hubcap without hubcapOffset therefore causes a Lua error (nil operand) in this handler.

## Functions

| Function | Description | Line |
|---|---|---|
| `jbeam_sections_wheelTypes_hubWheels.process(vehicle, wheelKey, wheel)` | Creates all the nodes and beams of a hubWheels wheel (alias of addHubWheel). Exits with an 'invalid hubWheel' warning if node1 or node2 does not exist. *(internal)* | 20 |

### Parameter details

#### `jbeam_sections_wheelTypes_hubWheels.process(vehicle, wheelKey, wheel)`

Creates all the nodes and beams of a hubWheels wheel (alias of addHubWheel). Exits with an 'invalid hubWheel' warning if node1 or node2 does not exist.

- `vehicle` (*table*) : vehicle under construction
- `wheelKey` (*integer*) : index of the wheel in its section
- `wheel` (*table*) : jbeam definition of the wheel (modified: collision, treadCoef, radius, hubRadius, numRays, nodes, pressuredBeams)

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/common/jbeam/sections/wheelTypes/hubWheels.lua`.*
