# `editor_masterSpline_burn`

*File: `lua/ge/extensions/editor/masterSpline/burn.lua` · VM: Game Engine (GE) · 64 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_masterSpline_burn`: `extensions.load("editor_masterSpline_burn")`, then the global `editor_masterSpline_burn`

Locking ("burn" = lock) of an editor Master Spline. A Master Spline has a stack of linked child splines (mesh, assembly, road, tree, decal); locking it also locks all its children: they stay in their tools, uneditable, and their generated content is saved with the level. Unlocking makes everything editable again.

## Notes

- Each lock/unlock is an undoable editor.history action ("Lock Master Spline" / "Unlock Master Spline").
- On unlock, the manual changes to the children (mesh and assembly tools only, via eachObjectJumpTable) are recorded in data.records; a later lock (e.g. undo) restores them via splineLock.restore.
- Sets spline.isEnabled = not isLocked and calls editor.setDirty().

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_masterSpline_burn.run(idx)` | Burn button action: locks the Master Spline at index idx (equivalent to setLocked(idx, true)). | 56 |
| `editor_masterSpline_burn.setLocked(idx, isLocked)` | Locks or unlocks the Master Spline at index idx, with all its linked children, in a single undoable transaction. Does nothing if the index is invalid. | 47 |

### Parameter details

#### `editor_masterSpline_burn.run(idx)`

Burn button action: locks the Master Spline at index idx (equivalent to setLocked(idx, true)).

- `idx` (*integer*) : Index of the Master Spline in the list (1-based).

#### `editor_masterSpline_burn.setLocked(idx, isLocked)`

Locks or unlocks the Master Spline at index idx, with all its linked children, in a single undoable transaction. Does nothing if the index is invalid.

- `idx` (*integer*) : Index of the Master Spline in the list (1-based).
- `isLocked` (*boolean*) : true to lock, false to unlock.

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/masterSpline/burn.lua`.*
