# `editor_raceEditor`

*File: `lua/ge/extensions/editor/raceEditor.lua` · VM: Game Engine (GE) · 569 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_raceEditor`: `extensions.load("editor_raceEditor")`, then the global `editor_raceEditor`

Main "Race Tool" window of the race/path editor (menu Gameplay > Race/Path Editor, edit mode "Edit Races"). It manages the current race file (*.race.json, default folder /gameplay/races/): load, save, new race, copy from a scenario Time Trials, list of all races. It hosts the sub-windows (pathnodes, segments, startPositions, trackLayout, timeTrials, tools) and a "Race Test" window (testing). Loads go through the edit history (undo/redo). The current path is a gameplay/race/path object.

## Example

```lua
local race = editor_raceEditor.getCurrentPath()
editor_raceEditor.saveRace(race, '/gameplay/races/maCourse.race.json')
editor_raceEditor.loadRace('/gameplay/races/maCourse.race.json')
```

## Notes

- Registered preferences (category raceEditor.general): directionalNodes (true by default), showAiRoute, showCustomFields, useSimpleDrag.
- The pacenotes sub-module is commented out in the window list (not loaded). Window order: 1 pathnodes, 2 segments, 3 startPositions, 4 trackLayout, 5 timeTrials, 6 tools.
- loadRace returns currentPath as of the call: since the replacement is done later by the history action (setRaceRedo), the returned value may be the old path and not the loaded one.
- In setRaceRedo/setRaceUndo, the loop "for _, window in ipairs(windows)" calls currentWindow and not window: only the current window is updated, N times.
- An "All Races" dialog searches all *.race.json files across the whole virtual file system (may take a few seconds).

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_raceEditor.allowGizmo()` | Returns whether the edit gizmo is allowed: true when the current edit mode is "Edit Races". | 551 |
| `editor_raceEditor.calculateAiRoute()` | Calls autoConfig() then getAiPath() on the current path to recompute the AI route (and the aiPathDistance distance). | 28 |
| `editor_raceEditor.changedFromExternal()` | Call when the current path was modified outside the window: gives the path back to the active sub-window (setPath). | 555 |
| `editor_raceEditor.getCurrentFilename()` | Returns the full path of the current race file (folder + name). | 552 |
| `editor_raceEditor.getCurrentPath()` | Returns the gameplay/race/path object being edited. | 553 |
| `editor_raceEditor.getToolsWindow()` | Returns the race editor's "tools" sub-window. | 567 |
| `editor_raceEditor.isVisible()` | Returns whether the "Race Tool" window is displayed. | 554 |
| `editor_raceEditor.loadRace(filename)` | Reads a .race.json file, builds a new path (onDeserialized), recomputes the AI route and commits a "Set path to <name>" history action to replace it. Does nothing if filename is nil; logs an error if the file is not found. | 79 |
| `editor_raceEditor.onDeserialized(data)` | Called after a Lua reload with the saved state; restores the path, the file name and folder, then recomputes the AI route. *(internal)* *(hook)* | 520 |
| `editor_raceEditor.onEditorGui()` | Called every frame. Draws the Race Tool window (File menu, lists, sub-window tabs) and switches back to objectSelect mode if the window is hidden. *(internal)* *(hook)* | 254 |
| `editor_raceEditor.onEditorInitialized()` | Declares the raceEditMode edit mode, registers the window (500x500) and the menu entry, then instantiates the sub-windows and the test window. *(internal)* *(hook)* | 471 |
| `editor_raceEditor.onEditorRegisterPreferences(prefsRegistry)` | Declares the raceEditor preferences category (directionalNodes, showAiRoute, showCustomFields, useSimpleDrag). *(internal)* *(hook)* | 535 |
| `editor_raceEditor.onEditorToolWindowHide(windowName)` | If the hidden window is raceEditorTool, switches back to objectSelect mode. *(internal)* *(hook)* | 499 |
| `editor_raceEditor.onSerialize()` | Called before a Lua reload; serializes the current path and the last folder/file name. *(internal)* *(hook)* | 511 |
| `editor_raceEditor.onUpdate(dtReal, dtSim, dtRaw)` | Update hook; draws the "Race Test" window (testingWindow:draw(dtSim)) when it is open. *(internal)* *(hook)* | 113 |
| `editor_raceEditor.onWindowGotFocus(windowName)` | If the window gaining focus is raceEditorTool, activates the raceEditMode edit mode. *(internal)* *(hook)* | 505 |
| `editor_raceEditor.saveRace(race, savePath)` | Serializes a race and writes it as JSON (jsonWriteFile, pretty format). Updates the remembered folder and file name. | 67 |
| `editor_raceEditor.setupRace()` | Opens the "Race Test" window, gives it the current path and prepares the test race (testingWindow:setupRace). | 106 |
| `editor_raceEditor.show()` | Clears the selection, shows the Race Tool window and activates the raceEditMode edit mode. | 447 |

