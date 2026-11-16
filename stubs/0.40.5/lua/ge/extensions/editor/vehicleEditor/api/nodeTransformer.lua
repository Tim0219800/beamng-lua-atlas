---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/vehicleEditor/api/nodeTransformer.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Vehicle Editor helper to move the selected nodes (vEditor.selectedNodes) with the editor's axis gizmo. The gizmo is centered on the average of the node positions; during the drag, each node receives its original position plus the delta (in local coordinates, sign inverted).
--- Access: extension `editor_vehicleEditor_api_nodeTransformer`: `extensions.load("editor_vehicleEditor_api_nodeTransformer")`, then the global `editor_vehicleEditor_api_nodeTransformer`
---@class editor_vehicleEditor_api_nodeTransformer
editor_vehicleEditor_api_nodeTransformer = {}

--- Places and draws the gizmo at the center of the selected nodes, handles start/end/drag and applies the offset to the nodes (node.pos).
---Source: lua/ge/extensions/editor/vehicleEditor/api/nodeTransformer.lua:48
---@return boolean  true if a gizmo drag is in progress during this call.
function editor_vehicleEditor_api_nodeTransformer.transformNodes() end

