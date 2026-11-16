# `jsonPrettyEncoderCustom`

*File: `lua/common/jsonPrettyEncoderCustom.lua` · VM: Common (GE + vehicle) · 149 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("jsonPrettyEncoderCustom")`

Customizable 'pretty' JSON encoder: sorts keys by weight (tableWeights), and lets a callback decide which tables are folded onto a single line and which are indented. Used to write readable configuration files (e.g. controls/bindings files).

## Example

```lua
local exampleTable = {control = 5, bindings = {{1,2}, {4,5,6,7}}}
local function foldingCallback(item, lvl, path)
  return path:sub(1,10) == '/bindings/' and tableSize(item) < 4
end
local tblWeights = {control = 10, bindings = 99} -- 1 = first, 99 = last, default 50
local json = require('jsonPrettyEncoderCustom').encode(exampleTable, nil, nil, tblWeights, foldingCallback)
```

## Notes

- Without foldingCallback, fold is true: ALL tables are written on a single line ('{"a":1, ...}' / '[1, 2]'). To get indentation, the callback must return false for the table concerned.
- The keys of tableWeights must be LOWERCASE (the code looks up weights[tostring(key):lower()]). Missing key = weight 50. At equal weight, sorting is by type then by value.
- The path passed to the callback has the form '/key/subkey/3' (array indices included); lvl is the depth (1 for the root).
- Arrays are detected by next(v) == 1 and next(v, #v) == nil (sequential array without holes). An empty array is written '{}'. NaN and infinities become 9e999 / -9e999. numberPrecision (if not nil) formats non-integers as %<n>.<n>f (the same integer n serves as width and precision) and integers as %d. vec3/quat (cdata) are written {"x":..,"y":..,"z":..[,"w":..]}. Other types (function, userdata) give null.
- Depends on require('utils') (tableKeys).

## Functions

| Function | Description | Line |
|---|---|---|
| `jsonPrettyEncoderCustom.encode(v, lvl, numberPrecision, tableWeights, foldingCallback, _levelPath)` | Encodes v to JSON text with keys sorted by weight and folding driven by foldingCallback. The last three arguments are optional; _levelPath is internal (recursion). | 76 |

### Parameter details

#### `jsonPrettyEncoderCustom.encode(v, lvl, numberPrecision, tableWeights, foldingCallback, _levelPath)`

Encodes v to JSON text with keys sorted by weight and folding driven by foldingCallback. The last three arguments are optional; _levelPath is internal (recursion).

- `v` (*any*) : value to encode (nil -> 'null')
- `lvl` (*integer|nil*) : starting indentation level, default 1
- `numberPrecision` (*integer|nil*) : number of decimals for non-integers; nil = %.10g
- `tableWeights` (*table<string, number>|nil*) : key sort weights (lowercase), default 50; a nil value causes an error in the sort because weights is indexed (provide at least {})
- `foldingCallback` (*fun(item: table, lvl: integer, path: string): boolean|nil*) : returns true to fold the table onto one line, false to indent it
- `_levelPath` (*string|nil*) : internal: current path
- **returns**: string JSON text

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/common/jsonPrettyEncoderCustom.lua`.*
