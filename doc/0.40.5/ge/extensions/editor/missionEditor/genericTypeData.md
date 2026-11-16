# `editor_missionEditor_genericTypeData`

*File: `lua/ge/extensions/editor/missionEditor/genericTypeData.lua` · VM: Game Engine (GE) · 398 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/editor/missionEditor/genericTypeData")` (file under extensions/ but not a regular extension)

Mission editor panel that edits a mission's missionTypeData field. It lists the mission types (gameplay_missions_missions.getMissionTypes), picks the type-specific editor (gameplay_missions_missions.getMissionEditorForType) and, failing that or in "Raw" mode, offers a raw JSON editor. It also provides a popup that compares the mission variables with those of the open Flowgraph project (adding and fixing the type in one click). The module returns a constructor (function): require(...)(missionEditor) creates an instance via C:init.

## Example

```lua
local gtd = require('/lua/ge/extensions/editor/missionEditor/genericTypeData')(missionEditor)
gtd:setMission(mission)
-- in the editor's imgui loop:
gtd:draw()
```

## Notes

- The type change (changeMissionType) remembers the old data per mission and per type in oldMissionTypeData, and restores them if you go back to the previous type.
- The raw JSON editor caps the text at about 8*(2+max(128, 4*size)) / 8 characters (displayed as "char limit"). An invalid JSON is not saved and displays a message in red.
- loadEditor is not called in this file; it looks for /gameplay/missionTypes/<type>/editor.lua and creates a default editor (editorHelper) otherwise.
- The mission._dirty field is set to true at each modification to signal that a save is needed.

## Class `C`

Instance of the "Mission Type Data" panel. Main fields: missionEditor, mission, missionTypes (sorted list), missionTypeEditors (editor per type), rawEditPerMission, oldMissionTypeData, mtdIssues.

The module returns a constructor: `local obj = require("editor_missionEditor_genericTypeData")(options)`.

| Method | Description | Line |
|---|---|---|
| `C:changeMissionType(newType, force)` | Changes the mission's type: saves the current type's data, creates (or restores) those of the new type, then calls setMission again. | 77 |
| `C:draw()` | Draws the panel: mission type combo, "Raw" checkbox, "Auto fix N issues" button, then the type's editor or the raw JSON editor. | 244 |
| `C:drawTools()` | For each type whose editor defines toolsFunctions, creates a submenu and calls that function. | 340 |
| `C:drawViews()` | Calls drawViews(list of missions) on each type editor that defines it. | 364 |
| `C:drawViewsMenu()` | For each type whose editor defines viewFunctions, creates a submenu and calls that function. | 352 |
| `C:fillGeneric(mission)` | Replaces mission.missionTypeData with the fresh data provided by the mission's type editor (getNewData), or {} if there is none. | 72 |
| `C:getCurrentEditorHelper()` | Returns the editor of the current mission's type. | 372 |
| `C:getMissionIssues(m)` | Returns a mission's list of issues: result of checkContainer of its type's editor, plus those of the type's calculateMissionIssues if it exists (called in pcall). | 375 |
| `C:init(missionEditor)` | Constructor called by the function returned by the module. Gets the sorted list of mission types and the editor of each type. | 25 |
| `C:loadEditor(missionType)` | Looks for /gameplay/missionTypes/<missionType>/editor.lua and instantiates it with missionEditor. If the file does not exist or does not load, creates a generic editor via gameplay_missions_missions.editorHelper. | 41 |
| `C:openPopup()` | Opens the imgui popup "missionFGVariables" (Flowgraph variables helper). | 99 |
| `C:setMission(mission)` | Sets the current mission, passes the container to its type's editor (setContainer) and recomputes the issues (checkContainer) into self.mtdIssues. | 60 |
| `C:variablesHelperPopup()` | Draws the popup that sorts the mission type's fields into missing variables, variables of a different type, correct ones, and variables present only in the Flowgraph. The buttons add the missing variables (default value of the type) or fix their type in the current Flowgraph project (editor_flowgraphEditor.getManager()). Call every frame. | 103 |

## Calls into the engine (C++)

- `FS:` `fileExists`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/missionEditor/genericTypeData.lua`.*
