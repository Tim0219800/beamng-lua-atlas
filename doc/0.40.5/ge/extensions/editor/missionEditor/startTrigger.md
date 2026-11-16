# `editor_missionEditor_startTrigger`

*File: `lua/ge/extensions/editor/missionEditor/startTrigger.lua` · VM: Game Engine (GE) · 218 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/editor/missionEditor/startTrigger")` (file under extensions/ but not a regular extension)

"StartTrigger" panel of the mission editor. It edits mission.startTrigger: type "coordinates" (level + position, rotation and radius editable with a gizmo, drawn with debugDrawer), "league" (startable from the career progress screen in a given level) or "none". Changing the type remembers the previous values of each type. The module returns a constructor: require(...)(missionEditor).

## Notes

- Default values of a new trigger: coordinates = {level = 'gridmap', pos = {0,0,0}, radius = 3, rot = {0,0,0,1}}; league = {level = 'gridmap'}.
- The gizmo and the drawing (red sphere, prisms) are only active if getCurrentLevelIdentifier() equals startTrigger.level.
- The transform helper's scale is used as the radius; pos and rot are stored as tables.
- The types "automatic", "world" and "level" exist in newStartTrigger but not in startTriggerTypes (not offered in the combo).

## Class `C`

Instance of the panel. Fields: missionEditor, name = 'StartTrigger', mission, fields, sortedLevels (sorted levels).

The module returns a constructor: `local obj = require("editor_missionEditor_startTrigger")(options)`.

| Method | Description | Line |
|---|---|---|
| `C:draw()` | Draws the trigger type combo then the editor of the chosen type (level, position, radius). | 158 |
| `C:getStartTriggerTransform()` | Returns the transform helper if the current level is the trigger's level. | 203 |
| `C:init(missionEditor)` | Constructor: lists and sorts the levels (getAllLevelIdentifiers). | 136 |
| `C:setMission(mission)` | Sets the mission, resets the fields, stops the gizmo and repositions it if the trigger is of type coordinates. | 147 |

## Calls into the engine (C++)

- `debugDrawer:` `drawSphere`, `drawSquarePrism`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/missionEditor/startTrigger.lua`.*
