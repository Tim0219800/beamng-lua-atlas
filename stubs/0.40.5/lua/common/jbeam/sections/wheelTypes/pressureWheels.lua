---@meta
-- tim19Atlas stub generated from lua/common/jbeam/sections/wheelTypes/pressureWheels.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Handler for the 'pressureWheels' wheel type: the most recent and most complete wheel model, with air pressure simulated by pressurized TRIANGLES (one pressure group per wheel) instead of pressurized beams. It creates the tread ring (if a tire exists), the hub ring, an optional stabilizer node, hubcaps, many beam families (rim, sides, periphery, reinforcements, tread, L-beams, support) and the tire and hub triangles. Called by jbeam/sections/wheels.lua during loading.
--- Access: `require("jbeam/sections/wheelTypes/pressureWheels")`
---@class jbeam_sections_wheelTypes_pressureWheels
local jbeam_sections_wheelTypes_pressureWheels = {}

--- Creates nodes, beams and triangles of a pressureWheels wheel (alias of addPressureWheel). Warning 'invalid pressureWheel' and exits if node1 or node2 is missing.
---*(internal: called by the engine or the main loop)*
---Source: lua/common/jbeam/sections/wheelTypes/pressureWheels.lua:166
---@param vehicle table vehicle under construction (nodes, triangles, maxIDs...)
---@param wheelKey integer index of the wheel in its section
---@param wheel table jbeam definition of the wheel (many fields, see notes); modified with nodes, treadNodes, rimBeams, sideBeams, peripheryBeams, reinfBeams, treadBeams, pressureGroup
function jbeam_sections_wheelTypes_pressureWheels.process(vehicle, wheelKey, wheel) end

return jbeam_sections_wheelTypes_pressureWheels
