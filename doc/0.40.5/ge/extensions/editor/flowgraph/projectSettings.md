# `editor_flowgraph_projectSettings`

*File: `lua/ge/extensions/editor/flowgraph/projectSettings.lua` · VM: Game Engine (GE) · 128 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/editor/flowgraph/projectSettings")` (file under extensions/ but not a regular extension)

"Project Settings" window (projectSettings) of the Flowgraph editor. It edits the metadata of the current project: name, description (512 chars max), authors, difficulty (0-100, label Easy/Medium/Hard/Very Hard in steps of 25) and "Is Scenario" checkbox. Also displays the file name and the save folder, with Save and Save as... buttons (.flow.json extension).

## Notes

- Each change of name, author, difficulty or scenario mode adds a history entry via fgEditor.addHistory.
- In debug mode (preference flowgraph.debug.editorDebug) the window displays an icon if the project is hidden (mgr.hidden) or transient (mgr.transient, cannot be saved).
- The description is modified without a history entry.
- The difficulty label uses floor(value/25)+1: the value 100 falls back to 'Very Hard' thanks to the fallback, otherwise 0-24 Easy, 25-49 Medium, 50-74 Hard, 75-99 Very Hard.

## Class `C`

Window class (windowName 'projectSettings', windowDescription 'Project Settings').

| Method | Description | Line |
|---|---|---|
| `C:_onDeserialized(data)` | Window deserialization hook: empty. | 123 |
| `C:_onSerialize(data)` | Window serialization hook: empty, nothing is saved. | 119 |
| `C:attach(mgr)` | Stores the manager and prepares the ImGui fields (name 64 chars, authors 128 chars, difficulty pointer) from mgr.name, mgr.authors and mgr.difficulty. | 14 |
| `C:draw()` | Draws the project fields and the Save / Save as... buttons. Save calls fgEditor.save(), Save as opens the file dialog then fgEditor.saveAsFile. | 25 |
| `C:init()` | Registers the window in the editor (150x300, hidden by default). | 21 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/flowgraph/projectSettings.lua`.*
