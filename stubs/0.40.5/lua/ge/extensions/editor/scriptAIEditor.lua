---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/scriptAIEditor.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `editor_scriptAIEditor` : `extensions.load("editor_scriptAIEditor")`, puis la globale `editor_scriptAIEditor`
---@class editor_scriptAIEditor
editor_scriptAIEditor = {}

--- Deserialization function.
---Source : lua/ge/extensions/editor/scriptAIEditor.lua:3203
---@param dataIn any
function editor_scriptAIEditor.onDeserialized(dataIn) end

--- Functions triggered by hooks.
---Source : lua/ge/extensions/editor/scriptAIEditor.lua:1989
function editor_scriptAIEditor.onEditorGui() end

--- Called upon world editor initialization.
---Source : lua/ge/extensions/editor/scriptAIEditor.lua:3128
function editor_scriptAIEditor.onEditorInitialized() end

--- Serialization function.
---Source : lua/ge/extensions/editor/scriptAIEditor.lua:3186
function editor_scriptAIEditor.onSerialize() end

--- Triggered when a vehicle is replaced.
---Source : lua/ge/extensions/editor/scriptAIEditor.lua:3169
---@param vid any
function editor_scriptAIEditor.onVehicleReplaced(vid) end

--- Triggering when a recording is stopped.
---Source : lua/ge/extensions/editor/scriptAIEditor.lua:3153
---@param vid any
---@param data any
function editor_scriptAIEditor.onVehicleSubmitRecording(vid, data) end

