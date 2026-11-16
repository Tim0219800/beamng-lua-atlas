---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/api/dataBlock.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Editor API for managing engine datablocks (shared data objects: sounds, particles, physical materials, etc.). initialize(editor) adds the creation, lookup, save and delete functions to the editor object; persistence goes through a PersistenceManager named dataBlockPersistMan. Default file: art/datablocks/managedDatablocks.json.
--- Access: extension `editor_api_dataBlock`: `extensions.load("editor_api_dataBlock")`, then the global `editor_api_dataBlock`
---@class editor_api_dataBlock
editor_api_dataBlock = {}

--- Creates the dataBlockPersistMan PersistenceManager if it does not exist and installs the functions on the editor object.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/api/dataBlock.lua:99
---@param editorInstance table editor object
function editor_api_dataBlock.initialize(editorInstance) end

--- Functions added to the editor object by initialize.
---@class editor_api_dataBlock_editor
local editor_api_dataBlock_editor = {}

--- Creates a datablock of the given type, optionally copies the fields of an existing one, registers it, names it, adds it to the dataBlockGroup group and to the datablock set, then marks it as modified for the file.
---Source: lua/ge/extensions/editor/api/dataBlock.lua:13
---@param name string|nil Unique name
---@param type string Datablock type (class)
---@param copyFrom string|nil Name of a datablock to copy fields from (ignored if nil or empty)
---@param filename string|nil Target file, default art/datablocks/managedDatablocks.json
---@return integer  ID of the created object
function editor_api_dataBlock_editor.createDataBlock(name, type, copyFrom, filename) end

--- Looks up a datablock by name by iterating over the set.
---Source: lua/ge/extensions/editor/api/dataBlock.lua:92
---@param name string Name to find
---@return userdata|nil  Datablock found or nil
function editor_api_dataBlock_editor.findDataBlock(name) end

--- Returns the set of all datablocks (Sim.getDataBlockSet()).
---Source: lua/ge/extensions/editor/api/dataBlock.lua:86
---@return userdata  Datablock SimSet
function editor_api_dataBlock_editor.getDataBlocks() end

--- Returns whether the datablock has been modified.
---Source: lua/ge/extensions/editor/api/dataBlock.lua:75
---@param dataBlock userdata Datablock object
---@return boolean  true if modified
function editor_api_dataBlock_editor.isDataBlockDirty(dataBlock) end

--- Removes the datablock from the set and, if it has a file name, deletes it from its file.
---Source: lua/ge/extensions/editor/api/dataBlock.lua:51
---@param dataBlock userdata Datablock object
function editor_api_dataBlock_editor.removeDataBlockFromFile(dataBlock) end

--- Associates the datablock with a file (by default its current file) then saves it immediately.
---Source: lua/ge/extensions/editor/api/dataBlock.lua:69
---@param dataBlock userdata Datablock object
---@param filename string|nil Target file
function editor_api_dataBlock_editor.saveDataBlockToFile(dataBlock, filename) end

--- Saves the datablock if it is modified.
---Source: lua/ge/extensions/editor/api/dataBlock.lua:45
---@param dataBlock userdata Datablock object
function editor_api_dataBlock_editor.saveDirtyDataBlock(dataBlock) end

--- Marks the datablock as modified (file = its file, otherwise the default file).
---Source: lua/ge/extensions/editor/api/dataBlock.lua:81
---@param dataBlock userdata Datablock object
function editor_api_dataBlock_editor.setDataBlockDirty(dataBlock) end

