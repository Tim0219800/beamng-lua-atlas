# `editor_missionEditor_layers`

*File: `lua/ge/extensions/editor/missionEditor/layers.lua` · VM: Game Engine (GE) · 139 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/editor/missionEditor/layers")` (file under extensions/ but not a regular extension)

"Layers" panel of the mission editor. A mission looks for its files in an ordered list of folders (mission.layers, each with a dir field) until it finds a matching file. This panel lets you reorder the folders, edit them (text or file picker), open the folder in the explorer, add some after a row or delete them. The module returns a constructor: require(...)(missionEditor).

## Notes

- A layer with fixed = true is disabled for editing (field, picker and deletion).
- The first layer is labeled "Checked First", the last "Checked Last".
- Adding a folder calls dump(add) (debugging leftover in the log).

## Class `C`

Instance of the Layers panel. Fields: missionEditor, mission, inputs (imgui text buffers per layer).

The module returns a constructor: `local obj = require("editor_missionEditor_layers")(options)`.

| Method | Description | Line |
|---|---|---|
| `C:createInputFields()` | Recreates the imgui text buffers (im.ArrayChar of 1024) from layer.dir for each layer. | 19 |
| `C:draw()` | Draws the list of layers with up/down buttons, path field, folder, picker, deletion and addition. Applies the moves at the end of the frame and sets mission._dirty to true. | 29 |
| `C:init(missionEditor)` | Constructor: remembers missionEditor. | 10 |
| `C:setMission(mission)` | Sets the current mission and recreates the input fields. | 14 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/missionEditor/layers.lua`.*
