# `gameplay_vehiclePresencePolicy`

*File: `lua/ge/extensions/gameplay/vehiclePresencePolicy.lua` · VM: Game Engine (GE) · 38 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `gameplay_vehiclePresencePolicy`: `extensions.load("gameplay_vehiclePresencePolicy")`, then the global `gameplay_vehiclePresencePolicy`

Pure (stateless) rules describing a player's "presence" relative to a vehicle: driver, passenger or unrestricted. Tells whether an input action map is allowed for a given mode and which unseated mode to use by default. No hook or state: it is used as a library.

## Example

```lua
local policy = require("gameplay/vehiclePresencePolicy")
if policy.allowsActionMap(mode, "driving") then ... end
```

## Notes

- Valid modes: driver, passenger, unrestricted.
- allowsActionMap: unrestricted allows everything; driver only allows the "driving" map; passenger allows nothing.
- The file is loaded with require("gameplay/vehiclePresencePolicy"); the extension name gameplay_vehiclePresencePolicy is not necessarily loaded by extensions.load.

## Functions

| Function | Description | Line |
|---|---|---|
| `gameplay_vehiclePresencePolicy.allowsActionMap(mode, mapKind)` | Indicates whether an action map is allowed for the mode. | 28 |
| `gameplay_vehiclePresencePolicy.defaultUnseatedMode(context)` | Default mode of an unseated player: "unrestricted" in freeroam (or without a mode) when multiseat is not active, "passenger" otherwise. | 21 |
| `gameplay_vehiclePresencePolicy.isValidMode(mode)` | Tests whether a value is a known mode. | 13 |
| `gameplay_vehiclePresencePolicy.normalizeMode(mode, fallback)` | Returns the mode if valid, otherwise the fallback mode if valid, otherwise "passenger". | 17 |

### Parameter details

#### `gameplay_vehiclePresencePolicy.allowsActionMap(mode, mapKind)`

Indicates whether an action map is allowed for the mode.

- `mode` (*string*) : Presence mode.
- `mapKind` (*string*) : Action map type (e.g. "driving", "slot").
- **returns**: boolean 

#### `gameplay_vehiclePresencePolicy.defaultUnseatedMode(context)`

Default mode of an unseated player: "unrestricted" in freeroam (or without a mode) when multiseat is not active, "passenger" otherwise.

- `context` (*table|nil*) : {mode = "freeroam"|"multiplayer"|"career"|..., isMultiseatActive = boolean}
- **returns**: string "unrestricted" or "passenger"

#### `gameplay_vehiclePresencePolicy.isValidMode(mode)`

Tests whether a value is a known mode.

- `mode` (*any*) : Value to test.
- **returns**: boolean true for driver, passenger or unrestricted.

#### `gameplay_vehiclePresencePolicy.normalizeMode(mode, fallback)`

Returns the mode if valid, otherwise the fallback mode if valid, otherwise "passenger".

- `mode` (*any*) : Requested mode.
- `fallback` (*any*) : Optional fallback mode.
- **returns**: string A valid mode.

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/gameplay/vehiclePresencePolicy.lua`.*
