# `partCondition`

*File: `lua/vehicle/partCondition.lua` · VM: Vehicle · 607 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** global `partCondition`

Vehicle part wear and condition system (mileage, integrity/damage, visual state including aged paint). It discovers which parts contain what (powertrain devices, tanks, flexbodies, breakable/deformable beams), calls powertrain, energyStorage and beamstate to apply or read their condition, and manages snapshots to be able to put the vehicle back into its spawn state on reset. The game Lua uses it to save and reload a vehicle's state (garage, career): initConditions at spawn, getConditions to save.

## Example

```lua
-- save the state
local conditions = partCondition.getConditions()  -- table partId -> {odometer, integrityValue, visualValue, integrityState, visualState} or false
-- reload
partCondition.initConditions(conditions, 0, 1, 1)
```

## Notes

- Depends on the `odometer` extension (extensions.odometer.getRelativeRecording / startRecording): a part's mileage = absolute base value + distance traveled since the condition was applied. The odometer units are those of the odometer extension (the paint aging threshold 5 000 000 -> 800 000 000 suggests cumulative meters, inferred).
- Part types (partTypeData[partId]) inferred on the first call: "powertrainDevice:<name>" (+ ":radiator", ":exhaust", ":turbocharger" for subsystems), "energyStorage:<name>", "jbeam:flexbody:<mesh>", "jbeam:breakGroup:<group>", "jbeam:beamDamage:<cid>" (breakable/deformable beams excluding support beams of type 7).
- Paint aging (getAgedPaint) increases roughness (of the clearcoat if there is one), decreases saturation (down to 0.95) and lightens the color between 5e6 and 8e8 of odometer. For the blue channel the lightening uses the green constant (maxColorBrightnessIncreaseG) instead of the blue one (apparent inconsistency in the code).
- A snapshot named "reset" is created at each initConditions and becomes the reset snapshot: partCondition.reset() (called by main.lua:onVehicleReset) clears the values and reapplies this snapshot.
- initCondition logs an error if a part's condition is applied twice (hasSetPartCondition) without going through reset or a snapshot.
- Minor bugs: in createConditionSnapshot the error message concatenates snapshotKey even when it is nil (which would raise an error); the error message of applyConditionSnapshot talks about "creating" a snapshot.
- getConditions returns false (not a table) if no condition has been applied yet. Per-part errors are caught (xpcall) and logged, the part is then absent from the result.
- testInit / testLoad / testSave are for debugging: write or read partConditionTest.json in the current directory.

## Functions

| Function | Description | Line |
|---|---|---|
| `partCondition.applyConditionSnapshot(snapshotKey)` | Reapplies a stored snapshot (resets the applied state then initConditions). Error logged if the key is absent. | 50 |
| `partCondition.createConditionSnapshot(snapshotKey)` | Stores the current state (getConditions) under a key. | 40 |
| `partCondition.deleteConditionSnapshots()` | Deletes all snapshots and the reset key. | 65 |
| `partCondition.ensureConditionsInit(fallbackOdometer, fallbackIntegrityValue, fallbackVisualValue)` | "Blind" call: initializes a new state if no condition has been applied yet (otherwise does nothing). | 558 |
| `partCondition.getConditions()` | Reads the current state of all parts: mileage, integrity (min of the subsystems), visual state (including paint) and detailed states per subsystem, ready to be saved or passed back to initConditions. | 489 |
| `partCondition.getRootPartOdometerValue()` | Returns the total odometer of the root part (slotType 'main'): base value + distance since the condition was applied. | 262 |
| `partCondition.getRootPartTripValue()` | Returns the distance traveled since the root part's condition was applied (trip). | 268 |
| `partCondition.initConditions(partsCondition, fallbackOdometer, fallbackIntegrityValue, fallbackVisualValue, defaultPaints)` | Applies the state of each vehicle part from a saved table (or a new state if nil), via powertrain, energyStorage, beamstate and paint, then creates the "reset" snapshot. | 515 |
| `partCondition.reset()` | Clears the stored conditions and, if a reset snapshot exists, reapplies it. Called by main.lua on vehicle reset. *(internal)* | 474 |
| `partCondition.setAllPartPaints(paints, paintOdometer)` | Applies the same set of aged paints to all active parts. | 356 |
| `partCondition.setPartMeshPaints(partId, paints)` | Applies the 3 paints (base color, roughness, metallic, clearcoat) to a part's flexbodies by sending setMeshColor / setMeshPaintData commands to the GE. | 273 |
| `partCondition.setPartPaints(partId, paints, paintOdometer)` | Stores a part's paints (entries 2 and 3 copy the 1st if absent), ages them according to the paint odometer and applies them to the meshes. | 348 |
| `partCondition.setResetSnapshotKey(snapshotKey)` | Chooses the snapshot applied by reset(). | 70 |
| `partCondition.testInit()` | Debug: initializes a test state (odometer 812812000, integrity 1, visual 1). *(internal)* | 564 |
| `partCondition.testLoad()` | Debug: loads partConditionTest.json and applies it with initConditions. *(internal)* | 569 |
| `partCondition.testSave()` | Debug: initializes if needed then writes getConditions() to partConditionTest.json. *(internal)* | 575 |

