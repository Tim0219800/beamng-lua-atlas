# `protocols_motionSim`

*File: `lua/vehicle/protocols/motionSim.lua` · VM: Vehicle · 66 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("protocols/motionSim")`

UDP "MotionSim" protocol (format 'BNG1') to drive a motion platform: sends position, speed, acceleration (without gravity), up vector, angles, angular speeds and accelerations of the player vehicle. Loaded and managed by protocols.lua (never called directly). Address, port and rate come from the settings protocols_motionSim_address, _port and _maxUpdateRate. Uses the physics step, so costly but accurate (up to 2000 Hz).

## Example

```lua
-- Activation: setting 'protocols_motionSim_enabled'. Packets are sent over UDP to protocols_motionSim_address:protocols_motionSim_port.
```

## Notes

- Packet (C struct, all floats are 32-bit): char format[4] = "BNG1"; posX,posY,posZ; velX,velY,velZ; accX,accY,accZ; upX,upY,upZ; rollPos,pitchPos,yawPos; rollVel,pitchVel,yawVel; rollAcc,pitchAcc,yawAcc. The values come from the corresponding fields of protocols.lua (smoothed).
- External documentation of the format: https://go.beamng.com/protocols (indicated in the code; any change to the struct must be reflected there).
- The end-of-line comments in the code ("return 4567", "return "127.0.0.1"") are example/default values: the code actually reads the user settings.
- No validation: if the smoothers of protocols.lua are not yet initialized, fields may be nil during fillStruct (value 0 expected by ffi).

## Functions

| Function | Description | Line |
|---|---|---|
| `protocols_motionSim.fillStruct(o, dtSim)` | Fills the packet with the current values from protocols.lua (position, speed, acceleration, up vector, angles, angular speeds and accelerations). *(internal)* | 42 |
| `protocols_motionSim.getAddress()` | Destination IP address, read from the setting protocols_motionSim_address. *(internal)* | 14 |
| `protocols_motionSim.getMaxUpdateRate()` | Maximum sending rate in Hz, read from the setting protocols_motionSim_maxUpdateRate. *(internal)* | 16 |
| `protocols_motionSim.getPort()` | Destination UDP port, read from the setting protocols_motionSim_port. *(internal)* | 15 |
| `protocols_motionSim.getStructDefinition()` | Returns the C definition of the packet structure (text passed to ffi.cdef). *(internal)* | 23 |
| `protocols_motionSim.init()` | Protocol initialization (does nothing). *(internal)* | 12 |
| `protocols_motionSim.isPhysicsStepUsed()` | Indicates that this protocol is updated at each physics step. *(internal)* | 18 |
| `protocols_motionSim.reset()` | Protocol reset (does nothing). *(internal)* | 13 |

### Parameter details

#### `protocols_motionSim.fillStruct(o, dtSim)`

Fills the packet with the current values from protocols.lua (position, speed, acceleration, up vector, angles, angular speeds and accelerations).

- `o` (*cdata*) : C struct of the packet to fill.
- `dtSim` (*number*) : Simulation time accumulated since the last send (not used here).

#### `protocols_motionSim.getAddress()`

Destination IP address, read from the setting protocols_motionSim_address.

- **returns**: string IP address (typical default 127.0.0.1).

#### `protocols_motionSim.getMaxUpdateRate()`

Maximum sending rate in Hz, read from the setting protocols_motionSim_maxUpdateRate.

- **returns**: number Hz.

#### `protocols_motionSim.getPort()`

Destination UDP port, read from the setting protocols_motionSim_port.

- **returns**: integer Port number.

#### `protocols_motionSim.getStructDefinition()`

Returns the C definition of the packet structure (text passed to ffi.cdef).

- **returns**: string Body of the C struct.

#### `protocols_motionSim.isPhysicsStepUsed()`

Indicates that this protocol is updated at each physics step.

- **returns**: boolean Always true.

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/vehicle/protocols/motionSim.lua`.*
