---@meta
-- tim19Atlas stub generated from lua/common/jbeam/sections/wheelTypes/hubWheels.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Handler for the 'hubWheels' wheel type: a wheel with a hub separate from the tire, with air pressure simulated by pressurized beams between the hub and the tire. It creates a ring of tire nodes, a ring of hub nodes, optionally a hubcap, then the tread, periphery, hub, axle, pressure, reinforcement and support beams. Called by jbeam/sections/wheels.lua during loading.
--- Access: `require("jbeam/sections/wheelTypes/hubWheels")`
---@class jbeam_sections_wheelTypes_hubWheels
local jbeam_sections_wheelTypes_hubWheels = {}

--- Creates all the nodes and beams of a hubWheels wheel (alias of addHubWheel). Exits with an 'invalid hubWheel' warning if node1 or node2 does not exist.
---*(internal: called by the engine or the main loop)*
---Source: lua/common/jbeam/sections/wheelTypes/hubWheels.lua:20
---@param vehicle table vehicle under construction
---@param wheelKey integer index of the wheel in its section
---@param wheel table jbeam definition of the wheel (modified: collision, treadCoef, radius, hubRadius, numRays, nodes, pressuredBeams)
function jbeam_sections_wheelTypes_hubWheels.process(vehicle, wheelKey, wheel) end

return jbeam_sections_wheelTypes_hubWheels
