# `test_dyncol`

*File: `lua/console/test_dyncol.lua` · VM: Console · 26 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("test_dyncol")`

Console test script for dynamic collisions: deletes all objects, spawns a pickup at (0, 0, 0.1) then runs test(5000), i.e. 5001 steps of BeamEngine:update(1/2000, 1/2000). The additional spawns (hatch, second pickup) are commented out.

## Notes

- Defines the global v. The timing in test() is commented out (and contains a mistake: hp:stop().-" ms").

## Global functions defined here

| Function | Description | Line |
|---|---|---|
| `test(n)` | Runs n+1 simulation steps of 0.5 ms (BeamEngine:update(1/2000, 1/2000)). | 15 |

**Globals assigned:** `v`

## Calls into the engine (C++)

- `BeamEngine:` `deleteAllObjects`, `update`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/console/test_dyncol.lua`.*
