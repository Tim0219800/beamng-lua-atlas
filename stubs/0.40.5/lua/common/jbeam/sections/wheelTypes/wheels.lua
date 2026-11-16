---@meta
-- tim19Atlas stub generated from lua/common/jbeam/sections/wheelTypes/wheels.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Handler for the 'wheels' wheel type (jbeam wheels section): the simple wheel. From two axle nodes (node1, node2), it creates a ring of 2 x numRays tire nodes around the axle then the associated beams (sides, X reinforcements, tread, periphery). Called by jbeam/sections/wheels.lua during vehicle loading; useful for understanding how a wheel jbeam is converted into physics.
--- Access: global `wheels`
---@class wheels
wheels = {}

--- Creates nodes and beams of a simple wheel (alias of addWheel): 2*numRays tire nodes, then per ray 8 beams (2 sides, 2 X reinforcements, 1 tread, 2 periphery, 1 diagonal). Stores the wheel's vehicle.nodes in wheel.nodes.
---*(internal: called by the engine or the main loop)*
---Source: lua/common/jbeam/sections/wheelTypes/wheels.lua:18
---@param vehicle table vehicle under construction (nodes, maxIDs...)
---@param wheelKey integer index of the wheel in its section
---@param wheel table jbeam definition of the wheel (modified: collision, radius, numRays, nodes)
function wheels.process(vehicle, wheelKey, wheel) end

