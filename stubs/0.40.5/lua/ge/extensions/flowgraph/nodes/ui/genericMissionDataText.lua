---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/ui/genericMissionDataText.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Flowgraph node class (returned by _flowgraph_createNode(C)).
---@class flowgraph_nodes_ui_genericMissionDataText_C
local flowgraph_nodes_ui_genericMissionDataText_C = {}

--- Creates the reused uiData table.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/ui/genericMissionDataText.lua:29
function flowgraph_nodes_ui_genericMissionDataText_C:init() end

--- Templates: styles and titles (time, pickups).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/ui/genericMissionDataText.lua:33
function flowgraph_nodes_ui_genericMissionDataText_C:postInit() end

--- Sends or clears the data via ui_apps_genericMissionData.setData and signals genericMissionDataChanged to the ui module.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/ui/genericMissionDataText.lua:46
function flowgraph_nodes_ui_genericMissionDataText_C:work() end

