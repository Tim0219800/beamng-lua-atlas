# `controller_advancedCouplerControl`

*File: `lua/vehicle/controller/advancedCouplerControl.lua` · VM: Vehicle · 570 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** controller `advancedCouplerControl` declared in the jbeam (`controller`), reachable with `controller.getController("name")`

Auxiliary controller that drives a group of local latches (doors, hatches, tailgates, latches) made of node pairs of the same vehicle, via `obj:attachLocalCoupler`. It tracks the group state (attached, coupling, autoCoupling, detached, broken, desyncedAttached, desyncedDetached), plays the attach/detach sounds, applies an opening or closing force for a short duration, registers the couplers' break groups with `beamstate`, and publishes two electrics `<name>_attached` and `<name>_notAttached` (1/0). It is instantiated once per group, with a unique `name`.

## Example

```lua
local door = controller.getControllerSafe("doorLatchFL")
door.toggleGroup()
print(door.getGroupState())
```

## Notes

- Group jbeam keys: `groupType` ("default", "autoCoupling", "manualClose", "manualCloseMultiPoint"; default "default"), `couplerNodes` (header table with columns cid1, cid2, forceCid1, forceCid2, autoCouplingStrength (40000), autoCouplingRadius (0.01), autoCouplingLockRadius (0.005), autoCouplingSpeed (0.2), couplingStartRadius, breakGroup), `soundNode_nodes` (first node), `attachSoundEvent`, `detachSoundEvent`, `breakSoundEvent`, `attachSoundVolume`, `detachSoundVolume`, `breakSoundVolume`, `openForceMagnitude` (100), `openForceDuration` (0.2 s), `closeForceMagnitude` (100), `closeForceDuration` (0.3 s), `openForceConditions` (header table: advancedCouplerControlName, requiredStates), `attachUIMessage`, `attachingUIMessage`, `detachUIMessage`, `latchTriggerElectricName`, `unlatchTriggerElectricName`.
- `cid2` can be a table of several nodes only in manualCloseMultiPoint mode (otherwise only the first is used, with a logged error); the closest node is then chosen.
- Node names are resolved by `beamstate.nodeNameMap`; a pair with a node that cannot be found is ignored with a warning.
- toggleGroupConditional expects conditions {controllerName, forbiddenState, errorMessage}.
- Sounds are allowed only 0.1 s after the reset (avoids sounds at spawn).
- Anomaly: in onCouplerAttached, the attach UI message is conditioned on `detachUIMessage` (and not `attachUIMessage`), so it only appears if both are defined.
- onCouplerFound and onGameplayEvent are exported but empty; resetSounds and initSounds too.
- The state is saved under the key `<name>_groupState`; setState tries to reproduce the state (attach impulse, detach or break of all pairs).

## Functions

| Function | Description | Line |
|---|---|---|
| `controller_advancedCouplerControl.detachGroup()` | Detaches all pairs of the group, triggers the opening force if all `openForceConditions` (required states of other groups) are met and displays `detachUIMessage`. Does nothing if the group is already detached or in autoCoupling. | 175 |
| `controller_advancedCouplerControl.getGroupState()` | Returns the group state. | 377 |
| `controller_advancedCouplerControl.getState()` | Returns the group state under the key `<name>_groupState`. | 512 |
| `controller_advancedCouplerControl.init(jbeamData)` | Builds the group from the jbeam (node pairs, sounds, forces, messages), registers the couplers' break groups, starts the initial attaches and synchronizes the state. *(internal)* | 412 |
| `controller_advancedCouplerControl.initSounds(jbeamData)` | Empty; present for the lifecycle. *(internal)* | 409 |
| `controller_advancedCouplerControl.onCouplerAttached(nodeId, obj2id, obj2nodeId, attachForce)` | Hook: a pair of the group has attached. Updates the state, plays the attach sound (volume tied to the force) and cancels ongoing forces when the whole group is attached. *(internal)* *(hook)* | 331 |
| `controller_advancedCouplerControl.onCouplerDetached(nodeId, obj2id, obj2nodeId, breakForce)` | Hook: a pair of the group has detached. State `detached` if breakForce <= 0, otherwise `broken`; re-queues the automatic latch and plays the detach sound. *(internal)* *(hook)* | 357 |
| `controller_advancedCouplerControl.onCouplerFound(nodeId, obj2id, obj2nodeId)` | Hook from controller.lua when a nearby coupler is found; empty here. *(internal)* *(hook)* | 323 |
| `controller_advancedCouplerControl.onGameplayEvent(eventName, ...)` | Gameplay event hook, empty in this controller. *(internal)* *(hook)* | 374 |
| `controller_advancedCouplerControl.reset(jbeamData)` | Resets all latches to the detached state, restarts the initial attaches (`couplingStartRadius`) and re-registers the break groups. *(internal)* | 390 |
| `controller_advancedCouplerControl.resetSounds(jbeamData)` | Empty; present for the lifecycle. *(internal)* | 387 |
| `controller_advancedCouplerControl.setState(data)` | Tries to reproduce a saved state (attach, detach or break of all pairs). | 517 |
| `controller_advancedCouplerControl.toggleGroup()` | Opens or closes the group depending on its state. Ignored while an opening or closing force is in progress. | 211 |
| `controller_advancedCouplerControl.toggleGroupConditional(conditions)` | Like toggleGroup, but first checks conditions on other advancedCouplerControl controllers; if one is in the forbidden state, displays the error message and does nothing. | 223 |
| `controller_advancedCouplerControl.tryAttachGroupImpulse()` | Tries to close the group again: depending on groupType, restarts the local attaches of detached pairs, triggers the `attachingUIMessage` message and a closing force of `closeForceDuration`. No effect if the group is already attached. | 144 |
| `controller_advancedCouplerControl.updateGFX(dt)` | Every frame: handles the sound delay, the lock/unlock electrics triggers, pending automatic latches, the search for the closest cid2 node in multipoint mode, and applies the opening/closing forces. *(internal)* | 254 |

