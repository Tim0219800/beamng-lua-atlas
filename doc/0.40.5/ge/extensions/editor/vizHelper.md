# `editor_vizHelper`

*File: `lua/ge/extensions/editor/vizHelper.lua` · VM: Game Engine (GE) · 228 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_vizHelper`: `extensions.load("editor_vizHelper")`, then the global `editor_vizHelper`

Small tool for level designers (Debug > "Viz Helper" menu): it places dynamic decals of images taken from art/vizhelper/ at the spot targeted by the mouse in the 3D view, to mark things. Wheel = rotation, Ctrl+wheel = size, Alt+wheel = change image, Shift = sensitivity x10, left click = place (held = paint with a minimum distance).

## Example

```lua
extensions.load('editor_vizHelper')
editor_vizHelper.openWindow()
```

## Notes

- The placed decals are kept in a local table savedDecals and redisplayed on every onUpdate via Engine.Render.DynamicDecalMgr.addDecals; they are cleared when the editor is deactivated (onEditorDeactivated) or by the "clear" button. They are not saved in the level.
- The images are listed when the extension loads (FS:findFiles on art/vizhelper/); if the folder is empty, vizHelper[curItem+1] is nil and the path concatenation fails.
- Windowing uses im.Begin directly (a TODO in the code plans to switch to editor.beginWindow).
- Fixed decal values: fadeStart 2000, fadeEnd 2500 (m), uniform scale = Size, forwardVec rotated around the normal.

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_vizHelper.onDeserialized(data)` | Hook called after a Lua reload: restores the window's open state. *(internal)* *(hook)* | 211 |
| `editor_vizHelper.onEditorActivated()` | Editor hook called on activation; does nothing. *(internal)* *(hook)* | 198 |
| `editor_vizHelper.onEditorDeactivated()` | Editor hook called on deactivation: clears savedDecals. *(internal)* *(hook)* | 201 |
| `editor_vizHelper.onEditorGui()` | Editor hook called every frame: draws the window, handles input (wheel, click), does a cameraMouseRayCast, draws a green sphere at the targeted point and adds the preview decal or saves it. *(internal)* *(hook)* | 50 |
| `editor_vizHelper.onEditorInitialized()` | Editor hook: adds the "Viz Helper" menu entry (Debug group). *(internal)* *(hook)* | 185 |
| `editor_vizHelper.onExtensionLoaded()` | Extension hook called on load: lists the files in art/vizhelper/ and builds the dropdown list string. *(internal)* *(hook)* | 190 |
| `editor_vizHelper.onSerialize()` | Hook called before a Lua reload: returns {windowOpen = bool}. *(internal)* *(hook)* | 205 |
| `editor_vizHelper.onUpdate()` | Extension hook called every frame: redisplays all saved decals. *(internal)* *(hook)* | 173 |
| `editor_vizHelper.openWindow()` | Opens the Viz Helper window (windowOpen[0] = true). | 37 |

### Parameter details

#### `editor_vizHelper.onDeserialized(data)`

Hook called after a Lua reload: restores the window's open state.

- `data` (*table*) : table produced by onSerialize

#### `editor_vizHelper.onSerialize()`

Hook called before a Lua reload: returns {windowOpen = bool}.

- **returns**: table {windowOpen = boolean}

## Fields

| Field | Type | Description |
|---|---|---|
| `windowOpen` | ImGui BoolPtr | Open/closed state of the window; read/write with windowOpen[0]. |

## Calls into the engine (C++)

- `FS:` `findFiles`
- `debugDrawer:` `drawSphere`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/vizHelper.lua`.*
