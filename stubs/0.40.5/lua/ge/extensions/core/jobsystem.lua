---@meta
-- tim19Atlas stub generated from lua/ge/extensions/core/jobsystem.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- GE extension `core_jobsystem`: mini cooperative task scheduler based on Lua coroutines. A modder puts a long task in it (file scan, heavy computation) to spread it over several frames instead of blocking the game. The job function receives a `job` object with `job.yield()` (yields if the time budget is exceeded) and `job.sleep(seconds)` (pause without blocking the game). All coroutines are resumed once per frame in onUpdate.
--- Access: extension `core_jobsystem`: `extensions.load("core_jobsystem")`, then the global `core_jobsystem`
---@class core_jobsystem
core_jobsystem = {}

--- Removes a job from the list so it is no longer resumed. Does not call its exit callback or onJobDone; the coroutine is abandoned.
---Source: lua/ge/extensions/core/jobsystem.lua:146
---@param jobHandle table Object returned by create.
---@return boolean  true if the job was found and removed.
function core_jobsystem.cancelJob(jobHandle) end

--- Creates and registers a job (coroutine) executed in chunks every frame. The function is called with (job, ...).
---Source: lua/ge/extensions/core/jobsystem.lua:43
---@param fct function Work function, fct(job, ...).
---@param maxdt number|nil Time budget in seconds between two effective yields; default 0.01.
---@param ... any Arguments passed to fct after job.
---@return table  Job object: {yield(), sleep(secs), setExitCallback(fn), running, fct, maxdt}. exitcbl is called with the job when it ends.
function core_jobsystem.create(fct, maxdt, ...) end

--- Searches for files under a folder: direct matches at the root, then native recursive search per first-level subfolder, with a call to yieldFn after each. To be called from a job by passing job.yield.
---Source: lua/ge/extensions/core/jobsystem.lua:161
---@param rootPath string Root folder.
---@param pattern string File pattern (e.g. '*.json').
---@param yieldFn function|nil Called with a debug text after each subfolder; default nop.
---@return string[]  Paths found.
function core_jobsystem.findFilesAsync(rootPath, pattern, yieldFn) end

--- Number of jobs currently running.
---Source: lua/ge/extensions/core/jobsystem.lua:140
---@return integer  Number of jobs.
function core_jobsystem.getRunningJobCount() end

--- Per-frame hook (called with the game's dt): resumes each coroutine, logs errors, removes finished jobs, calls their exitCallback then emits onJobDone.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/jobsystem.lua:102
---@param dtReal number Real-time delta in seconds.
---@param dtSim number Simulation time delta in seconds.
---@param dtRaw number Raw time delta in seconds.
function core_jobsystem.onUpdate(dtReal, dtSim, dtRaw) end

--- Returns a function that launches fct as a job, unless an instance of fct is already running (in which case the call is ignored).
---Source: lua/ge/extensions/core/jobsystem.lua:89
---@param fct function Work function of the job.
---@param maxdt number|nil Budget in seconds, as for create.
---@return function  function(...) that creates the job; returns nothing.
function core_jobsystem.wrap(fct, maxdt) end

