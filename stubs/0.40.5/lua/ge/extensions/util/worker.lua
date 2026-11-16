---@meta
-- tim19Atlas stub generated from lua/ge/extensions/util/worker.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Offline task runner: reads a JSON file `/work.json` containing a list of work items ({type=..., ...}) and runs them one by one (compiling .dae meshes into .cdae, compiling imposters, rendering vehicle previews, testing mods, performance measurements, ESC calibration), then quits the game with `shutdown(0)` when no job is running anymore. Intended for automated launches (command line), not for normal gameplay.
--- Access: extension `util_worker`: `extensions.load("util_worker")`, then the global `util_worker`
---@class util_worker
util_worker = {}

--- Sets the extension to manual unload, loads the extensions test/renderVehiclePreview, util/saveDynamicData, util/calibrateESC and util/compileImposters, then reads the task file.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/util/worker.lua:115
function util_worker.onExtensionLoaded() end

--- Hook called when a job of the job system finishes: if the tasks have already been queued and no job remains, quits the game (shutdown(0)).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/util/worker.lua:97
---@param job any finished job (unused)
---@param totalRunning integer number of jobs still running
function util_worker.onJobDone(job, totalRunning) end

--- After 120 frames, runs all the work items via the N table, then, when core_jobsystem has no running job left, stops the game.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/util/worker.lua:126
---@param dt number elapsed time (unused)
function util_worker.onPreRender(dt) end

--- Table of task handlers, keyed by the `type` field of a work.json item. Each method receives the item `w` (JSON table).
---@class util_worker_N
local util_worker_N = {}

--- Launches util_calibrateESC.work(w.pcFile, w.vehicle) to calibrate the ESC.
---Source: lua/ge/extensions/util/worker.lua:91
---@param w table work item; fields pcFile, vehicle
function util_worker_N.calibrateESC(w) end

--- Queues the compilation of the imposters of the levels w.levels via util_compileImposters.
---Source: lua/ge/extensions/util/worker.lua:70
---@param w table work item; field levels
function util_worker_N.compileImposters(w) end

--- Loads the materials from the folder of w.filename, then compiles this .dae file into .cdae (with a *meshes.json file). Error if w.filename is missing.
---Source: lua/ge/extensions/util/worker.lua:50
---@param w table work item; field filename = path of the .dae
function util_worker_N.compileMesh(w) end

--- Prints w.vehicles to the log then launches test_renderVehiclePreview.renderVehiclePreview.
---Source: lua/ge/extensions/util/worker.lua:80
---@param w table work item; field vehicles
function util_worker_N.renderVehiclePreview(w) end

--- Checks that w.filename exists; the actual test is not implemented (TODO in the code).
---Source: lua/ge/extensions/util/worker.lua:60
---@param w table work item; field filename
function util_worker_N.testImage(w) end

--- Calls extensions.test_testMods.work with w.tagid, w.resource_version_id and w.disableSpinScr.
---Source: lua/ge/extensions/util/worker.lua:76
---@param w table work item; fields tagid, resource_version_id, disableSpinScr
function util_worker_N.testMod(w) end

--- Launches util_saveDynamicData.work(w.pcFile, w.vehicle) to measure vehicle performance.
---Source: lua/ge/extensions/util/worker.lua:85
---@param w table work item; fields pcFile, vehicle
function util_worker_N.testVehiclesPerformances(w) end

