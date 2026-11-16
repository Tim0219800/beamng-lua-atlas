# `luaBinding`

*File: `lua/common/luaBinding.lua` · VM: Common (GE + vehicle) · 276 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("luaBinding")`

Glue Lua for C++ <-> Lua bindings: the __luaBind* functions are the __index / __newindex that the C++ engine places on the metatables of the exposed classes (getters, setters, inheritance). They are called back by the engine (names hard-coded on the C++ side), a modder normally does not need to call them. __finalizeLuaBindings is called by the engine after the classes are registered to optimize the metatables and configure the SimObjects.

## Example

```lua
-- engine-internal usage; nothing to call in a mod
```

## Notes

- DO NOT RENAME: the names __luaBindIndex, __luaBindIndexStatic, __luaBindNewindex, __luaBindNewindexStatic, __finalizeLuaBindings are hard-coded on the C++ side (code comment).
- C++ class metatable convention: [1] = getters table, [2] = setters table, [3] = metatable of the parent class (super); for SimObjects: [4] getStaticDataFieldbyName, [5] getDynDataFieldbyName, [6] setStaticDataFieldbyName, [7] setDynDataFieldbyName. Results found in a parent class are copied into the child metatable (cache).
- For static classes, a getter that is not a function (constant via addConstant()) is returned directly.
- __finalizeLuaBindings only does the SimObject work if luaVMname ~= 'vlua' (outside the vehicle VM): detects the classes whose name starts with 'd' (byte 100) and that have isSubClassOf, flattens their hierarchy and installs the SimObject __index/__newindex (dynamic/static fields accessible as properties, obj.obj = itself).
- Writing to a property that is not found or is read-only does not raise an error: the assignment is silently ignored (commented-out log). Reading an unknown property returns nil.
- testBindings() is an internal unit test (TestNamespace.TestClassA/B): only exists if these test classes are registered.

## Global functions defined here

| Function | Description | Line |
|---|---|---|
| `__finalizeLuaBindings(classes, luaVMname)` | Called by the engine once all the C++ classes are registered in the VM: installs the SimObject accessors (outside the vehicle VM) then optimizes the metatables without a parent (removes __newindex without setters, flattens the getters). | 195 |
| `__luaBindIndex(t, k)` | __index of a C++ class instance: first looks for a metatable field, then a class getter, then walks up the parent class chain (caching). Returns nil if not found. | 6 |
| `__luaBindIndexStatic(t, k)` | __index of classes with static members: like __luaBindIndex but the getters are called without an instance, and a non-function constant is returned as is. | 43 |
| `__luaBindNewindex(t, k, v)` | __newindex of an instance: calls the setter of the class (or of a parent); silently ignores if there is no setter. | 84 |
| `__luaBindNewindexStatic(t, k, v)` | __newindex for static classes: calls the setter without an instance (setFunc(v)). | 112 |
| `testBindings()` | Unit test of the bindings (classes TestNamespace.TestClassA/B): assignments, calls, destruction and garbage collection; prints *** Unittest start *** / *** DONE ***. | 249 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/common/luaBinding.lua`.*
