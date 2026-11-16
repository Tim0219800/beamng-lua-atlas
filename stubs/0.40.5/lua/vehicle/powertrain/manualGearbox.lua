---@meta
-- tim19Atlas stub generated from lua/vehicle/powertrain/manualGearbox.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Powertrain component `manualGearbox`: manual gearbox with fixed ratios. The active gear is chosen by setGearIndex (integer indices: 0 neutral, positive = forward gears, negative = reverse). It simulates synchronizers (wear, gear grinding with "grinding" torque), neutral (virtual mass), friction, locking (setLock) and the gear whine/grinding sounds. Its parent must be a clutch (category `clutch`). A modder or a controller (e.g. manual gearbox controller) calls setGearIndex; the game reads gearIndex, gearRatio, outputAV1.
--- Access: powertrain device type `manualGearbox` (jbeam `powertrain`), reachable with `powertrain.getDevice("name")`
---@class powertrain_manualGearbox
---@field deviceCategories table<string, boolean> {gearbox=true}.
---@field outputPorts table<integer, boolean> {[1]=true}: a single output port.
---@field requiredExternalInertiaOutputs table<integer, integer> {1}.
local powertrain_manualGearbox = {}

--- Builds the gearbox: reads gearRatios and builds the forward/reverse index tables, the gear whine coefficients, the synchronizer settings and the transmission node, then goes to neutral via setGearIndex(0).
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain/manualGearbox.lua:486
---@param jbeamData table jbeam data of the component (gearRatios required).
---@return table  The device (class `device`).
function powertrain_manualGearbox.new(jbeamData) end

--- Object returned by new(jbeamData).
---@class powertrain_manualGearbox_device
local powertrain_manualGearbox_device = {}

--- Increases the damage friction coefficient (0.01 of damage = +0.1).
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain/manualGearbox.lua:289
---@param damageAmount number Amount of damage of the deformation group.
function powertrain_manualGearbox_device:applyDeformGroupDamage(damageAmount) end

--- Takes the inertia and cumulative ratios of the first child; cumulativeInertia = downstream inertia / gearRatio² (with 2 * maxGearRatio in neutral).
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain/manualGearbox.lua:372
function powertrain_manualGearbox_device:calculateInertia() end

--- Returns the integrity 0..1 (0 if broken) and the table {damageFrictionCoef, synchroWear, isBroken}.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain/manualGearbox.lua:316
---@return number  Integrity 0..1.
---@return table  Saveable state.
function powertrain_manualGearbox_device:getPartCondition() end

--- Creates the sound objects (grinding, input and output gear whine), the smoothers and the pitch/volume coefficients from the jbeam, and sets the FMOD parameter c_gearboxMaxPower.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain/manualGearbox.lua:403
---@param jbeamData table jbeam data of the component.
function powertrain_manualGearbox_device:initSounds(jbeamData) end

--- Marks the gearbox as broken and switches to neutral mode (virtualMassAV). Called when the breakTriggerBeam beam breaks or via setPartCondition.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain/manualGearbox.lua:277
function powertrain_manualGearbox_device:onBreak() end

--- Resets the state (speeds, torque, wear, original ratios, synchros, damage) then goes back to neutral.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain/manualGearbox.lua:446
---@param jbeamData table jbeam data of the component.
function powertrain_manualGearbox_device:reset(jbeamData) end

--- Resets the sound smoothers and values (gear whine).
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain/manualGearbox.lua:391
function powertrain_manualGearbox_device:resetSounds() end

--- Enables or stops the grinding state: stores the targeted gear and the max torque, starts or stops the grinding sound loop.
---Source: lua/vehicle/powertrain/manualGearbox.lua:150
---@param active boolean true to start the grinding, false to stop it and reset everything.
---@param targetGearIndex integer|nil Index of the targeted gear (if active).
---@param maxGrindingTorque number|nil Maximum grinding torque in N·m (if active).
function powertrain_manualGearbox_device:setGearGrinding(active, targetGearIndex, maxGrindingTorque) end

--- Engages a gear. The index is clamped to [minGearIndex, maxGearIndex]. Without availableSyncTime, the shift always succeeds; with it, simulates the synchros and can trigger a grind (shift refused: the gear stays the old one). Recomputes the powertrain inertia if the gear is non-zero. 0 = neutral.
---Source: lua/vehicle/powertrain/manualGearbox.lua:196
---@param index integer Index of the desired gear (0 neutral, >0 forward, <0 reverse).
---@param availableSyncTime number|nil Duration in seconds during which the synchro could work; nil = do not simulate the synchros.
function powertrain_manualGearbox_device:setGearIndex(index, availableSyncTime) end

--- Locks or unlocks the transmission: lockCoef = 0 (locked, no torque or speed transmitted) or 1. Propagates the call to the parent (clutch) if it has setLock.
---Source: lua/vehicle/powertrain/manualGearbox.lua:282
---@param enabled boolean true to lock.
function powertrain_manualGearbox_device:setLock(enabled) end

--- Applies wear (odometer), damage (integrity number 0..1 or table) and synchro wear. Calls onBreak if the table indicates isBroken.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain/manualGearbox.lua:293
---@param subSystem any Not used.
---@param odometer number Distance traveled in meters.
---@param integrity number|table Number 0..1 or table {damageFrictionCoef, synchroWear, isBroken}.
---@param visual any Not used.
function powertrain_manualGearbox_device:setPartCondition(subSystem, odometer, integrity, visual) end

--- Called at each physics step: outputTorque1 = (parent torque - friction) * gearRatio * lockCoef, and feeds the sound smoothers. In neutral, calls updateGrinding, integrates the virtual mass and returns the grinding reaction.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain/manualGearbox.lua:71
---@param dt number Time step in seconds (used in neutral).
function powertrain_manualGearbox_device:torqueUpdate(dt) end

--- Per-frame update: currently empty (the debug and gear skip code is commented out).
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain/manualGearbox.lua:178
---@param dt number Frame duration in seconds.
function powertrain_manualGearbox_device:updateGFX(dt) end

--- During a grinding shift: computes the grinding torque and its sign, wears the synchro of the targeted gear, engages the gear when the speed gap falls below 20 rad/s, plays the grinding sound and displays "Synchronizer damage" messages.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain/manualGearbox.lua:99
---@param dt number Time step in seconds.
function powertrain_manualGearbox_device:updateGrinding(dt) end

--- Updates the volume and pitch of the gear whine sound loops (input and output) from the smoothed speeds/torques and the current gear. Called every frame by the powertrain.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain/manualGearbox.lua:19
---@param dt number Frame duration in seconds.
function powertrain_manualGearbox_device:updateSounds(dt) end

--- Checks that the parent is a clutch (or a fake one), logs an error and returns false otherwise. Determines transmissionNodeID and the expected values (max engine torque and speed, power) used to normalize the sounds.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain/manualGearbox.lua:329
---@return boolean  false if the parent is not a clutch.
function powertrain_manualGearbox_device:validate() end

--- Called at each physics step: inputAV = outputAV1 * gearRatio * lockCoef (or virtual mass in neutral) and written to the parent.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain/manualGearbox.lua:66
---@param dt number Time step in seconds (unused).
function powertrain_manualGearbox_device:velocityUpdate(dt) end

return powertrain_manualGearbox
