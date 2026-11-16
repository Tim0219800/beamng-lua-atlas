# `bullettime`

*File: `lua/vehicle/bullettime.lua` · VM: Vehicle · 53 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** global `bullettime`

Old slow-motion (bullet time) API on the vehicle side, kept for mod compatibility. It only relays to `simTimeAuthority` in the game engine (GE Lua). Deprecated functions show an error toast in the UI and log a trace; use `get`, `set` or `selectPreset`.

## Example

```lua
local scale = bullettime.get() -- current time scale
bullettime.set(0.5)             -- half speed
```

## Notes

- The old field `bullettime.simulationSpeed` is still read via a metatable: it returns `get() * 100` and logs a deprecation error (only once).
- `set(v)` sends the value `1/v` to simTimeAuthority: v is therefore a speed factor (0.5 = half as fast); v = 0 would give a division by zero (inf).
- `update`, `reset` and `slowMotion` are all the same `deprecated` function; `requestValue` also calls deprecated then forwards the request.

## Functions

| Function | Description | Line |
|---|---|---|
| `bullettime.get()` | Returns the current simulation time scale (`obj:getSimulationTimeScale()`). | 13 |
| `bullettime.requestValue()` | Deprecated: shows the warning then calls `simTimeAuthority.requestValue()` on the GE side. | 25 |
| `bullettime.reset()` | Deprecated (same function as update): error toast and trace. | 8 |
| `bullettime.selectPreset(v)` | Asks `simTimeAuthority.selectPreset` (GE side) to choose a speed preset. | 21 |
| `bullettime.set(v)` | Asks the game engine to change the simulation speed, by running `simTimeAuthority.set(1/v)` on the GE side. | 17 |
| `bullettime.slowMotion()` | Deprecated (same function as update): error toast and trace. | 8 |
| `bullettime.update()` | Deprecated: shows an error toast "Deprecated API: bullettime" and logs a trace. | 8 |

### Parameter details

#### `bullettime.get()`

Returns the current simulation time scale (`obj:getSimulationTimeScale()`).

- **returns**: number Time scale (1 = real time).

#### `bullettime.selectPreset(v)`

Asks `simTimeAuthority.selectPreset` (GE side) to choose a speed preset.

- `v` (*any*) : Preset, serialized by dumps (inferred from code).

#### `bullettime.set(v)`

Asks the game engine to change the simulation speed, by running `simTimeAuthority.set(1/v)` on the GE side.

- `v` (*number*) : Desired speed factor (inferred from code: the value sent is 1/v).

**UI events (guihooks.trigger):** `toastrMsg`

## Calls into the engine (C++)

- `obj:` `getSimulationTimeScale`, `queueGameEngineLua`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/vehicle/bullettime.lua`.*
