# `powertrain_nitrousOxideInjection`

*File: `lua/vehicle/powertrain/nitrousOxideInjection.lua` · VM: Vehicle · 284 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** powertrain device type `nitrousOxideInjection` (jbeam `powertrain`), reachable with `powertrain.getDevice("name")`

Nitrous oxide (NOS) injection submodule for a combustion engine. It is NOT an independent powertrain component: it does not export `new`; it is a module with global state in the file (a single instance per vehicle VM), initialized by the engine with `init(device, data)`. It reads three electrics values (arming, override, activation), adds torque to the engine (`engine.nitrousOxideTorque`) according to a per-RPM table, consumes energy from the registered `n2o` tanks and handles the purging of the lines (particles and sound).

## Example

```lua
electrics.values.nitrousOxideArm = 1       -- arm (>= 1)
electrics.values.nitrousOxideOverride = 1  -- force the injection without conditions
print(electrics.values.nitrousOxideActive)
```

## Notes

- Jbeam keys read in data (init): addedPower (kW), cutInRPM (cut-in speed, default = engine idleRPM, clamped to 0.9 * maxRPM), cutInRange (RPM of progressive ramp-up, 50), electricsArmName ('nitrousOxideArm'), electricsOverrideName ('nitrousOxideOverride'), electricsActiveName ('nitrousOxideActive'), minimumGear (0), volumeCoef (1.5, multiplies the engine sound volume when the NOS is active), purgeValves_nodes (list of node cid pairs). initSounds reads data.purgeSoundEvent ('event:>Vehicle>Nitrous_Purging') and purgeSoundVolume (1). If data is nil, the module is disabled (updateGFX = nop).
- Activation conditions (per frame): (armed AND engine throttle >= 1 AND RPM >= cutInRPM AND |electrics.gearIndex| >= minimumGear AND clutch not used (electrics.clutch == 0)) OR manual override, AND liquid available, AND no purge in progress. Arming and override are read from electrics.values with a threshold >= 1.
- Effects on the engine: engine.nitrousOxideTorque += additional torque (N·m, = added power / angular speed), engine.engineVolumeCoef *= volumeCoef if torque > 0, engine.invBurnEfficiencyCoef *= 2 when active. The engine must reset these fields to their value before each call to updateGFX. The consumption goes through engine.spentEnergyNitrousOxide shared between the registered tanks.
- Public fields: isExisting (true), isArmed (boolean updated every frame), isActive (boolean), updateGFX and updateSounds (reassigned by init; nop by default).
- Bugs / pitfalls: the nitrousOxideTorqueLookup torque tables are filled at index i + 1 (value for i RPM) but are read at the integer RPM index (updateGFX) or rpm (getAddedTorque): a one-RPM offset with no practical consequence. registerStorage crashes if the storage name is unknown (storage nil, then storage.storedEnergy). updateGFX reads abs(electrics.values.gearIndex): error if gearIndex does not exist. cutInRange = 0 gives a division by zero. Only one engine at a time (global state in the module).

## Functions

| Function | Description | Line |
|---|---|---|
| `powertrain_nitrousOxideInjection.getAddedTorque()` | Returns the table of additional torque (N·m) per RPM of the engine torque curve (indexed like torqueCurve, k+1), without any activation condition. Used to draw the torque curve with NOS. | 259 |
| `powertrain_nitrousOxideInjection.getPurgeTimeRemaining()` | Returns the remaining purge time in seconds (0 if no purge). | 53 |
| `powertrain_nitrousOxideInjection.getTankRatio()` | Returns the average of the relative level (remainingRatio, 0..1) of the registered tanks, or 0 if there are none. Useful for a gauge. | 57 |
| `powertrain_nitrousOxideInjection.init(device, data)` | Initializes the module for an engine: builds the additional torque tables per RPM (progressive ramp-up from cutInStart to cutInRPM), reads the electrics names, the minimum gear, the purge valves. Called by the combustion engine at initialization; with data nil, disables the module. *(internal)* | 193 |
| `powertrain_nitrousOxideInjection.initSounds(data)` | Reads the purge sound event and volume from the jbeam. Called at engine sound initialization. *(internal)* | 248 |
| `powertrain_nitrousOxideInjection.purgeLines(purgeTime)` | Starts the purging of the NOS lines for purgeTime seconds (particles and sound at the valves) if there are purge valves and liquid; otherwise resets the purge time to 0. Blocks the injection during the purge. | 49 |
| `powertrain_nitrousOxideInjection.registerStorage(storageName)` | Registers an energy tank (nitrous liquid) of the engine for NOS consumption. Called by the engine for each energy storage of the expected type. *(internal)* | 166 |
| `powertrain_nitrousOxideInjection.reset()` | Resets the states (arming, override, purge, registered tanks, energy). Called at vehicle reset. *(internal)* | 177 |
| `powertrain_nitrousOxideInjection.resetSounds()` | Stops the purge sounds of all valves. Called at sound reset. *(internal)* | 253 |

