# `util_worker`

*File: `lua/ge/extensions/util/worker.lua` · VM: Game Engine (GE) · 161 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `util_worker`: `extensions.load("util_worker")`, then the global `util_worker`

Offline task runner: reads a JSON file `/work.json` containing a list of work items ({type=..., ...}) and runs them one by one (compiling .dae meshes into .cdae, compiling imposters, rendering vehicle previews, testing mods, performance measurements, ESC calibration), then quits the game with `shutdown(0)` when no job is running anymore. Intended for automated launches (command line), not for normal gameplay.

## Example

```lua
-- game command line: -lua extensions.load('util_worker') -console -nouserpath
```

## Notes

- The work starts only after 120 render frames (frame counter in onPreRender).
- Recognized task types: compileMesh, testImage, compileImposters, testMod, renderVehiclePreview, testVehiclesPerformances, calibrateESC. An unknown or missing type is logged as an error.
- The extension sets itself to manual unload mode (setExtensionUnloadMode(M, 'manual')).
- Bug: in loadWork, if /work.json is unreadable, workItems is nil and `#workItems` then causes a Lua error.
- The file also contains local functions (loadMaterialsInPath, compileDae) that are not exported: compileDae calls compileCollada then Engine.Render.updateImposters(false).

## Functions

| Function | Description | Line |
|---|---|---|
| `util_worker.onExtensionLoaded()` | Sets the extension to manual unload, loads the extensions test/renderVehiclePreview, util/saveDynamicData, util/calibrateESC and util/compileImposters, then reads the task file. *(internal)* *(hook)* | 115 |
| `util_worker.onJobDone(job, totalRunning)` | Hook called when a job of the job system finishes: if the tasks have already been queued and no job remains, quits the game (shutdown(0)). *(internal)* *(hook)* | 97 |
| `util_worker.onPreRender(dt)` | After 120 frames, runs all the work items via the N table, then, when core_jobsystem has no running job left, stops the game. *(internal)* *(hook)* | 126 |

### Parameter details

#### `util_worker.onJobDone(job, totalRunning)`

Hook called when a job of the job system finishes: if the tasks have already been queued and no job remains, quits the game (shutdown(0)).

- `job` (*any*) : finished job (unused)
- `totalRunning` (*integer*) : number of jobs still running

#### `util_worker.onPreRender(dt)`

After 120 frames, runs all the work items via the N table, then, when core_jobsystem has no running job left, stops the game.

- `dt` (*number*) : elapsed time (unused)

## Class `N`

Table of task handlers, keyed by the `type` field of a work.json item. Each method receives the item `w` (JSON table).

| Method | Description | Line |
|---|---|---|
| `N.calibrateESC(w)` | Launches util_calibrateESC.work(w.pcFile, w.vehicle) to calibrate the ESC. | 91 |
| `N.compileImposters(w)` | Queues the compilation of the imposters of the levels w.levels via util_compileImposters. | 70 |
| `N.compileMesh(w)` | Loads the materials from the folder of w.filename, then compiles this .dae file into .cdae (with a *meshes.json file). Error if w.filename is missing. | 50 |
| `N.renderVehiclePreview(w)` | Prints w.vehicles to the log then launches test_renderVehiclePreview.renderVehiclePreview. | 80 |
| `N.testImage(w)` | Checks that w.filename exists; the actual test is not implemented (TODO in the code). | 60 |
| `N.testMod(w)` | Calls extensions.test_testMods.work with w.tagid, w.resource_version_id and w.disableSpinScr. | 76 |
| `N.testVehiclesPerformances(w)` | Launches util_saveDynamicData.work(w.pcFile, w.vehicle) to measure vehicle performance. | 85 |

## Calls into the engine (C++)

- `FS:` `fileExists`, `findFiles`
- `TorqueScriptLua.` `exec`

**Loads extensions:** `test/renderVehiclePreview`, `util/calibrateESC`, `util/compileImposters`, `util/saveDynamicData`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/util/worker.lua`.*
