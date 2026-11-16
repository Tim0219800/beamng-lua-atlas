# `editor_cubemapEditor`

*File: `lua/ge/extensions/editor/cubemapEditor.lua` · VM: Game Engine (GE) · 760 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_cubemapEditor`: `extensions.load("editor_cubemapEditor")`, then the global `editor_cubemapEditor`

World Editor cubemap editor (Assets > "Cubemap Editor" menu, "cubemapEditor" window). It lists the CubemapData class objects of the level, lets you create, save and delete a cubemap, assign each of the 6 faces (drag and drop or button), and capture the 6 faces from the camera position (captureCameraCubemap, resolution 128 to 2048 px, power of 2) before assigning them automatically. It also exports the data to a main.materials.json file. Can be opened by another tool via show(onSelectCb) to pick a cubemap.

## Example

```lua
editor_cubemapEditor.show(function(name) print('chosen cubemap: '..name) end, 'myCubemap')
```

## Notes

- Captured face files must be named <prefix><0..5>.hdr.dds; if one is missing, the assignment fails with a status error message.
- Face order displayed: 0 +X right, 1 -X left, 2 -Y back, 3 +Y front, 4 +Z up, 5 -Z down.
- The default base folder is <level path>/art/cubemaps/<datablock name>; it is created if it does not exist.
- The capture position is stored in the captureLocation field ("x,y,z"), used by the "Go to cubemap location" button.

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_cubemapEditor.onEditorGui()` | Hook called every editor frame: draws the window. *(internal)* *(hook)* | 751 |
| `editor_cubemapEditor.onEditorInitialized()` | Hook called at World Editor initialization: registers the window (750x380, hidden) and the "Cubemap Editor" menu entry in the Assets group. *(internal)* *(hook)* | 745 |
| `editor_cubemapEditor.show(onSelectCb, preselectName)` | Opens the cubemap editor window. Loads the cubemap list on the first call, preselects the one whose name is given (otherwise the first if nothing is selected). If a callback is provided, the window shows Select/Cancel buttons; Select calls the callback with the cubemap name and closes the window. | 734 |

### Parameter details

#### `editor_cubemapEditor.show(onSelectCb, preselectName)`

Opens the cubemap editor window. Loads the cubemap list on the first call, preselects the one whose name is given (otherwise the first if nothing is selected). If a callback is provided, the window shows Select/Cancel buttons; Select calls the callback with the cubemap name and closes the window.

- `onSelectCb` (*function|nil*) : called with the name (string) of the chosen cubemap
- `preselectName` (*string|nil*) : name of the cubemap to preselect

## Calls into the engine (C++)

- `FS:` `directoryCreate`, `directoryExists`, `fileExists`
- `obj:` `setField`
- `scenetree.` `findClassObjects`, `findObject`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/cubemapEditor.lua`.*
