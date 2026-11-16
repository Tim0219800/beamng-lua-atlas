---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/events/onMissionEnded.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Node class.
---@class flowgraph_nodes_events_onMissionEnded_C
local flowgraph_nodes_events_onMissionEnded_C = {}

--- Empty.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/events/onMissionEnded.lua:19
---@param mgr table Flowgraph manager
---@param ... any
function flowgraph_nodes_events_onMissionEnded_C:init(mgr, ...) end

--- Hook called when the level is unloaded: sets flow to true and triggers the node.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/events/onMissionEnded.lua:22
function flowgraph_nodes_events_onMissionEnded_C:onClientEndMission() end

--- Empty.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/events/onMissionEnded.lua:27
---@param args table Flowgraph arguments
function flowgraph_nodes_events_onMissionEnded_C:work(args) end

