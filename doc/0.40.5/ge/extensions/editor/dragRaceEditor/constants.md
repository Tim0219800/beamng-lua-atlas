# `editor_dragRaceEditor_constants`

*File: `lua/ge/extensions/editor/dragRaceEditor/constants.lua` · VM: Game Engine (GE) · 56 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_dragRaceEditor_constants`: `extensions.load("editor_dragRaceEditor_constants")`, then the global `editor_dragRaceEditor_constants`

Constants shared by the drag race editor: window name and size, settings file extension, race types, phases, starting tree types, contexts, default transform and waypoint, interface colors and dimensions.

## Notes

- The module is a simple data container, it has no function. It is loaded via require, not as an extension.
- The colors mix ColorF/ColorI (3D drawing) and ImVec4 (ImGui interface).

## Fields

| Field | Type | Description |
|---|---|---|
| `CONSTANTS` | table | WINDOW_NAME ("Drag Race Editor"), WINDOW_SIZE {x=1800,y=900}, DEFAULT_FILE_DIR ("/levels/"), FILE_EXTENSION (".dragSettings.json"), DRAG_TYPES {"headsUpRace","bracketRace"}, RACE_PHASES {"stage","countdown","race","stop"}, TREE_TYPES {".400",".500"}, CONTEXT_TYPES {"freeroam","activity"}, DEFAULT_TRANSFORM (position 0, identity rotation quaternion, scale 1), DEFAULT_WAYPOINT {speed=5, mode="limit"}, COLORS (WHITE, BLACK, RED, GREEN, BLUE, YELLOW, SUCCESS, WARNING, ERROR), UI {INPUT_WIDTH=120, BUTTON_HEIGHT=20, SPACING=5}. |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/dragRaceEditor/constants.lua`.*