### Parameter details

#### `controller_advancedCouplerControl.getGroupState()`

Returns the group state.

- **returns**: string "attached", "coupling", "autoCoupling", "detached", "broken", "desyncedAttached" or "desyncedDetached".

#### `controller_advancedCouplerControl.getState()`

Returns the group state under the key `<name>_groupState`.

- **returns**: table<string, string> State table.

#### `controller_advancedCouplerControl.init(jbeamData)`

Builds the group from the jbeam (node pairs, sounds, forces, messages), registers the couplers' break groups, starts the initial attaches and synchronizes the state.

- `jbeamData` (*table*) : Group jbeam data.

#### `controller_advancedCouplerControl.initSounds(jbeamData)`

Empty; present for the lifecycle.

- `jbeamData` (*table*) : Not used.

#### `controller_advancedCouplerControl.onCouplerAttached(nodeId, obj2id, obj2nodeId, attachForce)`

Hook: a pair of the group has attached. Updates the state, plays the attach sound (volume tied to the force) and cancels ongoing forces when the whole group is attached.

- `nodeId` (*integer*) : cid of the local node.
- `obj2id` (*integer*) : Id of the other vehicle.
- `obj2nodeId` (*integer*) : cid of the node on the other side.
- `attachForce` (*number*) : In practice receives the `attachSpeed` argument from controller.lua (inferred from code); used for the sound's aggressiveness.

#### `controller_advancedCouplerControl.onCouplerDetached(nodeId, obj2id, obj2nodeId, breakForce)`

Hook: a pair of the group has detached. State `detached` if breakForce <= 0, otherwise `broken`; re-queues the automatic latch and plays the detach sound.

- `nodeId` (*integer*) : cid of the local node.
- `obj2id` (*integer*) : Id of the other vehicle.
- `obj2nodeId` (*integer*) : cid of the node on the other side.
- `breakForce` (*number*) : Break force (0 = normal detachment).

#### `controller_advancedCouplerControl.onCouplerFound(nodeId, obj2id, obj2nodeId)`

Hook from controller.lua when a nearby coupler is found; empty here.

- `nodeId` (*integer*) : cid of the local node.
- `obj2id` (*integer*) : Id of the other vehicle.
- `obj2nodeId` (*integer*) : cid of the other vehicle's node.

#### `controller_advancedCouplerControl.onGameplayEvent(eventName, ...)`

Gameplay event hook, empty in this controller.

- `eventName` (*string*) : Event name.
- `...` (*any*) : Event arguments.

#### `controller_advancedCouplerControl.reset(jbeamData)`

Resets all latches to the detached state, restarts the initial attaches (`couplingStartRadius`) and re-registers the break groups.

- `jbeamData` (*table*) : Jbeam data.

#### `controller_advancedCouplerControl.resetSounds(jbeamData)`

Empty; present for the lifecycle.

- `jbeamData` (*table*) : Not used.

#### `controller_advancedCouplerControl.setState(data)`

Tries to reproduce a saved state (attach, detach or break of all pairs).

- `data` (*table|nil*) : Table containing `<name>_groupState`.

#### `controller_advancedCouplerControl.toggleGroupConditional(conditions)`

Like toggleGroup, but first checks conditions on other advancedCouplerControl controllers; if one is in the forbidden state, displays the error message and does nothing.

- `conditions` (*table[]*) : List of {controllerName, forbiddenState, errorMessage?}.

#### `controller_advancedCouplerControl.updateGFX(dt)`

Every frame: handles the sound delay, the lock/unlock electrics triggers, pending automatic latches, the search for the closest cid2 node in multipoint mode, and applies the opening/closing forces.

- `dt` (*number*) : Time step in seconds.

## Fields

| Field | Type | Description |
|---|---|---|
| `type` | string | "auxiliary". |

## Calls into the engine (C++)

- `obj:` `applyForceTime`, `attachLocalCoupler`, `detachCoupler`, `nodeLength`, `playSFXOnceCT`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/vehicle/controller/advancedCouplerControl.lua`.*
