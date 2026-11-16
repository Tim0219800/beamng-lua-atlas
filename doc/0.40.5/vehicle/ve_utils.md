# `ve_utils`

*File: `lua/vehicle/ve_utils.lua` · VM: Vehicle · 293 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("ve_utils")`

Global utilities specific to the vehicle VM, loaded by require("ve_utils"): high-precision timer, conversion of header-style jbeam tables to a list of dictionaries, saving compiled jbeam as text, contrast colors, generation of interpolated curves (Catmull-Rom) and psi -> Pa conversion. The module does not return a useful table M: everything is defined as a global function.

## Example

```lua
local t = HighPerfTimer()
-- ... work ...
local ms = t:stop() -- duration in milliseconds
local curve = createCurve({{0,0},{1000,50},{7000,200}})
local torque = curve[floor(rpm)]
```

## Notes

- The functions are global (no ve_utils. prefix); a `require` is enough to define them.
- HighPerfTimer: os.clockhp() is in seconds, getTime/stop/stopAndReset return milliseconds.
- _HighPerfTimer:getTime() returns the absolute clock in ms (os.clockhp()*1000), not the elapsed time: for the duration, use stop().
- createCurve: the x of the points must be increasing integers (the index of the resulting array is x itself, from floor(x1) to floor(xn)). With returnArray=true and ffi available, returns a C float[?] of size xn+1, 0-based.
- createCurve with 3 or more points uses a Catmull-Rom spline; with 2 points a straight line; with fewer than 2 returns nil.
- PSItoPascal adds 101325: the result is an absolute pressure, not relative.
- getContrastColor/getContrastColorStringRGB cycle over 17 colors (i % 17) of the jetColor palette.
- saveCompiledJBeamRecursive writes a pseudo-JSON (key order not guaranteed because of pairs()) and does not escape the quotes of strings.

## Class `_HighPerfTimer`

Timer returned by HighPerfTimer(). Stores the start time in seconds in self[1].

| Method | Description | Line |
|---|---|---|
| `_HighPerfTimer:getTime()` | Returns the absolute high-precision clock in milliseconds (not the elapsed duration). | 33 |
| `_HighPerfTimer:reset()` | Restarts the timer at the present moment. | 18 |
| `_HighPerfTimer:stop()` | Returns the time elapsed since the start, in milliseconds, without restarting. | 22 |
| `_HighPerfTimer:stopAndReset()` | Returns the elapsed time in milliseconds and restarts the timer. | 26 |

## Global functions defined here

| Function | Description | Line |
|---|---|---|
| `HighPerfTimer()` | Creates a high-precision timer started at the moment of creation (based on os.clockhp). | 14 |
| `PSItoPascal(psi)` | Converts a relative pressure in psi to an absolute pressure in pascals: psi * 6894.757 + 101325. | 290 |
| `createCurve(points, returnArray)` | Builds a dense lookup table from points {x, y}: an array whose index is x (integer) and whose value is the interpolated y. Straight line for 2 points, Catmull-Rom spline for 3 or more. Used for example for engine torque curves. | 265 |
| `getContrastColor(i, a)` | Returns a game color taken from the jet palette according to the index, to distinguish curves or debug elements. | 224 |
| `getContrastColorStringRGB(i)` | Same palette as getContrastColor but returns a CSS hexadecimal string. | 228 |
| `saveCompiledJBeam(data, filename, lvl)` | Saves compiled jbeam data to a text file (opens, writes via saveCompiledJBeamRecursive, closes). Used for debugging. | 211 |
| `saveCompiledJBeamRecursive(f, data, level)` | Recursively writes a data table in JSON-like text format to an open file, with indentation depending on the level and a header comment for each table having a partPath. | 119 |
| `tableFromHeaderTable(entry)` | Converts a jbeam table in the "first row = header, following rows = values" format into a list of dictionaries {column=value}. A row that is a lone dictionary defines common options applied to the following rows; a dictionary placed in the last column merges its options into the row. If a row has an id field, it is renamed name. | 37 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/vehicle/ve_utils.lua`.*
