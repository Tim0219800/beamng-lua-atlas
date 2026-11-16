# `util_compileMeshes`

*File: `lua/ge/extensions/util/compileMeshes.lua` · VM: Game Engine (GE) · 249 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `util_compileMeshes`: `extensions.load("util_compileMeshes")`, then the global `util_compileMeshes`

Offline build tool: compiles .dae (Collada) meshes into .cdae (faster loading) for the art/, assets/, vehicles/, levels/, content/ and /core/art/ folders. Each subfolder is processed in isolation (temporary materials and objects in ObjectsTempGroup). A cache in collada_cache/ (key = SHA1 of the .dae) avoids recompiling. At the end, the game exits with an exit code (0 = everything compiled, 1 = missed files). It starts as soon as the extension loads.

## Notes

- Existing .cdae files are reused: delete them first to start from scratch.
- Recognized command line arguments: -compileMeshesNoCache (disables collada_cache), -compileMeshesCustomPaths "a/;b/" (replaces the folder list, separated by ;), -compileMeshesScanPathBaseDirs (also processes files at the root of each base folder), -compileMeshesNoCompileOnlyCheck (does not compile: only checks that the .cdae exist), -compileMeshesNoCheck (skips the final check for missed files).
- Paths ignored for the final check: starting with /DevTools/ or /projects/.
- Writes cdae_compilation_hardlink_todo.json: list of {cacheName.cdae, destination} pairs to hard-link after compilation.
- An empty .dae file is considered already covered in -compileMeshesNoCompileOnlyCheck mode.
- Minor bug: the final summary divides by (cacheHits + cacheMisses); without cache (-compileMeshesNoCache) this total is zero and the displayed percentage is undefined (floating-point division by zero).
- The extension runs in a job (core_jobsystem.create(work, 1)) that yields at each file.

## Functions

| Function | Description | Line |
|---|---|---|
| `util_compileMeshes.onExtensionLoaded()` | Load hook: creates the work job (core_jobsystem.create(work, 1)). *(internal)* *(hook)* | 238 |
| `util_compileMeshes.work(job)` | Main compilation loop, run as a job: finds all .dae files, compiles or fetches from the cache, writes the hard-link list, checks for missed files, then calls shutdown(code). *(internal)* | 51 |

### Parameter details

#### `util_compileMeshes.work(job)`

Main compilation loop, run as a job: finds all .dae files, compiles or fetches from the cache, writes the hard-link list, checks for missed files, then calls shutdown(code).

- `job` (*table*) : core_jobsystem job (job.yield is called at each file).

## Calls into the engine (C++)

- `Engine.` `getStartingArgs`, `requestShutdown`
- `FS:` `copyFile`, `directoryCreate`, `directoryExists`, `fileExists`, `fileSize`, `findFiles`, `hashFileSHA1`
- `TorqueScriptLua.` `exec`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/util/compileMeshes.lua`.*
