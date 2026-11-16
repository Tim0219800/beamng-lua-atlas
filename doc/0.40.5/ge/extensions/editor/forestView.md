# `editor_forestView`

*File: `lua/ge/extensions/editor/forestView.lua` · VM: Game Engine (GE) · 157 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_forestView`: `extensions.load("editor_forestView")`, then the global `editor_forestView`

Editor "Forest View" window, intended to list the forest's ForestItemData ("theForest") as buttons sorted by name. The module is largely unfinished: the edit mode activation/deactivation hooks are commented out at export, so the list is never filled and the window stays empty.

## Notes

- Bug: forestItemDataTreeNode calls selectForestItemData, whose definition is entirely commented out; clicking a button would raise an error if the list contained elements.
- populateForestItems, onEditorEditModeActivated and onEditorEditModeDeactivated are defined but never called (the exports M.onEditorEditModeActivated/Deactivated are commented out): forestItemsInfo stays empty.

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_forestView.onEditorActivated()` | Hook called when the editor is activated; empty body. *(internal)* *(hook)* | 15 |
| `editor_forestView.onEditorGui()` | Hook called every frame by the editor: draws the "Forest View" window with one button per forestItemsInfo entry. *(internal)* *(hook)* | 86 |
| `editor_forestView.onEditorInitialized()` | Hook called at editor initialization: registers the "forestEditorView" window (220x320). *(internal)* *(hook)* | 11 |

## Calls into the engine (C++)

- `Sim.` `upcast`
- `obj:` `getId`
- `scenetree.` `findObject`, `findObjectById`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/forestView.lua`.*
