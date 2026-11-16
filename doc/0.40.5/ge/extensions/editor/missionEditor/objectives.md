# `editor_missionEditor_objectives`

*File: `lua/ge/extensions/editor/missionEditor/objectives.lua` · VM: Game Engine (GE) · 587 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/editor/missionEditor/objectives")` (file under extensions/ but not a regular extension)

"Objectives / Career Setup" panel of the mission editor. It configures the mission's stars (starsActive, defaultStarKeys for the 3 default stars, bonus stars), the rewards per star (starRewards: attributeKey + rewardAmount) and the ending texts (starOutroTexts, with default translation). It also contains checks (getMissionIssues) and a "Raw" JSON mode. Loads the career_branches extension to offer the reward attributes (money, beamXP, vouchers, plus the branches' attributeKey). The module returns a constructor: require(...)(missionEditor).

## Notes

- Bug: Raw mode calls pushStyle("red") and popStyle() which are not defined in this file (nil globals); a JSON error in the raw editor would therefore cause a Lua error when the message is displayed.
- getMissionIssues: "Star X using default translations" (minor), "has no text and no default" or "is not translated" (error), "No Stars set at all!" (error if showInCareer, otherwise warning), reward at 0 (error, only if showInCareer).
- Checking a star assigns it to the first free slot among the 3 default stars; unchecking it removes it from those slots.
- The "Summary" stats add up rewardAmount per attributeKey for all stars, default stars and bonus stars.

## Class `C`

Instance of the Objectives panel. Fields: missionEditor, mission, missionInstance (gameplay_missions_missions.getMissionById), careerSetup, attributeOptions, skillOptions, copiedStars (clipboard per mission type), starKeysSorted.

The module returns a constructor: `local obj = require("editor_missionEditor_objectives")(options)`.

| Method | Description | Line |
|---|---|---|
| `C:attributeDropdown()` | Small "..." combo listing attributeOptions. | 171 |
| `C:draw()` | Draws the "Career Setup" header (Raw checkbox, copy/paste of the configuration per mission type) then drawCareerSetup or the raw JSON editor of mission.careerSetup. | 505 |
| `C:drawAddReward(key, rewards)` | Controls for adding a reward (text, combo, +) and copy/paste buttons for the rewards. | 219 |
| `C:drawAttributeInput(re, idx, key)` | Text field + combo for a reward's attributeKey; updates re.attributeKey. | 191 |
| `C:drawCareerSetup()` | Draws the whole configuration: list of stars with checkboxes, slot, type editor, rewards, ending texts, then summary (default stars, bonus, reward totals). | 371 |
| `C:drawDefaultStar(defaultIndex)` | Combo to choose which active star occupies the given default star slot. Not called in this file. | 148 |
| `C:drawOutroText(key)` | Edit row for a star's ending text (or "noStarUnlocked"), with status icons for the default translation and the current translation. | 328 |
| `C:drawRewardAmount(re, idx, key)` | Integer field for rewardAmount; also remembers _originalRewardAmount. | 208 |
| `C:drawStarRewards(key)` | Displays and edits a star's rewards list (deletion via "Rem" button, addition). | 268 |
| `C:getMissionIssues(m)` | Calls setMission(m) then returns the mission's star, text and reward issues. | 46 |
| `C:getStarLabel(key)` | Returns the star's translated label (_tr), handling labels as a function, a string or a table {txt}. | 133 |
| `C:init(missionEditor)` | Constructor: loads career_branches and builds the attributeOptions and skillOptions lists (branches with isSkill). | 20 |
| `C:setMission(mission)` | Sets the current mission, gets its game instance, the sorted star keys and the mission type's editor (setContainer(mission, 'mission')). | 113 |
| `C:starSlotSelector(key)` | Combo to place the star as "Bonus Star" or as "Default Star N". | 300 |

**Loads extensions:** `career_branches`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/missionEditor/objectives.lua`.*
