# `jbeamWriter`

*File: `lua/common/jbeamWriter.lua` · VM: Common (GE + vehicle) · 109 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("jbeamWriter")`

Variant of the 'pretty' JSON encoder that only indents (multi-line formatting) down to a certain depth, to write readable jbeam files. It is not merged with the main encoder for performance reasons. A modder uses it to save a Lua table to a .jbeam file.

## Example

```lua
local ok = require('jbeamWriter').writeFile('mods/unpacked/my.jbeam', jbeamTable)
```

## Notes

- writeFile encodes with maxLevel = 2: beyond depth 2, sub-tables are written on one line via the global jsonEncode. Exception: the 'components' key at level 1 is always fully formatted (maxLevel 999).
- Object keys are sorted (tableKeysSorted). Numbers use %.10g; NaN/infinities become 9e999 / -9e999. vec3/quat (cdata) are written {"x":..,"y":..,"z":..[,"w":..]}.
- The file is opened for writing ('w') and overwritten. It depends on game globals: jsonEncode, tableKeysSorted, ffi, log, dumps. The numberPrecision parameter passed to the encoder is a global variable `numberPrecision` (nil unless defined elsewhere), so normally undefined.

## Functions

| Function | Description | Line |
|---|---|---|
| `jbeamWriter.writeFile(filename, obj)` | Writes the table obj to filename in depth-limited pretty JSON format. Returns true on success; if opening fails, logs an error and returns false. | 93 |

### Parameter details

#### `jbeamWriter.writeFile(filename, obj)`

Writes the table obj to filename in depth-limited pretty JSON format. Returns true on success; if opening fails, logs an error and returns false.

- `filename` (*string*) : path of the file to write (overwritten)
- `obj` (*table*) : data to write
- **returns**: boolean success

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/common/jbeamWriter.lua`.*
