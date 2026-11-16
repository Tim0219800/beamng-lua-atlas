# `editor_toolUtilities_materialSelectionMgr`

*File: `lua/ge/extensions/editor/toolUtilities/materialSelectionMgr.lua` · VM: Game Engine (GE) · 143 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_toolUtilities_materialSelectionMgr`: `extensions.load("editor_toolUtilities_materialSelectionMgr")`, then the global `editor_toolUtilities_materialSelectionMgr`

ImGui "Material Selector" window (300 x 500) to pick a material, with thumbnails and a search bar. Used by the editor's decal tools. It lists the materials of Sim.getMaterialSet() filtered by tag (decal for decal patches, RoadAndPath for decal roads) and calls a callback with the chosen material name.

## Example

```lua
local msm = require('editor/toolUtilities/materialSelectionMgr')
msm.registerWindow()  -- at initialization
msm.openWindow()
-- every imgui frame:
msm.handleMaterialSelectionSubWindow(false, function(matName) ... end)
```

## Notes

- The material list is computed only once (on first display) and then kept.
- At most 5 thumbnail textures are loaded per frame (loadedTextures reset to 0 on each display); the others appear in the following frames. A load failure is remembered (false).
- The filter: isDecal true keeps materials tagged 'decal', false keeps those tagged 'RoadAndPath' (tags read with getField('materialTag', 0..2)). Empty names are ignored.

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_toolUtilities_materialSelectionMgr.closeWindow()` | Hides the material selection window. | 63 |
| `editor_toolUtilities_materialSelectionMgr.getTexObj(absPath)` | Returns the texture object for an absolute path, loading it via editor.texObj if needed (limited to 5 loads per frame). Returns false if loading failed, nil if the limit is reached before the first attempt. | 43 |
| `editor_toolUtilities_materialSelectionMgr.handleMaterialSelectionSubWindow(isDecal, onSelectMaterialFunct)` | To be called every frame: draws the window (search + scrolling list of materials with a diffuseMap thumbnail) and calls onSelectMaterialFunct(materialName) on click. Hides the window if there are no materials. | 66 |
| `editor_toolUtilities_materialSelectionMgr.openWindow()` | Shows the material selection window. | 60 |
| `editor_toolUtilities_materialSelectionMgr.registerWindow()` | Registers the 'materialSelect' window in the editor (editor.registerWindow). | 57 |

### Parameter details

#### `editor_toolUtilities_materialSelectionMgr.getTexObj(absPath)`

Returns the texture object for an absolute path, loading it via editor.texObj if needed (limited to 5 loads per frame). Returns false if loading failed, nil if the limit is reached before the first attempt.

- `absPath` (*string*) : Absolute path of the image.
- **returns**: table|boolean|nil Texture object (with .tex), false or nil.

#### `editor_toolUtilities_materialSelectionMgr.handleMaterialSelectionSubWindow(isDecal, onSelectMaterialFunct)`

To be called every frame: draws the window (search + scrolling list of materials with a diffuseMap thumbnail) and calls onSelectMaterialFunct(materialName) on click. Hides the window if there are no materials.

- `isDecal` (*boolean*) : true: decal patches ('decal' tag); false: decal roads ('RoadAndPath' tag).
- `onSelectMaterialFunct` (*function|nil*) : Callback called with the chosen material name.

## Calls into the engine (C++)

- `Sim.` `getMaterialSet`
- `obj:` `getField`, `getName`
- `scenetree.` `findObject`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/toolUtilities/materialSelectionMgr.lua`.*
