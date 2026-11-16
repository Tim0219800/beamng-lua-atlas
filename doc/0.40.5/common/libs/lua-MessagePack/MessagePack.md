# `libs_lua_MessagePack_MessagePack`

*File: `lua/common/libs/lua-MessagePack/MessagePack.lua` · VM: Common (GE + vehicle) · 592 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("libs/lua-MessagePack/MessagePack")`

lua-MessagePack (François Perrad, MIT license, base version 0.5.1, adapted by BeamNG in 2022): MessagePack binary serialization. This version uses LuaJIT's string.buffer and a shared work buffer; it can also serialize vec3 and quat (cdata). A modder uses it to encode/decode Lua tables into compact binary strings (network exchange, files).

## Example

```lua
local mp = require('libs/lua-MessagePack/MessagePack')
local bin = mp.pack({a = 1, b = {1, 2, 3}})
local data = mp.unpack(bin)
```

## Notes

- All numbers are written as doubles (0xCB), never as compact integers. When reading, MessagePack integers are converted to Lua numbers.
- A Lua string is written as binary (bin8/16/32), not as MessagePack str; when reading, str and bin both become Lua strings.
- Default array mode: 'without_hole' (called at the end of the file): a table is written as an array if its keys are 1..n without holes, otherwise as a map. Change with set_array.
- vec3 are written as a map {x,y,z} and quat as a map {x,y,z,w}; any other cdata is written as the string '?'.
- packWorkBuffer and packPrefixWorkBuffer return the shared internal buffer (bufTmp): its content is overwritten at the next pack call; consume it immediately.
- Unhandled types (function, thread) raise the error "pack '<type>' is unimplemented".
- Extension types (ext): build_ext returns nil by default, so ext values read become nil unless build_ext is replaced.

## Functions

| Function | Description | Line |
|---|---|---|
| `libs_lua_MessagePack_MessagePack.build_ext(tag, data)` | Hook called for each extension value read; the default implementation returns nil. Replace it to decode your extension types. | 457 |
| `libs_lua_MessagePack_MessagePack.pack(data)` | Serializes a Lua value into a MessagePack string. | 255 |
| `libs_lua_MessagePack_MessagePack.packPrefix(prefix, data)` | Serializes data preceded by the string prefix. | 265 |
| `libs_lua_MessagePack_MessagePack.packPrefixWorkBuffer(prefix, data)` | Like packPrefix, but returns the shared work buffer. | 259 |
| `libs_lua_MessagePack_MessagePack.packWorkBuffer(data)` | Like pack, but returns the shared work buffer without converting it to a string (avoids a copy). | 249 |
| `libs_lua_MessagePack_MessagePack.set_array(array)` | Chooses how Lua tables are serialized: 'without_hole' (array if consecutive indices without holes, otherwise map), 'with_hole' (array up to the max index if all keys are positive numbers), 'always_as_map' (always a map). Any other value raises an error. | 130 |
| `libs_lua_MessagePack_MessagePack.unpack(s)` | Deserializes a string containing exactly one MessagePack value. Raises a 'missing bytes' error if it is truncated and 'extra bytes' if bytes remain. | 558 |
| `libs_lua_MessagePack_MessagePack.unpack_cursor(c)` | Decodes the next value from a cursor {s, i, j, underflow}, advancing c.i. | 271 |
| `libs_lua_MessagePack_MessagePack.unpacker(src)` | Returns an iterator that successively decodes several values: from a string (returns the position and the value) or from a function supplying chunks of data (returns true and the value). | 568 |

### Parameter details

#### `libs_lua_MessagePack_MessagePack.build_ext(tag, data)`

Hook called for each extension value read; the default implementation returns nil. Replace it to decode your extension types.

- `tag` (*integer*) : Extension number.
- `data` (*string*) : Extension bytes.
- **returns**: any Value built.

#### `libs_lua_MessagePack_MessagePack.pack(data)`

Serializes a Lua value into a MessagePack string.

- `data` (*any*) : nil, boolean, number, string, table, vec3, quat, string.buffer.
- **returns**: string Binary data.

#### `libs_lua_MessagePack_MessagePack.packPrefix(prefix, data)`

Serializes data preceded by the string prefix.

- `prefix` (*string*) : Bytes to write before the data.
- `data` (*any*) : Value.
- **returns**: string prefix followed by the data.

#### `libs_lua_MessagePack_MessagePack.packPrefixWorkBuffer(prefix, data)`

Like packPrefix, but returns the shared work buffer.

- `prefix` (*string*) : Prefix.
- `data` (*any*) : Value.
- **returns**: userdata Internal string.buffer.

#### `libs_lua_MessagePack_MessagePack.packWorkBuffer(data)`

Like pack, but returns the shared work buffer without converting it to a string (avoids a copy).

- `data` (*any*) : Value to serialize.
- **returns**: userdata Internal string.buffer, reused on each call.

#### `libs_lua_MessagePack_MessagePack.set_array(array)`

Chooses how Lua tables are serialized: 'without_hole' (array if consecutive indices without holes, otherwise map), 'with_hole' (array up to the max index if all keys are positive numbers), 'always_as_map' (always a map). Any other value raises an error.

- `array` (*string*) : 'without_hole', 'with_hole' or 'always_as_map'.

#### `libs_lua_MessagePack_MessagePack.unpack(s)`

Deserializes a string containing exactly one MessagePack value. Raises a 'missing bytes' error if it is truncated and 'extra bytes' if bytes remain.

- `s` (*string*) : Data.
- **returns**: any Decoded value.

#### `libs_lua_MessagePack_MessagePack.unpack_cursor(c)`

Decodes the next value from a cursor {s, i, j, underflow}, advancing c.i.

- `c` (*table*) : Cursor on the source string.
- **returns**: any Decoded value.

#### `libs_lua_MessagePack_MessagePack.unpacker(src)`

Returns an iterator that successively decodes several values: from a string (returns the position and the value) or from a function supplying chunks of data (returns true and the value).

- `src` (*string|function*) : String, or function returning the next chunk (or nil).
- **returns**: function Iterator.

**Globals assigned:** `k`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/common/libs/lua-MessagePack/MessagePack.lua`.*
