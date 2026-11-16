---@meta
-- tim19Atlas stub generated from lua/vehicle/protocols/motionSim.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- UDP "MotionSim" protocol (format 'BNG1') to drive a motion platform: sends position, speed, acceleration (without gravity), up vector, angles, angular speeds and accelerations of the player vehicle. Loaded and managed by protocols.lua (never called directly). Address, port and rate come from the settings protocols_motionSim_address, _port and _maxUpdateRate. Uses the physics step, so costly but accurate (up to 2000 Hz).
--- Access: `require("protocols/motionSim")`
---@class protocols_motionSim
local protocols_motionSim = {}

--- Fills the packet with the current values from protocols.lua (position, speed, acceleration, up vector, angles, angular speeds and accelerations).
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/protocols/motionSim.lua:42
---@param o cdata C struct of the packet to fill.
---@param dtSim number Simulation time accumulated since the last send (not used here).
function protocols_motionSim.fillStruct(o, dtSim) end

--- Destination IP address, read from the setting protocols_motionSim_address.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/protocols/motionSim.lua:14
---@return string  IP address (typical default 127.0.0.1).
function protocols_motionSim.getAddress() end

--- Maximum sending rate in Hz, read from the setting protocols_motionSim_maxUpdateRate.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/protocols/motionSim.lua:16
---@return number  Hz.
function protocols_motionSim.getMaxUpdateRate() end

--- Destination UDP port, read from the setting protocols_motionSim_port.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/protocols/motionSim.lua:15
---@return integer  Port number.
function protocols_motionSim.getPort() end

--- Returns the C definition of the packet structure (text passed to ffi.cdef).
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/protocols/motionSim.lua:23
---@return string  Body of the C struct.
function protocols_motionSim.getStructDefinition() end

--- Protocol initialization (does nothing).
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/protocols/motionSim.lua:12
function protocols_motionSim.init() end

--- Indicates that this protocol is updated at each physics step.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/protocols/motionSim.lua:18
---@return boolean  Always true.
function protocols_motionSim.isPhysicsStepUsed() end

--- Protocol reset (does nothing).
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/protocols/motionSim.lua:13
function protocols_motionSim.reset() end

return protocols_motionSim
