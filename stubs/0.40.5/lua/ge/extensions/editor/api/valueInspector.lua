---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/api/valueInspector.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Inspector object returned by the module constructor (require(...)()). Instance methods.
---@class editor_api_valueInspector
local editor_api_valueInspector = {}

--- Clears the cache of preview textures used in the material selector.
---Source: lua/ge/extensions/editor/api/valueInspector.lua:504
function editor_api_valueInspector:deleteTexObjs() end

--- Like displaySimSetPopupList but for materials: popup with texture previews (texObjs cache) and filtering by name or tag.
---Source: lua/ge/extensions/editor/api/valueInspector.lua:299
---@param objectSet table List of material objects.
---@param fieldName string Field name.
---@param fieldNameId string ImGui id of the field.
---@param fieldValue string Current value.
---@param selectedIds table Ids of the selected objects.
---@param val any customData passed to the callback (inferred from code).
---@param arrayIndex integer|nil Index in an array field.
---@param className string|nil Class (inferred from code).
function editor_api_valueInspector:displayMaterialPopupList(objectSet, fieldName, fieldNameId, fieldValue, selectedIds, val, arrayIndex, className) end

--- Displays a "..." button and the current value, and on click a filterable popup listing the objects of the given SimSets so one can be picked.
---Source: lua/ge/extensions/editor/api/valueInspector.lua:212
---@param objectSetArray table List of SimSets/groups to browse.
---@param fieldName string Field name.
---@param fieldNameId string ImGui id of the field.
---@param fieldValue string Current value.
---@param selectedIds table Ids of the selected objects.
---@param val any customData passed to the callback (inferred from code).
---@param arrayIndex integer|nil Index in an array field.
---@param className string|nil Class of objects to list (inferred from code).
function editor_api_valueInspector:displaySimSetPopupList(objectSetArray, fieldName, fieldNameId, fieldValue, selectedIds, val, arrayIndex, className) end

--- Initializes the ImGui buffers (text, integers, floats, boolean, combo) and the default fields. Called automatically by the constructor.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/api/valueInspector.lua:426
function editor_api_valueInspector:init() end

--- Builds (only once, unless forced) the global annotation and datablock tables used by the selectors.
---Source: lua/ge/extensions/editor/api/valueInspector.lua:492
---@param force boolean|nil true to rebuild even if already initialized.
function editor_api_valueInspector:initializeTables(force) end

--- Marks the global tables as to be rebuilt at the next initializeTables.
---Source: lua/ge/extensions/editor/api/valueInspector.lua:488
function editor_api_valueInspector:reinitializeTables() end

--- Sets the id of the field whose SimSet selection popup window is open (nil to close it).
---Source: lua/ge/extensions/editor/api/valueInspector.lua:500
---@param id string|nil Field id ("##fieldName").
function editor_api_valueInspector:setSimSetWindowFieldId(id) end

--- Draws a complete field: label (with fieldDesc tooltip, copy/paste menu) and an editing widget chosen by fieldTypeName then fieldType. Calls a custom editor if one is registered for (selection class, fieldName). Any change is sent to self.setValueCallback.
---Source: lua/ge/extensions/editor/api/valueInspector.lua:565
---@param fieldName string Technical field name.
---@param fieldValue any Current value (string, number, table depending on the type).
---@param arrayIndex integer|nil Index if array field.
---@param fieldLabel string Displayed label.
---@param fieldDesc string|nil Description displayed as a tooltip.
---@param fieldType string Field type: 'float', 'int', 'bool', 'filename', 'Point3F', 'ColorF', 'string', etc.
---@param fieldTypeName string Engine type name: 'TypeMaterialName', 'TypeShapeFilename', 'TypeCommand', etc.
---@param customData any Opaque data passed back to the callback.
---@param pasteCallback function|nil pasteCallback(fieldName, value, arrayIndex, customData) called on paste.
---@param contextMenuUI function|nil Additional context menu content (inferred from code).
---@param indeterminateFlags integer|nil Indeterminate-value flags (0 by default).
function editor_api_valueInspector:valueEditorGui(fieldName, fieldValue, arrayIndex, fieldLabel, fieldDesc, fieldType, fieldTypeName, customData, pasteCallback, contextMenuUI, indeterminateFlags) end

