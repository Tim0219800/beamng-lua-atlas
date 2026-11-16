---@meta
-- tim19Atlas stub generated from lua/vehicle/extensions/cruiseControl.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Cruise control: a PID drives electrics.values.throttleOverride to keep the wheel speed (electrics.values.wheelspeed, m/s) at a setpoint. It stops on braking, after post-crash braking and does not drive the pedal if the driver presses the clutch or the throttle. A modder can drive it via setSpeed, changeSpeed, holdCurrentSpeed and setEnabled.
--- Access: extension `cruiseControl`: `extensions.load (vehicle VM)("cruiseControl")`, then the global `cruiseControl`
---@class cruiseControl
---@field hasReachedTargetSpeed boolean true when the speed is within 3% of the setpoint.
---@field minimumSpeed number Minimum setpoint in m/s (30 km/h).
cruiseControl = {}

--- Enables the cruise control and adds an offset to the current setpoint.
---Source: lua/vehicle/extensions/cruiseControl.lua:81
---@param offset number Change in m/s (positive or negative).
function cruiseControl.changeSpeed(offset) end

--- Returns the current configuration.
---Source: lua/vehicle/extensions/cruiseControl.lua:123
---@return table  {isEnabled, targetSpeed, minimumSpeed, hasReachedTargetSpeed}.
function cruiseControl.getConfiguration() end

--- Sets the setpoint to the current speed if it exceeds the minimum speed.
---Source: lua/vehicle/extensions/cruiseControl.lua:89
function cruiseControl.holdCurrentSpeed() end

--- Vehicle reset hook: resets hasReachedTargetSpeed, the state and the smoother to zero.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/extensions/cruiseControl.lua:23
function cruiseControl.onReset() end

--- Publishes the state (electrics.cruiseControlTarget/Active) and sends 'CruiseControlState' to the UI.
---Source: lua/vehicle/extensions/cruiseControl.lua:110
function cruiseControl.requestState() end

--- Enables or disables the cruise control; resets throttleOverride to nil and the smoother to zero.
---Source: lua/vehicle/extensions/cruiseControl.lua:97
---@param enabled boolean true to enable.
function cruiseControl.setEnabled(enabled) end

--- Enables the cruise control with the given setpoint (clamped to the minimum).
---Source: lua/vehicle/extensions/cruiseControl.lua:73
---@param speed number Setpoint in m/s.
function cruiseControl.setSpeed(speed) end

--- Sets the acceleration (in m/s²) of the setpoint ramp.
---Source: lua/vehicle/extensions/cruiseControl.lua:106
---@param target number Target acceleration, default 3.
function cruiseControl.setTargetAcceleration(target) end

--- Called every frame: if active, applies the PID regulation and handles the stop conditions.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/extensions/cruiseControl.lua:34
---@param dt number Time step in seconds.
function cruiseControl.updateGFX(dt) end

