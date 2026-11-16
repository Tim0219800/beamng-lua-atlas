# `editor_rallyEditor_stageLoaderModal`

*File: `lua/ge/extensions/editor/rallyEditor/stageLoaderModal.lua` · VM: Game Engine (GE) · 197 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_rallyEditor_stageLoaderModal`: `extensions.load("editor_rallyEditor_stageLoaderModal")`, then the global `editor_rallyEditor_stageLoaderModal`

"Open Rally Stage" modal window of the rally editor. It lists the rallyStage missions of the current level (gameplay_missions_missions.getFilesData), sorted by name, with dev missions marked [DEV]. The Open button loads the chosen mission's notebook (rallyEditor.loadForMissionEditor) and shows the tool (showRallyTool).

## Notes

- Message displayed if no level is loaded, if the mission data is unavailable or if there is no rallyStage mission.
- A mission's level comes from startTrigger.level, otherwise from the first segment of the id; comparison is case-insensitive.

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_rallyEditor_stageLoaderModal.draw(rallyEditor, openPtr)` | To be called every frame. Opens the popup when openPtr[0] becomes true (refreshing the list), draws the list and the details, and resets openPtr[0] to false on close (Open or Cancel). | 140 |

### Parameter details

#### `editor_rallyEditor_stageLoaderModal.draw(rallyEditor, openPtr)`

To be called every frame. Opens the popup when openPtr[0] becomes true (refreshing the list), draws the list and the details, and resets openPtr[0] to false on close (Open or Cancel).

- `rallyEditor` (*table*) : Rally editor module (must provide loadForMissionEditor and showRallyTool).
- `openPtr` (*table*) : Imgui boolean pointer (BoolPtr) indicating whether the modal should be opened.

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/rallyEditor/stageLoaderModal.lua`.*
