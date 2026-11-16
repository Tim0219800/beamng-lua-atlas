# `utils_filterchain`

*File: `lua/common/utils/filterchain.lua` · VM: Common (GE + vehicle) · 272 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("utils/filterchain")`

Proof of concept of a functional 'filter chain': a chain is described by text strings like 'smooth(2)' or 'interval(0.1, 0.1)' that are compiled (load) into an update function chaining the filters. The filters are in the local table F (smooth, interval, scale, digitize, floor, clamp, examine, startdelay); each filter is an object with a get(self, dt, ...) method. Loaded with require('utils/filterchain') but only the test function is exported: the newFilterchain factory is local and inaccessible. The file also defines two debug globals (locals, getVarByName).

## Example

```lua
-- Filters can only be manipulated directly from this file (F is local).
-- Example idea: chain {'smooth(2)', 'clamp(0,1)'}, called with update(dt, value).
```

## Notes

- Only M.test is exported; newFilterchain, F and the Smooth/Interval/Startdelay classes are local to the file (the index .md lists them but they are not accessible from outside).
- The index page states Smooth:get(sample) and Startdelay:get(sample): in reality the signature is get(self, dt, sample).
- Convention: the first argument of each filter is dt (commonFilterArguments = {'dt'} by default); the filtered value follows.
- newFilterchain composes the filters from the end to the start (the last one in the list is called first on the input, based on how the chain s is built) and print()s the generated code.
- Filters are created via load('return '..text, nil, 't', F): the environment is F, so only the names in F can be used in the strings.
- Inconsistency: Interval:get returns a table {dt, ...} instead of a value.

## Functions

| Function | Description | Line |
|---|---|---|
| `utils_filterchain.test()` | Usage example: creates a chain with the filter 'interval(0.1, 0.1)' in debug mode (examine) and calls update 30 times with dt = 0.02, printing the output via dump. *(internal)* | 234 |

## Class `F`

Local table of filter factories (not exported). Each function returns a filter object with get(self, dt, ...).

| Method | Description | Line |
|---|---|---|
| `F.clamp(minval, maxval)` | Filter that clamps the value between minval and maxval. | 123 |
| `F.digitize(threshold)` | Filter that returns 1 if the value exceeds the threshold, otherwise 0. | 108 |
| `F.examine(str, commonArgumentsCount)` | Debug filter: logs (level D, origin filterchain.examine) the text str followed by the arguments, and returns the arguments starting from commonArgumentsCount+1 (removes common arguments like dt). | 145 |
| `F.floor()` | Filter that returns math.floor(value). | 117 |
| `F.interval(offsetTime, timeOn, timeOff)` | Builds a blinking filter (Interval): alternates between active and inactive states. | 67 |
| `F.scale(scaleVal)` | Filter that multiplies the value by scaleVal. | 102 |
| `F.smooth(rate)` | Builds a rate-limited smoothing filter (Smooth). | 44 |
| `F.startdelay(startdelay)` | Builds a filter (Startdelay) that delays a rise in value: as long as the input has been rising for less than startdelay seconds, the output stays at the old value. | 158 |

## Class `Interval`

Object returned by F.interval: alternates an active state (onTime) and an inactive state (offTime).

| Method | Description | Line |
|---|---|---|
| `Interval:get(dt, ...)` | Advances the internal timer by dt. When the state is active, returns {dt, ...} (arguments unchanged), otherwise {dt, 0, 0, ...} (as many zeros as arguments). | 79 |

## Class `Smooth`

Object returned by F.smooth: moves its state toward the sample at maximum rate `rate` (units per second).

| Method | Description | Line |
|---|---|---|
| `Smooth:get(dt, sample)` | Advances the state toward sample by at most dt*rate and returns it. On the first call the state is initialized to sample. | 52 |

## Class `Startdelay`

Object returned by F.startdelay.

| Method | Description | Line |
|---|---|---|
| `Startdelay:get(dt, sample)` | If the sample does not exceed the previous value, stores it and returns it. If it exceeds it, returns the old value as long as the accumulated rise time is below startdelay, then the sample. | 167 |

## Global functions defined here

| Function | Description | Line |
|---|---|---|
| `getVarByName(name, scope)` | Debug GLOBAL: finds a variable from a dotted name (e.g. 'mv.foo') in a scope (default _G). The pattern used ('([^.]*).(.*)') only splits into two pieces at the first separator; works for names with one or two levels (inferred from code). | 37 |
| `locals()` | Debug GLOBAL: returns a table {localName = value} of the local variables of the calling function (debug.getlocal at level 2). | 22 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/common/utils/filterchain.lua`.*
