# `libs_inspect_inspect`

*File: `lua/common/libs/inspect/inspect.lua` · VM: Common (GE + vehicle) · 330 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("libs/inspect/inspect")`

inspect.lua 3.1.0: third-party library (Enrique García Cota, MIT license) that turns any Lua value into a readable string: sorted tables, indentation, circular references marked by <id>, metatables displayed. The module is callable: inspect(t, options). Handy for debugging.

## Example

```lua
local inspect = require("libs/inspect/inspect")
print(inspect({1, 2, a = {b = true}}, {depth = 2}))
```

## Notes

- Options of inspect.inspect: depth (max depth, unlimited by default), newline (default "\n"), indent (default two spaces), process (function process(item, path) applied recursively before display).
- Functions, userdata and threads are displayed in the form <type id>.
- The KEY and METATABLE fields are internal markers used in process (inferred from code).
- `i` is listed as an assigned global by the automatic extractor; in practice it is a local loop variable of the file (to be checked, not essential).

## Functions

| Function | Description | Line |
|---|---|---|
| `libs_inspect_inspect.inspect(root, options)` | Returns a textual representation of root. Can also be called directly: inspect(root, options). | 298 |

### Parameter details

#### `libs_inspect_inspect.inspect(root, options)`

Returns a textual representation of root. Can also be called directly: inspect(root, options).

- `root` (*any*) : Value to display
- `options` (*table|nil*) : {depth, newline, indent, process}
- **returns**: string Formatted text

## Fields

| Field | Type | Description |
|---|---|---|
| `KEY` | any | Key marker used in the path passed to options.process. |
| `METATABLE` | any | Metatable marker used in the path passed to options.process. |

## Class `Inspector`

Internal object that accumulates text in a buffer while walking the value.

| Method | Description | Line |
|---|---|---|
| `Inspector:alreadyVisited(v)` | Tells whether the value already has an identifier (table already encountered). | 208 |
| `Inspector:down(f)` | Runs f one level deeper (increments then decrements the level). | 198 |
| `Inspector:getId(v)` | Returns the numeric identifier of the value, according to its type, creating it if needed. | 212 |
| `Inspector:putKey(k)` | Writes a table key: raw identifier or [key] in brackets. | 223 |
| `Inspector:putTable(t)` | Writes a table: sequential and non-sequential parts, metatable, depth limit, repeated references. | 230 |
| `Inspector:putValue(v)` | Writes a value according to its type (escaped string, number, boolean, table, or <type id>). | 281 |
| `Inspector:puts(...)` | Appends pieces of text to the buffer. | 188 |
| `Inspector:tabify()` | Appends a line break followed by the indentation of the current level. | 204 |

**Globals assigned:** `i`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/common/libs/inspect/inspect.lua`.*
