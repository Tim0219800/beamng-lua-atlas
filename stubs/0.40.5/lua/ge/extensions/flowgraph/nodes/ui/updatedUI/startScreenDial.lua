---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/ui/updatedUI/startScreenDial.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Flowgraph node class; each instance represents a node in a graph.
---@class flowgraph_nodes_ui_updatedUI_startScreenDial_C
local flowgraph_nodes_ui_updatedUI_startScreenDial_C = {}

--- Prepares the panel {type='dragDial', header='Dial Setup', ...}.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/ui/updatedUI/startScreenDial.lua:22
function flowgraph_nodes_ui_updatedUI_startScreenDial_C:init() end

--- Called when the player changes a dial in the panel; updates the value of the entry with the same label and republishes dials.
---Source: lua/ge/extensions/flowgraph/nodes/ui/updatedUI/startScreenDial.lua:58
---@param dial table Table {label, value} sent by the panel.
function flowgraph_nodes_ui_updatedUI_startScreenDial_C:onDialSetByDialPanel(dial) end

--- Reads gameplay_drag_dragBridge.getData(); for each racer creates a dial entry (value timers.dial.value or 12 by default, disabled if the racer is not playable), adds the panel to the UI and publishes the list on the dials pin. Without data, logs a warning and does nothing else.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/ui/updatedUI/startScreenDial.lua:34
function flowgraph_nodes_ui_updatedUI_startScreenDial_C:work() end

