# `test`

*File: `lua/console/test.lua` · VM: Console · 57 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("test")`

Main console test file: it loads lua/console/benchphysics and defines two global test functions, loadOneVehicle (pickup spawn) and benchJSON (loading and merging the pickup's .jbeam files). No automatic call, they must be launched by hand.

## Notes

- benchJSON uses globals (directory, dir) for lack of local.
- benchJSON returns nil as soon as a jbeam file cannot be decoded; otherwise returns nothing.

## Global functions defined here

| Function | Description | Line |
|---|---|---|
| `benchJSON()` | Lists the .jbeam files (excluding .jbeamc) of vehicles/pickup, reads them, decodes them with json.decode and merges the parts with tableMerge. Logs the number of parts of each file. | 18 |
| `loadOneVehicle()` | Deletes all objects then spawns vehicles/pickup at the origin. | 13 |

## Calls into the engine (C++)

- `BeamEngine:` `deleteAllObjects`, `spawnObject`
- `FS:` `closeDirectory`, `fileExists`, `openDirectory`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/console/test.lua`.*
