# `editor_forestTsstaticMover`

*File: `lua/ge/extensions/editor/forestTsstaticMover.lua` · VM: Game Engine (GE) · 565 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_forestTsstaticMover`: `extensions.load("editor_forestTsstaticMover")`, then the global `editor_forestTsstaticMover`

Editor tool "Forest TSStatic Mover" (Window > Terrain menu) that converts instances between the forest (ForestItem) and TSStatic objects. Two buttons: "Move selected ForestItems -> TSStatic" (Forest Tools mode required) and "Move selected TSStatic -> ForestItems" (Object Select mode required). Options: select the created objects, move all instances of the same mesh, put the created TSStatics in a new SimGroup. The action is recorded in the history (undo/redo).

## Notes

- The folder (SimGroup) option only applies in the ForestItems to TSStatic direction: forest items do not use a SimGroup.
- The tool displays "Forest data is missing in the level" if the level has no forest object (core_forest.getForestObject()).

**Dependencies (loaded first):** `core_forest`

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_forestTsstaticMover.onEditorGui()` | Hook called every frame by the editor: draws the "Forest TSStatic Mover" window (current edit mode, selected shape, checkboxes, conversion buttons grayed out depending on the mode, last error). *(internal)* *(hook)* | 492 |
| `editor_forestTsstaticMover.onEditorInitialized()` | Hook called at editor initialization: adds the "Forest TSStatic Mover" menu entry (Terrain group) and registers the window (560x260). *(internal)* *(hook)* | 556 |

## Fields

| Field | Type | Description |
|---|---|---|
| `dependencies` | string[] | Extensions loaded before this module: {"core_forest"}. |

## Emitted hooks

Events broadcast to extensions by `extensions.hook`:

- `onEditorObjectSelectionChanged` — listened to by 8 module(s)

## Calls into the engine (C++)

- `Sim.` `getUniqueName`
- `obj:` `getId`, `registerObject`, `setField`, `setInternalName`, `setName`, `setScale`, `setTransform`
- `scenetree.` `findClassObjects`, `findObject`, `findObjectById`
- `worldEditorCppApi.` `rebuildForestManagerInstanceData`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/forestTsstaticMover.lua`.*