### Parameter details

#### `editor_raceEditor.allowGizmo()`

Returns whether the edit gizmo is allowed: true when the current edit mode is "Edit Races".

- **returns**: boolean true if the current edit mode is the race editor's.

#### `editor_raceEditor.getCurrentFilename()`

Returns the full path of the current race file (folder + name).

- **returns**: string Default "/gameplay/races/NewRace.race.json".

#### `editor_raceEditor.getCurrentPath()`

Returns the gameplay/race/path object being edited.

- **returns**: table Race path object (pathnodes, segments, startPositions...).

#### `editor_raceEditor.getToolsWindow()`

Returns the race editor's "tools" sub-window.

- **returns**: table Instance of the raceEditor/tools module.

#### `editor_raceEditor.isVisible()`

Returns whether the "Race Tool" window is displayed.

- **returns**: boolean Visibility of the raceEditorTool window.

#### `editor_raceEditor.loadRace(filename)`

Reads a .race.json file, builds a new path (onDeserialized), recomputes the AI route and commits a "Set path to <name>" history action to replace it. Does nothing if filename is nil; logs an error if the file is not found.

- `filename` (*string|nil*) : Path of the .race.json file.
- **returns**: table|nil currentPath (see notes: may be the old path).

#### `editor_raceEditor.onDeserialized(data)`

Called after a Lua reload with the saved state; restores the path, the file name and folder, then recomputes the AI route.

- `data` (*table|nil*) : onSerialize table: path, previousFilepath, previousFilename.

#### `editor_raceEditor.onEditorRegisterPreferences(prefsRegistry)`

Declares the raceEditor preferences category (directionalNodes, showAiRoute, showCustomFields, useSimpleDrag).

- `prefsRegistry` (*table*) : Editor preferences registry.

#### `editor_raceEditor.onEditorToolWindowHide(windowName)`

If the hidden window is raceEditorTool, switches back to objectSelect mode.

- `windowName` (*string*) : Name of the hidden window.

#### `editor_raceEditor.onSerialize()`

Called before a Lua reload; serializes the current path and the last folder/file name.

- **returns**: table {path, previousFilepath, previousFilename}.

#### `editor_raceEditor.onUpdate(dtReal, dtSim, dtRaw)`

Update hook; draws the "Race Test" window (testingWindow:draw(dtSim)) when it is open.

- `dtReal` (*number*) : Real-time delta (unused).
- `dtSim` (*number*) : Simulation time delta passed to the test window.
- `dtRaw` (*number*) : Raw time delta (unused).

#### `editor_raceEditor.onWindowGotFocus(windowName)`

If the window gaining focus is raceEditorTool, activates the raceEditMode edit mode.

- `windowName` (*string*) : Window name.

#### `editor_raceEditor.saveRace(race, savePath)`

Serializes a race and writes it as JSON (jsonWriteFile, pretty format). Updates the remembered folder and file name.

- `race` (*table|nil*) : Race path to save; if nil, uses the current path.
- `savePath` (*string*) : Full path of the output file.

## Calls into the engine (C++)

- `FS:` `findFiles`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/raceEditor.lua`.*
