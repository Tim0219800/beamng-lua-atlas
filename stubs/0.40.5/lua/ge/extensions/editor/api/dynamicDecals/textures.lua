---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/api/dynamicDecals/textures.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Texture management for the editor's dynamic decals system. Scans /art/dynamicDecals/textures (*.jpg and *.png), reads/writes for each a "sidecar" file <texture>.dynDecalTexture.json (version, type, isSdfCompatible, tags, vehicle), maintains the tag indexes and migrates old sidecars via editor_api_dynamicDecals_sidecarFileMigration. A missing sidecar is created from a default template.
--- Access: extension `editor_api_dynamicDecals_textures`: `extensions.load("editor_api_dynamicDecals_textures")`, then the global `editor_api_dynamicDecals_textures`
---@class editor_api_dynamicDecals_textures
---@field textureType table<string, integer> greyscale=0, color=1, sdf=2 (obsolete), fillTexture=3
editor_api_dynamicDecals_textures = {}

--- Returns a copy of the list of textures whose sidecar was missing at the last scan, then clears the internal list.
---Source: lua/ge/extensions/editor/api/dynamicDecals/textures.lua:282
---@return string[]  Texture paths
function editor_api_dynamicDecals_textures.getAndFlushMissingSidecarFiles() end

--- Default sidecar template (version 2, type color, isSdfCompatible=false, empty tags, empty vehicle).
---Source: lua/ge/extensions/editor/api/dynamicDecals/textures.lua:281
---@return table  Template (shared table, copy before modifying)
function editor_api_dynamicDecals_textures.getSidecarTemplate() end

--- List of known distinct tags.
---Source: lua/ge/extensions/editor/api/dynamicDecals/textures.lua:290
---@return string[]|nil  Tags (nil before the first scan)
function editor_api_dynamicDecals_textures.getTags() end

--- Table tag -> list of textures carrying this tag.
---Source: lua/ge/extensions/editor/api/dynamicDecals/textures.lua:291
---@return table<string, string[]>|nil  Tag index
function editor_api_dynamicDecals_textures.getTagsWithRefs() end

--- List of known texture paths (nil before the first scan).
---Source: lua/ge/extensions/editor/api/dynamicDecals/textures.lua:280
---@return string[]|nil  Paths
function editor_api_dynamicDecals_textures.getTextureFiles() end

--- Textures folder with trailing slash: /art/dynamicDecals/textures/.
---Source: lua/ge/extensions/editor/api/dynamicDecals/textures.lua:292
---@return string  Path
function editor_api_dynamicDecals_textures.getTexturesDirectoryPath() end

--- File watching hook. For a png/jpg under the textures folder: 'added'/'modified' adds the texture (creates its sidecar if absent) and emits dynamicDecals_onTextureFileAdded(filepath); 'deleted' removes its tags and the texture, and emits dynamicDecals_onTextureFileDeleted(filepath).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/api/dynamicDecals/textures.lua:244
---@param filepath string Modified file
---@param type string 'added', 'modified' or 'deleted'
function editor_api_dynamicDecals_textures.onFileChanged(filepath, type) end

--- Reads a texture's JSON sidecar, nil if it does not exist.
---Source: lua/ge/extensions/editor/api/dynamicDecals/textures.lua:76
---@param textureFilepath string Texture path
---@return table|nil  Sidecar content
function editor_api_dynamicDecals_textures.readSidecarFile(textureFilepath) end

--- Rediscovers all textures, rebuilds the tags, migrates sidecars of version < 2 and creates the missing sidecars (listed in missingSidecarFiles).
---Source: lua/ge/extensions/editor/api/dynamicDecals/textures.lua:111
function editor_api_dynamicDecals_textures.reloadTextureFiles() end

--- Yielding equivalent of reloadTextureFiles, for a job: the discovery and each processed texture call callbacks.yield.
---Source: lua/ge/extensions/editor/api/dynamicDecals/textures.lua:162
---@param callbacks table yield(section) during discovery and after each file; onTotal(total) number of textures found; onProgress(count) textures processed since the last call
function editor_api_dynamicDecals_textures.reloadTextureFilesAsync(callbacks) end

--- Fetches the migration extension, scans the textures (blocking) and creates the textures folder if missing.
---Source: lua/ge/extensions/editor/api/dynamicDecals/textures.lua:229
function editor_api_dynamicDecals_textures.setup() end

--- Version of setup() to run in a job (jobsystem): the scan is spread over several frames. The callbacks are passed to reloadTextureFilesAsync.
---Source: lua/ge/extensions/editor/api/dynamicDecals/textures.lua:237
---@param callbacks table yield, onTotal, onProgress (see reloadTextureFilesAsync)
function editor_api_dynamicDecals_textures.setupAsync(callbacks) end

--- Tests whether a texture's sidecar exists.
---Source: lua/ge/extensions/editor/api/dynamicDecals/textures.lua:72
---@param textureFilepath string Texture path
---@return boolean  true if the sidecar exists
function editor_api_dynamicDecals_textures.sidecarFileExists(textureFilepath) end

--- Writes the sidecar and updates the tag indexes (removes the texture's old tags, adds the new ones).
---Source: lua/ge/extensions/editor/api/dynamicDecals/textures.lua:84
---@param textureFilepath string Texture path
---@param data table Sidecar content (see getSidecarTemplate)
function editor_api_dynamicDecals_textures.updateSidecarFile(textureFilepath, data) end

