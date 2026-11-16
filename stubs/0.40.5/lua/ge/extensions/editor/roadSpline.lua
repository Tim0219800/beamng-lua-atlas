---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/roadSpline.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- "Road Spline" tool of the level editor: you draw a spline (nodes + widths) and the tool automatically generates DecalRoads stacked in layers (roadway, center/edge lines, edge fades, tire marks, cracks, patches...), with optional terrain painting. This file is mostly the ImGui interface ("roadSplineEditor" window, "Road Spline" edit mode); the data logic is in editor/roadSpline/groupMgr and layerMgr. It also registers the "Convert to Road Spline" entry in the scene tree context menu to convert existing DecalRoads. Useful to a modder mainly to lock/select a spline from another tool (Master Spline).
--- Access: extension `editor_roadSpline`: `extensions.load("editor_roadSpline")`, then the global `editor_roadSpline`
---@class editor_roadSpline
editor_roadSpline = {}

--- Called when leaving the level: deletes the active unlinked groups (locked and linked ones stay in the list) and recomputes the id -> index table.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/roadSpline.lua:1680
function editor_roadSpline.onClientEndMission() end

--- Deserialization hook after Lua reload: recreates the groups, takes back the kept DecalRoads of the locked roads (groupMgr.adopt) and recomputes the id -> index table.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/roadSpline.lua:162
---@param data table Value returned by onSerialize.
function editor_roadSpline.onDeserialized(data) end

--- Called every frame by the editor. Updates the dirty groups (even if the tool is inactive), then, if the tool is active, draws the main window, handles the selection polygon, material selection, wireframe, nodes/handles and the gizmo.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/roadSpline.lua:1504
function editor_roadSpline.onEditorGui() end

--- Called when the editor initializes: declares the roadSplineEditor edit mode ("Road Spline"), registers the tool window and the material selection window, and adds "Convert to Road Spline" to the scene tree context menu.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/roadSpline.lua:1657
function editor_roadSpline.onEditorInitialized() end

--- Serialization hook before Lua reload. Returns the list of encoded groups; for a locked road, stores the ids of its DecalRoads (keptObjects) and leaves the objects in the scene. Then empties the list of groups.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/roadSpline.lua:144
---@return table  Array of serialized groups (strings encoded by string.buffer).
function editor_roadSpline.onSerialize() end

--- Locks or unlocks the spline whose id is given and rebuilds it immediately. When locked (isEnabled = false), the road is no longer rebuilt by the tool and its DecalRoads are saved with the level. Also used by the Master Spline for linked child splines. Does nothing if the id is unknown.
---Source: lua/ge/extensions/editor/roadSpline.lua:86
---@param id string Identifier (UUID) of the group/spline.
---@param isLocked boolean true to lock (the last displayed state is rebuilt first), false to unlock.
function editor_roadSpline.setLockedById(id, isLocked) end

--- Sets the index of the selected node in the current spline (selection shared between tools).
---Source: lua/ge/extensions/editor/roadSpline.lua:119
---@param idx integer Index (1-based) of the node.
function editor_roadSpline.setSelectedNodeIdx(idx) end

--- Sets the index of the selected spline in the tool (selection shared between tools).
---Source: lua/ge/extensions/editor/roadSpline.lua:116
---@param idx integer Index (1-based) in the list of groups.
function editor_roadSpline.setSelectedSplineIdx(idx) end

