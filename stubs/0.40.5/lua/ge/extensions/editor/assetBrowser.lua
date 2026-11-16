---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/assetBrowser.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- "Asset Browser" window of the world editor: browses the asset tree of the current level (level folder), the shared art/ and vehicles/, displays thumbnails, materials, meshes and texture sets, and lets you drag them into the scene. The selected object is stored in editor.selection["asset"] and displayed by the inspector (type "asset"). A modder mostly uses it through selectFileByPath / getAssetByPath to locate a file from another tool (e.g. the scene tree "Locate in Asset Browser" menu for TSStatics).
--- Access: extension `editor_assetBrowser`: `extensions.load("editor_assetBrowser")`, then the global `editor_assetBrowser`
---@class editor_assetBrowser
editor_assetBrowser = {}

--- Deselects the current asset: sets selectedInABView (and selected if the asset has a type) back to false, clears editor.selection["asset"] and forgets the corresponding selection history entry.
---Source: lua/ge/extensions/editor/assetBrowser.lua:813
function editor_assetBrowser.clearSelectedAsset() end

--- Finds the asset of the loaded tree matching a virtual path (e.g. 'levels/<level>/art/shapes/x.dae'). Determines the root (level folder or root folder with the same name as the first segment), descends to the folder then looks for the file.
---Source: lua/ge/extensions/editor/assetBrowser.lua:1736
---@param path string Full virtual path of the file
---@return table|nil  Asset Browser asset entry, or nil if the root is not found (rest of the search: inferred from code)
function editor_assetBrowser.getAssetByPath(path) end

--- Returns the asset currently selected in the Asset Browser (editor.selection["asset"]).
---Source: lua/ge/extensions/editor/assetBrowser.lua:809
---@return table|nil  Selected asset or nil
function editor_assetBrowser.getSelectedAsset() end

--- Moves the selection index in the displayed list one step up or down (clamped between 1 and var.maxListIndexVal); used for keyboard navigation (AssetBrowser action map). No effect if there is no current index.
---Source: lua/ge/extensions/editor/assetBrowser.lua:5819
---@param up boolean true to go up (index - 1), false/nil to go down (index + 1)
function editor_assetBrowser.moveSelectionIndex(up) end

--- Hook called when the editor is activated. If the selected asset is a mesh or a material, refreshes the preview (meshPreview / matPreview).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/assetBrowser.lua:5255
function editor_assetBrowser.onEditorActivated() end

--- Hook called every editor UI frame: draws the Asset Browser window, the image inspection window and the collection modal dialogs.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/assetBrowser.lua:5407
function editor_assetBrowser.onEditorGui() end

--- Hook called at editor initialization: registers the 'asset' inspector handler, the windows (assetBrowser, image inspector, collection dialogs), the assetBrowserEditMode edit mode, the Window > Asset Browser menu and the "Locate in Asset Browser" scene tree entry (valid for TSStatics).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/assetBrowser.lua:5213
function editor_assetBrowser.onEditorInitialized() end

--- Hook called when an editor preference changes; copies the 'assetBrowser.general.*' values (thumbnail size, filters, sorting, grouping, scroll speed, etc.) into the internal options.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/assetBrowser.lua:5595
---@param path string Preference path, e.g. 'assetBrowser.general.thumbnailSize'
---@param value any New value
function editor_assetBrowser.onEditorPreferenceValueChanged(path, value) end

--- Hook called to declare the Asset Browser preferences (category 'assetBrowser', subcategory 'general'): skipMainFolder, skipImposters, fullPathSearch, thumbnailSize, scrollSpeed, etc.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/assetBrowser.lua:5651
---@param prefsRegistry table Editor preferences registry
function editor_assetBrowser.onEditorRegisterPreferences(prefsRegistry) end

--- Hook called when a tool window gets focus; if it is the Asset Browser, pushes the 'AssetBrowser' action map.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/assetBrowser.lua:5624
---@param windowName string Window name
function editor_assetBrowser.onEditorToolWindowGotFocus(windowName) end

--- Hook called when a tool window loses focus; if it is the Asset Browser, removes the 'AssetBrowser' action map.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/assetBrowser.lua:5630
---@param windowName string Window name
function editor_assetBrowser.onEditorToolWindowLostFocus(windowName) end

--- Hook called when a file changes on disk. Once the tree is loaded, updates the relevant folder for files under /levels/<current level>/ or /art/: 'modified' adds/refreshes the asset (imposters, .cdae and .dae.png ignored), 'deleted' removes it.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/assetBrowser.lua:5313
---@param path string Virtual path of the file
---@param type string 'modified' or 'deleted' (the only values handled)
function editor_assetBrowser.onFileChanged(path, type) end

--- Public interface: opens the file's folder in the Asset Browser, selects the file and scrolls to it. Opens the window if it is not visible.
---Source: lua/ge/extensions/editor/assetBrowser.lua:1673
---@param path string Virtual path of the file, e.g. 'levels/<level>/art/shapes/x.dae'
function editor_assetBrowser.selectFileByPath(path) end

