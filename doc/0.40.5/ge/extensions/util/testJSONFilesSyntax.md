# `util_testJSONFilesSyntax`

*File: `lua/ge/extensions/util/testJSONFilesSyntax.lua` · VM: Game Engine (GE) · 33 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `util_testJSONFilesSyntax`: `extensions.load("util_testJSONFilesSyntax")`, then the global `util_testJSONFilesSyntax`

Diagnostic tool: on load, it walks the game's whole virtual file system (root '/') looking for *.jbeam, *.pc and *.json files, then decodes them one by one with the jsonDebug library. Syntax errors and warnings are written to the log. Useful to a modder to find an invalid JSON or jbeam.

## Example

```lua
extensions.load('util/testJSONFilesSyntax')
-- then read the E/W 'jsonDecode' lines in the log
```

## Notes

- Everything happens in onExtensionLoaded, synchronously: the game may freeze for a while, because all the game and mod files are read.
- The decoding result is not kept; only the logs matter.

## Functions

| Function | Description | Line |
|---|---|---|
| `util_testJSONFilesSyntax.onExtensionLoaded()` | Called on extension load. Recursively lists the .jbeam, .pc and .json files, reads them with readFile and decodes them with jsonDebug.decode under xpcall; logs errors (E) and warnings (W) under the tag 'jsonDecode'. *(internal)* *(hook)* | 22 |

## Calls into the engine (C++)

- `FS:` `findFiles`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/util/testJSONFilesSyntax.lua`.*
