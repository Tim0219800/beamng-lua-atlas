---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/objectScreenSizeViz.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- "Object Screen Size" debug tool (Debug menu) of the World Editor. For the selected objects (editor.selection.object) and forest items (editor.selection.forestItem), it computes the distance to the camera and the size in pixels on screen of their world bounding box (projection of the 8 corners with the camera's field of view). It can draw the box (orange lines), a camera-center line (magenta) and an overlay rectangle on screen. Useful to tune LOD distances and the visible size of objects.
--- Access: extension `editor_objectScreenSizeViz`: `extensions.load("editor_objectScreenSizeViz")`, then the global `editor_objectScreenSizeViz`
---@class editor_objectScreenSizeViz
editor_objectScreenSizeViz = {}

--- Editor hook called every frame: draws the "Object Screen Size" window (display checkboxes and results per selected object) and the debug lines.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/objectScreenSizeViz.lua:160
function editor_objectScreenSizeViz.onEditorGui() end

--- Hook called at editor initialization: registers the window (480x320) and the "Object Screen Size" menu entry (Debug group).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/objectScreenSizeViz.lua:259
function editor_objectScreenSizeViz.onEditorInitialized() end

