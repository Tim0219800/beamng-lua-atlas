# `telemetry_hardwareChanges`

*File: `lua/ge/extensions/telemetry/hardwareChanges.lua` · VM: Game Engine (GE) · 79 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `telemetry_hardwareChanges`: `extensions.load("telemetry_hardwareChanges")`, then the global `telemetry_hardwareChanges`

Hardware telemetry utility module (loaded by require): compares two controller snapshots to produce connection/disconnection events, and says which display transitions (window/fullscreen) are tracked. Relies on telemetry/hardwareInput.

## Functions

| Function | Description | Line |
|---|---|---|
| `telemetry_hardwareChanges.connectionChanges(previous, current)` | Compares two snapshots and returns the list of events {...device fields, connected = true\|false}. Connections come first, sorted by name, then disconnections. If the same name changes vidpid or productName, it produces a connection (new device) and a disconnection (old one). | 46 |
| `telemetry_hardwareChanges.controllerSnapshot(controllerInfo)` | Builds a snapshot keyed by device name, limited to the gamepad, joystick, wheel and xinput types (keyboard, mouse, openxr, vinput ignored). Each entry contains device, deviceType, productName, vidpid and forceFeedback; for a wheel, the official English name is looked up via hardwareInput.officialEnglishName. | 15 |
| `telemetry_hardwareChanges.isTrackedDisplayTransition(from, to)` | True only for the direct transitions 'Window' to 'Fullscreen' and 'Fullscreen' to 'Window'. | 69 |

### Parameter details

#### `telemetry_hardwareChanges.connectionChanges(previous, current)`

Compares two snapshots and returns the list of events {...device fields, connected = true|false}. Connections come first, sorted by name, then disconnections. If the same name changes vidpid or productName, it produces a connection (new device) and a disconnection (old one).

- `previous` (*table<string, table>*) : Previous snapshot.
- `current` (*table<string, table>*) : Current snapshot.
- **returns**: table[] Change events.

#### `telemetry_hardwareChanges.controllerSnapshot(controllerInfo)`

Builds a snapshot keyed by device name, limited to the gamepad, joystick, wheel and xinput types (keyboard, mouse, openxr, vinput ignored). Each entry contains device, deviceType, productName, vidpid and forceFeedback; for a wheel, the official English name is looked up via hardwareInput.officialEnglishName.

- `controllerInfo` (*table[]|nil*) : List of controllers (name, type, productName, vidpid, ffbAxes...).
- **returns**: table<string, table> Snapshot per device name.

#### `telemetry_hardwareChanges.isTrackedDisplayTransition(from, to)`

True only for the direct transitions 'Window' to 'Fullscreen' and 'Fullscreen' to 'Window'.

- `from` (*string*) : Old display mode.
- `to` (*string*) : New display mode.
- **returns**: boolean true if the transition is tracked.

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/telemetry/hardwareChanges.lua`.*
