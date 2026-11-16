---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/scene/sevensegmentDisplay.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Flowgraph node class (returned by _flowgraph_createNode(C)). The methods are called by the flowgraph manager or the editor.
---@class flowgraph_nodes_scene_sevensegmentDisplay_C
local flowgraph_nodes_scene_sevensegmentDisplay_C = {}

--- Forgets the last displayed number.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/scene/sevensegmentDisplay.lua:135
function flowgraph_nodes_scene_sevensegmentDisplay_C:_executionStarted() end

--- Deletes the objects on stop.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/scene/sevensegmentDisplay.lua:131
function flowgraph_nodes_scene_sevensegmentDisplay_C:_executionStopped() end

--- Deletes all created objects and sets spawned back to false.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/scene/sevensegmentDisplay.lua:139
function flowgraph_nodes_scene_sevensegmentDisplay_C:clearObjects() end

--- Creates the digits (shape '8'), the decimal point and, in minutes mode, the colon.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/scene/sevensegmentDisplay.lua:42
---@param objectName any unused
function flowgraph_nodes_scene_sevensegmentDisplay_C:createObjects(objectName) end

--- Called when the node is destroyed: cleans up the created objects.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/scene/sevensegmentDisplay.lua:169
function flowgraph_nodes_scene_sevensegmentDisplay_C:destroy() end

--- Initializes the default settings (mode 'minutes', count 5, decimals 3, spacing 5...).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/scene/sevensegmentDisplay.lua:27
---@param mgr any flowgraph manager
---@param ... any
function flowgraph_nodes_scene_sevensegmentDisplay_C:init(mgr, ...) end

--- Creates a point TSStatic (shape 'period') offset relative to the base position.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/scene/sevensegmentDisplay.lua:81
---@param offset any local offset vec3
---@param name any name suffix (decimal, m_1, m_2)
function flowgraph_nodes_scene_sevensegmentDisplay_C:makeDot(offset, name) end

--- End-of-mission hook: cleans up the objects created by the node.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/scene/sevensegmentDisplay.lua:165
function flowgraph_nodes_scene_sevensegmentDisplay_C:onClientEndMission() end

--- Changes the shape of each digit according to the current number; clears leading zeros if showLeadingZeroes is false.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/scene/sevensegmentDisplay.lua:101
function flowgraph_nodes_scene_sevensegmentDisplay_C:updateNumbers() end

--- On clear, deletes the display; otherwise creates it if needed and updates the digits if the number changed.
---Source: lua/ge/extensions/flowgraph/nodes/scene/sevensegmentDisplay.lua:152
function flowgraph_nodes_scene_sevensegmentDisplay_C:work() end

