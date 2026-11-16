---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/groundCoverEditor.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- GroundCover editor (grass, rocks, billboards spread over the terrain) of the world editor. "Ground Cover Editor" window in two columns: list of GroundCover objects on the left, details on the right (up to 8 types, object fields such as reflectScale/maxBillboardTiltAngle/shapesCastShadows, wind parameters windDirection/windGust*/windTurbulence*, validation panel). Changes go through setField/postApply and the editor's action history. Loads the editor_inspector extension.
--- Access: extension `editor_groundCoverEditor`: `extensions.load("editor_groundCoverEditor")`, then the global `editor_groundCoverEditor`
---@class editor_groundCoverEditor
editor_groundCoverEditor = {}

--- Hook called every frame by the editor: draws the window (two-column table: object list and details; falls back to a simple display if the table cannot be opened).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/groundCoverEditor.lua:1914
function editor_groundCoverEditor.onEditorGui() end

--- Hook called at editor initialization: registers the window (920x720), the groundCoverEditMode edit mode and the "Ground Cover Editor" menu entry (Terrain group).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/groundCoverEditor.lua:1960
function editor_groundCoverEditor.onEditorInitialized() end

--- Hook called when the editor's object selection changes: keeps the first selected GroundCover and invalidates the validation cache.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/groundCoverEditor.lua:1952
function editor_groundCoverEditor.onEditorObjectSelectionChanged() end

--- Shows the GroundCover editor window and activates its edit mode. Usable from a script or another tool.
---Source: lua/ge/extensions/editor/groundCoverEditor.lua:1943
function editor_groundCoverEditor.show() end

