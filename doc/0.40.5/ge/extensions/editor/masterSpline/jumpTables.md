# `editor_masterSpline_jumpTables`

*File: `lua/ge/extensions/editor/masterSpline/jumpTables.lua` · VM: Game Engine (GE) · 389 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_masterSpline_jumpTables`: `extensions.load("editor_masterSpline_jumpTables")`, then the global `editor_masterSpline_jumpTables`

Master Spline tool utility module: groups dispatch tables keyed by a layer's link type (tool prefix of meshSpline, assemblySpline, decalSpline, roadSpline, treeSpline). Each table maps that type to the matching tool function (create, restore, unlink, delete, lock, serialize...). Useful to understand how a Master Spline drives its child splines.

## Notes

- All the tables are keyed by the string returned by each tool's getToolPrefixStr() (layer.linkType).
- The module only exports tables, no functions; the call is made through jumps.xxxJumpTable[linkType](...).
- eachObjectJumpTable only covers mesh and assembly (the only tools whose manual changes can be restored after undoing an unlock).
- For the road (roadSpline), the functions come from groupMgr (groups) and not from a splineMgr.

## Fields

| Field | Type | Description |
|---|---|---|
| `createJumpTable` | table<string, function> | Creates a new spline in the target tool (addNewMeshSpline, addNewAssemblySpline, addNewDecalSpline, addNewGroup, addNewTreeSpline). |
| `eachObjectJumpTable` | table<string, function(id: any, fn: function)> | Iterates over the objects of a linked spline (eachObjectById), for splineLock; mesh and assembly only. |
| `getLastCreatedSplineJumpTable` | table<string, function> | Returns the last spline of the tool's list (or nil if empty); optimized for undo/redo. |
| `removeJumpTable` | table<string, function> | Deletes a linked spline (removeLinkedXxx of each tool). |
| `restoreJumpTable` | table<string, function(data: table)> | Restores a spline from data: deep copy, added to the tool's list, id-to-index table recomputed; returns the spline. |
| `serializeJumpTable` | table<string, function(linkedSplineId: any)> | Returns a deep copy of the linked spline (deepCopyXxx), or nil if not found. |
| `setLinkJumpTable` | table<string, function> | setLink of each tool: sets the link state of a layer. |
| `setLinkedSplineDirtyJumpTable` | table<string, function(id: any)> | Sets isDirty = true on the linked spline, if it exists. |
| `setLockedJumpTable` | table<string, function(id: any, isLocked: boolean)> | Locks/unlocks a child spline via the tool's setLockedById; follows the lock of its Master Spline. |
| `setNameJumpTable` | table<string, function(id: any, splineName: string)> | Renames the linked spline (name field); for mesh, assembly and road, also renames the scene tree folder (sceneTreeFolderId) and refreshes the tree window. |
| `toolNavigation` | table<string, table> | For each type: uiModule (extension name, e.g. 'editor_meshSpline'), getModeKey, getSplines and getIdToIdxMap, to navigate to the matching tool. |
| `unlinkJumpTable` | table<string, function(linkedSplineId: any)> | Unlinks the spline: isLink = false, linkId = nil, isDirty = true. |

## Calls into the engine (C++)

- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/masterSpline/jumpTables.lua`.*
