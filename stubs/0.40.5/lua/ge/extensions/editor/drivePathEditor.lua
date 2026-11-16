---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/drivePathEditor.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Drive Path Editor of the world editor: tool for drawing paths (splines) that AI vehicles follow, in free mode (hand-placed nodes, with widths and speed profile) or in navigation graph mode (choosing nodes of the map's navgraph). It also lets you record a path by driving and start playback (ai.driveUsingPath). This file is the main interface: window, mouse/keyboard input and rendering; the spline logic is in drivePathEditor/splineMgr, playback in playback and recording in record.
--- Access: extension `editor_drivePathEditor`: `extensions.load("editor_drivePathEditor")`, then the global `editor_drivePathEditor`
---@class editor_drivePathEditor
editor_drivePathEditor = {}

--- Hook called on map exit: removes all path splines, even disabled ones, to avoid invalid TSStatic pointers on the next load.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/drivePathEditor.lua:1231
function editor_drivePathEditor.onClientEndMission() end

--- Restore hook: recreates the splines from the data, recomputes the id-to-index table and relinks the vehicles. Does nothing if data is empty.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/drivePathEditor.lua:99
---@param data table|nil array returned by onSerialize
function editor_drivePathEditor.onDeserialized(data) end

--- Editor hook called every frame: updates the splines, draws the window, handles playback, recording, input and rendering of free mode or navgraph mode.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/drivePathEditor.lua:1087
function editor_drivePathEditor.onEditorGui() end

--- Hook: declares the "Drive Path Spline" edit mode (traffic cone icon) and registers the window (300x700).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/drivePathEditor.lua:1217
function editor_drivePathEditor.onEditorInitialized() end

--- Save hook before extensions reload: returns the list of serialized splines and removes the splines from the scene.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/drivePathEditor.lua:86
---@return table  array of serialized splines
function editor_drivePathEditor.onSerialize() end

--- Sets the selected node (for the selection shared between tools).
---Source: lua/ge/extensions/editor/drivePathEditor.lua:83
---@param idx integer node index (1-based)
function editor_drivePathEditor.setSelectedNodeIdx(idx) end

--- Sets the selected spline (for the selection shared between tools).
---Source: lua/ge/extensions/editor/drivePathEditor.lua:80
---@param idx integer spline index (1-based)
function editor_drivePathEditor.setSelectedSplineIdx(idx) end

