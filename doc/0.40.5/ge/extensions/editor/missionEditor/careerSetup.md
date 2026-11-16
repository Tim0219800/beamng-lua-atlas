# `editor_missionEditor_careerSetup`

*File: `lua/ge/extensions/editor/missionEditor/careerSetup.lua` · VM: Game Engine (GE) · 251 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/editor/missionEditor/careerSetup")` (file under extensions/ but not a regular extension)

Career setup section of the Mission Editor (mission.careerSetup): choice of the modes where the mission appears (Freeroam, Career), associated skill (Skill, among the career branches), registration fee (Entry Fee) and utilities for rewards (attribute key, amount, copy/paste). Loads career_branches to list the possible attributes (money, vouchers and each branch's key). The module returns a constructor.

## Notes

- The attribute options are money, vouchers, then branch.attributeKey for each branch returned by career_branches.getSortedBranches().
- The input buffers are in a local table (inputBuffers) cleared at each setMission.
- getMissionIssues detects no issue: always returns an empty list.
- setMission assumes that mission.careerSetup exists and that the mission instance is found (missionInstance.sortedStarKeys); otherwise error.

## Class `C`

Career setup sub-window.

The module returns a constructor: `local obj = require("editor_missionEditor_careerSetup")(options)`.

| Method | Description | Line |
|---|---|---|
| `C:attributeDropdown()` | Draws a small "..." dropdown of the possible attribute keys. | 71 |
| `C:draw()` | Draw entry point: calls drawCareerSetup. | 240 |
| `C:drawAddReward(key, rewards)` | Draws the area for adding a reward (key field, + button, choice list) and the copy and paste buttons of the rewards list. | 119 |
| `C:drawAttributeInput(re, idx, key)` | Draws the text field for a reward's attribute key with the choice list; updates re.attributeKey and marks the mission _dirty. | 91 |
| `C:drawCareerSetup()` | Draws the main table: Freeroam and Career checkboxes, Skill list and Entry Fee; each modification writes into mission.careerSetup and marks _dirty. | 197 |
| `C:drawEntryFee()` | Draws the editing of the mission's registration fees (one line per fee with a "Rem" button to remove it). | 168 |
| `C:drawRewardAmount(re, idx, key)` | Draws the integer field for the reward amount; writes re.rewardAmount and re._originalRewardAmount and marks the mission _dirty. | 108 |
| `C:getMissionIssues(m)` | Calls setMission then returns the list of issues (always empty). | 44 |
| `C:init(missionEditor)` | Constructor: loads career_branches and builds the attribute lists (attributeOptions) and skill lists (skillOptions, sorted, with "(none)"). | 20 |
| `C:setMission(mission)` | Selects the mission: reads careerSetup (showInCareer, showInFreeroam), gets the star keys, clears the buffers and links the mission type's edit helper to the "mission" container. | 50 |

**Loads extensions:** `career_branches`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/missionEditor/careerSetup.lua`.*
