---@meta
-- tim19Atlas stub generated from lua/vehicle/controller/twoStepLaunch.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Auxiliary "two-step" controller (standing-start rev limiter). Once enabled, it arms when the vehicle is almost stopped with throttle AND brake pressed, then imposes a temporary rev limiter on the engine (engine:setTempRevLimiter) at tempRevLimiterRPM. Releasing brake or throttle disarms it. A modder enables it through toggleTwoStep/setTwoStep or via the radial menu it registers. Publishes electrics.values.twoStep (jbeam name electricsName).
--- Access: controller `twoStepLaunch` declared in the jbeam (`controller`), reachable with `controller.getController("name")`
---@class controller_twoStepLaunch
---@field type string "auxiliary".
local controller_twoStepLaunch = {}

--- Adds a value to the two-step rev limit and displays a message.
---Source: lua/vehicle/controller/twoStepLaunch.lua:56
---@param amount number Change in RPM.
function controller_twoStepLaunch.changeTwoStepRPM(amount) end

--- Restores the state and RPM from the serialize table.
---Source: lua/vehicle/controller/twoStepLaunch.lua:176
---@param data table Table {state, rpm}.
function controller_twoStepLaunch.deserialize(data) end

--- Synchronizable state: <name>_enabled (boolean) and <name>_rpm.
---Source: lua/vehicle/controller/twoStepLaunch.lua:192
---@return table  State table.
function controller_twoStepLaunch.getState() end

--- Reads the jbeam keys, gets the engine, sets the rev limit and registers the quick menu entries.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/twoStepLaunch.lua:91
---@param jbeamData table Controller jbeam data.
function controller_twoStepLaunch.init(jbeamData) end

--- Resets the engine's temporary limiter and sets the state back to idle if it was active.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/twoStepLaunch.lua:82
function controller_twoStepLaunch.reset() end

--- Returns {state, rpm} for saving.
---Source: lua/vehicle/controller/twoStepLaunch.lua:169
---@return table  Current state.
function controller_twoStepLaunch.serialize() end

--- Applies external parameters: isEnabled (boolean) and launchRPM (RPM).
---Source: lua/vehicle/controller/twoStepLaunch.lua:183
---@param parameters table Table {isEnabled?, launchRPM?}.
function controller_twoStepLaunch.setParameters(parameters) end

--- Restores activation and RPM from the getState table (silent).
---Source: lua/vehicle/controller/twoStepLaunch.lua:198
---@param data table|nil Table produced by getState.
function controller_twoStepLaunch.setState(data) end

--- Enables (idle state) or disables the two-step (resets the temporary limiter) and displays a message unless silent.
---Source: lua/vehicle/controller/twoStepLaunch.lua:28
---@param enabled boolean Enable?
---@param silent boolean|nil Do not display a message.
function controller_twoStepLaunch.setTwoStep(enabled, silent) end

--- Toggles the two-step activation.
---Source: lua/vehicle/controller/twoStepLaunch.lua:42
function controller_twoStepLaunch.toggleTwoStep() end

--- Every frame: advances the state (idle -> armed) and applies/removes the temporary limiter, publishes the electric. (dynamically assigned)
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/twoStepLaunch.lua:dyn
---@param dt number Time step in seconds.
function controller_twoStepLaunch.updateGFX(dt) end

return controller_twoStepLaunch
