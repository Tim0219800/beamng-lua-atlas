---@meta
-- tim19Atlas stub generated from lua/ge/extensions/util/resaveMaterials.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Migration tool for developers: loads old TorqueScript material files (materials.cs), then resaves them in the new (JSON) format via a PersistenceManager, then deletes the loaded objects. Processing starts as soon as the extension is loaded, in an asynchronous job.
--- Access: extension `util_resaveMaterials`: `extensions.load("util_resaveMaterials")`, then the global `util_resaveMaterials`
---@class util_resaveMaterials
util_resaveMaterials = {}

--- Called on extension load: disables console log categories and creates the work job (yield every second).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/util/resaveMaterials.lua:62
function util_resaveMaterials.onExtensionLoaded() end

--- Job body: for each materials.cs found, runs the script, identifies the objects created from that file, marks them modified, saves them in the new format then deletes them. Logs DONE at the end.
---Source: lua/ge/extensions/util/resaveMaterials.lua:25
---@param job table core_jobsystem job object (not used directly)
function util_resaveMaterials.work(job) end

