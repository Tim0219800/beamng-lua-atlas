# `utils_torqueScriptParser`

*File: `lua/common/utils/torqueScriptParser.lua` · VM: Common (GE + vehicle) · 108 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("utils/torqueScriptParser")`

Proof of concept of a parser (PEG parser, via libs/lua-luaepnf/epnf) for TorqueScript files: 'new/singleton/datablock' declarations, properties, functions (body ignored). The file itself states 'not completely functional, far from ready'. Loaded with require('utils/torqueScriptParser').

## Example

```lua
local ts = require('utils/torqueScriptParser')
local ok, ast = ts.parse(readFile('/levels/xxx/main.cs'))
```

## Notes

- The JIT is turned off (jit.off) while loading epnf because lulpeg would try to use VLA indexing, which is not supported.
- parse directly returns the result of pcall: (true, ast) or (false, error message).
- The body of TorqueScript functions is not parsed (balanced braces only).

## Functions

| Function | Description | Line |
|---|---|---|
| `utils_torqueScriptParser.parse(s)` | Parses TorqueScript text with the internal grammar (epnf.parsestring) in a pcall. | 95 |

### Parameter details

#### `utils_torqueScriptParser.parse(s)`

Parses TorqueScript text with the internal grammar (epnf.parsestring) in a pcall.

- `s` (*string*) : TorqueScript text
- **returns**: boolean true if parsing succeeded
- **returns**: table|string Syntax tree on success, error message otherwise

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/common/utils/torqueScriptParser.lua`.*
