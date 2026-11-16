---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/masterSpline.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Master Spline tool of the World Editor ("masterSpline" edit mode). A Master Spline is a master curve (nodes, widths, normals) that drives a stack of layers, each linked to a child spline of another tool (mesh, assembly, decal, road, tree) offset laterally. The file mostly contains the imgui interface ("masterSpline" window, turn handles, gizmo, terraforming, auto road, homologation, session); the data lives in masterSpline/splineMgr.lua. It is meant for level creators, not for vehicles.
--- Access: extension `editor_masterSpline`: `extensions.load("editor_masterSpline")`, then the global `editor_masterSpline`
---@class editor_masterSpline
---@field dependencies string[] Extensions loaded before this one to guarantee the serialization order: editor_assemblySpline, editor_decalSpline, editor_meshSpline, editor_roadSpline, editor_treeSpline.
editor_masterSpline = {}

--- Hook called when leaving the map: unlinks and deletes all the Master Splines and recomputes the id-to-index table.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/masterSpline.lua:1922
function editor_masterSpline.onClientEndMission() end

--- Deserialization hook: deletes the existing Master Splines, recreates those from data, then recomputes the id-to-index table.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/masterSpline.lua:203
---@param data table[] Data produced by onSerialize.
function editor_masterSpline.onDeserialized(data) end

--- Hook called every editor frame: live optimization of the selected spline, rebuilding of dirty splines, then, if the tool is active, window, pan camera, engineered turn handles, mouse/keyboard events, terraforming and drawing.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/masterSpline.lua:1788
function editor_masterSpline.onEditorGui() end

--- Editor initialization hook: registers the "Master Spline" edit mode (editor.editModes.masterSpline) and the "masterSpline" window.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/masterSpline.lua:1908
function editor_masterSpline.onEditorInitialized() end

--- Editor serialization hook: serializes all the Master Splines, unlinks their children, deletes the Master Splines and reloads the collision.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/masterSpline.lua:183
---@return table[]  Array of the serialized Master Splines.
function editor_masterSpline.onSerialize() end

--- Sets the index of the selected node (cross-selection between tools).
---Source: lua/ge/extensions/editor/masterSpline.lua:145
---@param idx integer Node index (1-based).
function editor_masterSpline.setSelectedNodeIdx(idx) end

--- Sets the index of the selected Master Spline (cross-selection between tools).
---Source: lua/ge/extensions/editor/masterSpline.lua:142
---@param idx integer Index in the list (1-based).
function editor_masterSpline.setSelectedSplineIdx(idx) end

