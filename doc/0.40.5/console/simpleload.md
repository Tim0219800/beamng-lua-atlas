# `simpleload`

*File: `lua/console/simpleload.lua` · VM: Console · 7 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("simpleload")`

Console test script: it deletes all objects (BeamEngine:deleteAllObjects) then spawns the vehicle vehicles/pickup at the origin (BeamEngine:spawnObject(1, ..., nil, vec3(0,0,0))). Nothing is exported.

## Calls into the engine (C++)

- `BeamEngine:` `deleteAllObjects`, `spawnObject`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/console/simpleload.lua`.*
