# `devUtils`

*File: `lua/common/devUtils.lua` · VM: Common (GE + vehicle) · 213 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("devUtils")`

Rarely needed development utilities, defined as global functions: running Lua code with print capture, analysis of a module's upvalues, JSON snapshot of the Lua global state to compare two states, and detection of tables shared in several places of a tree. Mostly useful for debugging table leaks or merges between modules.

## Notes

- The file uses global helpers from other files: tableMerge, tableKeysSorted, tableIsEmpty, deepcopy, flattenTable, jsonWriteFile, writeFile.
- executeLuaSandboxed is not a real sandbox (the code still runs in the file's environment and hidden objects can be reached); only print is redirected.
- Bug: _createGraphviz (local, unused, call commented out in createGlobalSnapshot) references an undefined variable k; it would not work if enabled.
- createGlobalSnapshot calls gui.reset() if available before capturing, to clear temporary caches.

## Global functions defined here

| Function | Description | Line |
|---|---|---|
| `createGlobalSnapshot(filename)` | Writes as JSON a snapshot of the global variables, the modules (contents and locals) and the loaded extensions. Functions and userdata are removed, tables flattened (flattenTable). | 145 |
| `executeLuaSandboxed(cmd, source)` | Compiles then runs the string cmd with xpcall, temporarily replacing print to capture output. On a syntax or runtime error, returns a string starting with 'Error: '. | 10 |
| `getModuleLocals(moduleTbl)` | Returns the local variables (upvalues) used by a module's functions, recursively walking the functions, their upvalues and the metatable. Ignores globals, module fields, the module itself and ___locals. | 89 |
| `tableFindRecursion(tbl)` | Walks tbl and detects sub-tables reached through several paths (shared references or cycles). | 200 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/common/devUtils.lua`.*
