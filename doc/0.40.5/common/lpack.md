# `lpack`

*File: `lua/common/lpack.lua` · VM: Common (GE + vehicle) · 568 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** global `lpack`

Fast serializer/deserializer of Lua values (tables, numbers, strings, booleans, vec3, quat) to compact strings, used to exchange data between VMs (GE <-> vehicle) and for saving. Three formats: proprietary text ('a...~'), binary based on string.buffer ('b...'), and Lua source (encodeLua). decode automatically recognizes text or binary. An array of doubles can also be packed at 8 bytes per value.

## Example

```lua
local s = lpack.encode({a = 1, b = {1, 2, 3}, pos = vec3(1, 2, 3)})
local t = lpack.decode(s)
-- binaire :
local sb = lpack.encodeBin(t)
local t2 = lpack.decode(sb)
```

## Notes

- SECURITY: decodeLua(s) executes loadstring('return ' .. s)(): only call it with trusted data (produced by encodeLua), never with external text.
- decode(is, target): `is` can be a string or a string.buffer. If the data is in binary format ('b'), `target` allows decoding "in place" into an existing table/vec3/quat to avoid allocations (the target table is cleared then filled). For the text format, target is ignored.
- encode(nil) and encodeBin(nil) return ''; decode('') and decode(nil) return nil. The garbage collector is stopped during decode then restarted.
- encodeBinWorkBuffer returns the module's shared INTERNAL string.buffer (bufTmp), not a string: its content is overwritten on the next call of encodeBin/encodeLua/encodeBinWorkBuffer. Consume it immediately.
- encodeDoubleArray(tbl): packs the elements tbl[1..n] (and tbl[0] if it exists) into little-endian doubles; decodeDoubleArray(sda, tbl) does the reverse, filling tbl[1..n] (the input element at index 0 is not restored at index 0 but at 1: shift).
- The text format encodes numbers as 'sign + absolute value' (prefix '-' positive, '=' negative) and infinities/NaN are malformed in the code ('-9e+999' for v >= 0 and '=9e+999' for v < 0): NaNs are therefore decoded as +infinity.

## Functions

| Function | Description | Line |
|---|---|---|
| `lpack.decode(is, target)` | Deserializes a value produced by encode or encodeBin (detects the format from the first character: 'b' = binary). Accepts a string or a string.buffer. | 268 |
| `lpack.decodeDoubleArray(sda, tbl)` | Converts a string of doubles (8 bytes each, little-endian) into a Lua array. Fills tbl if given. | 76 |
| `lpack.decodeLua(s)` | Evaluates a string produced by encodeLua (loadstring('return '..s)()). Dangerous with untrusted data. Returns nil if s is nil. | 91 |
| `lpack.encode(v)` | Serializes v in the compact text format (start 'a', end '~'). Returns '' if v is nil. | 96 |
| `lpack.encodeBin(v)` | Serializes v in binary format (string.buffer encode, prefix 'b') with special types for vec3 and quat. Returns '' if nil. | 105 |
| `lpack.encodeBinWorkBuffer(v)` | Like encodeBin but returns the module's shared work buffer instead of a string (zero copy). The content is overwritten on the next call. | 112 |
| `lpack.encodeDoubleArray(tbl)` | Converts an array of numbers into a binary string of doubles (8 bytes per value, via ffi). | 71 |
| `lpack.encodeLua(v)` | Serializes v as Lua source text (strings with %q, tables with brackets for non-sequential keys) to be read back with decodeLua. | 85 |

### Parameter details

#### `lpack.decode(is, target)`

Deserializes a value produced by encode or encodeBin (detects the format from the first character: 'b' = binary). Accepts a string or a string.buffer.

- `is` (*string|table|nil*) : serialized string or string.buffer
- `target` (*table|vec3|quat|nil*) : object to fill in place (binary format only)
- **returns**: any decoded value, nil if input is empty

#### `lpack.decodeDoubleArray(sda, tbl)`

Converts a string of doubles (8 bytes each, little-endian) into a Lua array. Fills tbl if given.

- `sda` (*string*) : binary string
- `tbl` (*table|nil*) : destination table, new table if nil
- **returns**: number[] decoded values starting at index 1

#### `lpack.decodeLua(s)`

Evaluates a string produced by encodeLua (loadstring('return '..s)()). Dangerous with untrusted data. Returns nil if s is nil.

- `s` (*string|nil*) : Lua source of a value
- **returns**: any value

#### `lpack.encode(v)`

Serializes v in the compact text format (start 'a', end '~'). Returns '' if v is nil.

- `v` (*any*) : Lua value (table, number, string, boolean, vec3, quat)
- **returns**: string serialized string

#### `lpack.encodeBin(v)`

Serializes v in binary format (string.buffer encode, prefix 'b') with special types for vec3 and quat. Returns '' if nil.

- `v` (*any*) : Lua value
- **returns**: string binary string

#### `lpack.encodeBinWorkBuffer(v)`

Like encodeBin but returns the module's shared work buffer instead of a string (zero copy). The content is overwritten on the next call.

- `v` (*any*) : Lua value
- **returns**: string.buffer|string work buffer (or '' if v is nil)

#### `lpack.encodeDoubleArray(tbl)`

Converts an array of numbers into a binary string of doubles (8 bytes per value, via ffi).

- `tbl` (*number[]*) : array of numbers (index 0 included if it exists)
- **returns**: string binary string

#### `lpack.encodeLua(v)`

Serializes v as Lua source text (strings with %q, tables with brackets for non-sequential keys) to be read back with decodeLua.

- `v` (*any*) : Lua value
- **returns**: string Lua source

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/common/lpack.lua`.*
