---@meta
-- tim19Atlas stub generated from lua/vehicle/controller/tirePressureControl.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Auxiliary controller for central tire inflation/deflation (CTIS, off-road/military vehicles). Wheels are grouped into "groups" (axles, sides...); the driver enables/disables groups, then starts inflation, deflation or stop for all active groups. The controller directly modifies the pressure of the wheel pressure groups (obj:setGroupPressure), equalizes pressures within a group and publishes the average pressure of the active groups and the active state of each group in electrics. Registers a "Tire pressure control" radial menu.
--- Access: controller `tirePressureControl` declared in the jbeam (`controller`), reachable with `controller.getController("name")`
---@class controller_tirePressureControl
---@field type string "auxiliary".
local controller_tirePressureControl = {}

--- Saveable state: active pressure change, active state of each group and pressure of each wheel (keys prefixed by the controller name).
---Source: lua/vehicle/controller/tirePressureControl.lua:126
---@return table  State table.
function controller_tirePressureControl.getState() end

--- Does nothing (see initSecondStage).
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/tirePressureControl.lua:280
---@param jbeamData table Jbeam data.
function controller_tirePressureControl.init(jbeamData) end

--- Builds the wheel groups, reads flows and pressure limits and registers the radial menu. Called after the init of the other controllers.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/tirePressureControl.lua:283
---@param jbeamData table Jbeam data.
function controller_tirePressureControl.initSecondStage(jbeamData) end

--- Disables all groups, stops pressure changes and resets the electric smoother to zero.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/tirePressureControl.lua:265
---@param jbeamData table Jbeam data.
function controller_tirePressureControl.reset(jbeamData) end

--- Enables or disables a wheel group and displays a message. An unknown group name logs an error and does nothing.
---Source: lua/vehicle/controller/tirePressureControl.lua:84
---@param groupName string Group name (jbeam groupName).
---@param state boolean Active?
function controller_tirePressureControl.setGroupState(groupName, state) end

--- Restores activations, pressure change and wheel pressures (clamped between ambient pressure and maxPressure, broken wheels ignored).
---Source: lua/vehicle/controller/tirePressureControl.lua:148
---@param data table|nil Table produced by getState.
function controller_tirePressureControl.setState(data) end

--- Starts deflation (change = -deflateMaxFlow per second) of the active groups and displays a message.
---Source: lua/vehicle/controller/tirePressureControl.lua:116
function controller_tirePressureControl.startDeflateActiveGroups() end

--- Starts inflation (change = +inflateMaxFlow per second) of the active groups and displays a message.
---Source: lua/vehicle/controller/tirePressureControl.lua:111
function controller_tirePressureControl.startInflateActiveGroups() end

--- Stops the current inflation/deflation and displays a message.
---Source: lua/vehicle/controller/tirePressureControl.lua:121
function controller_tirePressureControl.stopActiveGroups() end

--- Toggles the activation of a wheel group.
---Source: lua/vehicle/controller/tirePressureControl.lua:103
---@param groupName string Group name.
function controller_tirePressureControl.toggleGroupState(groupName) end

--- Every frame: reads the pressures, equalizes between wheels of a group, applies inflation/deflation to the active groups and publishes the electrics.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/tirePressureControl.lua:28
---@param dt number Time step in seconds.
function controller_tirePressureControl.updateGFX(dt) end

return controller_tirePressureControl
