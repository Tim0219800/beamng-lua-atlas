# `editor_missionEditor_additionalAttributes`

*File: `lua/ge/extensions/editor/missionEditor/additionalAttributes.lua` · VM: Game Engine (GE) · 284 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/editor/missionEditor/additionalAttributes")` (file under extensions/ but not a regular extension)

"AdditionalInfo" section of the Mission Editor: edits the author, the creation or update date (Unix timestamp), the "As Scenario" and "DEV Mission" options, the mission's additional attributes (difficulty, etc., listed by gameplay_missions_missions.getAdditionalAttributes, some in automatic mode) and the grouping in the big map (Group Id, Group Label). Also provides a window that bulk-updates the date of several missions. The module returns a constructor.

## Notes

- The date is an integer (seconds since 1970); os.date('%Y-%m-%d %H:%M:%S') is used to display it.
- Missions with the same Group Id are grouped in the bigmap; empty = no group.
- Issues detected by getMissionIssues: missing difficulty, missing author, missing date (error), group label without translation (minor), DEV mission in a shipping_build version (error).
- The date update popup offers by default the missions whose date is later than now minus 2,629,743 s (about one month).
- The file contains a local function todToTime (time of day as hh:mm:ss) that is unused in this file.

## Class `C`

Additional information sub-window.

The module returns a constructor: `local obj = require("editor_missionEditor_additionalAttributes")(options)`.

| Method | Description | Line |
|---|---|---|
| `C:draw()` | Draws the fields Author, Date (with "Now" button), As Scenario, DEV Mission, the additional attributes dropdowns, Group Id and Group Label. | 74 |
| `C:getMissionIssues(m)` | Calls setMission then returns this section's issues (difficulty, author, date, group label translation, DEV mission in release). | 43 |
| `C:init(missionEditor)` | Constructor: remembers missionEditor, names the section "AdditionalInfo" and loads the additional attributes and their sorted keys. | 14 |
| `C:openTimeUpdater()` | Opens the "timeUpdaterForMissions" popup. | 198 |
| `C:setMission(mission)` | Selects the mission: finds its instance (gameplay_missions_missions.getMissionById) and creates the buffers for Group Id, Group Label, author and date. | 29 |
| `C:timeUpdaterPopup()` | Draws the bulk update popup: you choose an "After" date and a "Set To" date, the list of affected missions is displayed (a click removes one), and "Update Affected Missions" writes the new date into each mission, marking it _dirty. The popup's data is cleared when it closes. | 213 |
| `C:updateDateHumanReadable()` | Computes, only once, the mission's readable date (format YYYY-MM-DD hh:mm:ss) and caches it. | 39 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/missionEditor/additionalAttributes.lua`.*
