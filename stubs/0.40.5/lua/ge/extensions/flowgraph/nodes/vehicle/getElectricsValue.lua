---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/vehicle/getElectricsValue.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Flowgraph node class (returned by `_flowgraph_createNode(C)`). Definition fields: name, description, category, pinSchema, tags.
---@class flowgraph_nodes_vehicle_getElectricsValue_C
local flowgraph_nodes_vehicle_getElectricsValue_C = {}

--- Called by the manager when the flowgraph project execution starts; resets the internal state to zero.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/vehicle/getElectricsValue.lua:41
function flowgraph_nodes_vehicle_getElectricsValue_C:_executionStarted() end

--- Called by the manager when the project execution stops; cleans up the internal state.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/vehicle/getElectricsValue.lua:44
function flowgraph_nodes_vehicle_getElectricsValue_C:_executionStopped() end

--- Unsubscribes from the value change notification (`unregisterValueChangeNotification`) and clears `_setupData`.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/vehicle/getElectricsValue.lua:48
function flowgraph_nodes_vehicle_getElectricsValue_C:clearNotification() end

--- Node constructor, called at its creation by the flowgraph editor/manager; initializes the internal state.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/vehicle/getElectricsValue.lua:25
function flowgraph_nodes_vehicle_getElectricsValue_C:init() end

--- Goes to `inactive` duration and removes the notification.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/vehicle/getElectricsValue.lua:59
function flowgraph_nodes_vehicle_getElectricsValue_C:onNodeReset() end

--- Defines `hardTemplates` of the `key` pin: list of common electrics keys offered in the editor.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/vehicle/getElectricsValue.lua:28
function flowgraph_nodes_vehicle_getElectricsValue_C:postInit() end

--- Reads the cached value; if it exists, writes it to `value` and goes to `finished`.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/vehicle/getElectricsValue.lua:78
function flowgraph_nodes_vehicle_getElectricsValue_C:work() end

--- Subscribes to the vehicle's `key` value and goes to `started` duration.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/vehicle/getElectricsValue.lua:64
function flowgraph_nodes_vehicle_getElectricsValue_C:workOnce() end

