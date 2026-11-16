---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/util/project.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Flowgraph node class; each instance represents a node in a graph.
---@class flowgraph_nodes_util_project_C
local flowgraph_nodes_util_project_C = {}

--- Disables clearOutPinsOnStart.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/util/project.lua:30
---@param mgr any
function flowgraph_nodes_util_project_C:init(mgr) end

--- Reads mgr.id/name/description, savedFilename/savedDir (via path.splitWithoutExt, path.levelFromPath) and the current graph, then writes the pins and activates flow.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/util/project.lua:34
function flowgraph_nodes_util_project_C:workOnce() end

