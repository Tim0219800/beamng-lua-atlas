---@meta
-- tim19Atlas stub generated from lua/ge/suspensionFrequencyTester.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Development tool that measures a vehicle's suspension frequency. It shows an ImGui window "Suspension Frequency Tester": for two nodes (front axle 279, rear axle 425 by default) it reads the z height every frame and feeds it into 1000 frequency detection filters (newFreqExists) between 0.5 Hz and 5 Hz, then compares against categories (Too Soft 0.9 Hz, Luxury 1.1, Average 1.2, Sporty 1.4, Rally 1.8, Racetrack 2.2, Aero-Critical 5.0). The file explains the usage: put the car on ice, remove the damping, then run extensions.suspensionFrequencyTester.run() from the console.
--- Access: `require("suspensionFrequencyTester")`
---@class suspensionFrequencyTester
local suspensionFrequencyTester = {}

--- Hook called every frame by the extension system: draws the window if it is open, then (if a player vehicle exists) updates for each node the amplitudes of all frequency filters from the node's z position (veh:getNodePositionXYZ) and dtSim.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/suspensionFrequencyTester.lua:176
---@param dtReal number Real frame duration (s); unused.
---@param dtSim number Simulated frame duration (s), passed to the filters.
---@param dtRaw number Raw frame duration (s); unused.
function suspensionFrequencyTester.onUpdate(dtReal, dtSim, dtRaw) end

--- Opens the window and resets the amplitudes and frequency filters of each node to start a new measurement.
---Source: lua/ge/suspensionFrequencyTester.lua:190
function suspensionFrequencyTester.run() end

return suspensionFrequencyTester
