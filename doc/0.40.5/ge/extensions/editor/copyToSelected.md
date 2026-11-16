# `editor_copyToSelected`

*File: `lua/ge/extensions/editor/copyToSelected.lua` · VM: Game Engine (GE) · 498 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_copyToSelected`: `extensions.load("editor_copyToSelected")`, then the global `editor_copyToSelected`

Editor tool "Copy To Selected": chooses a base object and a list of target objects (current selection, same class or same TSStatic mesh), then creates a copy of the base object at the position of each target (via editor.saveSimObjectMemento / restoreSimObjectMemento). Options: apply the target's rotation or scale, compose rotations (target * base), local offset in meters in the target's frame, copies stored in a new SimGroup "CopiedObjects", selection of the created copies. The action goes through editor.history (undoable/redoable with forced ids).

## Notes

- Each copy is also linked to its target: its name is written into the first free "child" dynamic field (index 0..1023) of the target object; undo restores the old value of these fields.
- Local offset: X/Y/Z sliders from -50 to +50 m, applied along the axes (columns 0, 1, 2) of the target's transform.
- Relative rotation: quaternion target * base built from the forward (+Y) and up (+Z) axes via quatFromDir.
- The target identical to the base is skipped (skipId). A preview draws 0.25 m cyan spheres at the destination positions while the window is open.
- Copies are added to the parent group of the base object, otherwise to MissionGroup; with the SimGroup option, a new group is created in MissionGroup.
- The module only exports two hooks; the logic is local.

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_copyToSelected.onEditorGui()` | Draws the "Copy To Selected" window (base object, targets, options, local offsets, "Create Copies" button, error messages) and the preview of the target positions. Called every frame by the editor. After creation, emits extensions.hook('onEditorObjectSelectionChanged') if "Select Created" is checked. *(internal)* *(hook)* | 376 |
| `editor_copyToSelected.onEditorInitialized()` | Adds the "Copy To Selected" menu entry and registers the window (560x520). Called once at editor initialization. *(internal)* *(hook)* | 491 |

## Emitted hooks

Events broadcast to extensions by `extensions.hook`:

- `onEditorObjectSelectionChanged` — listened to by 8 module(s)

## Calls into the engine (C++)

- `Sim.` `getUniqueName`
- `debugDrawer:` `drawSphere`
- `obj:` `getDynDataFieldbyName`, `getField`, `getName`, `setDynDataFieldbyName`, `setField`
- `scenetree.` `findClassObjects`, `findObject`, `findObjectById`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/copyToSelected.lua`.*
