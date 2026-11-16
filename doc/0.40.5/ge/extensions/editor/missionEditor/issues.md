# `editor_missionEditor_issues`

*File: `lua/ge/extensions/editor/missionEditor/issues.lua` · VM: Game Engine (GE) · 241 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/editor/missionEditor/issues")` (file under extensions/ but not a regular extension)

"Issues" panel of the mission editor. It aggregates the issues detected by the other panels (each window's getMissionIssues method) for all the missions, stores them in mission._issueList and displays a sortable table window "Mission Issues Overview". The module returns a constructor: require(...)(missionEditor).

## Notes

- Recognized severities: unknown (-1), minor (1), warning (10), error (50), critical (100). Only warning and error count in importantCount.
- calculateMissionIssues ignores devMission missions when shipping_build is false (development build).
- In drawIssuesWindow, the "Level" column is sorted by sortByLevel (column 4) and the "Availability" column by sortByAvailability (column 5).
- The window's menus can automatically fix the missionTypeData issues of all the missions (checkContainer(mission, true)) or remove the excess data (checkContainer(mission, true, {})): bulk action, to be used with caution.

## Class `C`

Instance of the Issues panel. Fields: missionEditor, mission, issues = {list = {...}}.

The module returns a constructor: `local obj = require("editor_missionEditor_issues")(options)`.

| Method | Description | Line |
|---|---|---|
| `C:calculateMissionIssues(missionList, windows, missionTypeWindow)` | Recomputes all the issues: for each mission, calls setMission on missionTypeWindow then getMissionIssues(mission) on each window that defines it. Fills issue.label, severity, idx, missionId, missionType, level, availability, and for the mission _issueList (importantCount, highestSeverity, icon, color). | 188 |
| `C:draw()` | Displays, for the current mission, the bulleted list of issue labels (or "No Issues!"). Does nothing if mission._issueList does not exist. | 22 |
| `C:drawIssuesWindow()` | Draws the "mission_issues" window: bulk action menu and 7-column table (#, Type, Mission, MissionType, Level, Availability, Label). Clicking a mission opens it in the editor (setMissionById). Respects the preference missionEditor.general.shortIds. | 107 |
| `C:init(missionEditor)` | Constructor: remembers missionEditor and initializes issues.list. | 13 |
| `C:setMission(mission)` | Sets the current mission. | 18 |
| `C:showIssuesWindow()` | Shows the "mission_issues" editor window. | 182 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/missionEditor/issues.lua`.*
