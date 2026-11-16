# `energyStorage`

*File: `lua/vehicle/energyStorage.lua` · VM: Vehicle · 320 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** global `energyStorage`

Manager of the vehicle's energy tanks (fuel, battery, N2O, compressed air...). At init it dynamically loads each type from lua/vehicle/energyStorage/<type>.lua for each entry of the jbeam `energyStorage` section, registers the storages with the powertrain devices (device.energyStorage), updates `remainingRatio` every frame and relays beam break, coupling and part condition events. A modder uses it to find a storage by name (getStorage/getStorageSafe) and read/modify its stored energy.

## Example

```lua
local tank = energyStorage.getStorage("mainTank")
if tank then
  print(tank.storedEnergy, tank.remainingRatio)
end
-- call safe from errors: returns a fake object if the name does not exist
energyStorage.getStorageSafe("nope"):setRemainingVolume(0)
```

## Notes

- Each storage is created by `<factory>.new(jbeamData)` with jbeamData = the jbeam entry merged with the jbeam section of the same name (v.data[name]). The `type` field chooses the file (electricBattery, fuelTank, n2oTank, pressureTank, or any .lua in the energyStorage folder).
- An unknown type causes an error log and an immediate `return` from init: the following storages and the device wiring are then not initialized.
- Each storage exposes at least name, storedEnergy, initialStoredEnergy and remainingRatio (recomputed here every frame = storedEnergy / initialStoredEnergy, or 0 if the initial energy is 0). Recognized optional methods: updateGFX, reset, onBreak, onCouplerFound, onCouplerAttached, onCouplerDetached, setPartCondition, getPartCondition, serialize.
- breakTriggerBeam (beam name or list of names): when one of them breaks, beamBroke calls storage:onBreak() and sets damageTracker('energyStorage', name) to true.
- M.updateGFX is nop as long as no storage exists; init replaces it with the real function only if storageCount > 0.
- onDeserialize is empty (the restore code is commented out): the state serialized by onSerialize is not read back.
- onCouplerAttached receives attachSpeed but does not pass it to the storages (they receive nodeId, obj2id, obj2nodeId, attachEnergy).
- getPartCondition never provides a visual condition (canProvideVisualCondition stays false).

## Functions

| Function | Description | Line |
|---|---|---|
| `energyStorage.beamBroke(id)` | Called by the engine when a beam breaks. If the beam is a trigger of a storage, calls storage:onBreak() and sets the damage in damageTracker. *(internal)* | 170 |
| `energyStorage.getPartCondition(partTypeData)` | Aggregates the integrity condition of the storages linked to the part ('energyStorage:<name>' types). integrityValue is the minimum of the storage values, integrityState a table by name. *(internal)* | 258 |
| `energyStorage.getStorage(name)` | Returns the storage with this name, or nil if it does not exist. | 214 |
| `energyStorage.getStorageSafe(name)` | Like getStorage but returns nilStorage (object that absorbs all accesses and calls) if the name is unknown, with a debug log. | 218 |
| `energyStorage.getStorages()` | Returns the table of all storages keyed by name. | 210 |
| `energyStorage.init()` | Called at vehicle initialization: discovers the available types, instantiates the jbeam storages, registers them in the powertrain devices, builds the table of beams that trigger a break and creates nilStorage. *(internal)* | 30 |
| `energyStorage.onCouplerAttached(nodeId, obj2id, obj2nodeId, attachSpeed, attachEnergy)` | Hook called when a coupler attaches; relayed to storage:onCouplerAttached without attachSpeed. *(internal)* *(hook)* | 192 |
| `energyStorage.onCouplerDetached(nodeId, obj2id, obj2nodeId, breakForce)` | Hook called when a coupler detaches; relayed to storage:onCouplerDetached. *(internal)* *(hook)* | 201 |
| `energyStorage.onCouplerFound(nodeId, obj2id, obj2nodeId, nodeDist)` | Hook called when a coupler finds a nearby partner; relayed to storage:onCouplerFound. *(internal)* *(hook)* | 183 |
| `energyStorage.onDeserialize(data)` | Deserialization (save) hook; currently without effect (code commented out). *(internal)* *(hook)* | 278 |
| `energyStorage.onSerialize()` | Serialization hook: returns {name = storage:serialize()} for the storages that have serialize(). *(internal)* *(hook)* | 289 |
| `energyStorage.reset()` | Called at vehicle reset: calls reset() of each storage, sets their damage back to false in damageTracker and re-registers the storages with the devices. *(internal)* | 147 |
| `energyStorage.setPartCondition(partTypeData, odometer, integrity, visual)` | Applies the part condition (odometer, integrity, visual) to the storages linked to the part; if integrity is a table with the key energyStorage, the storage value is taken by its name. *(internal)* | 243 |

