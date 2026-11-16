---@meta
-- tim19Atlas stub generated from lua/common/jbeam/sections/wheelTypes/hubWheelsTSI.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Handler for the 'hubWheelsTSI' wheel type: a variant of hubWheels without hubcap. Ring of tire nodes + ring of hub nodes, tread, periphery, hub and axle beams, and six pressurized beams per ray between hub and tire (air pressure is simulated). Called by jbeam/sections/wheels.lua during vehicle loading.
--- Access: `require("jbeam/sections/wheelTypes/hubWheelsTSI")`
---@class jbeam_sections_wheelTypes_hubWheelsTSI
local jbeam_sections_wheelTypes_hubWheelsTSI = {}

--- Creates nodes and beams of a hubWheelsTSI wheel (alias of addHubWheelTSI). Warning 'invalid hubWheel' and exits without creating anything if node1 or node2 cannot be found.
---*(internal: called by the engine or the main loop)*
---Source: lua/common/jbeam/sections/wheelTypes/hubWheelsTSI.lua:20
---@param vehicle table vehicle under construction
---@param wheelKey integer index of the wheel in its section
---@param wheel table jbeam definition of the wheel (modified: collision, radius, hubRadius, numRays, tireWidth, hubWidth, nodes, pressuredBeams)
function jbeam_sections_wheelTypes_hubWheelsTSI.process(vehicle, wheelKey, wheel) end

return jbeam_sections_wheelTypes_hubWheelsTSI
