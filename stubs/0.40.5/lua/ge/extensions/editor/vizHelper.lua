---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/vizHelper.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Small tool for level designers (Debug > "Viz Helper" menu): it places dynamic decals of images taken from art/vizhelper/ at the spot targeted by the mouse in the 3D view, to mark things. Wheel = rotation, Ctrl+wheel = size, Alt+wheel = change image, Shift = sensitivity x10, left click = place (held = paint with a minimum distance).
--- Access: extension `editor_vizHelper`: `extensions.load("editor_vizHelper")`, then the global `editor_vizHelper`
---@class editor_vizHelper
---@field windowOpen ImGui BoolPtr Open/closed state of the window; read/write with windowOpen[0].
editor_vizHelper = {}

--- Hook called after a Lua reload: restores the window's open state.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/vizHelper.lua:211
---@param data table table produced by onSerialize
function editor_vizHelper.onDeserialized(data) end

--- Editor hook called on activation; does nothing.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/vizHelper.lua:198
function editor_vizHelper.onEditorActivated() end

--- Editor hook called on deactivation: clears savedDecals.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/vizHelper.lua:201
function editor_vizHelper.onEditorDeactivated() end

--- Editor hook called every frame: draws the window, handles input (wheel, click), does a cameraMouseRayCast, draws a green sphere at the targeted point and adds the preview decal or saves it.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/vizHelper.lua:50
function editor_vizHelper.onEditorGui() end

--- Editor hook: adds the "Viz Helper" menu entry (Debug group).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/vizHelper.lua:185
function editor_vizHelper.onEditorInitialized() end

--- Extension hook called on load: lists the files in art/vizhelper/ and builds the dropdown list string.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/vizHelper.lua:190
function editor_vizHelper.onExtensionLoaded() end

--- Hook called before a Lua reload: returns {windowOpen = bool}.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/vizHelper.lua:205
---@return table  {windowOpen = boolean}
function editor_vizHelper.onSerialize() end

--- Extension hook called every frame: redisplays all saved decals.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/vizHelper.lua:173
function editor_vizHelper.onUpdate() end

--- Opens the Viz Helper window (windowOpen[0] = true).
---Source: lua/ge/extensions/editor/vizHelper.lua:37
function editor_vizHelper.openWindow() end

