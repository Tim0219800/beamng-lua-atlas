# `editor_rallyEditor_testTab`

*File: `lua/ge/extensions/editor/rallyEditor/testTab.lua` · VM: Game Engine (GE) · 83 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/editor/rallyEditor/testTab")` (file under extensions/ but not a regular extension)

"Test" tab of the rally editor (debug tool). The module returns a class C constructor. It offers a "Test 1" button (prints a random "precountdown" system pacenote to the log), "Load Recce Mission" (reloads the gameplay_rally_recceApp extension and loads the mission) and "Unload Recce Mission".

## Notes

- No exported function: you get an instance with require(...)(rallyEditor).
- self.driveline is initialized to nil and is no longer used (driveline loading was removed).

## Class `C`

Test tab instance, created by the constructor returned by the module (calls init). Has windowDescription = 'Test'.

The module returns a constructor: `local obj = require("editor_rallyEditor_testTab")(options)`.

| Method | Description | Line |
|---|---|---|
| `C:draw()` | Draws the three test buttons (imgui). Does nothing without a notebook. | 42 |
| `C:drawDebugEntrypoint()` | 3D view debug drawing entry point; empty here. | 71 |
| `C:init(rallyEditor)` | Constructor: stores rallyEditor, path = nil. | 13 |
| `C:selected()` | Called by the rally editor when the tab is selected; re-emits the onEditorEditModeChanged(nil, nil) hook to redraw the shortcut legend. | 25 |
| `C:setPath(path)` | Sets the current notebook. | 20 |
| `C:test1()` | Prints to the console the name of a random system pacenote of type 'precountdown' (path:getRandomSystemPacenote). | 64 |
| `C:unselect()` | Called when the tab is left; also emits onEditorEditModeChanged(nil, nil). | 36 |

## Emitted hooks

Events broadcast to extensions by `extensions.hook`:

- `onEditorEditModeChanged` — listened to by 1 module(s)

**Loads extensions:** `gameplay_rally_recceApp`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/rallyEditor/testTab.lua`.*
