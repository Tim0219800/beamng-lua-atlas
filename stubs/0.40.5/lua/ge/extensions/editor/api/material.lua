---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/api/material.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `editor_api_material` : `extensions.load("editor_api_material")`, puis la globale `editor_api_material`
---@class editor_api_material
editor_api_material = {}

---Source : lua/ge/extensions/editor/api/material.lua:369
---@param editorInstance any
function editor_api_material.initialize(editorInstance) end

--- Classe locale `editor` de lua/ge/extensions/editor/api/material.lua
---@class editor_api_material_editor
local editor_api_material_editor = {}

--- Copies all parameters of a material onto an existing material, keeping the target's name, mapTo and file.
---  param 'source'; type 'class<Material>' || 'string';
---  param 'target'; type 'class<Material>' || 'string';
---  returns; type 'bool';
---Source : lua/ge/extensions/editor/api/material.lua:285
---@param source any
---@param target any
function editor_api_material_editor.copyMaterial(source, target) end

--- Copies a material into a new material with the given name, written to the given materials.json file.
---  param 'source'; type 'class<Material>' || 'string';
---  param 'newName'; type 'string';
---  param 'newFilename'; type 'string';
---  returns; type 'bool';
---Source : lua/ge/extensions/editor/api/material.lua:315
---@param source any
---@param newName any
---@param newFilename any
function editor_api_material_editor.copyMaterialAsNew(source, newName, newFilename) end

--- Creates a new material object with given params and writes it to disk.
---  param 'materialName'; type 'string';
---  param 'materialFilename'; type 'string';
---  param 'materialMapTo'; type 'number';
---  returns; type 'bool';
---Source : lua/ge/extensions/editor/api/material.lua:12
---@param materialName any
---@param materialFilename any
---@param materialMapTo any
function editor_api_material_editor.createMaterial(materialName, materialFilename, materialMapTo) end

---Source : lua/ge/extensions/editor/api/material.lua:351
---@param material any
function editor_api_material_editor.deleteMaterial(material) end

--- Moves a material to another materials.json file (existing or new) and removes it from its source file.
---  param 'material'; type 'class<Material>' || 'string';
---  param 'newFilename'; type 'string';
---  returns; type 'bool';
---Source : lua/ge/extensions/editor/api/material.lua:188
---@param material any
---@param newFilename any
function editor_api_material_editor.moveMaterial(material, newFilename) end

--- Removes a single material entry from a materials.json file using text manipulation.
---  This avoids re-serializing the whole file (jsonWriteFile sorts keys alphabetically),
---  which would otherwise reorder every entry and produce huge diffs in version control.
---Source : lua/ge/extensions/editor/api/material.lua:79
---@param materialName any
---@param materialFilename any
function editor_api_material_editor.removeMaterialFromJson(materialName, materialFilename) end

--- Sets a property of a material.
---  param 'material'; type 'class<Material>' || 'string';
---  param 'property'; type 'string';
---  param 'layer'; type 'number';
---  param 'value'; type 'string';
---  returns; type 'bool';
---Source : lua/ge/extensions/editor/api/material.lua:60
---@param material any
---@param property any
---@param layer any
---@param value any
function editor_api_material_editor.setMaterialProperty(material, property, layer, value) end

