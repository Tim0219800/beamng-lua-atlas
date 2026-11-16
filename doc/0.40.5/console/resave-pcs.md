# `resave_pcs`

*File: `lua/console/resave-pcs.lua` · VM: Console · 70 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("resave-pcs")`

Console utility script that reopens and re-saves all vehicle configurations (*.pc) in the vehicles/ folder. For each vehicle, it spawns the object in slot 0, loads each config with partmgmt.loadLocal then saves it with partmgmt.saveLocal. ResaveConfigs() is launched automatically at the end of the file.

## Notes

- The "common", "box" and "bathtub" vehicles are skipped (known to fail on spawn according to the code comment).
- The loadLocal/saveLocal commands are sent by be:queueLuaCommand (vehicle VM); BeamEngine:update(2, 2) is called after each config to execute them.
- The script launches on import: it deletes all objects (BeamEngine:deleteAllObjects) for each vehicle processed.

## Global functions defined here

| Function | Description | Line |
|---|---|---|
| `ResaveConfigs()` | Walks all folders in vehicles/, spawns each vehicle, and reloads then saves each of its .pc configs. Prints progress with io.write and the total number of configs re-saved. | 43 |

## Calls into the engine (C++)

- `BeamEngine:` `deleteAllObjects`, `getSlot`, `spawnObject`, `update`
- `FS:` `closeDirectory`, `fileExists`, `openDirectory`
- `be:` `queueLuaCommand`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/console/resave-pcs.lua`.*