### Parameter details

#### `energyStorage.beamBroke(id)`

Called by the engine when a beam breaks. If the beam is a trigger of a storage, calls storage:onBreak() and sets the damage in damageTracker.

- `id` (*integer*) : Identifier (cid) of the broken beam.

#### `energyStorage.getPartCondition(partTypeData)`

Aggregates the integrity condition of the storages linked to the part ('energyStorage:<name>' types). integrityValue is the minimum of the storage values, integrityState a table by name.

- `partTypeData` (*table<integer, string>*) : List of part types, e.g. {"energyStorage:mainTank"}.
- **returns**: table {integrityValue, integrityState, visualValue, visualState}.
- **returns**: boolean true if at least one storage can provide an integrity condition.
- **returns**: boolean Visual condition available (always false).

#### `energyStorage.getStorage(name)`

Returns the storage with this name, or nil if it does not exist.

- `name` (*string*) : Storage name (jbeam name field).
- **returns**: table|nil The storage or nil.

#### `energyStorage.getStorageSafe(name)`

Like getStorage but returns nilStorage (object that absorbs all accesses and calls) if the name is unknown, with a debug log.

- `name` (*string*) : Storage name.
- **returns**: table The storage or nilStorage.

#### `energyStorage.getStorages()`

Returns the table of all storages keyed by name.

- **returns**: table<string, table> Storages by name.

#### `energyStorage.onCouplerAttached(nodeId, obj2id, obj2nodeId, attachSpeed, attachEnergy)`

Hook called when a coupler attaches; relayed to storage:onCouplerAttached without attachSpeed.

- `nodeId` (*integer*) : Coupler node.
- `obj2id` (*integer*) : Other vehicle.
- `obj2nodeId` (*integer*) : Node of the other vehicle.
- `attachSpeed` (*number*) : Attach speed (not passed on).
- `attachEnergy` (*number*) : Attach energy.

#### `energyStorage.onCouplerDetached(nodeId, obj2id, obj2nodeId, breakForce)`

Hook called when a coupler detaches; relayed to storage:onCouplerDetached.

- `nodeId` (*integer*) : Coupler node.
- `obj2id` (*integer*) : Other vehicle.
- `obj2nodeId` (*integer*) : Node of the other vehicle.
- `breakForce` (*number*) : Break force.

#### `energyStorage.onCouplerFound(nodeId, obj2id, obj2nodeId, nodeDist)`

Hook called when a coupler finds a nearby partner; relayed to storage:onCouplerFound.

- `nodeId` (*integer*) : Coupler node of this vehicle.
- `obj2id` (*integer*) : Identifier of the other vehicle.
- `obj2nodeId` (*integer*) : Node of the other vehicle.
- `nodeDist` (*number*) : Distance between the two nodes (m).

#### `energyStorage.onDeserialize(data)`

Deserialization (save) hook; currently without effect (code commented out).

- `data` (*table*) : Serialized data.

#### `energyStorage.onSerialize()`

Serialization hook: returns {name = storage:serialize()} for the storages that have serialize().

- **returns**: table<string, any> Serialized data by storage name.

#### `energyStorage.setPartCondition(partTypeData, odometer, integrity, visual)`

Applies the part condition (odometer, integrity, visual) to the storages linked to the part; if integrity is a table with the key energyStorage, the storage value is taken by its name.

- `partTypeData` (*table<integer, string>*) : Part types 'energyStorage:<name>'.
- `odometer` (*number*) : Part odometer (inferred from code).
- `integrity` (*number|table*) : Integrity or table {energyStorage = {name = value}}.
- `visual` (*any*) : Visual condition passed as is.

## Fields

| Field | Type | Description |
|---|---|---|
| `nilStorage` | table | 'Magic' fake storage created in init: any indexing or call returns itself, writes are ignored. Returned by getStorageSafe when the name does not exist. Is {} (without a metatable) before the first init. |
| `updateGFX` | function | Is nop (global variable nop) as long as there is no storage; replaced in init by the per-frame update function. (The extraction .md flags nop as undefined: it is an engine global.) |

## Calls into the engine (C++)

- `FS:` `findFiles`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/vehicle/energyStorage.lua`.*
