# `core_jobsystem`

*File: `lua/ge/extensions/core/jobsystem.lua` · VM: Game Engine (GE) · 204 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `core_jobsystem`: `extensions.load("core_jobsystem")`, then the global `core_jobsystem`

GE extension `core_jobsystem`: mini cooperative task scheduler based on Lua coroutines. A modder puts a long task in it (file scan, heavy computation) to spread it over several frames instead of blocking the game. The job function receives a `job` object with `job.yield()` (yields if the time budget is exceeded) and `job.sleep(seconds)` (pause without blocking the game). All coroutines are resumed once per frame in onUpdate.

## Example

```lua
local function work(job, path)
  for i = 1, 10000 do
    -- ... processing ...
    job.yield()          -- yields if the maxdt budget is exceeded
  end
  job.sleep(3)           -- waits 3 s while letting the game run
end
core_jobsystem.create(work, 1, 'some/path')   -- maxdt = 1 s: good for background work

-- variant that does not launch the same function twice in parallel
local check = core_jobsystem.wrap(work, 0.5)
check('some/path')
```

## Notes

- Unit of maxdt: the file header and the code (dt = hp:stop()/1000 compared to maxdt, default 0.01) indicate SECONDS; the comment of create() says 'milliseconds', which is wrong/misleading. Default 0.01 s.
- job.yield() only interrupts if maxdt has elapsed since the last effective yield; otherwise it does nothing. It cannot interrupt code that does not call it: insert yields in long loops.
- job.yield and job.sleep do nothing outside a coroutine (coroutine.running() == nil).
- The arguments passed to create are given to the function on the first resume: fct(job, ...). Without arguments, fct(job, dtTable) receives a shared table {dtReal, dtSim, dtRaw} as second parameter (updated every frame: read the fields, do not keep it).
- An error in a job is logged ('job error') and the job dies if the coroutine is finished; it does not stop the other jobs.
- Probable bug: in onUpdate, extensions.hook('onJobDone', coroutines[ci], #coroutines) is called AFTER table.remove(coroutines, ci), so the first argument is the entry that took the place of the finished job (or nil if it was the last), not the finished job. Moreover, several terminations in the same frame use stored indices then removed in reverse order, which remains correct for the removal.
- The local variable disableBackgroundTasks is false and is never modified in this file: the 'foreground execution' branch of create() is unreachable from outside.
- wrap() does not return the job and only prevents relaunching the same function while it is running (key = the function itself).

## Functions

| Function | Description | Line |
|---|---|---|
| `core_jobsystem.cancelJob(jobHandle)` | Removes a job from the list so it is no longer resumed. Does not call its exit callback or onJobDone; the coroutine is abandoned. | 146 |
| `core_jobsystem.create(fct, maxdt, ...)` | Creates and registers a job (coroutine) executed in chunks every frame. The function is called with (job, ...). | 43 |
| `core_jobsystem.findFilesAsync(rootPath, pattern, yieldFn)` | Searches for files under a folder: direct matches at the root, then native recursive search per first-level subfolder, with a call to yieldFn after each. To be called from a job by passing job.yield. | 161 |
| `core_jobsystem.getRunningJobCount()` | Number of jobs currently running. | 140 |
| `core_jobsystem.onUpdate(dtReal, dtSim, dtRaw)` | Per-frame hook (called with the game's dt): resumes each coroutine, logs errors, removes finished jobs, calls their exitCallback then emits onJobDone. *(internal)* *(hook)* | 102 |
| `core_jobsystem.wrap(fct, maxdt)` | Returns a function that launches fct as a job, unless an instance of fct is already running (in which case the call is ignored). | 89 |

### Parameter details

#### `core_jobsystem.cancelJob(jobHandle)`

Removes a job from the list so it is no longer resumed. Does not call its exit callback or onJobDone; the coroutine is abandoned.

- `jobHandle` (*table*) : Object returned by create.
- **returns**: boolean true if the job was found and removed.

#### `core_jobsystem.create(fct, maxdt, ...)`

Creates and registers a job (coroutine) executed in chunks every frame. The function is called with (job, ...).

- `fct` (*function*) : Work function, fct(job, ...).
- `maxdt` (*number|nil*) : Time budget in seconds between two effective yields; default 0.01.
- `...` (*any*) : Arguments passed to fct after job.
- **returns**: table Job object: {yield(), sleep(secs), setExitCallback(fn), running, fct, maxdt}. exitcbl is called with the job when it ends.

#### `core_jobsystem.findFilesAsync(rootPath, pattern, yieldFn)`

Searches for files under a folder: direct matches at the root, then native recursive search per first-level subfolder, with a call to yieldFn after each. To be called from a job by passing job.yield.

- `rootPath` (*string*) : Root folder.
- `pattern` (*string*) : File pattern (e.g. '*.json').
- `yieldFn` (*function|nil*) : Called with a debug text after each subfolder; default nop.
- **returns**: string[] Paths found.

#### `core_jobsystem.getRunningJobCount()`

Number of jobs currently running.

- **returns**: integer Number of jobs.

#### `core_jobsystem.onUpdate(dtReal, dtSim, dtRaw)`

Per-frame hook (called with the game's dt): resumes each coroutine, logs errors, removes finished jobs, calls their exitCallback then emits onJobDone.

- `dtReal` (*number*) : Real-time delta in seconds.
- `dtSim` (*number*) : Simulation time delta in seconds.
- `dtRaw` (*number*) : Raw time delta in seconds.

#### `core_jobsystem.wrap(fct, maxdt)`

Returns a function that launches fct as a job, unless an instance of fct is already running (in which case the call is ignored).

- `fct` (*function*) : Work function of the job.
- `maxdt` (*number|nil*) : Budget in seconds, as for create.
- **returns**: function function(...) that creates the job; returns nothing.

## Emitted hooks

Events broadcast to extensions by `extensions.hook`:

- `onJobDone` — listened to by 1 module(s)

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/core/jobsystem.lua`.*
