---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/ui/customUiLayout.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Flowgraph node class (returned by _flowgraph_createNode(C)).
---@class flowgraph_nodes_ui_customUiLayout_C
local flowgraph_nodes_ui_customUiLayout_C = {}

--- Writes {apps = storedLayout, layoutName = ...} to "layout".
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/ui/customUiLayout.lua:25
function flowgraph_nodes_ui_customUiLayout_C:_executionStarted() end

--- Restores storedLayout.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/ui/customUiLayout.lua:90
---@param data table Saved / received data.
function flowgraph_nodes_ui_customUiLayout_C:_onDeserialized(data) end

--- Saves storedLayout.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/ui/customUiLayout.lua:86
---@param res table Node save table to fill.
function flowgraph_nodes_ui_customUiLayout_C:_onSerialize(res) end

--- Capture, Clear, Load Stored Layout, Load Freeroam layout buttons and copy list.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/ui/customUiLayout.lua:30
function flowgraph_nodes_ui_customUiLayout_C:drawCustomProperties() end

--- Returns the string of this node's Lua callback function _anon(setLayout).
---Source: lua/ge/extensions/flowgraph/nodes/ui/customUiLayout.lua:82
---@param action string Name of the activated button or output pin.
function flowgraph_nodes_ui_customUiLayout_C:getCmd(action) end

--- Empty.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/ui/customUiLayout.lua:21
function flowgraph_nodes_ui_customUiLayout_C:init() end

--- Receives the layout captured by the UI and stores data.apps in storedLayout.
---Source: lua/ge/extensions/flowgraph/nodes/ui/customUiLayout.lua:77
---@param data table Saved / received data.
function flowgraph_nodes_ui_customUiLayout_C:setLayout(data) end

--- Returns "<idManager>_<nodeId>", used to name the temporary game state.
---Source: lua/ge/extensions/flowgraph/nodes/ui/customUiLayout.lua:29
function flowgraph_nodes_ui_customUiLayout_C:uniqueId() end

