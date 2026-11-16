---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/career/onGarageEvent.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Node class.
---@class flowgraph_nodes_career_onGarageEvent_C
local flowgraph_nodes_career_onGarageEvent_C = {}

--- Creates the flag table.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/career/onGarageEvent.lua:22
function flowgraph_nodes_career_onGarageEvent_C:init() end

--- Hook: raises beforeGarageVehicleSelected.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/career/onGarageEvent.lua:39
---@param data any unused
function flowgraph_nodes_career_onGarageEvent_C:onBeforeGarageVehicleSelected(data) end

--- Hook: raises beforeGarageInventoryOpened.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/career/onGarageEvent.lua:35
---@param data any unused
function flowgraph_nodes_career_onGarageEvent_C:onBeforeGarageVehicleSelectionMenuOpened(data) end

--- Hook: raises endMode.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/career/onGarageEvent.lua:43
---@param data any unused
function flowgraph_nodes_career_onGarageEvent_C:onEndGarageMode(data) end

--- Every frame: sets two outputs back to false, applies then clears the flags.
---Source: lua/ge/extensions/flowgraph/nodes/career/onGarageEvent.lua:26
---@param args any unused
function flowgraph_nodes_career_onGarageEvent_C:work(args) end

