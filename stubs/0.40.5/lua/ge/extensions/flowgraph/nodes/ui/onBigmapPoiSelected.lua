---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/ui/onBigmapPoiSelected.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Flowgraph node class (returned by _flowgraph_createNode(C)).
---@class flowgraph_nodes_ui_onBigmapPoiSelected_C
local flowgraph_nodes_ui_onBigmapPoiSelected_C = {}

--- Initializes the flags and the position.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/ui/onBigmapPoiSelected.lua:26
function flowgraph_nodes_ui_onBigmapPoiSelected_C:init() end

--- Hook: POI selected (poiId) or nil if deselected.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/ui/onBigmapPoiSelected.lua:45
---@param poiId string|nil POI identifier, nil if deselected.
function flowgraph_nodes_ui_onBigmapPoiSelected_C:onPoiSelectedFromBigmap(poiId) end

--- Hook: navigation to pos, or nil if cancelled.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/ui/onBigmapPoiSelected.lua:54
---@param pos vec3|nil Target position, nil if the navigation is cancelled.
function flowgraph_nodes_ui_onBigmapPoiSelected_C:onSetBigmapNavFocus(pos) end

--- Resets the pulses to false, applies the flags recorded by the hooks then clears them and writes poiId and pos.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/ui/onBigmapPoiSelected.lua:31
---@param args any Optional argument (unused).
function flowgraph_nodes_ui_onBigmapPoiSelected_C:work(args) end

