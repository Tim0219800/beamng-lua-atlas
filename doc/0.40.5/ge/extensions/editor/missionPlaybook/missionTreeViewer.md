# `editor_missionPlaybook_missionTreeViewer`

*File: `lua/ge/extensions/editor/missionPlaybook/missionTreeViewer.lua` · VM: Game Engine (GE) · 261 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_missionPlaybook_missionTreeViewer`: `extensions.load("editor_missionPlaybook_missionTreeViewer")`, then the global `editor_missionPlaybook_missionTreeViewer`

"Playbook Mission Tree Viewer" window associated with editor_missionPlaybook. It draws, with the flowgraph node editor (ui_flowgraph_editor), the career mission unlock tree: one node per mission (showInCareer), placed according to the forwardInfo.depth depth, linked to the missions it unlocks (forwardIds). The color indicates the state (green startable, yellow visible, red otherwise) and star icons show the stars unlocked at the current playbook step (full star, empty, or "stars" for unlocked at this step).

## Notes

- You must click "Generate" to create the nodes (generateNodes); otherwise M.nodes stays empty.
- The window is only drawn if "Mission Playbook" is visible and book.results[book.page] exists.
- Bug: M.onEditorRegisterPreferences is assigned to an undefined global variable (nil).
- Debug code (dump) remains active in onEditorGui and onPlaybookLogAfterStep.
- createRect.is_empty references global (undefined) w and h; unused function.

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_missionPlaybook_missionTreeViewer.onEditorGui()` | Editor hook called every frame: creates (once) a dedicated node editor context, draws the nodes and links then restores the previous context. *(internal)* *(hook)* | 183 |
| `editor_missionPlaybook_missionTreeViewer.onEditorInitialized()` | Hook called at editor initialization: registers the window (500x500) and the "Missions" menu entry. *(internal)* *(hook)* | 229 |
| `editor_missionPlaybook_missionTreeViewer.onPlaybookLogAfterStep(resultData)` | Hook emitted after each playbook instruction: adds to resultData the stars unlocked per mission (unlockedStars) and those unlocked at this step (unlockedThisStep). *(internal)* *(hook)* | 234 |
| `editor_missionPlaybook_missionTreeViewer.show()` | Shows the "Mission Playbook" and "Playbook Mission Tree Viewer" windows. | 224 |

### Parameter details

#### `editor_missionPlaybook_missionTreeViewer.onPlaybookLogAfterStep(resultData)`

Hook emitted after each playbook instruction: adds to resultData the stars unlocked per mission (unlockedStars) and those unlocked at this step (unlockedThisStep).

- `resultData` (*table*) : Result of the step, modified in place.

## Fields

| Field | Type | Description |
|---|---|---|
| `nodes` | table[] | Generated nodes: {id, name, missionId, pos}. |
| `nodesByMId` | table<string, table> | Nodes keyed by mission id. |
| `onEditorRegisterPreferences` | any |  ⚠ reference `onEditorRegisterPreferences` not defined in the file (probably nil) |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/missionPlaybook/missionTreeViewer.lua`.*
