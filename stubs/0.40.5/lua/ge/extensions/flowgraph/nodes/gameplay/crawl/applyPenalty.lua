---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/gameplay/crawl/applyPenalty.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Node class.
---@class flowgraph_nodes_gameplay_crawl_applyPenalty_C
local flowgraph_nodes_gameplay_crawl_applyPenalty_C = {}

--- Loads the crawl bridge.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/crawl/applyPenalty.lua:22
---@param mgr table Flowgraph manager
function flowgraph_nodes_gameplay_crawl_applyPenalty_C:init(mgr) end

--- Fills the templates of the penaltyType pin with bridge.getPenaltyTypes().
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/crawl/applyPenalty.lua:26
function flowgraph_nodes_gameplay_crawl_applyPenalty_C:postInit() end

--- Calls bridge.applyPenalty(penaltyType) if the type is set.
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/crawl/applyPenalty.lua:35
function flowgraph_nodes_gameplay_crawl_applyPenalty_C:work() end

