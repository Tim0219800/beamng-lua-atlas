---@meta
-- tim19Atlas stub generated from lua/vehicle/protocols.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Manager of the vehicle's UDP telemetry protocols (OutGauge for external dashboards, MotionSim for motion platforms). At init, it loads each module of lua/vehicle/protocols/*.lua enabled in the settings, opens one UDP socket per protocol, fills a C packet (ffi) at the requested rate (real time, not simulation time) and sends it. It also computes the shared smoothed quantities (speed, acceleration, angles and angular speeds) that the modules read in protocols.xxx. Only acts for the first seated player, and never in multi-seat.
--- Access: global `protocols`
---@class protocols
---@field update function nop, or updatePhysics(dtSim) if at least one protocol uses the physics step. Called at each physics step.
---@field updateGFX function nop, or the graphics update if at least one protocol does not use the physics step.
protocols = {}

--- Closes the UDP sockets of all active protocols and empties the list.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/protocols.lua:193
function protocols.destroy() end

--- Destroys the existing protocols, then (if enabled in the settings and not in multi-seat) loads, initializes and activates each protocol module found, installs update/updateGFX and initializes the smoothers.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/protocols.lua:206
function protocols.init() end

--- Indicates whether at least one active protocol requests the physics step; used to register update() in the physics loop.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/protocols.lua:257
---@return boolean  true if a protocol uses the physics step.
function protocols.isPhysicsStepUsed() end

--- Hook called when the seated players change: if a first player is seated, resets the smoothers.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/protocols.lua:265
---@param anyPlayerSeated boolean True if at least one player is seated (not used directly).
function protocols.onPlayersChanged(anyPlayerSeated) end

--- Resets the smoothers and calls reset() of each protocol module that defines one.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/protocols.lua:125
function protocols.reset() end

--- Hook called when the user settings change: reruns init() to apply the new protocol settings.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/protocols.lua:261
function protocols.settingsChanged() end

