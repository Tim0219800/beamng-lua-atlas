# `editor_missionPlaybook_attributeViewer`

*File: `lua/ge/extensions/editor/missionPlaybook/attributeViewer.lua` · VM: Game Engine (GE) · 127 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_missionPlaybook_attributeViewer`: `extensions.load("editor_missionPlaybook_attributeViewer")`, then the global `editor_missionPlaybook_attributeViewer`

"Playbook Attribute Viewer" window associated with editor_missionPlaybook. At each playbook step, it records the player's attributes (career_modules_playerAttributes.getAllAttributes: value, branch level, progress toward the next level) in resultData.attributes. The window displays for the current page a Key / Value / Tier / Change table (green for an increase, red for a decrease) and a curve of the attributes' evolution (except "money") via plotHelperUtil.

## Notes

- The window is only drawn if the "Mission Playbook" window is visible.
- Bug: M.onEditorRegisterPreferences is assigned to a global variable not defined in this file (nil); no effect.
- The graph is conditioned by plotInvalid, set to true at each onPlaybookLogAfterStep; it therefore only appears after a first step has run.
- The computation of "Change" reads prevData[key].value without checking that the key exists in the previous step.

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_missionPlaybook_attributeViewer.onEditorGui(dt)` | Editor hook called every frame: draws the attributes table and graph for book.results[book.page]. *(internal)* *(hook)* | 17 |
| `editor_missionPlaybook_attributeViewer.onEditorInitialized()` | Hook called at editor initialization: registers the window (500x500), the "Missions" menu entry and creates the plot utility. *(internal)* *(hook)* | 97 |
| `editor_missionPlaybook_attributeViewer.onPlaybookLogAfterStep(resultData)` | Hook emitted by editor_missionPlaybook after each instruction: adds resultData.attributes = {key = {value, level, curLvlProgress, neededForNext}}. *(internal)* *(hook)* | 103 |
| `editor_missionPlaybook_attributeViewer.show()` | Shows the "Mission Playbook" and "Playbook Attribute Viewer" windows. | 87 |

### Parameter details

#### `editor_missionPlaybook_attributeViewer.onEditorGui(dt)`

Editor hook called every frame: draws the attributes table and graph for book.results[book.page].

- `dt` (*number*) : Frame duration in seconds (passed to the plot).

#### `editor_missionPlaybook_attributeViewer.onPlaybookLogAfterStep(resultData)`

Hook emitted by editor_missionPlaybook after each instruction: adds resultData.attributes = {key = {value, level, curLvlProgress, neededForNext}}.

- `resultData` (*table*) : Result of the step, modified in place.

## Fields

| Field | Type | Description |
|---|---|---|
| `onEditorRegisterPreferences` | any |  ⚠ reference `onEditorRegisterPreferences` not defined in the file (probably nil) |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/missionPlaybook/attributeViewer.lua`.*
