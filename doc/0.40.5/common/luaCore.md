# `luaCore`

*File: `lua/common/luaCore.lua` · VM: Common (GE + vehicle) · 42 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("luaCore")`

Small base module loaded in both VMs, which adds language utilities used everywhere: require_optional, unrequire, rerequire, nop, and LuaJIT additions (table.clear, table.new, global variable ffi). It does not return a table: everything is global.

## Example

```lua
local ok = require_optional('some.module')   -- nil if absent
local m = rerequire('mymodule')              -- forces a reload from disk
table.clear(t)
```

## Notes

- Defines the global `ffi` (= require('ffi') or nil if unavailable).
- If the LuaJIT extensions table.clear / table.new fail to load, pure-Lua replacements are installed (table.new(...) then ignores its arguments and returns {}).
- `nop` is a global empty function used as the default value of hooks (e.g. extensions.onSerialize = nop).

## Global functions defined here

| Function | Description | Line |
|---|---|---|
| `nop()` | Function that does nothing (default value for callbacks). | 41 |
| `require_optional(module)` | Does require(module) in a pcall: returns the module, or nil if loading fails (module absent or error in the module). | 8 |
| `rerequire(module)` | Forces a file reload: clears package.loaded[module] then does require. Logs a warning if the module is falsy after loading. | 21 |
| `unrequire(m)` | Unloads a module: removes package.loaded[m] and the global of the same name. | 15 |

**Globals assigned:** `ffi`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/common/luaCore.lua`.*
