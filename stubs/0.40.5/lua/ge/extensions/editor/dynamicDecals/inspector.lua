---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/dynamicDecals/inspector.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `editor_dynamicDecals_inspector` : `extensions.load("editor_dynamicDecals_inspector")`, puis la globale `editor_dynamicDecals_inspector`
---@class editor_dynamicDecals_inspector
editor_dynamicDecals_inspector = {}

---Source : lua/ge/extensions/editor/dynamicDecals/inspector.lua:104
---@param path any
---@param value any
function editor_dynamicDecals_inspector.editorPreferenceValueChanged(path, value) end

---Source : lua/ge/extensions/editor/dynamicDecals/inspector.lua:91
---@param inspectorInfo any
function editor_dynamicDecals_inspector.inspectorGuiBrush(inspectorInfo) end

---Source : lua/ge/extensions/editor/dynamicDecals/inspector.lua:64
---@param inspectorInfo any
function editor_dynamicDecals_inspector.inspectorGuiLayer(inspectorInfo) end

---Source : lua/ge/extensions/editor/dynamicDecals/inspector.lua:98
---@param prefsRegistry any
function editor_dynamicDecals_inspector.registerEditorPreferences(prefsRegistry) end

---Source : lua/ge/extensions/editor/dynamicDecals/inspector.lua:133
---@param layerTypeId any
---@param guiFn any
function editor_dynamicDecals_inspector.registerLayerGui(layerTypeId, guiFn) end

---Source : lua/ge/extensions/editor/dynamicDecals/inspector.lua:118
---@param tool_in any
function editor_dynamicDecals_inspector.setup(tool_in) end

