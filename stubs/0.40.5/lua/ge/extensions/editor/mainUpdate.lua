---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/mainUpdate.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Editor update loop, called every frame via onUpdate when the editor is active. It updates and draws the object icons, broadcasts preference changes (and saves them), calls the current edit mode's onUpdate, then presents the interface (GUI, context menus, modal boxes, save dialog for modified tools).
--- Access: extension `editor_mainUpdate`: `extensions.load("editor_mainUpdate")`, then the global `editor_mainUpdate`
---@class editor_mainUpdate
---@field onEditorInitialized any
editor_mainUpdate = {}

--- Load hook. Empty body.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/mainUpdate.lua:37
function editor_mainUpdate.onExtensionLoaded() end

--- Unload hook. Empty body.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/mainUpdate.lua:40
function editor_mainUpdate.onExtensionUnloaded() end

--- Editor per-frame loop: object icons, modified preferences, editMode.onUpdate, gizmos (if editor.hideObjectIcons is false) then editor.guiModule.presentGui.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/mainUpdate.lua:13
---@param dtReal number Real-time delta of the frame (s), passed to the edit mode and to presentGui.
---@param dtSim number Simulation time delta (s).
---@param dtRaw number Raw time delta (s).
function editor_mainUpdate.onUpdate(dtReal, dtSim, dtRaw) end

