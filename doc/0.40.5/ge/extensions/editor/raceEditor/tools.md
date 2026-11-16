# `editor_raceEditor_tools`

*File: `lua/ge/extensions/editor/raceEditor/tools.lua` · VM: Game Engine (GE) · 346 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/editor/raceEditor/tools")` (file under extensions/ but not a regular extension)

"Tools" sub-window of the race editor (raceEditor). "Side Decorators" section: generates decorations (TSStatic .dae or prefab) on both sides of the pathnodes, with position/rotation/scale offsets and alignment mode (terrain, pathnode, absolute), colored line preview and Create / Replace / Remove buttons ("<name>_decoration" SimGroup in MissionGroup). "Pathnode Tools" section: drop all nodes to the ground, align normals to the terrain, set all radii, remove redundant BeamNGWaypoints, align to grid, delete all segments. "Debug Tools" section: open the test window and path/autoConfig dumps. The module returns a constructor: require('/lua/ge/extensions/editor/raceEditor/tools')(raceEditor).

## Notes

- Initial values: position offset (0, 0, 0.2), rotation (0, 15, 0) in degrees (converted to radians), scale (1, 1, 1), alignment mode "terrain".
- Default shape for left and right: art/shapes/race/sign_checkpoint.dae.
- Probable bug: "Drop All Pathnodes to Terrain Height" writes via changeFieldMulti('pos', ...) a number (terrain height) into the nodes' pos field, which is a vec3; only z should change.
- Bug: setFieldsUndo iterates oldDataMap with ipairs while the keys are node IDs (sparse table); undo therefore only restores consecutive IDs starting from 1.
- Bug: C:selector uses the variable "value" (undefined) and calls self:changeField which does not exist in this file; the method is not called by the module.
- "Align All Pathnodes to Grid", "Remove Redundant BeamNGWaypoints" and "Remove All Segments" modify directly without going through the history (not undoable).
- The left shape's mode is "unknown" and the right one's is "none" if the extension is neither dae nor prefab; in that case no decoration is created for that side (createDecoration only handles 'dae' and 'prefab').

## Class `C`

Tools window (windowDescription = 'Tools'). Instantiated with init(raceEditor).

The module returns a constructor: `local obj = require("editor_raceEditor_tools")(options)`.

| Method | Description | Line |
|---|---|---|
| `C:changeFieldMulti(field, newDataMap)` | Modifies the same field of several pathnodes in a single history action (old values stored for undo). | 113 |
| `C:createDecoration(transforms)` | Creates a "<path name>_decoration" SimGroup (numeric suffix if the name already exists) in MissionGroup and places one object per transform in it: TSStatic for a .dae, prefab (spawnPrefab) for a .prefab / .prefab.json, depending on the side (l/r). Remembers the group as the last created group. | 42 |
| `C:displayClassification(classification, name, field, tt)` | Displays a "name" line with a check or cross icon depending on classification[field]. | 298 |
| `C:draw()` | Called every frame: draws the tools UI. | 38 |
| `C:drawGeneralInfo()` | Draws all the content: side decorations, pathnode tools and debug tools. | 129 |
| `C:existsIcon(f)` | Displays a check icon if the file exists (FS:fileExists), otherwise an error icon, with a path tooltip. | 92 |
| `C:getSideTransformParameters()` | Returns the side decoration parameters entered in the window, to pass to pathnode:getSideTransforms. | 123 |
| `C:init(raceEditor)` | Stores raceEditor and initializes the decoration position, rotation and scale offsets. | 19 |
| `C:selected()` | Called when the tab becomes active; does nothing. | 35 |
| `C:selector(name, objects, fieldName, clrI, tt)` | Dropdown to select a path object for a field (see notes: non-functional and unused here). | 311 |
| `C:setPath(path)` | Sets the race path being edited. | 32 |
| `C:unselect()` | Called when the tab is left; does nothing. | 36 |

## Calls into the engine (C++)

- `FS:` `fileExists`
- `debugDrawer:` `drawLine`, `drawTextAdvanced`
- `scenetree.` `findObject`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/raceEditor/tools.lua`.*
