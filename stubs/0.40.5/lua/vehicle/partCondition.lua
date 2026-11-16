---@meta
-- tim19Atlas stub generated from lua/vehicle/partCondition.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Vehicle part wear and condition system (mileage, integrity/damage, visual state including aged paint). It discovers which parts contain what (powertrain devices, tanks, flexbodies, breakable/deformable beams), calls powertrain, energyStorage and beamstate to apply or read their condition, and manages snapshots to be able to put the vehicle back into its spawn state on reset. The game Lua uses it to save and reload a vehicle's state (garage, career): initConditions at spawn, getConditions to save.
--- Access: global `partCondition`
---@class partCondition
partCondition = {}

--- Reapplies a stored snapshot (resets the applied state then initConditions). Error logged if the key is absent.
---Source: lua/vehicle/partCondition.lua:50
---@param snapshotKey string Snapshot name.
function partCondition.applyConditionSnapshot(snapshotKey) end

--- Stores the current state (getConditions) under a key.
---Source: lua/vehicle/partCondition.lua:40
---@param snapshotKey string Snapshot name.
function partCondition.createConditionSnapshot(snapshotKey) end

--- Deletes all snapshots and the reset key.
---Source: lua/vehicle/partCondition.lua:65
function partCondition.deleteConditionSnapshots() end

--- "Blind" call: initializes a new state if no condition has been applied yet (otherwise does nothing).
---Source: lua/vehicle/partCondition.lua:558
---@param fallbackOdometer number|nil Fallback odometer.
---@param fallbackIntegrityValue number|nil Fallback integrity.
---@param fallbackVisualValue number|nil Fallback visual state.
function partCondition.ensureConditionsInit(fallbackOdometer, fallbackIntegrityValue, fallbackVisualValue) end

--- Reads the current state of all parts: mileage, integrity (min of the subsystems), visual state (including paint) and detailed states per subsystem, ready to be saved or passed back to initConditions.
---Source: lua/vehicle/partCondition.lua:489
---@return table|boolean  Table partId -> condition, or false if nothing has been initialized yet.
function partCondition.getConditions() end

--- Returns the total odometer of the root part (slotType 'main'): base value + distance since the condition was applied.
---Source: lua/vehicle/partCondition.lua:262
---@return number  Odometer of the main part.
function partCondition.getRootPartOdometerValue() end

--- Returns the distance traveled since the root part's condition was applied (trip).
---Source: lua/vehicle/partCondition.lua:268
---@return number  Trip distance.
function partCondition.getRootPartTripValue() end

--- Applies the state of each vehicle part from a saved table (or a new state if nil), via powertrain, energyStorage, beamstate and paint, then creates the "reset" snapshot.
---Source: lua/vehicle/partCondition.lua:515
---@param partsCondition table|nil Table partId -> {odometer, integrityValue, visualValue, integrityState, visualState}; nil = new vehicle.
---@param fallbackOdometer number|nil Odometer for parts without data (0 by default).
---@param fallbackIntegrityValue number|nil Integrity 0..1 by default (1).
---@param fallbackVisualValue number|nil Visual state 0..1 by default (1).
---@param defaultPaints table|nil Default paints (3 entries) replacing those from the jbeam for a numeric visual value.
function partCondition.initConditions(partsCondition, fallbackOdometer, fallbackIntegrityValue, fallbackVisualValue, defaultPaints) end

--- Clears the stored conditions and, if a reset snapshot exists, reapplies it. Called by main.lua on vehicle reset.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/partCondition.lua:474
function partCondition.reset() end

--- Applies the same set of aged paints to all active parts.
---Source: lua/vehicle/partCondition.lua:356
---@param paints table Array of 1 to 3 paints.
---@param paintOdometer number Paint wear.
function partCondition.setAllPartPaints(paints, paintOdometer) end

--- Applies the 3 paints (base color, roughness, metallic, clearcoat) to a part's flexbodies by sending setMeshColor / setMeshPaintData commands to the GE.
---Source: lua/vehicle/partCondition.lua:273
---@param partId string Identifier (path) of the part.
---@param paints table Array of 3 paints {baseColor = {r,g,b,a (0..1)}, roughness, metallic, clearcoat, clearcoatRoughness}.
function partCondition.setPartMeshPaints(partId, paints) end

--- Stores a part's paints (entries 2 and 3 copy the 1st if absent), ages them according to the paint odometer and applies them to the meshes.
---Source: lua/vehicle/partCondition.lua:348
---@param partId string Identifier of the part.
---@param paints table Array of 1 to 3 paints.
---@param paintOdometer number Paint wear (0 = new).
function partCondition.setPartPaints(partId, paints, paintOdometer) end

--- Chooses the snapshot applied by reset().
---Source: lua/vehicle/partCondition.lua:70
---@param snapshotKey string|nil Reset snapshot key; nil to restore nothing.
function partCondition.setResetSnapshotKey(snapshotKey) end

--- Debug: initializes a test state (odometer 812812000, integrity 1, visual 1).
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/partCondition.lua:564
function partCondition.testInit() end

--- Debug: loads partConditionTest.json and applies it with initConditions.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/partCondition.lua:569
function partCondition.testLoad() end

--- Debug: initializes if needed then writes getConditions() to partConditionTest.json.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/partCondition.lua:575
function partCondition.testSave() end

