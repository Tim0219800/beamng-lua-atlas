# `jsonDebug`

*File: `lua/common/jsonDebug.lua` · VM: Common (GE + vehicle) · 388 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("jsonDebug")`

Variant of ljson (pure-Lua SJSON parser) that, in addition to decoding, returns a list of warnings, notably duplicate keys with line number. Used to validate data files (jbeam, config) during development; an extension can pass a context name to label these warnings.

## Example

```lua
local data, warnings = require('jsonDebug').decode(text, 'myFile.jbeam')
for _, w in ipairs(warnings) do log('W', 'x', w) end
```

## Notes

- Same accepted syntax as ljson (SJSON: comments, optional commas, unquoted keys, ':' or '=', root dictionary without braces, Infinity); see ljson.json.
- Warnings have the form "<context>: Duplicate key found: 'key' near line N, '<line>'". The duplicate key overwrites the previous value.
- decode(nil) returns nil and the (empty) warnings list. A syntax error raises error() as in ljson.
- The module replaces table.clear with a function that does not empty the table if the LuaJIT extension is absent (a case that does not occur in normal gameplay).

## Functions

| Function | Description | Line |
|---|---|---|
| `jsonDebug.decode(si, context)` | Decodes SJSON and returns the value with the list of warnings (duplicate keys). | 250 |

### Parameter details

#### `jsonDebug.decode(si, context)`

Decodes SJSON and returns the value with the list of warnings (duplicate keys).

- `si` (*string|nil*) : SJSON text
- `context` (*string|nil*) : label (e.g. file name) prefixed to the warnings
- **returns**: table|nil decoded value
- **returns**: string[] warnings

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/common/jsonDebug.lua`.*
