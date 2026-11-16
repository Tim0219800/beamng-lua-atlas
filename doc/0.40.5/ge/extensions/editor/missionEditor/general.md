# `editor_missionEditor_general`

*File: `lua/ge/extensions/editor/missionEditor/general.lua` · VM: Game Engine (GE) · 121 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/editor/missionEditor/general")` (file under extensions/ but not a regular extension)

"General" section of the Mission Editor: edits the mission's name and description (ImGui text fields) and displays a translation icon (green if _tr finds a translation, red otherwise, with the translation in the tooltip). The module returns a constructor: require('/lua/ge/extensions/editor/missionEditor/general')(missionEditor). Any modification sets mission._dirty = true.

## Notes

- The description can be a string or a table; a table is not editable (it is displayed with dumps).
- ImGui buffers: name 1024 characters, description 2048.
- Minor bug: getMissionIssues compares the translation with the name without testing the name's type; only the description case explicitly handles a table.

## Class `C`

General section sub-window, created by the constructor returned by the module.

The module returns a constructor: `local obj = require("editor_missionEditor_general")(options)`.

| Method | Description | Line |
|---|---|---|
| `C:draw()` | Draws the Name and Description fields and their translation icons; saves the modifications into the mission at the end of the edit. | 52 |
| `C:getMissionIssues(m)` | Calls setMission then returns the issues: missing name (error), missing description (error), name without translation (warning), description without translation (warning). | 22 |
| `C:init(missionEditor)` | Constructor: remembers the reference to the missionEditor and prepares the recommended fields (recommended attributes of gameplay_missions_missions). | 11 |
| `C:setMission(mission)` | Selects the mission to edit: creates the name and description buffers and clears the cached translations. | 40 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/missionEditor/general.lua`.*
