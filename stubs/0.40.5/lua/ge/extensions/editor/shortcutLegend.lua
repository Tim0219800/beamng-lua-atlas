---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/shortcutLegend.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- World editor window (no title bar) that displays a legend of the shortcuts of the active edit mode. It reads either editor.editMode.getLegendCurrentActionNames(), or the actions of the mode's actionMap (keyboard and mouse bindings from core_input_bindings), plus editor.editMode.auxShortcuts, then sorts them and displays them inline. An editor tool modder fills auxShortcuts or getLegendCurrentActionNames so that their shortcuts appear.
--- Access: extension `editor_shortcutLegend`: `extensions.load("editor_shortcutLegend")`, then the global `editor_shortcutLegend`
---@class editor_shortcutLegend
editor_shortcutLegend = {}

--- Hook called when the edit mode changes: requests a rebuild of the shortcut list.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/shortcutLegend.lua:165
---@param oldEditMode table Old edit mode.
---@param newEditMode table New edit mode.
function editor_shortcutLegend.onEditorEditModeChanged(oldEditMode, newEditMode) end

--- Hook called every frame of the editor UI: rebuilds the shortcut list if needed and draws the centered legend with key badges.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/shortcutLegend.lua:22
function editor_shortcutLegend.onEditorGui() end

--- Hook called at editor initialization: fills the modifier name table (Ctrl, Shift, Alt, LMB, MMB, RMB, MouseWheel, Copy, Paste, etc.), registers and shows the shortcutLegend window.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/shortcutLegend.lua:140
function editor_shortcutLegend.onEditorInitialized() end

--- Extension load hook; empty.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/shortcutLegend.lua:137
function editor_shortcutLegend.onExtensionLoaded() end

