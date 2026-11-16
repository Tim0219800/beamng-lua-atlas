---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/extensionsDebug.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Editor debug window (Window > Debug > Extensions Debug menu) that lists the loaded Lua extensions (extensions.getLoadedExtensionsNames()) as an imgui tree. Each extension expands to recursively show the content of its table (imguiUtils.addRecursiveTreeTable). Useful to a modder to inspect the state of an extension live.
--- Access: extension `editor_extensionsDebug`: `extensions.load("editor_extensionsDebug")`, then the global `editor_extensionsDebug`
---@class editor_extensionsDebug
editor_extensionsDebug = {}

--- Draws the "Extensions Debug Window": Filters checkbox then one tree node per loaded extension, with the recursive content of extensions[name] when Filters is unchecked.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/extensionsDebug.lua:33
function editor_extensionsDebug.onEditorGui() end

--- Called when the editor is initialized: registers the "extensionsDebug" window and the "Extensions Debug" menu entry (Debug group).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/extensionsDebug.lua:59
function editor_extensionsDebug.onEditorInitialized() end

--- Hook called when the extension is loaded; does nothing here.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/extensionsDebug.lua:56
function editor_extensionsDebug.onExtensionLoaded() end

