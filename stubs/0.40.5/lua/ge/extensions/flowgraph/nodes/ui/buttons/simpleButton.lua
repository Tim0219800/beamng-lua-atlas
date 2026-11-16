---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/ui/buttons/simpleButton.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Flowgraph node class (returned by _flowgraph_createNode(C)).
---@class flowgraph_nodes_ui_buttons_simpleButton_C
local flowgraph_nodes_ui_buttons_simpleButton_C = {}

--- Resets hiddenAfterDone and hiddenAfterReset to false.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/ui/buttons/simpleButton.lua:30
function flowgraph_nodes_ui_buttons_simpleButton_C:_executionStarted() end

--- Disables the button (active=false) once and resets hiddenAfterDone to false.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/ui/buttons/simpleButton.lua:39
function flowgraph_nodes_ui_buttons_simpleButton_C:onNodeReset() end

--- Defines the value template of the style pin.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/ui/buttons/simpleButton.lua:35
function flowgraph_nodes_ui_buttons_simpleButton_C:postInit() end

--- Re-enables the button after a reset, updates clicked/used/unused and disables it if hideWhenDone is set and it was already clicked.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/ui/buttons/simpleButton.lua:63
function flowgraph_nodes_ui_buttons_simpleButton_C:work() end

--- Creates the button and writes its id (see notes: bugs).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/ui/buttons/simpleButton.lua:50
function flowgraph_nodes_ui_buttons_simpleButton_C:workOnce() end

