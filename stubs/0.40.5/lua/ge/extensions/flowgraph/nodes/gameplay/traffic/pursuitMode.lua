---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/gameplay/traffic/pursuitMode.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Flowgraph node class (created via `_flowgraph_createNode(C)`).
---@class flowgraph_nodes_gameplay_traffic_pursuitMode_C
local flowgraph_nodes_gameplay_traffic_pursuitMode_C = {}

--- Displays "Traffic not active!" if traffic is not active.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/traffic/pursuitMode.lua:34
---@param builder table editor node constructor (builder:Middle())
---@param style table node drawing style
function flowgraph_nodes_gameplay_traffic_pursuitMode_C:drawMiddle(builder, style) end

--- If traffic is 'on', inserts the target into traffic if needed then calls gameplay_police.setPursuitMode(mode, vehId, policeId).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/traffic/pursuitMode.lua:23
function flowgraph_nodes_gameplay_traffic_pursuitMode_C:workOnce() end

