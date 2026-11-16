# `core_remoteController`

*File: `lua/ge/extensions/core/remoteController.lua` · VM: Game Engine (GE) · 194 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `core_remoteController`: `extensions.load("core_remoteController")`, then the global `core_remoteController`

UDP server that lets you control the game with the BeamNG "remote controller" mobile app. getQRCode opens UDP port 4444 and returns a 5-digit code that the app must send; then each recognized device becomes a virtual device (core_input_virtualInput, type bngremotectrlv1, 1 axis, 2 buttons) fed by the orientation packets received. The vehicle's UI data is sent back to the app (port 4445) via the vehicle's outgauge extension.

## Notes

- Protocol: a packet starting with 'beamng' with three fields separated by '|' (beamng|deviceName|code) is a discovery packet; if the code matches, the game replies 'beamng|code' on port 4445. Other 16-byte packets (struct ori_t w,x,y,z as floats, network order) are read as data: x > 0.5 = button 0, y > 0.5 = button 1, z = axis 0; x,y,z are clamped to [0,1].
- A device with no packet for 10 s is removed.
- Requires FFI: onExtensionLoaded returns false without it.
- BUG: M.onFirstUpdate = onFirstUpdate references an undefined local variable, so this field is nil (harmless).
- Packets are read in bursts (loop until receivefrom returns nothing anymore) in onUpdate, every frame (a TODO suggests switching to 1 Hz).
- The random code is drawn once when the module loads (random(10000, 99999)).

## Functions

| Function | Description | Line |
|---|---|---|
| `core_remoteController.devicesConnected()` | Indicates whether at least one remote device is connected. | 182 |
| `core_remoteController.getQRCode()` | Opens the listening UDP socket (port 4444) if it is not open, and returns the pairing code to display (as a QR code by the UI). | 54 |
| `core_remoteController.onExtensionLoaded()` | Load hook: checks for FFI. *(internal)* *(hook)* | 164 |
| `core_remoteController.onInputBindingsChanged(players)` | Hook called when input bindings change: remembers which player each virtual device is assigned to (key 'vinput<instance>'), or forgets it if the player is negative. *(internal)* *(hook)* | 172 |
| `core_remoteController.onUpdate()` | Update hook: removes devices inactive for more than 10 s, reads UDP packets, creates the virtual devices and emits their events (buttons, axis) to core_input_virtualInput. Does nothing as long as the socket is not open. *(internal)* *(hook)* | 70 |

### Parameter details

#### `core_remoteController.devicesConnected()`

Indicates whether at least one remote device is connected.

- **returns**: boolean true if there is at least one virtual device.

#### `core_remoteController.getQRCode()`

Opens the listening UDP socket (port 4444) if it is not open, and returns the pairing code to display (as a QR code by the UI).

- **returns**: integer|boolean 5-digit code, or false if the socket could not be opened.

#### `core_remoteController.onExtensionLoaded()`

Load hook: checks for FFI.

- **returns**: boolean false if FFI is unavailable (load refused).

#### `core_remoteController.onInputBindingsChanged(players)`

Hook called when input bindings change: remembers which player each virtual device is assigned to (key 'vinput<instance>'), or forgets it if the player is negative.

- `players` (*table<string, integer>*) : Device name -> player index.

## Fields

| Field | Type | Description |
|---|---|---|
| `onFirstUpdate` | nil | Is nil: reference to a variable not defined in the file. ⚠ reference `onFirstUpdate` not defined in the file (probably nil) |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/core/remoteController.lua`.*
