# `main`

*File: `lua/console/main.lua` · VM: Console · 18 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("main")`

Entry point of the "Console" Lua VM (used for command-line tools, outside the game). It sets package.path/cpath, loads extensions (paths lua/ge/extensions/ and lua/common/extensions/), then luaCore, common/cdefs, utils and mathlib. It defines no function.

## Notes

- Defines the global Engine as a fake object: Engine.Profiler.pushEvent and popEvent are nops, so that shared code that calls the profiler works in the console.
- package.cpath is emptied: no native library can be loaded from this VM.

**Globals assigned:** `Engine`, `extensions`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/console/main.lua`.*
