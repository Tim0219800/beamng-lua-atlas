# `json`

*File: `lua/common/json.lua` · VM: Common (GE + vehicle) · 38 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** global `json`

Thin wrapper around LuaJIT's string.buffer to read and write JSON/SJSON (https://github.com/Autodesk/sjson). `json.decode` reads text or a buffer; `json.encode` is directly buffer.jsonencode. The old pure-Lua SJSON parser was moved to ljson.lua.

## Example

```lua
local t = json.decode('{"a": 1, "b": [1,2,3]}')
local s = json.encode(t)
```

## Notes

- decode(nil) returns nil. The code avoids buffer.jsondecode directly because it would raise an error if the buffer is not entirely consumed; it uses a shared module buffer (_buf), so decode is not reentrant (not a problem outside coroutines).
- M.encode is LuaJIT's buffer.jsonencode: automatic extraction flags it as a field of unknown type; it is indeed a function.

## Functions

| Function | Description | Line |
|---|---|---|
| `json.decode(si)` | Decodes JSON/SJSON. Accepts a string or a string.buffer object (which must have a jsondecode method). Returns nil if the argument is nil. | 25 |

### Parameter details

#### `json.decode(si)`

Decodes JSON/SJSON. Accepts a string or a string.buffer object (which must have a jsondecode method). Returns nil if the argument is nil.

- `si` (*string|table|nil*) : JSON text or string.buffer
- **returns**: any decoded Lua value (table, number, string, boolean...); error raised if the JSON is invalid (string.buffer behavior)

## Fields

| Field | Type | Description |
|---|---|---|
| `encode` | function | string.buffer.jsonencode: serializes a Lua value (table, number, string, boolean) to JSON text. |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/common/json.lua`.*
