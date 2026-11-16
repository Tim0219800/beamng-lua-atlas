---@meta
-- tim19Atlas stub generated from lua/vehicle/powertrain/cvtGearbox.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Powertrain component `cvtGearbox`: continuously variable transmission (CVT) with a variable ratio between minGearRatio and maxGearRatio. The ratio is not chosen by this file: an external controller calls setGearRatio each step. The possible modes are set by setMode: 'neutral' (virtual mass), 'park' (spring parking lock), 'reverse' (reverses the direction), otherwise forward. A one-way viscous coupling prevents rolling backward. The file contains no automatic control logic.
--- Access: powertrain device type `cvtGearbox` (jbeam `powertrain`), reachable with `powertrain.getDevice("name")`
---@class powertrain_cvtGearbox
---@field deviceCategories table<string, boolean> {gearbox=true}.
---@field outputPorts table<integer, boolean> {[1]=true}.
---@field requiredExternalInertiaOutputs table<integer, integer> {1}.
local powertrain_cvtGearbox = {}

--- Builds the CVT gearbox: minimum/maximum ratio parameters, parking lock, one-way coupling, then sets the ratio to maxGearRatio.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain/cvtGearbox.lua:180
---@param jbeamData table jbeam data of the component.
---@return table  The device (class `device`).
function powertrain_cvtGearbox.new(jbeamData) end

--- Object returned by new(jbeamData). velocityUpdate/torqueUpdate depend on the mode (normal, neutral, park).
---@class powertrain_cvtGearbox_device
local powertrain_cvtGearbox_device = {}

--- Increases the damage friction coefficient (0.01 of damage = +0.1).
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain/cvtGearbox.lua:82
---@param damageAmount number Amount of damage of the deformation group.
function powertrain_cvtGearbox_device:applyDeformGroupDamage(damageAmount) end

--- Takes the cumulative inertia and ratios of the first child; computes cumulativeInertia (divided by maxGearRatio²), the parking lock parameters (spring, damping, max angle) and the cumulative ratios.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain/cvtGearbox.lua:130
function powertrain_cvtGearbox_device:calculateInertia() end

--- Returns the integrity 0..1 (0 if broken) and {damageFrictionCoef, isBroken}.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain/cvtGearbox.lua:101
---@return number  Integrity 0..1.
---@return table  Saveable state.
function powertrain_cvtGearbox_device:getPartCondition() end

--- Resets speeds, torque, virtual mass, coefficients, the one-way smoother and the parking angle, then sets the ratio to maxGearRatio.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain/cvtGearbox.lua:152
---@param jbeamData table jbeam data of the component (gearRatio, friction).
function powertrain_cvtGearbox_device:reset(jbeamData) end

--- Sets the current ratio, clamped between minGearRatio and maxGearRatio. Called by a CVT controller.
---Source: lua/vehicle/powertrain/cvtGearbox.lua:120
---@param ratio number Desired ratio (input / output, unsigned).
function powertrain_cvtGearbox_device:setGearRatio(ratio) end

--- Locks (lockCoef = 0: no speed or torque transmitted) or unlocks (1) the transmission.
---Source: lua/vehicle/powertrain/cvtGearbox.lua:126
---@param enabled boolean true to lock.
function powertrain_cvtGearbox_device:setLock(enabled) end

--- Changes the gearbox mode (no validation of the string). 'reverse' reverses the direction (reverseGearRatioCoef = -1); 'neutral' and 'park' select dedicated update functions with virtual mass; any other value = forward.
---Source: lua/vehicle/powertrain/cvtGearbox.lua:114
---@param mode string 'neutral', 'park', 'reverse' or other (forward).
function powertrain_cvtGearbox_device:setMode(mode) end

--- Applies wear (odometer, coefficient from 1 to 2) and damage (integrity number 0..1 or table {damageFrictionCoef, isBroken}). Calls onBreak if isBroken, which is not defined on this device (see notes).
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain/cvtGearbox.lua:86
---@param subSystem any Not used.
---@param odometer number Distance traveled in meters.
---@param integrity number|table Number 0..1 or state table.
---@param visual any Not used.
function powertrain_cvtGearbox_device:setPartCondition(subSystem, odometer, integrity, visual) end

--- Called at each physics step: computes outputTorque1 according to the mode. Normal: transmission with friction and one-way coupling; neutral: output torque 0 and acceleration of the virtual mass; park: spring/damper lock torque.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain/cvtGearbox.lua:48
---@param dt number Time step in seconds (used in neutral and park).
function powertrain_cvtGearbox_device:torqueUpdate(dt) end

--- Called after the powertrain is built; always returns true.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain/cvtGearbox.lua:110
---@return boolean  true.
function powertrain_cvtGearbox_device:validate() end

--- Called at each physics step: inputAV = outputAV1 * gearRatio * lockCoef * reverseGearRatioCoef, written to the parent. In neutral and park: uses the virtual mass.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain/cvtGearbox.lua:43
---@param dt number Time step in seconds.
function powertrain_cvtGearbox_device:velocityUpdate(dt) end

return powertrain_cvtGearbox
