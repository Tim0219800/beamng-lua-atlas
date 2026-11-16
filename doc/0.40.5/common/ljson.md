# `ljson`

*File: `lua/common/ljson.lua` · VM: Common (GE + vehicle) · 363 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("ljson")`

Old SJSON parser written in pure Lua (Lua 5.1), kept when json.lua switched to LuaJIT's string.buffer. It decodes Autodesk's SJSON format (extended JSON) used by jbeam and configuration files. Rarely useful to a modder (prefer json.decode, which is faster), but it tolerates the same extensions and produces errors with line numbers.

## Example

```lua
local t = require('ljson').decode(readFile('mon.sjson'))
```

## Notes

- Accepted SJSON extensions: // and /* */ comments (nested /* comments are an error), commas treated as whitespace (hence optional), unquoted keys (characters [A-Za-z0-9_]), key separator ':' or '=', root dictionary without braces (sequence of key:value), values Infinity and 1#INF00 (-> math.huge).
- String escapes recognized after '\': t n f r b " \ and, surprisingly in the code, a line break (-> '\n'), the digit 9 (-> tab) and the digit 0 (-> CR). Other '\x' leave the backslash as is.
- During decoding, the garbage collector is stopped (collectgarbage('stop')) then restarted; a syntax error raises error() with 'message near line N, <line text>'. The module state (source string) is global to the module: decode is not reentrant.
- In ljson, duplicate keys are not reported (the last one wins); jsonDebug.lua is the same base with duplicate warnings.
- Numbers are read by hand (integer part, fractional part by multiplication by 0.1: no perfect binary exactness for decimals; exponents use tonumber).

## Functions

| Function | Description | Line |
|---|---|---|
| `ljson.decode(si)` | Decodes SJSON/JSON text into a Lua table. Returns nil if si is nil. Raises an error with a line number if the text is invalid. | 233 |

### Parameter details

#### `ljson.decode(si)`

Decodes SJSON/JSON text into a Lua table. Returns nil if si is nil. Raises an error with a line number if the text is invalid.

- `si` (*string|nil*) : SJSON text
- **returns**: table|nil decoded value

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/common/ljson.lua`.*
