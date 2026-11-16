---@meta
-- tim19Atlas stub generated from lua/common/jbeam/sections/wheelTypes/hubWheelsTSV.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Handler for the 'hubWheelsTSV' wheel type: a wheel with a separate hub WITHOUT simulated air pressure: the tire is linked to the hub by anisotropic side and reinforcement beams (instead of pressurized beams). Called by jbeam/sections/wheels.lua during vehicle loading.
--- Access: `require("jbeam/sections/wheelTypes/hubWheelsTSV")`
---@class jbeam_sections_wheelTypes_hubWheelsTSV
local jbeam_sections_wheelTypes_hubWheelsTSV = {}

--- Creates nodes and beams of a hubWheelsTSV wheel (alias of addHubWheelTSV). Warning 'invalid hubWheel' and exits if node1 or node2 is missing.
---*(internal: called by the engine or the main loop)*
---Source: lua/common/jbeam/sections/wheelTypes/hubWheelsTSV.lua:19
---@param vehicle table vehicle under construction
---@param wheelKey integer index of the wheel in its section
---@param wheel table jbeam definition of the wheel (modified: collision, radius, hubRadius, numRays, nodes, reinforcementBeams, sideBeams, treadBeams)
function jbeam_sections_wheelTypes_hubWheelsTSV.process(vehicle, wheelKey, wheel) end

return jbeam_sections_wheelTypes_hubWheelsTSV
