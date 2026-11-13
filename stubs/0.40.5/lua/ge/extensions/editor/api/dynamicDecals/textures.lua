---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/api/dynamicDecals/textures.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `editor_api_dynamicDecals_textures` : `extensions.load("editor_api_dynamicDecals_textures")`, puis la globale `editor_api_dynamicDecals_textures`
---@class editor_api_dynamicDecals_textures
---@field textureType table
editor_api_dynamicDecals_textures = {}

---Source : lua/ge/extensions/editor/api/dynamicDecals/textures.lua:282
function editor_api_dynamicDecals_textures.getAndFlushMissingSidecarFiles() end

---Source : lua/ge/extensions/editor/api/dynamicDecals/textures.lua:281
function editor_api_dynamicDecals_textures.getSidecarTemplate() end

---Source : lua/ge/extensions/editor/api/dynamicDecals/textures.lua:290
function editor_api_dynamicDecals_textures.getTags() end

---Source : lua/ge/extensions/editor/api/dynamicDecals/textures.lua:291
function editor_api_dynamicDecals_textures.getTagsWithRefs() end

---Source : lua/ge/extensions/editor/api/dynamicDecals/textures.lua:280
function editor_api_dynamicDecals_textures.getTextureFiles() end

---Source : lua/ge/extensions/editor/api/dynamicDecals/textures.lua:292
function editor_api_dynamicDecals_textures.getTexturesDirectoryPath() end

---Source : lua/ge/extensions/editor/api/dynamicDecals/textures.lua:244
---@param filepath any
---@param type any
function editor_api_dynamicDecals_textures.onFileChanged(filepath, type) end

---Source : lua/ge/extensions/editor/api/dynamicDecals/textures.lua:76
---@param textureFilepath any
function editor_api_dynamicDecals_textures.readSidecarFile(textureFilepath) end

---Source : lua/ge/extensions/editor/api/dynamicDecals/textures.lua:111
function editor_api_dynamicDecals_textures.reloadTextureFiles() end

--- yielding twin of reloadTextureFiles(), for callers running inside a jobsystem job so the
---  scan spreads over several frames instead of blocking one. callbacks:
---    yield(section)    -- called during discovery and after every processed texture file
---    onTotal(total)    -- number of texture files that were found
---    onProgress(count) -- texture files processed since the last call
---Source : lua/ge/extensions/editor/api/dynamicDecals/textures.lua:162
---@param callbacks any
function editor_api_dynamicDecals_textures.reloadTextureFilesAsync(callbacks) end

--- public interface
---Source : lua/ge/extensions/editor/api/dynamicDecals/textures.lua:229
function editor_api_dynamicDecals_textures.setup() end

--- yielding twin of setup(), callbacks are forwarded to reloadTextureFilesAsync()
---Source : lua/ge/extensions/editor/api/dynamicDecals/textures.lua:237
---@param callbacks any
function editor_api_dynamicDecals_textures.setupAsync(callbacks) end

---Source : lua/ge/extensions/editor/api/dynamicDecals/textures.lua:72
---@param textureFilepath any
function editor_api_dynamicDecals_textures.sidecarFileExists(textureFilepath) end

---Source : lua/ge/extensions/editor/api/dynamicDecals/textures.lua:84
---@param textureFilepath any
---@param data any
function editor_api_dynamicDecals_textures.updateSidecarFile(textureFilepath, data) end

