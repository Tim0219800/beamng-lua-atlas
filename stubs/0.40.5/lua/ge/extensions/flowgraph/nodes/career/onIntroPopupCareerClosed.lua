---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/career/onIntroPopupCareerClosed.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Node class.
---@class flowgraph_nodes_career_onIntroPopupCareerClosed_C
local flowgraph_nodes_career_onIntroPopupCareerClosed_C = {}

--- Clears the flags after the trigger.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/career/onIntroPopupCareerClosed.lua:44
function flowgraph_nodes_career_onIntroPopupCareerClosed_C:_afterTrigger() end

--- Creates the flag table.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/career/onIntroPopupCareerClosed.lua:22
function flowgraph_nodes_career_onIntroPopupCareerClosed_C:init() end

--- Hook: raises closed and stores the window id if provided.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/career/onIntroPopupCareerClosed.lua:36
---@param id any id of the closed window
function flowgraph_nodes_career_onIntroPopupCareerClosed_C:onIntroPopupCareerClosed(id) end

--- Every frame: closed to false and id to nil, then applies and clears the flags.
---Source: lua/ge/extensions/flowgraph/nodes/career/onIntroPopupCareerClosed.lua:27
---@param args any unused
function flowgraph_nodes_career_onIntroPopupCareerClosed_C:work(args) end