### Parameter details

#### `partCondition.applyConditionSnapshot(snapshotKey)`

Reapplies a stored snapshot (resets the applied state then initConditions). Error logged if the key is absent.

- `snapshotKey` (*string*) : Snapshot name.

#### `partCondition.createConditionSnapshot(snapshotKey)`

Stores the current state (getConditions) under a key.

- `snapshotKey` (*string*) : Snapshot name.

#### `partCondition.ensureConditionsInit(fallbackOdometer, fallbackIntegrityValue, fallbackVisualValue)`

"Blind" call: initializes a new state if no condition has been applied yet (otherwise does nothing).

- `fallbackOdometer` (*number|nil*) : Fallback odometer.
- `fallbackIntegrityValue` (*number|nil*) : Fallback integrity.
- `fallbackVisualValue` (*number|nil*) : Fallback visual state.

#### `partCondition.getConditions()`

Reads the current state of all parts: mileage, integrity (min of the subsystems), visual state (including paint) and detailed states per subsystem, ready to be saved or passed back to initConditions.

- **returns**: table|boolean Table partId -> condition, or false if nothing has been initialized yet.

#### `partCondition.getRootPartOdometerValue()`

Returns the total odometer of the root part (slotType 'main'): base value + distance since the condition was applied.

- **returns**: number Odometer of the main part.

#### `partCondition.getRootPartTripValue()`

Returns the distance traveled since the root part's condition was applied (trip).

- **returns**: number Trip distance.

#### `partCondition.initConditions(partsCondition, fallbackOdometer, fallbackIntegrityValue, fallbackVisualValue, defaultPaints)`

Applies the state of each vehicle part from a saved table (or a new state if nil), via powertrain, energyStorage, beamstate and paint, then creates the "reset" snapshot.

- `partsCondition` (*table|nil*) : Table partId -> {odometer, integrityValue, visualValue, integrityState, visualState}; nil = new vehicle.
- `fallbackOdometer` (*number|nil*) : Odometer for parts without data (0 by default).
- `fallbackIntegrityValue` (*number|nil*) : Integrity 0..1 by default (1).
- `fallbackVisualValue` (*number|nil*) : Visual state 0..1 by default (1).
- `defaultPaints` (*table|nil*) : Default paints (3 entries) replacing those from the jbeam for a numeric visual value.

#### `partCondition.setAllPartPaints(paints, paintOdometer)`

Applies the same set of aged paints to all active parts.

- `paints` (*table*) : Array of 1 to 3 paints.
- `paintOdometer` (*number*) : Paint wear.

#### `partCondition.setPartMeshPaints(partId, paints)`

Applies the 3 paints (base color, roughness, metallic, clearcoat) to a part's flexbodies by sending setMeshColor / setMeshPaintData commands to the GE.

- `partId` (*string*) : Identifier (path) of the part.
- `paints` (*table*) : Array of 3 paints {baseColor = {r,g,b,a (0..1)}, roughness, metallic, clearcoat, clearcoatRoughness}.

#### `partCondition.setPartPaints(partId, paints, paintOdometer)`

Stores a part's paints (entries 2 and 3 copy the 1st if absent), ages them according to the paint odometer and applies them to the meshes.

- `partId` (*string*) : Identifier of the part.
- `paints` (*table*) : Array of 1 to 3 paints.
- `paintOdometer` (*number*) : Paint wear (0 = new).

#### `partCondition.setResetSnapshotKey(snapshotKey)`

Chooses the snapshot applied by reset().

- `snapshotKey` (*string|nil*) : Reset snapshot key; nil to restore nothing.

## Calls into the engine (C++)

- `obj:` `queueGameEngineLua`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/vehicle/partCondition.lua`.*
