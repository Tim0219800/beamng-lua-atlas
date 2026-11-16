# `editor_assetBrowser`

*File: `lua/ge/extensions/editor/assetBrowser.lua` · VM: Game Engine (GE) · 5849 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_assetBrowser`: `extensions.load("editor_assetBrowser")`, then the global `editor_assetBrowser`

"Asset Browser" window of the world editor: browses the asset tree of the current level (level folder), the shared art/ and vehicles/, displays thumbnails, materials, meshes and texture sets, and lets you drag them into the scene. The selected object is stored in editor.selection["asset"] and displayed by the inspector (type "asset"). A modder mostly uses it through selectFileByPath / getAssetByPath to locate a file from another tool (e.g. the scene tree "Locate in Asset Browser" menu for TSStatics).

## Notes

- The paths passed to selectFileByPath/getAssetByPath are virtual game paths starting with 'levels/...' (current level), or with the name of one of the loaded root folders (var.allDirs).
- selectFileByPath does nothing if the root is not found; if the path does not contain the root prefix, string.match(path, rootPath.."(.+)") returns nil and the following string.match(filepath, ...) call would raise an error (no guard in the code).
- onFileChanged only handles paths /levels/<current level>/... and /art/... once loading is finished (var.state == loading_done); files without an extension are ignored (treated as folders, TODO in the code).
- Preferences are under 'assetBrowser.general.*' (thumbnailSize, skipImposters, fullPathSearch, instantiateMeshInFrontOfCamera, scrollSpeed, dragDropRotationMultiplier, etc.).

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_assetBrowser.clearSelectedAsset()` | Deselects the current asset: sets selectedInABView (and selected if the asset has a type) back to false, clears editor.selection["asset"] and forgets the corresponding selection history entry. | 813 |
| `editor_assetBrowser.getAssetByPath(path)` | Finds the asset of the loaded tree matching a virtual path (e.g. 'levels/<level>/art/shapes/x.dae'). Determines the root (level folder or root folder with the same name as the first segment), descends to the folder then looks for the file. | 1736 |
| `editor_assetBrowser.getSelectedAsset()` | Returns the asset currently selected in the Asset Browser (editor.selection["asset"]). | 809 |
| `editor_assetBrowser.moveSelectionIndex(up)` | Moves the selection index in the displayed list one step up or down (clamped between 1 and var.maxListIndexVal); used for keyboard navigation (AssetBrowser action map). No effect if there is no current index. | 5819 |
| `editor_assetBrowser.onEditorActivated()` | Hook called when the editor is activated. If the selected asset is a mesh or a material, refreshes the preview (meshPreview / matPreview). *(internal)* *(hook)* | 5255 |
| `editor_assetBrowser.onEditorGui()` | Hook called every editor UI frame: draws the Asset Browser window, the image inspection window and the collection modal dialogs. *(internal)* *(hook)* | 5407 |
| `editor_assetBrowser.onEditorInitialized()` | Hook called at editor initialization: registers the 'asset' inspector handler, the windows (assetBrowser, image inspector, collection dialogs), the assetBrowserEditMode edit mode, the Window > Asset Browser menu and the "Locate in Asset Browser" scene tree entry (valid for TSStatics). *(internal)* *(hook)* | 5213 |
| `editor_assetBrowser.onEditorPreferenceValueChanged(path, value)` | Hook called when an editor preference changes; copies the 'assetBrowser.general.*' values (thumbnail size, filters, sorting, grouping, scroll speed, etc.) into the internal options. *(internal)* *(hook)* | 5595 |
| `editor_assetBrowser.onEditorRegisterPreferences(prefsRegistry)` | Hook called to declare the Asset Browser preferences (category 'assetBrowser', subcategory 'general'): skipMainFolder, skipImposters, fullPathSearch, thumbnailSize, scrollSpeed, etc. *(internal)* *(hook)* | 5651 |
| `editor_assetBrowser.onEditorToolWindowGotFocus(windowName)` | Hook called when a tool window gets focus; if it is the Asset Browser, pushes the 'AssetBrowser' action map. *(internal)* *(hook)* | 5624 |
| `editor_assetBrowser.onEditorToolWindowLostFocus(windowName)` | Hook called when a tool window loses focus; if it is the Asset Browser, removes the 'AssetBrowser' action map. *(internal)* *(hook)* | 5630 |
| `editor_assetBrowser.onFileChanged(path, type)` | Hook called when a file changes on disk. Once the tree is loaded, updates the relevant folder for files under /levels/<current level>/ or /art/: 'modified' adds/refreshes the asset (imposters, .cdae and .dae.png ignored), 'deleted' removes it. *(internal)* *(hook)* | 5313 |
| `editor_assetBrowser.selectFileByPath(path)` | Public interface: opens the file's folder in the Asset Browser, selects the file and scrolls to it. Opens the window if it is not visible. | 1673 |

