# `editor_toolUtilities_bake`

*File: `lua/ge/extensions/editor/toolUtilities/bake.lua` · VM: Game Engine (GE) · 196 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_toolUtilities_bake`: `extensions.load("editor_toolUtilities_bake")`, then the global `editor_toolUtilities_bake`

Shared 'Bake' helper of the editor's spline tools. As long as a spline belongs to its tool, its generated objects (TSStatic, DecalRoad, river) are transient (canSave=false). Bake commits them to the level: sets objects and SimGroup folder to canSave=true and removes the spline from the tool without deleting anything. Everything is driven by a `spec` table provided by the tool (toolId, displayName, getBakeTarget, rebuildNow, burn, detach, finalizeFolder, removeFromTool, captureState, restoreState, findSpline, optionally iconColor/iconSize/bakeIcon/canBake/rowIconSize). The operation is a single undoable history transaction, without a dialog.

## Notes

- LOCK mode: if spec.setLockedById exists, the button deletes nothing: it locks the spline (isEnabled=false), its objects are saved with the level and collide; it stays in the tool and can be unlocked (undoable).
- Default bakeability rule: spline enabled, not linked (isLink), with at least 2 nodes; can be overridden by spec.canBake.
- rowButton: after a click (returns true), the caller must call editor.endWindow() then return, because the tool's item list was modified during iteration.
- renderButton calls im.NextColumn(); renderButtonInline does not handle any column.

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_toolUtilities_bake.burnById(spec, id)` | Master-Spline propagation: bakes the spline with the given id (typically a linked child) without opening its own history transaction; the Master Spline wraps everything in one action. | 166 |
| `editor_toolUtilities_bake.renderButton(spec)` | Column variant: draws the Bake button as a column cell (the caller must increase its im.Columns by 1). If there is no bakeable spline selected, the cell is an empty Dummy. | 142 |
| `editor_toolUtilities_bake.renderButtonInline(spec)` | Inline variant: draws the Bake button (or a Dummy) without column handling; the caller does its own im.SameLine() beforehand. | 151 |
| `editor_toolUtilities_bake.rowButton(spec, spline)` | Row variant: Bake button for the spline of a list row (small icon), or Dummy if it is not bakeable. A click bakes immediately and returns true. | 178 |
| `editor_toolUtilities_bake.setLocked(spec, spline, isLocked)` | Locks/unlocks `spline` in one undoable history transaction. Used by the flame button and the tool's lock toggle. | 114 |
| `editor_toolUtilities_bake.unburn(data)` | Resumes a bake: deletes the burned objects and the planted forest items, reloads the collision and sets the folder back to transient (cansave=false). | 72 |

### Parameter details

#### `editor_toolUtilities_bake.burnById(spec, id)`

Master-Spline propagation: bakes the spline with the given id (typically a linked child) without opening its own history transaction; the Master Spline wraps everything in one action.

- `spec` (*table*) : Configuration table (must have findSpline).
- `id` (*any*) : Spline id.
- **returns**: table|nil { manifest, items, folderId } to allow undo, or nil if the id is not found.

#### `editor_toolUtilities_bake.renderButton(spec)`

Column variant: draws the Bake button as a column cell (the caller must increase its im.Columns by 1). If there is no bakeable spline selected, the cell is an empty Dummy.

- `spec` (*table*) : Tool configuration table (see module).

#### `editor_toolUtilities_bake.renderButtonInline(spec)`

Inline variant: draws the Bake button (or a Dummy) without column handling; the caller does its own im.SameLine() beforehand.

- `spec` (*table*) : Tool configuration table.

#### `editor_toolUtilities_bake.rowButton(spec, spline)`

Row variant: Bake button for the spline of a list row (small icon), or Dummy if it is not bakeable. A click bakes immediately and returns true.

- `spec` (*table*) : Tool configuration table.
- `spline` (*table*) : Spline of the row.
- **returns**: boolean true if a bake occurred (the caller must end its window). Always false in LOCK mode.

#### `editor_toolUtilities_bake.setLocked(spec, spline, isLocked)`

Locks/unlocks `spline` in one undoable history transaction. Used by the flame button and the tool's lock toggle.

- `spec` (*table*) : Configuration table (must have setLockedById).
- `spline` (*table*) : Spline (uses spline.id).
- `isLocked` (*boolean*) : true to lock, false to unlock.

#### `editor_toolUtilities_bake.unburn(data)`

Resumes a bake: deletes the burned objects and the planted forest items, reloads the collision and sets the folder back to transient (cansave=false).

- `data` (*table*) : Record from doBake/burnById (manifest, items, folderId).

## Calls into the engine (C++)

- `be:` `reloadCollision`
- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/toolUtilities/bake.lua`.*
