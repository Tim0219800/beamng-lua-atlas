---@meta
-- tim19Atlas stub generated from lua/ge/extensions/util/compileMeshes.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Offline build tool: compiles .dae (Collada) meshes into .cdae (faster loading) for the art/, assets/, vehicles/, levels/, content/ and /core/art/ folders. Each subfolder is processed in isolation (temporary materials and objects in ObjectsTempGroup). A cache in collada_cache/ (key = SHA1 of the .dae) avoids recompiling. At the end, the game exits with an exit code (0 = everything compiled, 1 = missed files). It starts as soon as the extension loads.
--- Access: extension `util_compileMeshes`: `extensions.load("util_compileMeshes")`, then the global `util_compileMeshes`
---@class util_compileMeshes
util_compileMeshes = {}

--- Load hook: creates the work job (core_jobsystem.create(work, 1)).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/util/compileMeshes.lua:238
function util_compileMeshes.onExtensionLoaded() end

--- Main compilation loop, run as a job: finds all .dae files, compiles or fetches from the cache, writes the hard-link list, checks for missed files, then calls shutdown(code).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/util/compileMeshes.lua:51
---@param job table core_jobsystem job (job.yield is called at each file).
function util_compileMeshes.work(job) end

