# `editor_dynamicDecals_camera`

*File: `lua/ge/extensions/editor/dynamicDecals/camera.lua` · VM: Game Engine (GE) · 138 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_dynamicDecals_camera`: `extensions.load("editor_dynamicDecals_camera")`, then the global `editor_dynamicDecals_camera`

"Camera" section of the editor's Dynamic Decals tool. Shows one button per camera preset (default, front, back, left, right, top) that switches to the player vehicle's orbit camera with a given default rotation. Presets are stored in the editor preference `dynamicDecalsTool.camera.presets` (name -> {x,y,z}) and are editable in the preferences window.

## Notes

- The file's logTag is "editor_dynamicDecals_meshes" (copy-paste, no functional effect).
- The camera change runs in a job (core_jobsystem): commands.setGameCamera, orbit, then a one-frame pause before core_camera.setDefaultRotation / resetCamera. This changes the camera's default rotation and it is not restored.
- In presetsGui, renaming a preset calls table.remove(presets, i) on a table keyed by name: this does not remove the old key (probable bug, the old name stays in the table).
- Each preset button reuses the ImGui identifier "Generate Materials" (copied from another section).

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_dynamicDecals_camera.editorPreferenceValueChanged(path, value)` | Hook called when a tool preference changes. Does nothing here. *(internal)* | 119 |
| `editor_dynamicDecals_camera.registerEditorPreferences(prefsRegistry)` | Registers the preferences subcategory `dynamicDecalsTool.camera` with the `presets` table (defaults: default {145,-5,0}, front {180,0,0}, back {0,0,0}, left {-90,0,0}, right {90,0,0}, top {90,-90,0}) and its graphical editor. *(internal)* | 103 |
| `editor_dynamicDecals_camera.setup(tool_in)` | Called by the dynamicDecalsTool tool: stores the tool, the editor_api_dynamicDecals API and the docs module, registers the "Camera" section (order 125) with a help button, and registers the documentation page. *(internal)* | 123 |

### Parameter details

#### `editor_dynamicDecals_camera.editorPreferenceValueChanged(path, value)`

Hook called when a tool preference changes. Does nothing here.

- `path` (*string*) : Path of the modified preference.
- `value` (*any*) : New value.

#### `editor_dynamicDecals_camera.registerEditorPreferences(prefsRegistry)`

Registers the preferences subcategory `dynamicDecalsTool.camera` with the `presets` table (defaults: default {145,-5,0}, front {180,0,0}, back {0,0,0}, left {-90,0,0}, right {90,0,0}, top {90,-90,0}) and its graphical editor.

- `prefsRegistry` (*table*) : Editor preferences registry.

#### `editor_dynamicDecals_camera.setup(tool_in)`

Called by the dynamicDecalsTool tool: stores the tool, the editor_api_dynamicDecals API and the docs module, registers the "Camera" section (order 125) with a help button, and registers the documentation page.

- `tool_in` (*table*) : Reference to the editor_dynamicDecalsTool tool.

## Calls into the engine (C++)

- `be:` `getPlayerVehicleID`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/dynamicDecals/camera.lua`.*
