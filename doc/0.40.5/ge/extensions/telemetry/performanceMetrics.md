# `telemetry_performanceMetrics`

*File: `lua/ge/extensions/telemetry/performanceMetrics.lua` · VM: Game Engine (GE) · 33 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `telemetry_performanceMetrics`: `extensions.load("telemetry_performanceMetrics")`, then the global `telemetry_performanceMetrics`

Small utility module (loaded by require) of performance telemetry: safe reading of VariableRegistry variables, the program's focus state and the cause of an FPS cap chosen by the player.

## Functions

| Function | Description | Line |
|---|---|---|
| `telemetry_performanceMetrics.getLimitedBy()` | Says which player-chosen FPS cap applies: 'background' (limit in the background without focus), 'vr' (OpenXR session), 'limiter' (fpsLimitEnabled), 'vsync', otherwise nil. Used to avoid mistaking an FPS locked at 60 for a machine unable to do better. | 23 |
| `telemetry_performanceMetrics.isFocused()` | Indicates whether the game window has focus (true if Engine.isProgramFocused does not exist). | 17 |
| `telemetry_performanceMetrics.readAvailable(name)` | Like readNumber but returns nil instead of -1 (value unavailable). | 12 |
| `telemetry_performanceMetrics.readNumber(name)` | Reads a VariableRegistry variable as a number; returns -1 if it is absent, non-numeric, NaN or infinite. | 7 |

### Parameter details

#### `telemetry_performanceMetrics.getLimitedBy()`

Says which player-chosen FPS cap applies: 'background' (limit in the background without focus), 'vr' (OpenXR session), 'limiter' (fpsLimitEnabled), 'vsync', otherwise nil. Used to avoid mistaking an FPS locked at 60 for a machine unable to do better.

- **returns**: string|nil 'background', 'vr', 'limiter', 'vsync' or nil.

#### `telemetry_performanceMetrics.isFocused()`

Indicates whether the game window has focus (true if Engine.isProgramFocused does not exist).

- **returns**: boolean true if the program has focus.

#### `telemetry_performanceMetrics.readAvailable(name)`

Like readNumber but returns nil instead of -1 (value unavailable).

- `name` (*string*) : Variable name.
- **returns**: number|nil Value >= 0, or nil.

#### `telemetry_performanceMetrics.readNumber(name)`

Reads a VariableRegistry variable as a number; returns -1 if it is absent, non-numeric, NaN or infinite.

- `name` (*string*) : Variable name (e.g. '$fps::avg').
- **returns**: number Value, or -1.

## Calls into the engine (C++)

- `Engine.` `isProgramFocused`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/telemetry/performanceMetrics.lua`.*
