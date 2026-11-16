# `controller_couplings_fifthwheel`

*File: `lua/vehicle/controller/couplings/fifthwheel.lua` · VM: Vehicle · 299 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** controller `couplings/fifthwheel` declared in the jbeam (`controller`), reachable with `controller.getController("name")`

Auxiliary fifth wheel controller of the tractor: among the colliding vehicles, it looks for compatible kingpins by requesting their data from the trailer's `couplings/kingpin` controller, computes the distances, and attaches an external coupler (`obj:attachExternalCoupler`) when a kingpin comes within 80% of the coupler radius. It tracks the state attached, attaching, detaching, detached, plays sounds and publishes an attach electrics.

## Example

```lua
controller.getControllerSafe("fifthwheel").detachFifthwheel()
print(controller.getControllerSafe("fifthwheel").isAttached())
```

## Notes

- Jbeam keys read by init: `fifthwheelNode` (node name), `fifthwheelKey` ("fifthwheel_v2": must match the kingpin's `kingpinKey`), `attachmentStateElectricsName` (`<name>_attachmentState`). Read by initSounds: `attachSoundEvent` ("event:>Vehicle>Latches>Special>tailgate_01_close"), `detachSoundEvent` ("...tailgate_01_open"), `attachSoundEventVolume` (0.5), `detachSoundEventVolume` (0.5). The coupler parameters (`couplerStrength` 10000000, `couplerRadius` 0.5, `couplerLockRadius` 0.025, `couplerLatchSpeed` 0.3) are read from the jbeam node itself.
- Data requests to the kingpins are made at 5 Hz as long as the coupler is not attached; a response is expected within 1 s (otherwise the vehicle's cache is cleared).
- After detachment (`detaching`), the controller waits for the previous kingpin to move away by more than 0.6 m before going back to `detached`.
- Calls `extensions.couplings.couplingAttached/couplingDetached` to inform the coupling extension.
- Anomaly: onCouplerAttached calls `setFifthwheelIndicatorVisibility(false)` for any attached node, not only the fifth wheel.
- `M.debugDraw` is nil at the start; setFifthwheelIndicatorVisibility sets or removes it then calls `controller.cacheAllControllerFunctions()` and broadcasts the visibility to the kingpin controllers of all vehicles.
- The internal variable is spelled `fithwheel...` (harmless typo).

## Functions

| Function | Description | Line |
|---|---|---|
| `controller_couplings_fifthwheel.detachFifthwheel()` | Detaches the fifth wheel coupler (obj:detachCoupler). Called by the radial menu entry. | 64 |
| `controller_couplings_fifthwheel.init(jbeamData)` | Finds the fifth wheel node, reads the coupler parameters from this node, initializes the state and adds the detach radial menu entry (only once). *(internal)* | 233 |
| `controller_couplings_fifthwheel.initSounds(jbeamData)` | Reads the attach and detach sound events and volumes. *(internal)* | 226 |
| `controller_couplings_fifthwheel.isAttached()` | Indicates whether the fifth wheel is attached to a kingpin. | 202 |
| `controller_couplings_fifthwheel.kingpinDataCallback(obj2Id, data)` | Callback from a trailer's kingpin controller: computes the distance between the fifth wheel and the kingpin and caches it. *(internal)* | 75 |
| `controller_couplings_fifthwheel.onCouplerAttached(nodeId, obj2id, obj2nodeId, attachForce)` | Hook: for the fifth wheel node, switches to attached, stores the kingpin, plays the attach sound and notifies the couplings extension. Hides the indicator. *(internal)* *(hook)* | 171 |
| `controller_couplings_fifthwheel.onCouplerDetached(nodeId, obj2id, obj2nodeId, breakForce)` | Hook: for the fifth wheel node, switches to detaching, stores the kingpin left, plays the detach sound and notifies the couplings extension. *(internal)* *(hook)* | 187 |
| `controller_couplings_fifthwheel.onCouplerFound(nodeId, obj2id, obj2nodeId)` | Coupler found hook, empty. *(internal)* *(hook)* | 167 |
| `controller_couplings_fifthwheel.reset(jbeamData)` | Puts the state back to detached and empties the kingpin caches. *(internal)* | 212 |
| `controller_couplings_fifthwheel.setFifthwheelIndicatorVisibility(visible)` | Shows or hides the fifth wheel debug indicator here and on the kingpins of all vehicles (by key). | 53 |
| `controller_couplings_fifthwheel.toggleFifthwheelIndicatorVisibility()` | Toggles the indicator visibility. | 60 |
| `controller_couplings_fifthwheel.updateGFX(dt)` | Every frame: updates the collisions and the request delays, queries nearby kingpins, handles leaving the detaching state, triggers the external attach to the nearest kingpin and publishes the electrics. *(internal)* | 95 |

### Parameter details

#### `controller_couplings_fifthwheel.init(jbeamData)`

Finds the fifth wheel node, reads the coupler parameters from this node, initializes the state and adds the detach radial menu entry (only once).

- `jbeamData` (*table*) : Controller jbeam data.

#### `controller_couplings_fifthwheel.initSounds(jbeamData)`

Reads the attach and detach sound events and volumes.

- `jbeamData` (*table*) : Controller jbeam data.

#### `controller_couplings_fifthwheel.isAttached()`

Indicates whether the fifth wheel is attached to a kingpin.

- **returns**: boolean true if the state is attached.

#### `controller_couplings_fifthwheel.kingpinDataCallback(obj2Id, data)`

Callback from a trailer's kingpin controller: computes the distance between the fifth wheel and the kingpin and caches it.

- `obj2Id` (*integer*) : Trailer vehicle id.
- `data` (*table*) : {nodeId = kingpin cid, nodePosition = world position}.

#### `controller_couplings_fifthwheel.onCouplerAttached(nodeId, obj2id, obj2nodeId, attachForce)`

Hook: for the fifth wheel node, switches to attached, stores the kingpin, plays the attach sound and notifies the couplings extension. Hides the indicator.

- `nodeId` (*integer*) : cid of the local node.
- `obj2id` (*integer*) : Trailer vehicle id.
- `obj2nodeId` (*integer*) : cid of the kingpin.
- `attachForce` (*number*) : In practice receives `attachSpeed` from controller.lua (inferred from code); used for the sound's aggressiveness.

#### `controller_couplings_fifthwheel.onCouplerDetached(nodeId, obj2id, obj2nodeId, breakForce)`

Hook: for the fifth wheel node, switches to detaching, stores the kingpin left, plays the detach sound and notifies the couplings extension.

- `nodeId` (*integer*) : cid of the local node.
- `obj2id` (*integer*) : Trailer vehicle id.
- `obj2nodeId` (*integer*) : cid of the kingpin.
- `breakForce` (*number*) : Breaking force (unused).

#### `controller_couplings_fifthwheel.onCouplerFound(nodeId, obj2id, obj2nodeId)`

Coupler found hook, empty.

- `nodeId` (*integer*) : cid of the local node.
- `obj2id` (*integer*) : Id of the other vehicle.
- `obj2nodeId` (*integer*) : cid of the other vehicle's node.

#### `controller_couplings_fifthwheel.reset(jbeamData)`

Puts the state back to detached and empties the kingpin caches.

- `jbeamData` (*table*) : Jbeam data.

#### `controller_couplings_fifthwheel.setFifthwheelIndicatorVisibility(visible)`

Shows or hides the fifth wheel debug indicator here and on the kingpins of all vehicles (by key).

- `visible` (*boolean*) : true to show.

#### `controller_couplings_fifthwheel.updateGFX(dt)`

Every frame: updates the collisions and the request delays, queries nearby kingpins, handles leaving the detaching state, triggers the external attach to the nearest kingpin and publishes the electrics.

- `dt` (*number*) : Time step in seconds.

## Fields

| Field | Type | Description |
|---|---|---|
| `debugDraw` | function|nil | nil by default; becomes the fifth wheel node drawing function when the indicator is visible. |
| `type` | string | "auxiliary". |

## Calls into the engine (C++)

- `BeamEngine:` `queueAllObjectLua`
- `obj:` `attachExternalCoupler`, `detachCoupler`, `getNodePosition`, `getPosition`, `playSFXOnceCT`, `queueObjectLuaCommand`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/vehicle/controller/couplings/fifthwheel.lua`.*
