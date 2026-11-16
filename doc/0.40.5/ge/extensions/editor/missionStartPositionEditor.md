# `editor_missionStartPositionEditor`

*File: `lua/ge/extensions/editor/missionStartPositionEditor.lua` · VM: Game Engine (GE) · 286 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_missionStartPositionEditor`: `extensions.load("editor_missionStartPositionEditor")`, then the global `editor_missionStartPositionEditor`

"Edit Mission Start Position" edit mode of the World Editor (flag icon). It draws with debugDrawer a sphere and the name for each mission whose startTrigger.level is the current level, and lets you move the start point of the selected mission: click-drag, or Ctrl+click to place directly at the mouse position (camera raycast). Each move is recorded in the editor's undo history (editor.history). A button also moves all the missions located within 10 m of the selected mission to its position.

## Notes

- Color code: green = selected mission, orange = nearby missions (<= 10 m), blue = others. The sphere size increases with the distance to the camera (1.5 to 10, between 500 m and 1500 m); x1.3 for the selection, x1.2 for nearby ones.
- Modifies startTrigger.pos ({x,y,z} table) and sets mission._dirty = true; saving is done from the mission editor.
- The im.IsItemHovered() test in onUpdate is not tied to an imgui item: the mission tooltip is probably never displayed (inferred from code).

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_missionStartPositionEditor.onEditorInitialized()` | Hook called at editor initialization: declares the missionStartPositionEditMode edit mode (action map "MissionStartPositionEditor", onActivate, onDeactivate, onUpdate, onToolbar). *(internal)* *(hook)* | 267 |
| `editor_missionStartPositionEditor.setSelectedMission(mission)` | Sets the selected mission in this edit mode (useful for the mission editor). | 284 |

### Parameter details

#### `editor_missionStartPositionEditor.setSelectedMission(mission)`

Sets the selected mission in this edit mode (useful for the mission editor).

- `mission` (*table|nil*) : Mission (with startTrigger.pos) or nil to deselect.

## Calls into the engine (C++)

- `debugDrawer:` `drawSphere`, `drawText`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/missionStartPositionEditor.lua`.*
