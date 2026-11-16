---@meta
-- tim19Atlas stub generated from lua/vehicle/powertrain/rangeBox.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Powertrain component `rangeBox`: range box (reducer with two ranges "high" / "low", e.g. 4x4 low-range transfer case or truck range). The ratio only changes via setMode: 'high' selects the smallest ratio, 'low' the largest. The transmission always stays engaged (no neutral or synchro). A modder uses it to switch between high and low range; the user control goes through powertrain.toggleDeviceMode(name) or the simple interface button.
--- Access: powertrain device type `rangeBox` (jbeam `powertrain`), reachable with `powertrain.getDevice("name")`
---@class powertrain_rangeBox
---@field deviceCategories table<string, boolean> {gearbox=true}.
---@field outputPorts table<integer, boolean> {[1]=true}.
---@field requiredExternalInertiaOutputs table<integer, integer> {1}.
local powertrain_rangeBox = {}

--- Builds the range box: ratio table (forward and reverse), high and low range indices, initial mode and saveable state.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain/rangeBox.lua:143
---@param jbeamData table jbeam data of the component (gearRatios required).
---@return table  The device (class `device`).
function powertrain_rangeBox.new(jbeamData) end

--- Object returned by new(jbeamData).
---@class powertrain_rangeBox_device
local powertrain_rangeBox_device = {}

--- Increases the damage friction coefficient (0.01 of damage = +0.1).
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain/rangeBox.lua:82
---@param damageAmount number Amount of damage of the deformation group.
function powertrain_rangeBox_device:applyDeformGroupDamage(damageAmount) end

--- Takes the inertia and cumulative ratios of the first child; cumulativeInertia = inertia / gearRatio² (maxGearRatio if the ratio is 0).
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain/rangeBox.lua:110
function powertrain_rangeBox_device:calculateInertia() end

--- Returns the integrity 0..1 (0 if broken) and {damageFrictionCoef, isBroken}.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain/rangeBox.lua:101
---@return number  Integrity 0..1.
---@return table  Saveable state.
function powertrain_rangeBox_device:getPartCondition() end

--- Returns stateData with the key '<name>Mode' = current mode (for saving).
---Source: lua/vehicle/powertrain/rangeBox.lua:66
---@return table  stateData.
function powertrain_rangeBox_device:getState() end

--- Resets speeds, torque, cumulative inertia, wear/damage coefficients and isBroken; rereads friction. Does not reset the gear.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain/rangeBox.lua:127
---@param jbeamData table jbeam data of the component.
function powertrain_rangeBox_device:reset(jbeamData) end

--- Chooses the gear by its index (clamped to [minGearIndex, maxGearIndex]) and recomputes the powertrain inertia, unless omitInertiaCaculation is true.
---Source: lua/vehicle/powertrain/rangeBox.lua:24
---@param index integer Desired gear index.
---@param omitInertiaCaculation boolean|nil true to not call powertrain.calculateTreeInertia().
function powertrain_rangeBox_device:setGearIndex(index, omitInertiaCaculation) end

--- Switches to 'high' range (smallest ratio) or 'low' range (largest ratio). Any other value is ignored. Updates the UI button.
---Source: lua/vehicle/powertrain/rangeBox.lua:52
---@param mode string 'high' or 'low'.
function powertrain_rangeBox_device:setMode(mode) end

--- Applies wear (odometer, coefficient from 1 to 2) and damage (integrity number 0..1 or table); calls onBreak if isBroken, which is not defined on this device.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain/rangeBox.lua:86
---@param subSystem any Not used.
---@param odometer number Distance traveled in meters.
---@param integrity number|table Number 0..1 or table {damageFrictionCoef, isBroken}.
---@param visual any Not used.
function powertrain_rangeBox_device:setPartCondition(subSystem, odometer, integrity, visual) end

--- Restores the mode from data['<name>Mode'] if it is a string different from the current mode.
---Source: lua/vehicle/powertrain/rangeBox.lua:71
---@param data table|nil State table produced by getState.
function powertrain_rangeBox_device:setState(data) end

--- Called at each physics step: outputTorque1 = (parent torque - friction) * gearRatio.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain/rangeBox.lua:20
function powertrain_rangeBox_device:torqueUpdate() end

--- If several modes and uiSimpleModeControl: updates the simple interface button (icons powertrain_rangebox_high / low) for powertrain.toggleDeviceMode(name).
---Source: lua/vehicle/powertrain/rangeBox.lua:33
function powertrain_rangeBox_device:updateSimpleControlButtons() end

--- Called at each physics step: inputAV = outputAV1 * gearRatio, written to the parent.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain/rangeBox.lua:15
---@param dt number Time step in seconds (unused).
function powertrain_rangeBox_device:velocityUpdate(dt) end

return powertrain_rangeBox
