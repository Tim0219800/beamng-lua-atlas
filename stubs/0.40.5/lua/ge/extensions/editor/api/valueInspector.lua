---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/api/valueInspector.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe locale `C` de lua/ge/extensions/editor/api/valueInspector.lua (instanciée par la fonction renvoyée par le module)
---@class editor_api_valueInspector
local editor_api_valueInspector = {}

---Source : lua/ge/extensions/editor/api/valueInspector.lua:504
function editor_api_valueInspector:deleteTexObjs() end

---Source : lua/ge/extensions/editor/api/valueInspector.lua:299
---@param objectSet any
---@param fieldName any
---@param fieldNameId any
---@param fieldValue any
---@param selectedIds any
---@param val any
---@param arrayIndex any
---@param className any
function editor_api_valueInspector:displayMaterialPopupList(objectSet, fieldName, fieldNameId, fieldValue, selectedIds, val, arrayIndex, className) end

---Source : lua/ge/extensions/editor/api/valueInspector.lua:212
---@param objectSetArray any
---@param fieldName any
---@param fieldNameId any
---@param fieldValue any
---@param selectedIds any
---@param val any
---@param arrayIndex any
---@param className any
function editor_api_valueInspector:displaySimSetPopupList(objectSetArray, fieldName, fieldNameId, fieldValue, selectedIds, val, arrayIndex, className) end

---Source : lua/ge/extensions/editor/api/valueInspector.lua:426
function editor_api_valueInspector:init() end

---Source : lua/ge/extensions/editor/api/valueInspector.lua:492
---@param force any
function editor_api_valueInspector:initializeTables(force) end

---Source : lua/ge/extensions/editor/api/valueInspector.lua:488
function editor_api_valueInspector:reinitializeTables() end

---Source : lua/ge/extensions/editor/api/valueInspector.lua:500
---@param id any
function editor_api_valueInspector:setSimSetWindowFieldId(id) end

---Source : lua/ge/extensions/editor/api/valueInspector.lua:565
---@param fieldName any
---@param fieldValue any
---@param arrayIndex any
---@param fieldLabel any
---@param fieldDesc any
---@param fieldType any
---@param fieldTypeName any
---@param customData any
---@param pasteCallback any
---@param contextMenuUI any
---@param indeterminateFlags any
function editor_api_valueInspector:valueEditorGui(fieldName, fieldValue, arrayIndex, fieldLabel, fieldDesc, fieldType, fieldTypeName, customData, pasteCallback, contextMenuUI, indeterminateFlags) end

