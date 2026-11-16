---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/environment/setCloud.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Node class.
---@class flowgraph_nodes_environment_setCloud_C
local flowgraph_nodes_environment_setCloud_C = {}

--- Empty.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/environment/setCloud.lua:37
function flowgraph_nodes_environment_setCloud_C:_executionStarted() end

--- Empty.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/environment/setCloud.lua:45
function flowgraph_nodes_environment_setCloud_C:_executionStopped() end

--- Sets data.restoreCloud = true.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/environment/setCloud.lua:24
---@param mgr table Flowgraph manager
function flowgraph_nodes_environment_setCloud_C:init(mgr) end

--- Configures the coverage pin as a 0 to 1 slider.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/environment/setCloud.lua:28
function flowgraph_nodes_environment_setCloud_C:postInit() end

--- Calls core_environment.setCloudCoverByID/ExposureByID/WindByID/HeightByID if objectId is provided, otherwise setCloudCover and setWindSpeed.
---Source: lua/ge/extensions/flowgraph/nodes/environment/setCloud.lua:64
function flowgraph_nodes_environment_setCloud_C:setCloudParameters() end

--- In repeat mode, applies the parameters every frame.
---Source: lua/ge/extensions/flowgraph/nodes/environment/setCloud.lua:58
function flowgraph_nodes_environment_setCloud_C:work() end

--- Applies the parameters once.
---Source: lua/ge/extensions/flowgraph/nodes/environment/setCloud.lua:54
function flowgraph_nodes_environment_setCloud_C:workOnce() end

