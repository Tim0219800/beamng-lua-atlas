# `editor_missionEditor_conditions`

*File: `lua/ge/extensions/editor/missionEditor/conditions.lua` · VM: Game Engine (GE) · 395 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/editor/missionEditor/conditions")` (file under extensions/ but not a regular extension)

Condition editor of the Mission Editor, used twice by missionEditor.lua: "Start Condition" (field startCondition) and "Visibility Conditions" (field visibleCondition). At startup, it loads all the files of /lua/ge/extensions/gameplay/missions/unlocks/conditions/ (via FS:findFiles and require) and merges their condition tables; each condition type has a suitable ImGui display (mission, value, numeric comparison, career level, WP category, manufacturer, transmission layout, propulsion, branch, league, nested conditions). The module returns a constructor: require(...)(missionEditor, field, name).

## Notes

- Conditions are stored in mission[field] as {type = '...', ...}; nested conditions are in condition.nested ("Add" button adds {type = 'always'}).
- The progressKey field of a progress condition accepts 'any' (any key) and 'default' (default key).
- Bug: getMissionIssues first tests whether mission[field] is nil, but does not stop the function; the next line then reads .type on nil and causes an error.
- The draw state (index, depth) is global to the module, shared by all instances; it is reset in draw.
- The available conditions depend on the files present in the unlocks/conditions folder; duplicate keys are overwritten by the last file read.

## Class `C`

Sub-window for editing a mission condition.

The module returns a constructor: `local obj = require("editor_missionEditor_conditions")(options)`.

| Method | Description | Line |
|---|---|---|
| `C:draw()` | Draws the mission's condition (default {type='always'}) with its label, recursively for nested conditions. | 228 |
| `C:getMissionIssues(m)` | Calls setMission then returns the issues: no condition defined (error), or condition set to "never" (error). | 46 |
| `C:init(missionEditor, field, name)` | Constructor: remembers missionEditor, the edited field and the displayed label, then loads all the available conditions from gameplay/missions/unlocks/conditions/. | 27 |
| `C:setMission(mission)` | Selects the mission to edit and clears the input fields cache. | 41 |

## Calls into the engine (C++)

- `FS:` `findFiles`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/missionEditor/conditions.lua`.*
