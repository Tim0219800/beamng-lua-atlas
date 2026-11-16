# `flowgraph_nodes_vehicle_ai_scriptAI_pathFromFile`

*File: `lua/ge/extensions/flowgraph/nodes/vehicle/ai/scriptAI/pathFromFile.lua` · VM: Game Engine (GE) · 81 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/vehicle/ai/scriptAI/pathFromFile")` (file under extensions/ but not a regular extension)

Node "AI Path from File" (category provider, color ai). Provides a ScriptAI path loaded from a track file /replays/scriptai/tracks/*.track.json chosen in the inspector ("Refresh Files" button to relist). Output: path (type aiPath), this is the "recording" field of the file. To be connected to "AI Follow Path from Data".

## Notes

- If no file is chosen or if reading fails, loadedFile stays nil and work raises an error (loadedFile.recording).
- jsonReadFile receives the first return value of mgr:getRelativeAbsolutePath (the resolved path).

## Class `C`

Flowgraph node class; each instance represents a node in a graph.

| Method | Description | Line |
|---|---|---|
| `C:_executionStopped()` | Does nothing. | 30 |
| `C:_onDeserialized(nodeData)` | Restores the file name and recomputes the short name. | 72 |
| `C:_onSerialize(res)` | Saves the file name. | 68 |
| `C:drawCustomProperties()` | Draws the "Refresh Files" button and the dropdown list of track files. | 33 |
| `C:drawMiddle(builder, style)` | Displays the short file name and its loading state. | 62 |
| `C:init()` | Lists the track files (FS:findFiles) and initializes the name and loaded file. | 23 |
| `C:work()` | Loads the file with jsonReadFile if it is not loaded yet and publishes loadedFile.recording on path. | 54 |

## Calls into the engine (C++)

- `FS:` `findFiles`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/vehicle/ai/scriptAI/pathFromFile.lua`.*