### Parameter details

#### `editor_assetBrowser.getAssetByPath(path)`

Finds the asset of the loaded tree matching a virtual path (e.g. 'levels/<level>/art/shapes/x.dae'). Determines the root (level folder or root folder with the same name as the first segment), descends to the folder then looks for the file.

- `path` (*string*) : Full virtual path of the file
- **returns**: table|nil Asset Browser asset entry, or nil if the root is not found (rest of the search: inferred from code)

#### `editor_assetBrowser.getSelectedAsset()`

Returns the asset currently selected in the Asset Browser (editor.selection["asset"]).

- **returns**: table|nil Selected asset or nil

#### `editor_assetBrowser.moveSelectionIndex(up)`

Moves the selection index in the displayed list one step up or down (clamped between 1 and var.maxListIndexVal); used for keyboard navigation (AssetBrowser action map). No effect if there is no current index.

- `up` (*boolean*) : true to go up (index - 1), false/nil to go down (index + 1)

#### `editor_assetBrowser.onEditorPreferenceValueChanged(path, value)`

Hook called when an editor preference changes; copies the 'assetBrowser.general.*' values (thumbnail size, filters, sorting, grouping, scroll speed, etc.) into the internal options.

- `path` (*string*) : Preference path, e.g. 'assetBrowser.general.thumbnailSize'
- `value` (*any*) : New value

#### `editor_assetBrowser.onEditorRegisterPreferences(prefsRegistry)`

Hook called to declare the Asset Browser preferences (category 'assetBrowser', subcategory 'general'): skipMainFolder, skipImposters, fullPathSearch, thumbnailSize, scrollSpeed, etc.

- `prefsRegistry` (*table*) : Editor preferences registry

#### `editor_assetBrowser.onEditorToolWindowGotFocus(windowName)`

Hook called when a tool window gets focus; if it is the Asset Browser, pushes the 'AssetBrowser' action map.

- `windowName` (*string*) : Window name

#### `editor_assetBrowser.onEditorToolWindowLostFocus(windowName)`

Hook called when a tool window loses focus; if it is the Asset Browser, removes the 'AssetBrowser' action map.

- `windowName` (*string*) : Window name

#### `editor_assetBrowser.onFileChanged(path, type)`

Hook called when a file changes on disk. Once the tree is loaded, updates the relevant folder for files under /levels/<current level>/ or /art/: 'modified' adds/refreshes the asset (imposters, .cdae and .dae.png ignored), 'deleted' removes it.

- `path` (*string*) : Virtual path of the file
- `type` (*string*) : 'modified' or 'deleted' (the only values handled)

#### `editor_assetBrowser.selectFileByPath(path)`

Public interface: opens the file's folder in the Asset Browser, selects the file and scrolls to it. Opens the window if it is not visible.

- `path` (*string*) : Virtual path of the file, e.g. 'levels/<level>/art/shapes/x.dae'

## Calls into the engine (C++)

- `FS:` `directoryCreate`, `directoryExists`, `directoryRemove`, `fileExists`, `findFiles`, `removeFile`, `stat`
- `Sim.` `deserializeObjectsFromText`, `findObjectById`, `getUniqueName`
- `obj:` `getPosition`, `serialize`
- `scenetree.` `findObject`, `findObjectById`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/assetBrowser.lua`.*
