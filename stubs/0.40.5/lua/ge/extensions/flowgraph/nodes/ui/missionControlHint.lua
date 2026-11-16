---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/ui/missionControlHint.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Flowgraph node class (returned by _flowgraph_createNode(C)).
---@class flowgraph_nodes_ui_missionControlHint_C
local flowgraph_nodes_ui_missionControlHint_C = {}

--- Restores count.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/ui/missionControlHint.lua:92
---@param res table Node save table to fill.
function flowgraph_nodes_ui_missionControlHint_C:_onDeserialized(res) end

--- Saves count.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/ui/missionControlHint.lua:88
---@param res table Node save table to fill.
function flowgraph_nodes_ui_missionControlHint_C:_onSerialize(res) end

--- "Hint Count" field.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/ui/missionControlHint.lua:71
function flowgraph_nodes_ui_missionControlHint_C:drawCustomProperties() end

--- count = 1.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/ui/missionControlHint.lua:40
function flowgraph_nodes_ui_missionControlHint_C:init() end

--- Creates the pins and loads the ui_apps_missionControls extension.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/ui/missionControlHint.lua:44
function flowgraph_nodes_ui_missionControlHint_C:postInit() end

--- Adjusts the number of pin trios (action, uiEvent, label).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/ui/missionControlHint.lua:49
---@param old integer Old number of elements.
---@param new integer New number of elements.
function flowgraph_nodes_ui_missionControlHint_C:updatePins(old, new) end

--- Loads the extension if needed, clears if reset, otherwise sends or clears each hint via setControl.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/ui/missionControlHint.lua:97
function flowgraph_nodes_ui_missionControlHint_C:work() end