### Parameter details

#### `powertrain_nitrousOxideInjection.getAddedTorque()`

Returns the table of additional torque (N·m) per RPM of the engine torque curve (indexed like torqueCurve, k+1), without any activation condition. Used to draw the torque curve with NOS.

- **returns**: table<integer, number> Additional torque per speed (N·m).

#### `powertrain_nitrousOxideInjection.getPurgeTimeRemaining()`

Returns the remaining purge time in seconds (0 if no purge).

- **returns**: number Remaining seconds.

#### `powertrain_nitrousOxideInjection.getTankRatio()`

Returns the average of the relative level (remainingRatio, 0..1) of the registered tanks, or 0 if there are none. Useful for a gauge.

- **returns**: number Average level 0..1.

#### `powertrain_nitrousOxideInjection.init(device, data)`

Initializes the module for an engine: builds the additional torque tables per RPM (progressive ramp-up from cutInStart to cutInRPM), reads the electrics names, the minimum gear, the purge valves. Called by the combustion engine at initialization; with data nil, disables the module.

- `device` (*table*) : Combustion engine (idleRPM, maxRPM, outputAV1, throttle, nitrousOxideTorque, engineVolumeCoef, invBurnEfficiencyCoef…).
- `data` (*table|nil*) : NOS jbeam data (addedPower in kW, cutInRPM, electricsArmName…); nil to disable.

#### `powertrain_nitrousOxideInjection.initSounds(data)`

Reads the purge sound event and volume from the jbeam. Called at engine sound initialization.

- `data` (*table*) : NOS jbeam data (purgeSoundEvent, purgeSoundVolume).

#### `powertrain_nitrousOxideInjection.purgeLines(purgeTime)`

Starts the purging of the NOS lines for purgeTime seconds (particles and sound at the valves) if there are purge valves and liquid; otherwise resets the purge time to 0. Blocks the injection during the purge.

- `purgeTime` (*number*) : Purge duration in seconds.

#### `powertrain_nitrousOxideInjection.registerStorage(storageName)`

Registers an energy tank (nitrous liquid) of the engine for NOS consumption. Called by the engine for each energy storage of the expected type.

- `storageName` (*string*) : Name of the storage (energyStorage.getStorage).

## Fields

| Field | Type | Description |
|---|---|---|
| `isActive` | boolean | true if the injection is in progress (conditions met, liquid present, no purge). |
| `isArmed` | boolean | true if the NOS is armed (electrics nitrousOxideArm >= 1). |
| `isExisting` | boolean | Always true: allows testing whether the NOS module is present on the vehicle. |
| `updateGFX` | function | Per-frame update function: nop until init, then the real function. Called by the engine after preparing nitrousOxideTorque. |
| `updateSounds` | function | Sound function: nop (the real function is empty). |

## Calls into the engine (C++)

- `obj:` `addParticleByNodesRelative`, `createSFXSource2`, `cutSFX`, `playSFX`, `setVolume`, `stopSFX`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/vehicle/powertrain/nitrousOxideInjection.lua`.*
