---@meta
-- tim19Atlas stub generated from lua/vehicle/controller/esc.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Auxiliary controller (type "auxiliary", defaultOrder 50) that implements the car's stability control (ESC) and traction control (TCS). The ESC compares the measured yaw rate to a desired yaw rate (computed from the front wheel angle, the speed, a characteristic speed and a max lateral acceleration) and brakes one wheel to correct oversteer or understeer. The TCS compares the speed of each driven wheel to that of the diagonal wheel and reduces engine thrust (throttle factors written into electrics.values) and/or brakes the slipping wheel. A modder uses it by declaring the controller in the jbeam with a block of configurations, or drives it with its mode functions (toggleESCMode, setESCMode). It writes electrics.values.esc, tcs, escActive, tcsActive, hasESC, hasTCS and one or more throttle factors (by default electrics.values.throttleFactor), which must be read by the engine/throttle for the TCS to act.
--- Access: controller `esc` declared in the jbeam (`controller`), reachable with `controller.getController("name")`
---@class controller_esc
---@field calibrationMeasurementReady boolean True when the calibration stiffness measurement is finished.
---@field calibrationSettled boolean True when the calibration settling phase is finished.
---@field debugData table Data for the debug app: debugData.esc (steeringAngle, yawRate, desiredYawRate, difference, desiredYawRateAcceleration, desiredYawRateSteering, speed) and debugData.tcs (wheelBrakeFactors, wheelSlips, slipThreshold, throttleFactors, allWheelSlips). Only yawRate, desiredYawRate, difference and the tcs fields are updated; steeringAngle, desiredYawRateAcceleration/Steering and speed stay at 0.
---@field defaultOrder number Default execution order of the controller (50).
---@field doMeasure boolean Set to true to start the calibration measurement phase (3500 steps); returns to false at the end.
---@field doSettle boolean Set to true to start the calibration settling phase (1500 steps); returns to false at the end.
---@field isExisting boolean Always true: serves as a marker indicating that an ESC exists.
---@field pauseESCAction boolean If true, the ESC no longer brakes and the TCS is treated as disabled. Reset to false at initSecondStage.
---@field stiffnessFront number Average cornering stiffness of the front axle estimated by the calibration.
---@field stiffnessRear number Average cornering stiffness of the rear axle estimated by the calibration.
---@field type string Always "auxiliary".
---@field wheelAngleFront number Actual steering angle of the front wheels (rad), updated every step.
---@field wheelAngleRear number Actual steering angle of the rear wheels (rad), updated every step.
local controller_esc = {}

--- Restores the configuration from serialize().
---Source: lua/vehicle/controller/esc.lua:1062
---@param data table|nil Table returned by serialize.
function controller_esc.deserialize(data) end

--- Returns the computed vehicle geometry, or nil if the mass is zero.
---Source: lua/vehicle/controller/esc.lua:621
---@return table|nil  {wheels, frontLeftWheelId, frontRightWheelId, rearLeftWheelId, rearRightWheelId, wheelBase (m), trackWidth (m), distanceCOGRearAxle (m), distanceCOGFrontAxle (m), mass (kg)}
function controller_esc.getCarData() end

--- Returns the table of the current ESC configuration (sanitized fields, with name).
---Source: lua/vehicle/controller/esc.lua:640
---@return table|nil  Current configuration; nil if no ESC.
function controller_esc.getCurrentConfigData() end

--- Returns the state table (key "<controllerName>ConfigKey" = current index) for saving/synchronizing the vehicle.
---Source: lua/vehicle/controller/esc.lua:1068
---@return table  Shared state table (reused).
function controller_esc.getState() end

--- Stores the jbeam data, creates the state table for saving and resets the LED color. Called by the controller loading.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/esc.lua:820
---@param jbeamData table Controller data in the jbeam (see notes).
function controller_esc.init(jbeamData) end

--- Builds the wheel caches, identifies the front/rear left/right wheels by geometry, loads and sorts the configurations, computes wheelbase, mass distribution, characteristic speed, registers the radial menu entry and installs updateWheelsIntermediate and updateGFX. Called after the init of all controllers.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/esc.lua:828
function controller_esc.initSecondStage() end

--- Switches to the next configuration, without wrapping (stays on the last).
---Source: lua/vehicle/controller/esc.lua:715
function controller_esc.nextESCMode() end

--- Switches to the previous configuration, without wrapping (stays on the first).
---Source: lua/vehicle/controller/esc.lua:720
function controller_esc.previousESCMode() end

--- Returns the state to save: the current configuration index.
---Source: lua/vehicle/controller/esc.lua:1058
---@return table  {escConfigKey = integer}
function controller_esc.serialize() end

--- Activates the configuration at index key (falls back to 1 if key exceeds the number of configurations), recomputes the precomputed values and shows a UI message unless silent. Does nothing if the vehicle has no ESC or lost a wheel.
---Source: lua/vehicle/controller/esc.lua:684
---@param key integer Index 1..n in the configuration list sorted by order.
---@param silent boolean|nil If true, no guihooks message.
function controller_esc.setESCMode(key, silent) end

--- Applies a state returned by getState if the index is a valid integer and differs from the current one (no message).
---Source: lua/vehicle/controller/esc.lua:1075
---@param data table|nil State table.
function controller_esc.setState(data) end

--- Resets the calibration counters and results then enables the cornering stiffness computation at every step (to be used with doMeasure/doSettle).
---Source: lua/vehicle/controller/esc.lua:603
function controller_esc.startESCCalibration() end

--- Disables the calibration computation.
---Source: lua/vehicle/controller/esc.lua:617
function controller_esc.stopESCCalibration() end

--- Switches to the next ESC configuration; after the last, returns to the first. Called by the interface button.
---Source: lua/vehicle/controller/esc.lua:709
function controller_esc.toggleESCMode() end

--- Blinks the esc/tcs lights (0.15 s period when active), writes electrics.values.esc/tcs/escActive/tcsActive and fills debugData. Dynamically defined by initSecondStage. (dynamically assigned)
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/esc.lua:dyn
---@param dt number Graphics time step in seconds.
function controller_esc.updateGFX(dt) end

--- Forces the (re)creation of the "ESC & TC" button in the powertrain simplified control panel (ui_simplePowertrainControl), with the color of the current configuration.
---Source: lua/vehicle/controller/esc.lua:147
function controller_esc.updateSimpleControlButtons() end

--- ESC + TCS + decision loop at every physics step (see the module notes). Dynamically defined by initSecondStage. (dynamically assigned)
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/esc.lua:dyn
---@param dt number Time step in seconds.
function controller_esc.updateWheelsIntermediate(dt) end

return controller_esc
