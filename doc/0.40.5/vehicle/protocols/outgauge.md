# `protocols_outgauge`

*File: `lua/vehicle/protocols/outgauge.lua` · VM: Vehicle · 139 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("protocols/outgauge")`

UDP OutGauge protocol (Live For Speed compatible): sends speed, RPM, gear, turbo pressure, temperatures, fuel, pedal inputs and warning lights of the vehicle for external dashboards. Loaded by protocols.lua; address, port and rate come from the settings protocols_outgauge_address, _port, _maxUpdateRate. Uses the graphics step (low cost).

## Example

```lua
-- Activation: setting 'protocols_outgauge_enabled'. In OutGauge dashboard software, listen on the configured UDP port.
```

## Notes

- Packet (C struct): unsigned time (always 0); char car[4] = "beam"; unsigned short flags; char gear; char plid (0); float speed (m/s); rpm (RPM); turbo (bar); engTemp (°C); fuel (0..1); oilPressure (0, not handled); oilTemp (°C); unsigned dashLights; unsigned showLights; float throttle, brake, clutch (0..1); char display1[16], display2[16] (empty); int id (0).
- flags = OG_KM + OG_BAR (+ OG_TURBO if electrics.turboBoost exists): indicates km/h and bar units. Turbo is converted from psi (electrics.turboBoost / 14.504). OG_x values: 8192 turbo, 16384 km, 32768 bar.
- gear = electrics.gearIndex + 1: 0 reverse, 1 neutral, 2 first, etc. (gearIndex is -1 in reverse).
- speed = electrics.wheelspeed, otherwise airspeed; rpm = electrics.rpm; engTemp = electrics.watertemp; oilTemp = electrics.oiltemp; fuel = electrics.fuel.
- Warning lights dashLights/showLights (bits 2^n): SHIFT 0 (if a shiftLights controller is present, electrics.shouldShift), FULLBEAM 1 (highbeam), HANDBRAKE 2 (parkingbrake), TC 4 (esc or tcs active, only if electrics.hasESC), SIGNAL_L 5 / SIGNAL_R 6 (turn signals), OILWARN 8 (electrics.oil), BATTERY 9 (engine stopped: engineRunning == 0), ABS 10 (electrics.absActive, only if hasABS). PITSPEED 3, SIGNAL_ANY 7, SPARE 11 are not used (N/A).
- Bug/inconsistency: fillStruct does an early `return` if electrics.values.watertemp is nil, but protocols.lua still sends the packet (filled with zeros) because the send happens after the call.
- Potential bug: electrics.values.gearIndex is not guarded: if it is nil, the addition raises an error. The `~= 0` comparisons of the lights assume numeric values (nil ~= 0 is true and lights the indicator if the electrics value does not exist: highbeam, parkingbrake, signal_L, signal_R, oil).

## Functions

| Function | Description | Line |
|---|---|---|
| `protocols_outgauge.fillStruct(o, dtSim)` | Fills the packet from electrics.values (speed, RPM, gear, turbo, temperatures, fuel, pedals, warning lights). *(internal)* | 84 |
| `protocols_outgauge.getAddress()` | Destination IP address (setting protocols_outgauge_address). *(internal)* | 19 |
| `protocols_outgauge.getMaxUpdateRate()` | Maximum sending rate in Hz (setting protocols_outgauge_maxUpdateRate). *(internal)* | 21 |
| `protocols_outgauge.getPort()` | Destination UDP port (setting protocols_outgauge_port). *(internal)* | 20 |
| `protocols_outgauge.getStructDefinition()` | Returns the C definition of the OutGauge packet (text passed to ffi.cdef). *(internal)* | 28 |
| `protocols_outgauge.init()` | Looks for controllers of type shiftLights to know whether the shift light is available. *(internal)* | 13 |
| `protocols_outgauge.isPhysicsStepUsed()` | Indicates that this protocol is updated in the graphics loop. *(internal)* | 23 |
| `protocols_outgauge.reset()` | Protocol reset (does nothing). *(internal)* | 18 |

### Parameter details

#### `protocols_outgauge.fillStruct(o, dtSim)`

Fills the packet from electrics.values (speed, RPM, gear, turbo, temperatures, fuel, pedals, warning lights).

- `o` (*cdata*) : C struct of the packet to fill (zeroed before the call).
- `dtSim` (*number*) : Simulation time accumulated since the last send (not used).

#### `protocols_outgauge.getAddress()`

Destination IP address (setting protocols_outgauge_address).

- **returns**: string IP address.

#### `protocols_outgauge.getMaxUpdateRate()`

Maximum sending rate in Hz (setting protocols_outgauge_maxUpdateRate).

- **returns**: number Hz.

#### `protocols_outgauge.getPort()`

Destination UDP port (setting protocols_outgauge_port).

- **returns**: integer Port number.

#### `protocols_outgauge.getStructDefinition()`

Returns the C definition of the OutGauge packet (text passed to ffi.cdef).

- **returns**: string Body of the C struct.

#### `protocols_outgauge.isPhysicsStepUsed()`

Indicates that this protocol is updated in the graphics loop.

- **returns**: boolean Always false.

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/vehicle/protocols/outgauge.lua`.*
