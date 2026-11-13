---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/inspector.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `editor_inspector` : `extensions.load("editor_inspector")`, puis la globale `editor_inspector`
---@class editor_inspector
editor_inspector = {}

---Source : lua/ge/extensions/editor/inspector.lua:1590
function editor_inspector.onEditorActivated() end

---Source : lua/ge/extensions/editor/inspector.lua:2292
function editor_inspector.onEditorAfterOpenLevel() end

---Source : lua/ge/extensions/editor/inspector.lua:1596
function editor_inspector.onEditorDeactivated() end

---Source : lua/ge/extensions/editor/inspector.lua:1484
function editor_inspector.onEditorGui() end

---Source : lua/ge/extensions/editor/inspector.lua:2234
function editor_inspector.onEditorInitialized() end

---Source : lua/ge/extensions/editor/inspector.lua:1599
---@param state any
function editor_inspector.onEditorLoadGuiInstancerState(state) end

---Source : lua/ge/extensions/editor/inspector.lua:2262
function editor_inspector.onEditorObjectSelectionChanged() end

---Source : lua/ge/extensions/editor/inspector.lua:2227
function editor_inspector.onEditorRegisterApi() end

---Source : lua/ge/extensions/editor/inspector.lua:1607
---@param state any
function editor_inspector.onEditorSaveGuiInstancerState(state) end

---Source : lua/ge/extensions/editor/inspector.lua:1007
function editor_inspector.onExtensionLoaded() end

--- Classe locale `editor` de lua/ge/extensions/editor/inspector.lua
---@class editor_inspector_editor
local editor_inspector_editor = {}

---Source : lua/ge/extensions/editor/inspector.lua:132
---@param selection any
function editor_inspector_editor.addInspectorInstance(selection) end

---Source : lua/ge/extensions/editor/inspector.lua:100
function editor_inspector_editor.checkEditorDirtyFlag() end

---Source : lua/ge/extensions/editor/inspector.lua:157
---@param idx any
function editor_inspector_editor.closeInspectorInstance(idx) end

---Source : lua/ge/extensions/editor/inspector.lua:163
function editor_inspector_editor.getInspectorInstances() end

---Source : lua/ge/extensions/editor/inspector.lua:167
function editor_inspector_editor.getInspectorTypeHandlers() end

---Source : lua/ge/extensions/editor/inspector.lua:986
---@param fieldName any
function editor_inspector_editor.inspectorHasField(fieldName) end

---Source : lua/ge/extensions/editor/inspector.lua:182
---@param uniqueName any
---@param callback any
function editor_inspector_editor.registerInspectorFieldModifier(uniqueName, callback) end

---Source : lua/ge/extensions/editor/inspector.lua:171
---@param typeName any
---@param guiCallback any
function editor_inspector_editor.registerInspectorTypeHandler(typeName, guiCallback) end

---Source : lua/ge/extensions/editor/inspector.lua:188
---@param uniqueName any
function editor_inspector_editor.unregisterInspectorFieldModifier(uniqueName) end

---Source : lua/ge/extensions/editor/inspector.lua:178
---@param typeName any
function editor_inspector_editor.unregisterInspectorTypeHandler(typeName) end

