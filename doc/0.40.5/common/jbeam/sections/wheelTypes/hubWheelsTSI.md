# `jbeam_sections_wheelTypes_hubWheelsTSI`

*File: `lua/common/jbeam/sections/wheelTypes/hubWheelsTSI.lua` · VM: Common (GE + vehicle) · 264 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("jbeam/sections/wheelTypes/hubWheelsTSI")`

Handler for the 'hubWheelsTSI' wheel type: a variant of hubWheels without hubcap. Ring of tire nodes + ring of hub nodes, tread, periphery, hub and axle beams, and six pressurized beams per ray between hub and tire (air pressure is simulated). Called by jbeam/sections/wheels.lua during vehicle loading.

## Example

```lua
-- called by the dispatcher: process(vehicle, wheelKey, wheel)
```

## Notes

- Differences from hubWheels: no hubcap, no V beams nor tread reinforcements; if tireWidth or hubWidth are not provided, they are set to the node1-node2 distance in the wheel table (wheel.tireWidth, wheel.hubWidth). The hub* hub options are applied only if they are defined (no 'or').
- Pressurized beams of type BEAM_PRESSURED (3) based on the reinforcement options (wheelReinforcementBeam*) with pressurePSI (default 30), volumeCoef = 1/(numRays*6), surface computed from radius, hubRadius, tireWidth, hubWidth; reinforcementPressure* (PSI, Spring, Damp) for the reinforcements.
- The tire nodes are linked by pairedNode (inner -> outer -> next inner). BEAM_SUPPORT (7) support beams if enableTireSideSupportBeams.
- Result: wheel.nodes = hub nodes, wheel.pressuredBeams = pressurized beams. Default parameters: radius 0.5, hubRadius 0.65*radius, numRays 10, treadCoef 1. wheel.collision forced to true. C constants: NORMALTYPE 0, BEAM_ANISOTROPIC 1, BEAM_PRESSURED 3, BEAM_SUPPORT 7.
- TSI/TSV: acronyms not explained in the code (inferred: 'pressure' and 'vertical' variants of the same construction; to be confirmed on the editor side).

## Functions

| Function | Description | Line |
|---|---|---|
| `jbeam_sections_wheelTypes_hubWheelsTSI.process(vehicle, wheelKey, wheel)` | Creates nodes and beams of a hubWheelsTSI wheel (alias of addHubWheelTSI). Warning 'invalid hubWheel' and exits without creating anything if node1 or node2 cannot be found. *(internal)* | 20 |

### Parameter details

#### `jbeam_sections_wheelTypes_hubWheelsTSI.process(vehicle, wheelKey, wheel)`

Creates nodes and beams of a hubWheelsTSI wheel (alias of addHubWheelTSI). Warning 'invalid hubWheel' and exits without creating anything if node1 or node2 cannot be found.

- `vehicle` (*table*) : vehicle under construction
- `wheelKey` (*integer*) : index of the wheel in its section
- `wheel` (*table*) : jbeam definition of the wheel (modified: collision, radius, hubRadius, numRays, tireWidth, hubWidth, nodes, pressuredBeams)

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/common/jbeam/sections/wheelTypes/hubWheelsTSI.lua`.*
