# `editor_perfProfiler`

*File: `lua/ge/extensions/editor/perfProfiler.lua` · VM: Game Engine (GE) · 558 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_perfProfiler`: `extensions.load("editor_perfProfiler")`, then the global `editor_perfProfiler`

Editor window "CameraProfiler" (Debug > Performance Recorder menu) to record and compare performance. It starts a recording along a camera path (*.camPath.json from the levels/<level>/perfRecordingCampaths/ folder) via test_util_fpsCamRecorder and util_stepHandler, loads .perfRecording.json files, plots curves (fps_average, fps_min, polyCount, drawCalls, memory...) in "Profiler Chart N" windows (10 max) and compares the files in a table. Useful to measure the impact of a mod or a graphics setting.

## Notes

- Plottable data keys: fps_instant, fps_average, fps_min, fps_max, fps_waitForGPU, gfx_polyCount, gfx_drawCalls, mem_osPhys*/mem_osVirt*, mem_processPhysUsed/VirtUsed.
- Load files: filter ".perfRecording.json", folder /perfRecordings/. An optional annotation file is searched in /levels/<lvl>/perfRecordingCampaths/<name>.perfAnnotation.json.
- Probable bug: in loadFile, the line "metadataFile = file" uses a variable "file" never defined in the function (nil); the metadata window therefore does not open after a load. Also, globalNames receives file.name, a field that loadFile does not set (only file.meta.name).
- The "Delete All Vehicles" button of the recording popup really deletes all the vehicles.

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_perfProfiler.loadFile(data)` | Loads a JSON performance file (jsonReadFile), completes meta.name (file name), looks for a level annotation file, converts each sample to pos=vec3 and rot=quat, marks the file active and adds it to the list of compared files. Does nothing if filepath is empty. | 426 |
| `editor_perfProfiler.onEditorGui(dt)` | Called every frame by the editor. Draws the main window (Record / Load / New Chart Window menu, file table with checkbox, color, name), recomputes colors and charts if needed, then the charts, the comparison table, the metadata window and the recording popup. *(internal)* *(hook)* | 461 |
| `editor_perfProfiler.onEditorInitialized()` | Registers the CameraProfiler window (500x500) and the "Performance Recorder" menu entry (Debug group). *(internal)* *(hook)* | 549 |
| `editor_perfProfiler.show()` | Shows the CameraProfiler window (editor.showWindow). | 545 |

### Parameter details

#### `editor_perfProfiler.loadFile(data)`

Loads a JSON performance file (jsonReadFile), completes meta.name (file name), looks for a level annotation file, converts each sample to pos=vec3 and rot=quat, marks the file active and adds it to the list of compared files. Does nothing if filepath is empty.

- `data` (*table*) : Return table of the file dialog; only data.filepath (path of the .perfRecording.json) is read.

#### `editor_perfProfiler.onEditorGui(dt)`

Called every frame by the editor. Draws the main window (Record / Load / New Chart Window menu, file table with checkbox, color, name), recomputes colors and charts if needed, then the charts, the comparison table, the metadata window and the recording popup.

- `dt` (*number*) : Delta time passed to the charts.

## Calls into the engine (C++)

- `FS:` `fileExists`, `findFiles`
- `obj:` `delete`

**Loads extensions:** `test_util_camPosDataToBucket`, `test_util_fpsCamRecorder`, `util_stepHandler`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/perfProfiler.lua`.*
