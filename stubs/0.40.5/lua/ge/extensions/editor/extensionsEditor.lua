---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/extensionsEditor.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- "Extensions Editor" window of the editor: lists all editor extensions (editor.allExtensionNames) and lets you enable/disable their loading by clicking the icon. The state is stored in editor.extensionsSettings[name].disabled then saved by editor.saveExtensionsSettings(). A Lua reload (Ctrl+L) is needed to apply the change; the editor's safe mode (Ctrl+F11) lets you disable a faulty extension.
--- Access: extension `editor_extensionsEditor`: `extensions.load("editor_extensionsEditor")`, then the global `editor_extensionsEditor`
---@class editor_extensionsEditor
editor_extensionsEditor = {}

--- Draws the window: help text and a one-column table with an icon button per extension (check mark = enabled, red "do_not_disturb" icon = disabled). A click toggles the disabled flag and saves the settings.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/extensionsEditor.lua:15
function editor_extensionsEditor.onEditorGui() end

--- Registers the "extensionsEditor" window (size 915x600) and the "Extensions Editor" menu entry.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/extensionsEditor.lua:59
function editor_extensionsEditor.onEditorInitialized() end

--- Empty hook (no preference handled).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/extensionsEditor.lua:64
---@param path string Path of the modified preference
---@param value any New value
function editor_extensionsEditor.onEditorPreferenceValueChanged(path, value) end

--- Empty hook: registers no preference.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/extensionsEditor.lua:67
---@param prefsRegistry table Editor preferences registry
function editor_extensionsEditor.onEditorRegisterPreferences(prefsRegistry) end

