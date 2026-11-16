---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/api/material.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Editor API for manipulating materials (`Material` objects, materials.json files): creation, copy, move to another file, property modification, deletion. `initialize` installs the functions on the `editor` object. Disk writes go through the PersistenceManager `scenetree.matLuaEd_PersistMan`; deleting a JSON entry is done by text manipulation so as not to reorder the whole file (jsonWriteFile sorts the keys).
--- Access: extension `editor_api_material`: `extensions.load("editor_api_material")`, then the global `editor_api_material`
---@class editor_api_material
editor_api_material = {}

--- Registers a 'materialPersistMan' PersistenceManager if it does not exist, remembers the editor and installs createMaterial, setMaterialProperty, removeMaterialFromJson, moveMaterial, copyMaterial, copyMaterialAsNew, deleteMaterial on it.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/api/material.lua:369
---@param editorInstance table `editor` object
function editor_api_material.initialize(editorInstance) end

--- Functions added to `editor` by initialize.
---@class editor_api_material_editor
local editor_api_material_editor = {}

--- Copies all the parameters (all layers and dynamic fields) of a source material onto an existing target material, keeping the target's name, mapTo and file. The target must be in a .json; it is reloaded and saved.
---Source: lua/ge/extensions/editor/api/material.lua:285
---@param source table|string source Material or name
---@param target table|string target Material or name
---@return boolean  false if either is not a Material, if source = target or if the target is not in a json
function editor_api_material_editor.copyMaterial(source, target) end

--- Copies a material into a new material (name and mapTo = newName) written to the given file.
---Source: lua/ge/extensions/editor/api/material.lua:315
---@param source table|string source Material or name
---@param newName string name of the new material (non-empty, unused)
---@param newFilename string destination materials.json file (existing folder)
---@return boolean  true if created
function editor_api_material_editor.copyMaterialAsNew(source, newName, newFilename) end

--- Creates a new Material (version 1.5) and writes it to disk. Fails if the name is empty, already taken, or if the folder does not exist. If mapTo is empty, the material name is used.
---Source: lua/ge/extensions/editor/api/material.lua:12
---@param materialName string material name
---@param materialFilename string path of the materials.json to write
---@param materialMapTo string mapTo value (mesh material name)
---@return boolean  true if created
function editor_api_material_editor.createMaterial(materialName, materialFilename, materialMapTo) end

--- Deletes the Material object from the scene and its entry in its JSON file (via removeMaterialFromJson).
---Source: lua/ge/extensions/editor/api/material.lua:351
---@param material table|string Material or its name
---@return boolean  true if it was a Material
function editor_api_material_editor.deleteMaterial(material) end

--- Moves a material to another file (saves it in the new one) then removes its entry from the old file if it was an existing .json.
---Source: lua/ge/extensions/editor/api/material.lua:188
---@param material table|string Material or its name
---@param newFilename string destination file (existing folder required)
---@return boolean  false if not a Material, same file or nonexistent folder
function editor_api_material_editor.moveMaterial(material, newFilename) end

--- Deletes the top-level `materialName` entry of a materials.json file by text editing (handles commas, independent of indentation) and rewrites the file. Logs an error/warning and returns nothing if the file or the entry is not found.
---Source: lua/ge/extensions/editor/api/material.lua:79
---@param materialName string key of the material to remove
---@param materialFilename string path of the JSON file
function editor_api_material_editor.removeMaterialFromJson(materialName, materialFilename) end

--- Sets a material field on a layer then reloads the material (does not save to disk).
---Source: lua/ge/extensions/editor/api/material.lua:60
---@param material table|string Material or its name
---@param property string field name
---@param layer integer layer index (0 to 3)
---@param value string field value in text format
---@return boolean  true if the object is a Material
function editor_api_material_editor.setMaterialProperty(material, property, layer, value) end

