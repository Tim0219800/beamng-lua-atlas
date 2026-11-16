---@meta
-- tim19Atlas stub generated from lua/common/jbeam/sections/wheelTypes/monoHubWheels.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Handler for the 'monoHubWheels' wheel type: a single-hub wheel. A tire ring (2 x numRays nodes) linked to the two axle nodes by sides and support beams, plus ONE single ring of numRays hub nodes placed at the middle of the axle and linked to node1, node2 and the tire by anisotropic reinforcement beams. Called by jbeam/sections/wheels.lua during vehicle loading.
--- Access: `require("jbeam/sections/wheelTypes/monoHubWheels")`
---@class jbeam_sections_wheelTypes_monoHubWheels
local jbeam_sections_wheelTypes_monoHubWheels = {}

--- Creates nodes and beams of a monoHubWheels wheel (alias of addMonoHubWheel). Warning 'invalid monohub wheel' and exits if node1 or node2 is missing.
---*(internal: called by the engine or the main loop)*
---Source: lua/common/jbeam/sections/wheelTypes/monoHubWheels.lua:19
---@param vehicle table vehicle under construction
---@param wheelKey integer index of the wheel in its section
---@param wheel table jbeam definition of the wheel (modified: collision, radius, hubRadius, numRays, nodes)
function jbeam_sections_wheelTypes_monoHubWheels.process(vehicle, wheelKey, wheel) end

return jbeam_sections_wheelTypes_monoHubWheels
