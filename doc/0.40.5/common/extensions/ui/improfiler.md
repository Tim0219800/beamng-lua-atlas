# `ui_improfiler`

*File: `lua/common/extensions/ui/improfiler.lua` · VM: Common (GE + vehicle) · 332 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `ui_improfiler`: `extensions.load("ui_improfiler")`, then the global `ui_improfiler`

LuaJIT profiler displayed in an ImGui window "LuaJIT Profiler". The first part of the file is Mike Pall's jit/p module (MIT, 2005-2017) adapted: sampling of LuaJIT's built-in profiler (jit.profile) and formatting of the result into a string instead of stdout. The end of the file is the BeamNG part: every 3 seconds, the profile is finished, its text displayed in the window, then a new profile is started with the mode "vzm0lspi0 500 -500" (VM states, zones, minimum 0%, split, full paths, interval 0 ms...).

## Example

```lua
extensions.load('ui_improfiler') -- the window appears; the text is refreshed every 3 s
```

## Notes

- The file does require('libs/LuaJIT/vmdef') while the game's copy is in common/jit/vmdef.lua: different path (no proven bug, just to keep in mind).
- The file asserts that jit.version_num == 20100.
- Only onUpdate is exposed; the profile starts at the first 3 s cycle (prof_finish does nothing as long as no profile is running).
- Time is accumulated with dtReal (real time, unaffected by slow motion).

## Functions

| Function | Description | Line |
|---|---|---|
| `ui_improfiler.onUpdate(dtReal, dtSim, dtRaw)` | Hook called every frame: draws the "LuaJIT Profiler" window with the latest result; every 3 s of real time, finishes the current profile, updates the displayed text and restarts the profiler. *(internal)* *(hook)* | 307 |

### Parameter details

#### `ui_improfiler.onUpdate(dtReal, dtSim, dtRaw)`

Hook called every frame: draws the "LuaJIT Profiler" window with the latest result; every 3 s of real time, finishes the current profile, updates the displayed text and restarts the profiler.

- `dtReal` (*number*) : Real delta time (s), accumulated for the 3 s timer.
- `dtSim` (*number*) : Not used.
- `dtRaw` (*number*) : Not used.

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/common/extensions/ui/improfiler.lua`.*
