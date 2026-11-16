# `editor_mainUpdate`

*File: `lua/ge/extensions/editor/mainUpdate.lua` · VM: Game Engine (GE) · 48 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_mainUpdate`: `extensions.load("editor_mainUpdate")`, then the global `editor_mainUpdate`

Editor update loop, called every frame via onUpdate when the editor is active. It updates and draws the object icons, broadcasts preference changes (and saves them), calls the current edit mode's onUpdate, then presents the interface (GUI, context menus, modal boxes, save dialog for modified tools).

## Notes

- Does nothing if editor.active is false.
- Preferences are saved as soon as a preference has changed in the frame; the code contains a TODO to add a delay.
- M.onEditorInitialized is explicitly set to nil.

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_mainUpdate.onExtensionLoaded()` | Load hook. Empty body. *(internal)* *(hook)* | 37 |
| `editor_mainUpdate.onExtensionUnloaded()` | Unload hook. Empty body. *(internal)* *(hook)* | 40 |
| `editor_mainUpdate.onUpdate(dtReal, dtSim, dtRaw)` | Editor per-frame loop: object icons, modified preferences, editMode.onUpdate, gizmos (if editor.hideObjectIcons is false) then editor.guiModule.presentGui. *(internal)* *(hook)* | 13 |

### Parameter details

#### `editor_mainUpdate.onUpdate(dtReal, dtSim, dtRaw)`

Editor per-frame loop: object icons, modified preferences, editMode.onUpdate, gizmos (if editor.hideObjectIcons is false) then editor.guiModule.presentGui.

- `dtReal` (*number*) : Real-time delta of the frame (s), passed to the edit mode and to presentGui.
- `dtSim` (*number*) : Simulation time delta (s).
- `dtRaw` (*number*) : Raw time delta (s).

## Fields

| Field | Type | Description |
|---|---|---|
| `onEditorInitialized` | nil |  |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/mainUpdate.lua`.*
