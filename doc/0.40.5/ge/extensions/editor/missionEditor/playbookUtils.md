# `editor_missionEditor_playbookUtils`

*File: `lua/ge/extensions/editor/missionEditor/playbookUtils.lua` · VM: Game Engine (GE) · 117 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/editor/missionEditor/playbookUtils")` (file under extensions/ but not a regular extension)

"Playbook Utils" tab of the mission editor. It offers buttons that add missionAttempt instructions for the current mission to editor_missionPlaybook.book.instructions, with different star combinations (all, default, bonus, random, one by one). The module returns a constructor: require(...)(missionEditor).

## Notes

- Each instruction has the form {type = 'missionAttempt', missionId = id, stars = {key = true}}.
- Uses the mission instance's careerSetup._activeStarCache (sortedStars, defaultStarKeysSorted, bonusStarKeysSorted).
- "Add Random Single Star" only adds a star if there is more than one star; otherwise the instruction is added with empty stars.

## Class `C`

Instance of the tab. Fields: missionEditor, tabName = 'Playbook Utils', mission, missionInstance.

The module returns a constructor: `local obj = require("editor_missionEditor_playbookUtils")(options)`.

| Method | Description | Line |
|---|---|---|
| `C:draw()` | Draws the buttons for adding instructions to the playbook (empty, all stars, default stars, bonus, one random star, random stars, progressive individual addition, bonus in random order). | 24 |
| `C:init(missionEditor)` | Constructor: remembers missionEditor and the tab name. | 9 |
| `C:setMission(mission)` | Sets the current mission and its game instance. | 16 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/missionEditor/playbookUtils.lua`.*
