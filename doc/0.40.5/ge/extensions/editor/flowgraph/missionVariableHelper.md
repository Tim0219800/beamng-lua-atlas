# `editor_flowgraph_missionVariableHelper`

*File: `lua/ge/extensions/editor/flowgraph/missionVariableHelper.lua` · VM: Game Engine (GE) · 171 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_flowgraph_missionVariableHelper`: `extensions.load("editor_flowgraph_missionVariableHelper")`, then the global `editor_flowgraph_missionVariableHelper`

Shared utility that applies to a flowgraph project the variables of the mission selected in the Mission Editor (missionTypeData), and checks whether a project matches the mission. Used by the Task Manager window and the main editor before launching a project.

## Example

```lua
local helper = require('/lua/ge/extensions/editor/flowgraph/missionVariableHelper')
local ok = helper.applyMissionVariablesToManager(mgr, 'myTool')
```

## Notes

- Requires editor_missionEditor to be loaded and a mission selected (editor_missionEditor.getSelectedMissionId() is treated as a mission object with id, missionType, missionTypeData, fgPath).
- Only variables that already exist in the project (mgr.variables:variableExists) are modified, via changeBase.
- The variables playerID, playerId, vehID and vehId receive the player vehicle ID (getPlayerVehicle(0):getID()); this code has no guard if no player vehicle exists (possible error).
- If the mission has no missionTypeData, the function returns false before the vehicle ID injection.

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_flowgraph_missionVariableHelper.applyMissionVariablesToManager(mgr, logTag)` | Copies the missionTypeData variables of the selected mission to the project, then injects the player vehicle ID into the variables with known names. Logs the match type (warning if the project does not belong to the mission, but applies anyway). | 77 |
| `editor_flowgraph_missionVariableHelper.checkMissionMatch(mgr, selectedMission)` | Compares the project's file path (savedDir + savedFilename, .flow.json appended if missing) to the mission's flowgraph path (fgPath, or that of the mission instance), after normalization (/, no leading /, lowercase). | 17 |

### Parameter details

#### `editor_flowgraph_missionVariableHelper.applyMissionVariablesToManager(mgr, logTag)`

Copies the missionTypeData variables of the selected mission to the project, then injects the player vehicle ID into the variables with known names. Logs the match type (warning if the project does not belong to the mission, but applies anyway).

- `mgr` (*table*) : Target flowgraph manager.
- `logTag` (*string|nil*) : Log label (default "missionVariableHelper").
- **returns**: boolean true if at least one variable was applied or injected; false otherwise (mission editor absent, no mission, no variable).

#### `editor_flowgraph_missionVariableHelper.checkMissionMatch(mgr, selectedMission)`

Compares the project's file path (savedDir + savedFilename, .flow.json appended if missing) to the mission's flowgraph path (fgPath, or that of the mission instance), after normalization (/, no leading /, lowercase).

- `mgr` (*table|nil*) : Flowgraph manager.
- `selectedMission` (*table|nil*) : Selected mission (id, fgPath, missionType).
- **returns**: string "exact", "missionTypeMain" (main gameplay flowgraph gameplay/missiontypes/<type>/<type>.flow.json), "sameMissionType", "differentMissionType" or "noMission".
- **returns**: string Normalized project path.
- **returns**: string Normalized mission path.

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/flowgraph/missionVariableHelper.lua`.*
