---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/materialEditor.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `editor_materialEditor` : `extensions.load("editor_materialEditor")`, puis la globale `editor_materialEditor`
---@class editor_materialEditor
---@field customMaterialsArray table
---@field customMaterialsArrayPtr any
---@field dbg boolean
---@field o table
---@field v table
editor_materialEditor = {}

---Source : lua/ge/extensions/editor/materialEditor.lua:1749
---@param label any
---@param property any
---@param id any
---@param layer any
---@param labelSameLine any
function editor_materialEditor.colorEdit4(label, property, id, layer, labelSameLine) end

---Source : lua/ge/extensions/editor/materialEditor.lua:1552
---@param label any
---@param property any
---@param layer any
function editor_materialEditor.deleteMapButton(label, property, layer) end

---Source : lua/ge/extensions/editor/materialEditor.lua:1598
---@param label any
---@param property any
---@param layer any
---@param additionalGuiFn any
function editor_materialEditor.imageButton(label, property, layer, additionalGuiFn) end

---Source : lua/ge/extensions/editor/materialEditor.lua:1869
---@param label any
---@param property any
---@param float_step any
---@param float_step_fast any
---@param string_format any
---@param layer any
---@param tooltip any
function editor_materialEditor.inputFloat(label, property, float_step, float_step_fast, string_format, layer, tooltip) end

---Source : lua/ge/extensions/editor/materialEditor.lua:3786
function editor_materialEditor.onEditorActivated() end

---Source : lua/ge/extensions/editor/materialEditor.lua:3816
function editor_materialEditor.onEditorDeactivated() end

---Source : lua/ge/extensions/editor/materialEditor.lua:3846
function editor_materialEditor.onEditorDeleteSelection() end

---Source : lua/ge/extensions/editor/materialEditor.lua:3552
function editor_materialEditor.onEditorGui() end

---Source : lua/ge/extensions/editor/materialEditor.lua:3827
function editor_materialEditor.onEditorInitialized() end

---Source : lua/ge/extensions/editor/materialEditor.lua:3843
function editor_materialEditor.onEditorObjectSelectionChanged() end

---Source : lua/ge/extensions/editor/materialEditor.lua:3753
---@param path any
---@param value any
function editor_materialEditor.onEditorPreferenceValueChanged(path, value) end

---Source : lua/ge/extensions/editor/materialEditor.lua:3771
---@param prefsRegistry any
function editor_materialEditor.onEditorRegisterPreferences(prefsRegistry) end

---Source : lua/ge/extensions/editor/materialEditor.lua:3738
---@param files any
function editor_materialEditor.onFilesChanged(files) end

---Source : lua/ge/extensions/editor/materialEditor.lua:3729
---@param oid any
---@param nid any
---@param player any
function editor_materialEditor.onVehicleSwitched(oid, nid, player) end

---Source : lua/ge/extensions/editor/materialEditor.lua:948
---@param matName any
---@param clearFilter any
function editor_materialEditor.selectMaterialByName(matName, clearFilter) end

---Source : lua/ge/extensions/editor/materialEditor.lua:1247
---@param materialObj any
function editor_materialEditor.setMaterialDirty(materialObj) end

---Source : lua/ge/extensions/editor/materialEditor.lua:1254
---@param materialObj any
---@param property any
---@param layer any
---@param value any
function editor_materialEditor.setProperty(materialObj, property, layer, value) end

---Source : lua/ge/extensions/editor/materialEditor.lua:3005
function editor_materialEditor.showMaterialEditor() end

