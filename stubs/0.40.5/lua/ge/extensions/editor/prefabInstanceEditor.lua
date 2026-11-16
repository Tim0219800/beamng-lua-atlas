---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/prefabInstanceEditor.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Adds a "PrefabInstance" section at the top of the editor inspector when all the selected objects are PrefabInstance. If at least one instance no longer matches its parent template (matchesParentTemplate), it displays the "Make new template" and "Apply to parent" buttons.
--- Access: extension `editor_prefabInstanceEditor`: `extensions.load("editor_prefabInstanceEditor")`, then the global `editor_prefabInstanceEditor`
---@class editor_prefabInstanceEditor
editor_prefabInstanceEditor = {}

--- Called at editor initialization; only writes a log line (level I).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/prefabInstanceEditor.lua:15
function editor_prefabInstanceEditor.onEditorInitialized() end

--- Called every frame at the top of the inspector. Displays the collapsible "PrefabInstance" header only if the whole selection is made of PrefabInstance; the buttons only appear if an instance differs from its parent.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/prefabInstanceEditor.lua:19
---@param inspectorInfo table Inspector information; the previousSelectedIds field (list of object IDs) is used.
function editor_prefabInstanceEditor.onEditorInspectorHeaderGui(inspectorInfo) end

