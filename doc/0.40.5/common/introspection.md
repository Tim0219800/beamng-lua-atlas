# `introspection`

*File: `lua/common/introspection.lua` · VM: Common (GE + vehicle) · 86 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("introspection")`

Debug tool that walks _G and the standard modules (table, math, string, coroutine, os, io, debug, package) to list the functions of the classes exposed by the engine (tables with a ___type field of the form class<...> or static_class<...>). Used from the console: require('introspection').gather_methods().

## Example

```lua
local m = require('introspection').gather_methods()
for _, e in ipairs(m) do print(e.class_name, e.method_name, e.is_static) end
```

## Notes

- The global 'extensions' is explicitly ignored.
- Keys starting with '__' are ignored.
- signature is "name (what)" where what comes from debug.getinfo(f, 'S') (Lua, C, main).

## Functions

| Function | Description | Line |
|---|---|---|
| `introspection.gather_methods()` | Builds and returns the list of methods of all exposed C++/Lua classes (and standard modules), with class name, method name, signature and static flag. | 10 |

### Parameter details

#### `introspection.gather_methods()`

Builds and returns the list of methods of all exposed C++/Lua classes (and standard modules), with class name, method name, signature and static flag.

- **returns**: table[] Array of entries {class_name=string, method_name=string, signature=string, is_static=boolean}.

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/common/introspection.lua`.*
