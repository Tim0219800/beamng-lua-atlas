---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/perfProfiler.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Editor window "CameraProfiler" (Debug > Performance Recorder menu) to record and compare performance. It starts a recording along a camera path (*.camPath.json from the levels/<level>/perfRecordingCampaths/ folder) via test_util_fpsCamRecorder and util_stepHandler, loads .perfRecording.json files, plots curves (fps_average, fps_min, polyCount, drawCalls, memory...) in "Profiler Chart N" windows (10 max) and compares the files in a table. Useful to measure the impact of a mod or a graphics setting.
--- Access: extension `editor_perfProfiler`: `extensions.load("editor_perfProfiler")`, then the global `editor_perfProfiler`
---@class editor_perfProfiler
editor_perfProfiler = {}

--- Loads a JSON performance file (jsonReadFile), completes meta.name (file name), looks for a level annotation file, converts each sample to pos=vec3 and rot=quat, marks the file active and adds it to the list of compared files. Does nothing if filepath is empty.
---Source: lua/ge/extensions/editor/perfProfiler.lua:426
---@param data table Return table of the file dialog; only data.filepath (path of the .perfRecording.json) is read.
function editor_perfProfiler.loadFile(data) end

--- Called every frame by the editor. Draws the main window (Record / Load / New Chart Window menu, file table with checkbox, color, name), recomputes colors and charts if needed, then the charts, the comparison table, the metadata window and the recording popup.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/perfProfiler.lua:461
---@param dt number Delta time passed to the charts.
function editor_perfProfiler.onEditorGui(dt) end

--- Registers the CameraProfiler window (500x500) and the "Performance Recorder" menu entry (Debug group).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/perfProfiler.lua:549
function editor_perfProfiler.onEditorInitialized() end

--- Shows the CameraProfiler window (editor.showWindow).
---Source: lua/ge/extensions/editor/perfProfiler.lua:545
function editor_perfProfiler.show() end

