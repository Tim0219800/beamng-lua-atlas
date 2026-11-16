---@meta
-- tim19Atlas stub generated from lua/common/jbeam/sections/wheels.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Dispatcher for wheel construction when loading a jbeam vehicle. It goes through the vehicle's wheel sections (wheels, monoHubWheels, hubWheelsTSV, hubWheelsTSI, hubWheels, pressureWheels) in that order, calls for each wheel the type handler (file jbeam/sections/wheelTypes/<section>.lua) that creates nodes, beams and triangles, then stores all wheels in vehicle.wheels with a wheelID. processRotators then adds the rotators (wheels without a tire) and renumbers the wheels. Called by the jbeam loader, not by a typical mod.
--- Access: global `wheels`
---@class wheels
wheels = {}

--- Adds the rotators (vehicle.rotators) as extra wheels (wheelID, jbeamUtils.addRotator), removes wheels without nodes and renumbers vehicle.wheels / cid.
---*(internal: called by the engine or the main loop)*
---Source: lua/common/jbeam/sections/wheels.lua:105
---@param vehicle table vehicle data
function wheels.processRotators(vehicle) end

--- Builds all the vehicle's wheels: resets vehicle.wheels, processes each non-empty wheel section via the wheel type handler (require loaded on demand then cached), assigns wheelID and stores the result in vehicle.wheels.
---*(internal: called by the engine or the main loop)*
---Source: lua/common/jbeam/sections/wheels.lua:81
---@param vehicle table data of the vehicle being built (nodes, beams, maxIDs, wheel sections, flexbodies...)
---@return boolean  always true
function wheels.processWheels(vehicle) end

