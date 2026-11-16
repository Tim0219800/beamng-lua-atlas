# `suspensionFrequencyTester`

*File: `lua/ge/suspensionFrequencyTester.lua` · VM: Game Engine (GE) · 201 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("suspensionFrequencyTester")`

Development tool that measures a vehicle's suspension frequency. It shows an ImGui window "Suspension Frequency Tester": for two nodes (front axle 279, rear axle 425 by default) it reads the z height every frame and feeds it into 1000 frequency detection filters (newFreqExists) between 0.5 Hz and 5 Hz, then compares against categories (Too Soft 0.9 Hz, Luxury 1.1, Average 1.2, Sporty 1.4, Rally 1.8, Racetrack 2.2, Aero-Critical 5.0). The file explains the usage: put the car on ice, remove the damping, then run extensions.suspensionFrequencyTester.run() from the console.

## Example

```lua
extensions.load('suspensionFrequencyTester')
extensions.suspensionFrequencyTester.run()
```

## Notes

- Node ids 279 and 425 are hard-coded for one specific vehicle; they can be changed in the window ('Front axle node ID' / 'Rear axle node ID' fields).
- The module reads imgui when it loads (ui_imgui): it must therefore only be loaded on the GE side with the imgui interface available.
- The table's 'm/Hz' display is an integral of amplitudes divided by the band width in Hz (formatted as an integer by %i).
- The header comment says extensions.suspensionFrequencyTester.run(); the automatic page says require(...): both assume the module is loaded as an extension.

## Functions

| Function | Description | Line |
|---|---|---|
| `suspensionFrequencyTester.onUpdate(dtReal, dtSim, dtRaw)` | Hook called every frame by the extension system: draws the window if it is open, then (if a player vehicle exists) updates for each node the amplitudes of all frequency filters from the node's z position (veh:getNodePositionXYZ) and dtSim. *(internal)* *(hook)* | 176 |
| `suspensionFrequencyTester.run()` | Opens the window and resets the amplitudes and frequency filters of each node to start a new measurement. | 190 |

### Parameter details

#### `suspensionFrequencyTester.onUpdate(dtReal, dtSim, dtRaw)`

Hook called every frame by the extension system: draws the window if it is open, then (if a player vehicle exists) updates for each node the amplitudes of all frequency filters from the node's z position (veh:getNodePositionXYZ) and dtSim.

- `dtReal` (*number*) : Real frame duration (s); unused.
- `dtSim` (*number*) : Simulated frame duration (s), passed to the filters.
- `dtRaw` (*number*) : Raw frame duration (s); unused.

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/suspensionFrequencyTester.lua`.*
