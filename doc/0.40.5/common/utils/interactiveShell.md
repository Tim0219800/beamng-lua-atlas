# `utils_interactiveShell`

*File: `lua/common/utils/interactiveShell.lua` · VM: Common (GE + vehicle) · 112 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("utils/interactiveShell")`

Interactive Lua console (REPL) for the console executable (console.x64.exe): require('utils/interactiveShell').start() reads lines from standard input and executes them. Used for development and testing outside the UI; a modder does not normally use it in the normal game. Also defines helper globals.

## Example

```lua
require('utils/interactiveShell').start()
```

## Notes

- Defines the GLOBALS spawnObjects (alias sp), updateOnce, updateLoop (alias ul).
- Special commands in the shell: help, tracktime (times each command), unittests / ut, reload (reloadLua()), testenv, exit/quit/Ctrl-D (character 4).
- spawnObjects deletes ALL objects (BeamEngine:deleteAllObjects()) before recreating n objects 'vehicles/<v>' (pickup by default), spaced in y by 3*n. It warns if the number of slots does not match.
- updateOnce and updateLoop call BeamEngine:update(1/2000, 1/2000); updateOnce ignores its parameter n; updateLoop runs n+1 iterations (loop from 0 to n).
- The 'unittests' command references lua/tests/unittests, which may not exist in the shipped version (inferred from code).

## Functions

| Function | Description | Line |
|---|---|---|
| `utils_interactiveShell.start()` | Blocking loop: shows the '> ' prompt, reads a line, handles the shortcuts then executes the line with loadstring/xpcall and prints the result or the error with trace. Exits on end of input, 'exit', 'quit' or Ctrl-D. Calls updateLuaCore() each iteration if it exists (cleanup and GC). | 66 |

## Global functions defined here

| Function | Description | Line |
|---|---|---|
| `spawnObjects(n, v)` | Helper GLOBAL (alias sp): deletes all objects then spawns n vehicles. | 12 |
| `updateLoop(n)` | Helper GLOBAL (alias ul): n+1 updates of the simulation engine at 1/2000 s. | 31 |
| `updateOnce(n)` | Helper GLOBAL: one update of the simulation engine (BeamEngine:update(1/2000, 1/2000)). | 27 |

**Globals assigned:** `sp`, `ul`

## Calls into the engine (C++)

- `BeamEngine:` `deleteAllObjects`, `getSlotCount`, `spawnObject`, `update`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/common/utils/interactiveShell.lua`.*
