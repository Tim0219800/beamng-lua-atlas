# `editor_missionEditor_progressSetup`

*File: `lua/ge/extensions/editor/missionEditor/progressSetup.lua` · VM: Game Engine (GE) · 108 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/editor/missionEditor/progressSetup")` (file under extensions/ but not a regular extension)

"Progress" tab (progress configuration) of the mission editor. It gets the mission type's progress definition (gameplay_missions_missions.getMissionProgressSetupData) and offers a "Raw" mode to edit the saveData JSON. The module returns a constructor: require(...)(missionEditor). File apparently incomplete.

## Notes

- Bug: draw calls self:drawProgress(), which is not defined in this file (copy of progressSingle); outside Raw mode, the call causes a Lua error.
- Bug: self.missionInstance is never set in setMission, while Raw mode reads self.missionInstance.saveData.
- Raw mode displays missionInstance.saveData but writes the result into mission.saveData.

## Class `C`

Instance of the tab. Fields: missionEditor, mission, progressSetup, rawEditPerMission.

The module returns a constructor: `local obj = require("editor_missionEditor_progressSetup")(options)`.

| Method | Description | Line |
|---|---|---|
| `C:draw()` | Draws the header with the Raw checkbox then the progress view or the raw JSON editor (Edit / Finish Editing / Cancel). | 45 |
| `C:init(missionEditor)` | Constructor. | 24 |
| `C:setMission(mission)` | Sets the current mission and loads progressSetup for its type. | 33 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/missionEditor/progressSetup.lua`.*
