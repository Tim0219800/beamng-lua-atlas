# `jbeam_sections_wheelTypes_hubWheelsTSV`

*File: `lua/common/jbeam/sections/wheelTypes/hubWheelsTSV.lua` · VM: Common (GE + vehicle) · 219 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("jbeam/sections/wheelTypes/hubWheelsTSV")`

Handler for the 'hubWheelsTSV' wheel type: a wheel with a separate hub WITHOUT simulated air pressure: the tire is linked to the hub by anisotropic side and reinforcement beams (instead of pressurized beams). Called by jbeam/sections/wheels.lua during vehicle loading.

## Example

```lua
-- called by the dispatcher: process(vehicle, wheelKey, wheel)
```

## Notes

- Per ray, the code creates: tread (BEAM_ANISOTROPIC), periphery (NORMALTYPE), hub beams (tread, periphery, axle toward node1/node2), 2 anisotropic hub-tire reinforcements (wheelReinforcementBeam*), 4 anisotropic side beams (wheelSideBeam*), and BEAM_SUPPORT (7) support beams if enableTireSideSupportBeams.
- The node creation order is reversed compared to hubWheelsTSI (inner then outer for the hub): the 'outhub' and 'inhub' nodes are swapped in the indices.
- Result: wheel.nodes (hub nodes), wheel.reinforcementBeams, wheel.sideBeams, wheel.treadBeams. Default values: radius 0.5, hubRadius 0.65*radius, numRays 10. wheel.collision is forced to true.
- In this handler, hubWidth/tireWidth are not written to the wheel (unlike TSI).
- C constants: NORMALTYPE 0, BEAM_ANISOTROPIC 1, BEAM_SUPPORT 7; no BEAM_PRESSURED.

## Functions

| Function | Description | Line |
|---|---|---|
| `jbeam_sections_wheelTypes_hubWheelsTSV.process(vehicle, wheelKey, wheel)` | Creates nodes and beams of a hubWheelsTSV wheel (alias of addHubWheelTSV). Warning 'invalid hubWheel' and exits if node1 or node2 is missing. *(internal)* | 19 |

### Parameter details

#### `jbeam_sections_wheelTypes_hubWheelsTSV.process(vehicle, wheelKey, wheel)`

Creates nodes and beams of a hubWheelsTSV wheel (alias of addHubWheelTSV). Warning 'invalid hubWheel' and exits if node1 or node2 is missing.

- `vehicle` (*table*) : vehicle under construction
- `wheelKey` (*integer*) : index of the wheel in its section
- `wheel` (*table*) : jbeam definition of the wheel (modified: collision, radius, hubRadius, numRays, nodes, reinforcementBeams, sideBeams, treadBeams)

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/common/jbeam/sections/wheelTypes/hubWheelsTSV.lua`.*
