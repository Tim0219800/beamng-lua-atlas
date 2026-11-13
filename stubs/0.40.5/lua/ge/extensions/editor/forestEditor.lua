---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/forestEditor.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `editor_forestEditor` : `extensions.load("editor_forestEditor")`, puis la globale `editor_forestEditor`
---@class editor_forestEditor
---@field dependencies table
editor_forestEditor = {}

---Source : lua/ge/extensions/editor/forestEditor.lua:3215
---@param direction any
function editor_forestEditor.beginChangeBrushSizeWithKeys(direction) end

---Source : lua/ge/extensions/editor/forestEditor.lua:1425
---@param value any
---@param step any
function editor_forestEditor.changeBrush(value, step) end

--- Drop the forest item selection, highlight included: the viewport glow is an instance flag fed by each
---  item's own selected state, so it only goes away by clearing that state and pushing the instance data
---  again. Nothing to do (and no rebuild to pay for) when nothing is selected.
---Source : lua/ge/extensions/editor/forestEditor.lua:208
function editor_forestEditor.clearForestItemsSelection() end

---Source : lua/ge/extensions/editor/forestEditor.lua:144
function editor_forestEditor.dumpBrushProperties() end

--- Debug
---Source : lua/ge/extensions/editor/forestEditor.lua:132
function editor_forestEditor.dumpForestBrushes() end

---Source : lua/ge/extensions/editor/forestEditor.lua:138
function editor_forestEditor.dumpForestBrushesMap() end

---Source : lua/ge/extensions/editor/forestEditor.lua:3216
function editor_forestEditor.endChangeBrushSizeWithKeys() end

---Source : lua/ge/extensions/editor/forestEditor.lua:3192
---@param data any
function editor_forestEditor.onDeserialize(data) end

---Source : lua/ge/extensions/editor/forestEditor.lua:3111
function editor_forestEditor.onEditorAfterSaveLevel() end

---Source : lua/ge/extensions/editor/forestEditor.lua:2881
function editor_forestEditor.onEditorAxisGizmoAligmentChanged() end

---Source : lua/ge/extensions/editor/forestEditor.lua:3179
---@param mode any
function editor_forestEditor.onEditorAxisGizmoModeChanged(mode) end

---Source : lua/ge/extensions/editor/forestEditor.lua:2040
function editor_forestEditor.onEditorGui() end

--- hooks
---Source : lua/ge/extensions/editor/forestEditor.lua:3073
function editor_forestEditor.onEditorInitialized() end

---Source : lua/ge/extensions/editor/forestEditor.lua:3133
---@param selectedIds any
---@param fieldName any
---@param fieldValue any
---@param arrayIndex any
function editor_forestEditor.onEditorInspectorFieldChanged(selectedIds, fieldName, fieldValue, arrayIndex) end

---Source : lua/ge/extensions/editor/forestEditor.lua:3159
---@param prefsRegistry any
function editor_forestEditor.onEditorRegisterPreferences(prefsRegistry) end

---Source : lua/ge/extensions/editor/forestEditor.lua:3196
function editor_forestEditor.onSerialize() end

---Source : lua/ge/extensions/editor/forestEditor.lua:1459
function editor_forestEditor.refreshForestItemDataList() end

---Source : lua/ge/extensions/editor/forestEditor.lua:3188
---@param index any
function editor_forestEditor.selectBrushByIndex(index) end

---Source : lua/ge/extensions/editor/forestEditor.lua:219
---@param forestItems any
---@param addToSelection any
function editor_forestEditor.selectForestItems(forestItems, addToSelection) end

---Source : lua/ge/extensions/editor/forestEditor.lua:367
---@param toolName any
function editor_forestEditor.selectToolByName(toolName) end

