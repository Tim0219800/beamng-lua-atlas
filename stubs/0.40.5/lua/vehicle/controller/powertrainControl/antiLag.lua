---@meta
-- tim19Atlas stub generated from lua/vehicle/controller/powertrainControl/antiLag.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Auxiliary anti-lag (ALS) controller for a turbocharged engine. State machine off / idle / armed / manualOverride / timeout: in idle it arms after a few seconds of full throttle at high RPM; when armed, when the vehicle is moving, the throttle is lifted (or the brake pressed) and the engine runs fast enough, it uses a PID to drive the engine's anti-lag coefficient (engine:setAntilagCoef) to keep the turbo at turboTargetRPM. A maximum continuous time prevents overheating. Publishes electrics.values.alsActive (boolean) and alsState (string).
--- Access: controller `powertrainControl/antiLag` declared in the jbeam (`controller`), reachable with `controller.getController("name")`
---@class controller_powertrainControl_antiLag
---@field type string "auxiliary".
local controller_powertrainControl_antiLag = {}

--- Saveable state: remote mode (off / automatic / manualOverride).
---Source: lua/vehicle/controller/powertrainControl/antiLag.lua:204
---@return table  State table.
function controller_powertrainControl_antiLag.getState() end

--- Gets the engine and its turbocharger, reads the jbeam thresholds and creates the turbo RPM PID.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/powertrainControl/antiLag.lua:134
---@param jbeamData table Controller jbeam data.
function controller_powertrainControl_antiLag.init(jbeamData) end

--- Resets timeout, PID and state (idle) to zero and the alsActive/alsState electrics.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/powertrainControl/antiLag.lua:126
---@param jbeamData table Jbeam data.
function controller_powertrainControl_antiLag.reset(jbeamData) end

--- Forces the internal state of the state machine (off, idle, armed, manualOverride, timeout).
---Source: lua/vehicle/controller/powertrainControl/antiLag.lua:47
---@param newState string State name.
function controller_powertrainControl_antiLag.setAntilagState(newState) end

--- Restores the mode from the table (unknown modes ignored).
---Source: lua/vehicle/controller/powertrainControl/antiLag.lua:209
---@param data table|nil Table produced by getState.
function controller_powertrainControl_antiLag.setState(data) end

--- Every frame: advances the state machine and applies the anti-lag coefficient to the engine.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/powertrainControl/antiLag.lua:51
---@param dt number Time step in seconds.
function controller_powertrainControl_antiLag.updateGFX(dt) end

return controller_powertrainControl_antiLag
