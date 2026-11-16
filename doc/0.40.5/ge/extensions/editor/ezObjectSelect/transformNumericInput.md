# `editor_ezObjectSelect_transformNumericInput`

*File: `lua/ge/extensions/editor/ezObjectSelect/transformNumericInput.lua` · VM: Game Engine (GE) · 85 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_ezObjectSelect_transformNumericInput`: `extensions.load("editor_ezObjectSelect_transformNumericInput")`, then the global `editor_ezObjectSelect_transformNumericInput`

Small keyboard numeric input buffer for the transform operations of Easy Object Select (as in Blender: typing "2.5" during a move). Reads digit keys (top row and numpad), decimal point/comma, minus (flips the sign) and backspace via ImGui, and maintains a string in a state {text, active}.

## Example

```lua
local ni = require("editor/ezObjectSelect/transformNumericInput")
local st = ni.newState()
ni.update(st)          -- every frame
local v = ni.value(st) -- nil as long as nothing valid is entered
```

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_ezObjectSelect_transformNumericInput.clear(state)` | Clears the text and deactivates the input. | 30 |
| `editor_ezObjectSelect_transformNumericInput.newState()` | Creates an empty input state. | 26 |
| `editor_ezObjectSelect_transformNumericInput.update(state, ignoreTopRowFour)` | Processes the keys pressed this frame: digits, a single decimal point (prefixed with a 0 if the text is empty or "-"), minus that toggles the sign, backspace. | 40 |
| `editor_ezObjectSelect_transformNumericInput.value(state)` | Converts the entered text to a number. | 77 |

### Parameter details

#### `editor_ezObjectSelect_transformNumericInput.clear(state)`

Clears the text and deactivates the input.

- `state` (*table*) : State created by newState.

#### `editor_ezObjectSelect_transformNumericInput.newState()`

Creates an empty input state.

- **returns**: table {text = "", active = false}.

#### `editor_ezObjectSelect_transformNumericInput.update(state, ignoreTopRowFour)`

Processes the keys pressed this frame: digits, a single decimal point (prefixed with a 0 if the text is empty or "-"), minus that toggles the sign, backspace.

- `state` (*table*) : Input state, modified in place.
- `ignoreTopRowFour` (*boolean|nil*) : If true, ignores the top row key 4 for this frame (useful when it is used for something else).
- **returns**: boolean true if the text changed.

#### `editor_ezObjectSelect_transformNumericInput.value(state)`

Converts the entered text to a number.

- `state` (*table*) : Input state.
- **returns**: number|nil Value, or nil if inactive, empty, "-" or ".".

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/ezObjectSelect/transformNumericInput.lua`.*
