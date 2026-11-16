# `editor_groundCoverEditor`

*File: `lua/ge/extensions/editor/groundCoverEditor.lua` · VM: Game Engine (GE) · 1978 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_groundCoverEditor`: `extensions.load("editor_groundCoverEditor")`, then the global `editor_groundCoverEditor`

GroundCover editor (grass, rocks, billboards spread over the terrain) of the world editor. "Ground Cover Editor" window in two columns: list of GroundCover objects on the left, details on the right (up to 8 types, object fields such as reflectScale/maxBillboardTiltAngle/shapesCastShadows, wind parameters windDirection/windGust*/windTurbulence*, validation panel). Changes go through setField/postApply and the editor's action history. Loads the editor_inspector extension.

## Notes

- Hardcoded limits: 8 types per GroundCover (maxTypes) and 10922 billboards per cell (maxBillboardsPerCell).
- The "Ground Cover Editor" edit mode has only one auxiliary shortcut: left click = Select.

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_groundCoverEditor.onEditorGui()` | Hook called every frame by the editor: draws the window (two-column table: object list and details; falls back to a simple display if the table cannot be opened). *(internal)* *(hook)* | 1914 |
| `editor_groundCoverEditor.onEditorInitialized()` | Hook called at editor initialization: registers the window (920x720), the groundCoverEditMode edit mode and the "Ground Cover Editor" menu entry (Terrain group). *(internal)* *(hook)* | 1960 |
| `editor_groundCoverEditor.onEditorObjectSelectionChanged()` | Hook called when the editor's object selection changes: keeps the first selected GroundCover and invalidates the validation cache. *(internal)* *(hook)* | 1952 |
| `editor_groundCoverEditor.show()` | Shows the GroundCover editor window and activates its edit mode. Usable from a script or another tool. | 1943 |

## Calls into the engine (C++)

- `Sim.` `getUniqueName`
- `obj:` `getClassName`, `getField`, `getID`, `getId`, `getName`, `postApply`, `registerObject`, `setField`
- `scenetree.` `findClassObjects`, `findObject`, `findObjectById`

**Loads extensions:** `editor_inspector`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/groundCoverEditor.lua`.*
