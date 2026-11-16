---@meta
-- tim19Atlas stub generated from lua/vehicle/protocols/outgauge.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- UDP OutGauge protocol (Live For Speed compatible): sends speed, RPM, gear, turbo pressure, temperatures, fuel, pedal inputs and warning lights of the vehicle for external dashboards. Loaded by protocols.lua; address, port and rate come from the settings protocols_outgauge_address, _port, _maxUpdateRate. Uses the graphics step (low cost).
--- Access: `require("protocols/outgauge")`
---@class protocols_outgauge
local protocols_outgauge = {}

--- Fills the packet from electrics.values (speed, RPM, gear, turbo, temperatures, fuel, pedals, warning lights).
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/protocols/outgauge.lua:84
---@param o cdata C struct of the packet to fill (zeroed before the call).
---@param dtSim number Simulation time accumulated since the last send (not used).
function protocols_outgauge.fillStruct(o, dtSim) end

--- Destination IP address (setting protocols_outgauge_address).
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/protocols/outgauge.lua:19
---@return string  IP address.
function protocols_outgauge.getAddress() end

--- Maximum sending rate in Hz (setting protocols_outgauge_maxUpdateRate).
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/protocols/outgauge.lua:21
---@return number  Hz.
function protocols_outgauge.getMaxUpdateRate() end

--- Destination UDP port (setting protocols_outgauge_port).
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/protocols/outgauge.lua:20
---@return integer  Port number.
function protocols_outgauge.getPort() end

--- Returns the C definition of the OutGauge packet (text passed to ffi.cdef).
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/protocols/outgauge.lua:28
---@return string  Body of the C struct.
function protocols_outgauge.getStructDefinition() end

--- Looks for controllers of type shiftLights to know whether the shift light is available.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/protocols/outgauge.lua:13
function protocols_outgauge.init() end

--- Indicates that this protocol is updated in the graphics loop.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/protocols/outgauge.lua:23
---@return boolean  Always false.
function protocols_outgauge.isPhysicsStepUsed() end

--- Protocol reset (does nothing).
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/protocols/outgauge.lua:18
function protocols_outgauge.reset() end

return protocols_outgauge
