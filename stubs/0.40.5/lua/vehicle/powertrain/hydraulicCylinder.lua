---@meta
-- tim19Atlas stub generated from lua/vehicle/powertrain/hydraulicCylinder.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Hydraulic cylinder: this is NOT a standalone powertrain component. It is a hydraulic "consumer" created by hydraulicPump.new for each entry of `v.data.powertrainHydros` whose `connectedPump` is the name of the pump and whose `type` is 'hydraulicCylinder'. The cylinder pushes or pulls beams (identified by `beamTags`) via obj:actuateBeam according to the valve position (electrics value `directionElectricsName`, -1 to 1) and the pressure supplied by the pump, returns the consumed flow to the pump, supports several valve types (float, closed, tandem, drop, bypass), telescopic stages and a position control mode (PID).
--- Access: powertrain device type `hydraulicCylinder` (jbeam `powertrain`), reachable with `powertrain.getDevice("name")`
---@class hydraulicCylinder
hydraulicCylinder = {}

--- Builds a hydraulic cylinder: piston and rod areas (or telescopic stages), beams to actuate from the beamTags tags, valve, smoothers, position PID. Called by hydraulicPump.new for each declared consumer.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain/hydraulicCylinder.lua:592
---@param cylinderData table Cylinder data (powertrainHydros entry merged with v.data[name]).
---@param pumpDevice table hydraulicPump device to which the cylinder is connected (its name is used to name the state keys).
---@return table  The cylinder (class `cylinder`).
function hydraulicCylinder.new(cylinderData, pumpDevice) end

--- Object returned by new(cylinderData, pumpDevice). The update method changes according to the valve type (setValveType).
---@class hydraulicCylinder_cylinder
local hydraulicCylinder_cylinder = {}

--- Returns the active stage of the cylinder for the current extension. Conventional version: always the first stage. Telescopic version: raw stage, with interpolated areas if it is a transition.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain/hydraulicCylinder.lua:94
---@return table  Stage {stageExtendStart, stageExtendEnd, cylinderExtendArea, shaftArea, cylinderContractArea, regenAreaRatio, invRegenAreaRatio, cylinderActiveArea}.
function hydraulicCylinder_cylinder:getCylinderStage() end

--- Searches the list of stages for the one that contains the current extension, starting from the current stage (local search). Stores currentStageId.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain/hydraulicCylinder.lua:40
---@return table  Stage found (the first one by default, with a warning).
function hydraulicCylinder_cylinder:getRawCylinderStage() end

--- Returns the saveable state: key '<pump>_<cylinder>_target_position' = current extension as a percentage (0..1).
---Source: lua/vehicle/powertrain/hydraulicCylinder.lua:563
---@return table  stateData table.
function hydraulicCylinder_cylinder:getState() end

--- Creates the movement sound loop (if movementLoopEvent is defined) and the speed and volume smoothers.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain/hydraulicCylinder.lua:490
---@param cylinderData table Cylinder data (movementLoop* keys).
function hydraulicCylinder_cylinder:initSounds(cylinderData) end

--- Resets speed, smoothers, valve position, mode (direct), target position (current position), PID, current stage and reinitializes the extension electrics values.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain/hydraulicCylinder.lua:520
---@param jbeamData table Cylinder data (unused here).
function hydraulicCylinder_cylinder:reset(jbeamData) end

--- Resets the movement sound speed smoother.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain/hydraulicCylinder.lua:516
---@param cylinderData table Cylinder data (unused).
function hydraulicCylinder_cylinder:resetSounds(cylinderData) end

--- Restores the target position (finite number, clamped to 0..1) from data['<pump>_<cylinder>_target_position'] and switches to 'position' mode if the gap exceeds the dead zone, otherwise to 'direct' mode.
---Source: lua/vehicle/powertrain/hydraulicCylinder.lua:568
---@param data table|nil State table produced by getState.
function hydraulicCylinder_cylinder:setState(data) end

--- Chooses the valve type: 'float', 'closed', 'tandem', 'drop' or 'bypass'. An invalid type logs an error and installs an empty update function.
---Source: lua/vehicle/powertrain/hydraulicCylinder.lua:399
---@param valveType string Valve type.
function hydraulicCylinder_cylinder:setValveType(valveType) end

--- Called by the pump at each physics step (consumer:update). Computes the cylinder force from the input pressure and the active area, actuates each beam (obj:actuateBeam) with speed limit, slip force (relief pressure) and drag, updates extension, velocity and consumed flow. Its version depends on the valve: updateFloat, updateClosed, updateTandem, updateDrop, updateBypass or updateDummy.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain/hydraulicCylinder.lua:106
---@param inputPressure number Accumulator pressure of the pump in Pa.
---@param dt number Time step in seconds.
---@return number  Flow consumed by the cylinder in m³/s (>= 0).
---@return number  Flow returned to the reservoir in m³/s (non-zero only for tandem).
function hydraulicCylinder_cylinder:update(inputPressure, dt) end

--- For a transition stage: interpolates the areas between the two neighboring stages according to the extension (factor 0 to 1).
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain/hydraulicCylinder.lua:28
---@param stage table Transition stage to update.
function hydraulicCylinder_cylinder:updateBlendedStage(stage) end

--- Called every frame by the pump: reads the direction electrics value (or the PID position in position mode), computes valvePosition, valveSign, the active areas and the drag coefficient, then publishes the extension and the extension percentage in the requested electrics.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain/hydraulicCylinder.lua:456
---@param dt number Frame duration in seconds.
function hydraulicCylinder_cylinder:updateGFX(dt) end

--- Sets the volume of the movement sound loop according to the (smoothed) cylinder speed.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain/hydraulicCylinder.lua:478
---@param dt number Frame duration in seconds.
function hydraulicCylinder_cylinder:updateSounds(dt) end

--- Chooses the active area of the stage: extension area if valveSign >= 0, retraction area otherwise.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain/hydraulicCylinder.lua:452
---@param stage table Stage to update.
function hydraulicCylinder_cylinder:updateStageActiveArea(stage) end

