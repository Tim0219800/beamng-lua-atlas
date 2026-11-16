---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/career/menuClosed.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Node class.
---@class flowgraph_nodes_career_menuClosed_C
local flowgraph_nodes_career_menuClosed_C = {}

--- Creates the flag table.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/career/menuClosed.lua:19
function flowgraph_nodes_career_menuClosed_C:init() end

--- Hook: if the player has returned to the play state, raises the menuClosed flag.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/career/menuClosed.lua:31
---@param enteredPlay boolean true if entering the play state
function flowgraph_nodes_career_menuClosed_C:onUIPlayStateChanged(enteredPlay) end

--- Every frame: menuClosed to false, applies then clears the flags.
---Source: lua/ge/extensions/flowgraph/nodes/career/menuClosed.lua:23
---@param args any unused
function flowgraph_nodes_career_menuClosed_C:work(args) end

