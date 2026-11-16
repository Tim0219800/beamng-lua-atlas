---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/dynamicDecals/textures.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Decal texture browser of the Dynamic Decals tool (interface). Adds the "Textures" (order 10) and "Tags" (order 20) tabs to the browser, an inspector for the selection `editor.selection["dynamicDecalTexture"]` (editing of the sidecar file's metadata/tags), multiple selection (Shift = range, Ctrl = add), a context menu to assign a texture to a property and a notification when missing metadata files have been created. The file logic is in editor_api_dynamicDecals_textures.
--- Access: extension `editor_dynamicDecals_textures`: `extensions.load("editor_dynamicDecals_textures")`, then the global `editor_dynamicDecals_textures`
---@class editor_dynamicDecals_textures
editor_dynamicDecals_textures = {}

--- Hook called when a texture file is added to the watched folder: if missing metadata files were created, adds a notification with selection buttons.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/dynamicDecals/textures.lua:544
---@param filepath string Path of the added file (not used directly).
function editor_dynamicDecals_textures.dynamicDecals_onTextureFileAdded(filepath) end

--- Hook called when a texture file is deleted: removes it from the `dynamicDecalTexture` selection (which becomes nil if empty).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/dynamicDecals/textures.lua:572
---@param filepath string Path of the deleted file.
function editor_dynamicDecals_textures.dynamicDecals_onTextureFileDeleted(filepath) end

--- Hook called when a preference changes. Does nothing here.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/dynamicDecals/textures.lua:257
---@param path string Preference path.
---@param value any New value.
function editor_dynamicDecals_textures.editorPreferenceValueChanged(path, value) end

--- Returns the decal textures folder (delegates to editor_api_dynamicDecals_textures).
---Source: lua/ge/extensions/editor/dynamicDecals/textures.lua:585
---@return string  Path of the textures folder.
function editor_dynamicDecals_textures.getTexturesDirectoryPath() end

--- Registers the subcategory `dynamicDecalsTool.textureBrowser` (loadImagesPerFrameCount, enableVirtualScrolling, texturePreviewSize).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/dynamicDecals/textures.lua:249
---@param prefsRegistry table Editor preferences registry.
function editor_dynamicDecals_textures.registerEditorPreferences(prefsRegistry) end

--- Called by the tool: gets the related modules, registers the Textures and Tags tabs, the "Browser / Textures" doc page and the inspector of the dynamicDecalTexture type, creates the textures folder, initializes the textures API and notifies about missing metadata files.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/dynamicDecals/textures.lua:492
---@param tool_in table Reference to the editor_dynamicDecalsTool tool.
function editor_dynamicDecals_textures.setup(tool_in) end

