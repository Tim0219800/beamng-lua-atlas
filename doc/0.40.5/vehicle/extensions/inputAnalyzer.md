# `inputAnalyzer`

*File: `lua/vehicle/extensions/inputAnalyzer.lua` · VM: Vehicle · 147 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `inputAnalyzer`: `extensions.load (vehicle VM)("inputAnalyzer")`, then the global `inputAnalyzer`

Gamepad/keyboard 'code' detector: at 30 Hz it watches the inputs (throttle, brake, steering left/right, clutch, parking brake), builds a string of the last 16 presses and calls a callback when the end of the string matches a registered sequence (8 to 16 characters). Used for easter eggs.

## Example

```lua
-- letters: u throttle, d brake, l left, r right, a clutch, b parking brake
extensions.inputAnalyzer.registerInputString('uuddlrlrab', function(s) print('code!') end)
```

## Notes

- Each new press (transition from false to true above 0.01) appends its letter to the string. The string is truncated by one character when it exceeds 16.
- The inputs read are electrics.values.throttle_input, brake_input, steering_input (l = negative part, r = positive part), clutch_input and parkingbrake_input.
- registerInputString ignores strings shorter than 8 or longer than 16 characters.
- Anomaly: the duplicate test in registerInputString compares `v.string == string` (the string library) instead of `str`: it is never true, so the same code can be registered several times.
- Anomaly: the parameter of unregisterInputString is named `string` and shadows the string library (no consequence here).
- If one of the electrics keys read is nil, abs(nil) raises an error; they are normally initialized by the inputs.

## Functions

| Function | Description | Line |
|---|---|---|
| `inputAnalyzer.onInit()` | Initialization hook; empty. *(internal)* *(hook)* | 136 |
| `inputAnalyzer.onReset()` | Reset hook; empty. *(internal)* *(hook)* | 133 |
| `inputAnalyzer.registerInputString(str, callback)` | Registers a sequence to detect and the callback called with the current string when it is entered. | 91 |
| `inputAnalyzer.unregisterInputString(string, callback)` | Removes a registered sequence (same string and same callback); enables/disables updateGFX depending on whether sequences remain. | 115 |
| `inputAnalyzer.updateGFX(dt)` | Called every frame: runs the input analysis at 30 Hz (no-op when no code is registered after a (un)register). *(internal)* | 83 |

### Parameter details

#### `inputAnalyzer.registerInputString(str, callback)`

Registers a sequence to detect and the callback called with the current string when it is entered.

- `str` (*string*) : Sequence of 8 to 16 letters among u, d, l, r, a, b.
- `callback` (*function*) : function(inputString).

#### `inputAnalyzer.unregisterInputString(string, callback)`

Removes a registered sequence (same string and same callback); enables/disables updateGFX depending on whether sequences remain.

- `string` (*string*) : Registered sequence.
- `callback` (*function*) : Registered callback.

#### `inputAnalyzer.updateGFX(dt)`

Called every frame: runs the input analysis at 30 Hz (no-op when no code is registered after a (un)register).

- `dt` (*number*) : Time step in seconds.

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/vehicle/extensions/inputAnalyzer.lua`.*
