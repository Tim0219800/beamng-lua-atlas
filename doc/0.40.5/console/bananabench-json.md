# `bananabench_json`

*File: `lua/console/bananabench-json.lua` · VM: Console · 22 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("bananabench-json")`

Console VM script: sets stdout to line-buffered mode (so the parent process reads progress live), runs bananabench's bench.physics() then writes the full result as JSON with jsonWriteFile (indented). File name: second command-line argument (`args[2]`), otherwise `bananabench.json`.

## Notes

- Runs on load (no exported function); uses the global `args` provided by the console.

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/console/bananabench-json.lua`.*
