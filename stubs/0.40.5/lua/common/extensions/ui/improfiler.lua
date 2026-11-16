---@meta
-- tim19Atlas stub generated from lua/common/extensions/ui/improfiler.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- LuaJIT profiler displayed in an ImGui window "LuaJIT Profiler". The first part of the file is Mike Pall's jit/p module (MIT, 2005-2017) adapted: sampling of LuaJIT's built-in profiler (jit.profile) and formatting of the result into a string instead of stdout. The end of the file is the BeamNG part: every 3 seconds, the profile is finished, its text displayed in the window, then a new profile is started with the mode "vzm0lspi0 500 -500" (VM states, zones, minimum 0%, split, full paths, interval 0 ms...).
--- Access: extension `ui_improfiler`: `extensions.load("ui_improfiler")`, then the global `ui_improfiler`
---@class ui_improfiler
ui_improfiler = {}

--- Hook called every frame: draws the "LuaJIT Profiler" window with the latest result; every 3 s of real time, finishes the current profile, updates the displayed text and restarts the profiler.
---*(internal: called by the engine or the main loop)*
---Source: lua/common/extensions/ui/improfiler.lua:307
---@param dtReal number Real delta time (s), accumulated for the 3 s timer.
---@param dtSim number Not used.
---@param dtRaw number Not used.
function ui_improfiler.onUpdate(dtReal, dtSim, dtRaw) end

