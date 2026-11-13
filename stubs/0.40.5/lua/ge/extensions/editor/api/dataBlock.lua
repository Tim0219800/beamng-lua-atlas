---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/api/dataBlock.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `editor_api_dataBlock` : `extensions.load("editor_api_dataBlock")`, puis la globale `editor_api_dataBlock`
---@class editor_api_dataBlock
editor_api_dataBlock = {}

---Source : lua/ge/extensions/editor/api/dataBlock.lua:99
---@param editorInstance any
function editor_api_dataBlock.initialize(editorInstance) end

--- Classe locale `editor` de lua/ge/extensions/editor/api/dataBlock.lua
---@class editor_api_dataBlock_editor
local editor_api_dataBlock_editor = {}

--- Create a new data block.
---  @param name the data block unique name
---  @param type the data block type
---  @param copyFrom the data block to be copied, can be nil
---  @param filename the data block filename
---Source : lua/ge/extensions/editor/api/dataBlock.lua:13
---@param name any
---@param type any
---@param copyFrom any
---@param filename any
function editor_api_dataBlock_editor.createDataBlock(name, type, copyFrom, filename) end

--- Returns the datablock object by its name, or nil if none found
---  @param name the name of the data block to find
---Source : lua/ge/extensions/editor/api/dataBlock.lua:92
---@param name any
function editor_api_dataBlock_editor.findDataBlock(name) end

--- Returns the data block objects array
---Source : lua/ge/extensions/editor/api/dataBlock.lua:86
function editor_api_dataBlock_editor.getDataBlocks() end

--- Returns true if data block was modified
---Source : lua/ge/extensions/editor/api/dataBlock.lua:75
---@param dataBlock any
function editor_api_dataBlock_editor.isDataBlockDirty(dataBlock) end

--- Delete a data block from its containing file.
---  @param dataBlock the data block object to be removed from the file
---Source : lua/ge/extensions/editor/api/dataBlock.lua:51
---@param dataBlock any
function editor_api_dataBlock_editor.removeDataBlockFromFile(dataBlock) end

--- Save a data block to a file.
---  @param dataBlock the data block to be saved into the file
---  @param filename the file where to save the data block
---Source : lua/ge/extensions/editor/api/dataBlock.lua:69
---@param dataBlock any
---@param filename any
function editor_api_dataBlock_editor.saveDataBlockToFile(dataBlock, filename) end

--- Save a modified data block.
---  @param dataBlock the data block object to be saved if dirty (modified)
---Source : lua/ge/extensions/editor/api/dataBlock.lua:45
---@param dataBlock any
function editor_api_dataBlock_editor.saveDirtyDataBlock(dataBlock) end

--- Set the dirty state (was modified) of the data block.
---  @param dataBlock the datablock to report as modified
---Source : lua/ge/extensions/editor/api/dataBlock.lua:81
---@param dataBlock any
function editor_api_dataBlock_editor.setDataBlockDirty(dataBlock) end

