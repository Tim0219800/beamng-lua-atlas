# `editor_api_assets`

*File: `lua/ge/extensions/editor/api/assets.lua` · VM: Game Engine (GE) · 49 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_api_assets`: `extensions.load("editor_api_assets")`, then the global `editor_api_assets`

Editor API for drag-and-drop of assets (file paths as strings) between ImGui windows. On initialization, adds to the editor instance: editor.dragDropAsset (internal state), editor.dragDropSource and editor.dragDropTarget. A source and a target match if they use the same dragDropId; the data is carried in a 2048-character buffer.

## Example

```lua
-- source
editor.dragDropSource("MyAsset", "/art/shapes/x.dae", function(str) end)
-- target
editor.dragDropTarget("MyAsset")
```

## Notes

- dragDropTarget checks by assert that the payload size equals 2048; the callback registered by the source is called with the dropped string, then the state is reset.
- In dragDropSource, the code uses `im.ArrayChar` and `im.ArraySize` while the local variable is called `imgui`: `im` is not defined in this file, which would cause an error if a global `im` does not exist (inferred from code).
- Both functions are installed on the editor object, not on the module; only initialize is exported by the module.

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_api_assets.initialize(editorInstance)` | Initializes the module: stores the editor and installs dragDropAsset, dragDropSource and dragDropTarget on it. *(internal)* | 39 |

### Parameter details

#### `editor_api_assets.initialize(editorInstance)`

Initializes the module: stores the editor and installs dragDropAsset, dragDropSource and dragDropTarget on it.

- `editorInstance` (*table*) : Editor instance.

## Class `editor`

Methods added to the editor instance by this module.

Object `editor` built inside the module (e.g. by `new`), with these methods:

| Method | Description | Line |
|---|---|---|
| `editor.dragDropSource(dragDropId, data, callback)` | To be called while drawing the ImGui element that serves as the source: if a drag begins, creates the payload (data, 2048-character buffer), stores the callback and displays the text during the drag. | 13 |
| `editor.dragDropTarget(dragDropId)` | To be called after the ImGui element that serves as the target: accepts a payload with the same dragDropId, calls the source's callback with the received string then resets the state. | 25 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/api/assets.lua`.*
