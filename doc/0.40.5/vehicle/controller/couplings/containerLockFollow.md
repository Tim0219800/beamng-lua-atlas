# `controller_couplings_containerLockFollow`

*File: `lua/vehicle/controller/couplings/containerLockFollow.lua` · VM: Vehicle · 230 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** controller `couplings/containerLockFollow` declared in the jbeam (`controller`), reachable with `controller.getController("name")`

"Follower" side of the container locking system (twist-locks): placed on the receiving vehicle (for example the container), it responds to the `containerLockLead` controller of another vehicle. It provides the position of its lock sites, receives an alignment force from the leader, enables or disables its couplers according to an electrics, and stiffens or softens the lock beams when all sites are locked. Exchanges between vehicles go through `obj:queueObjectLuaCommand` to `controller.getControllersByType('couplings/containerLockFollow')`.

## Notes

- Jbeam keys: `lockSites` (header table) with `name`, `feelerCouplerNodeName`, `lockCouplerNodeName`, `aligningForceNodeName`, `couplerLockBeamsTag`, `couplerLockBeamsUnlockedSpring`, `couplerLockBeamsLockedSpring`, `couplerLockBeamsUnlockedDamp`, `couplerLockBeamsLockedDamp`, `needsVisualLockProp` (true by default), `isEnabledElectricsName` and `isEnabledElectricsValue` (1 by default).
- Sites are keyed by the id (cid) of the feeler node, which also serves as the `lockSiteId` identifier on the leader side.
- When a site is disabled (electrics different from the expected value), the tags of its feeler and lock nodes receive the suffix `_disabled`, which prevents coupling.
- Electrics written: `<name>_<site>_lock_is_locked` (1 if locked).
- Anomaly: debugDraw is defined in the file but is not exported in M, so it is never called. `beamBroken` is exported but empty. The `lockNodeFeelerLookup` array is module-level and is not emptied in init.
- In onCouplerDetached, the search for the "feeler" site uses the node id directly, and that for the "lock" site goes through lockNodeFeelerLookup.

## Functions

| Function | Description | Line |
|---|---|---|
| `controller_couplings_containerLockFollow.applyAligningForce(lockSiteId, forceVector)` | Called remotely by the leader: stores the alignment force to apply to the site's alignment node (ignored if the lock node is already coupled). *(internal)* | 51 |
| `controller_couplings_containerLockFollow.beamBroken(id, energy)` | Beam break hook, empty. *(internal)* | 133 |
| `controller_couplings_containerLockFollow.init(jbeamData)` | Builds the lock sites from the jbeam (nodes, tags, lock beams, electrics) and softens the lock beams. *(internal)* | 167 |
| `controller_couplings_containerLockFollow.onCouplerAttached(nodeId, obj2id, obj2nodeId)` | Hook: if the node is a lock node, sets the site to the locked state, clears the alignment force and stiffens the lock beams. *(internal)* *(hook)* | 136 |
| `controller_couplings_containerLockFollow.onCouplerDetached(nodeId, obj2id, obj2nodeId, breakForce)` | Hook: clears the site's alignment force and, for a lock node, sets the site back to unlocked. *(internal)* *(hook)* | 146 |
| `controller_couplings_containerLockFollow.requestFollowLastLockCouplerPosition(objId, controllerName, lockCouplerNodeId)` | Called remotely by the leader: returns the world position of the lock node of the site whose lock node has the given id, via the leader's lastLockCouplerPositionCallback. *(internal)* | 21 |
| `controller_couplings_containerLockFollow.requestFollowLockCouplerPosition(objId, controllerName, lockSiteId)` | Called remotely by the leader: returns the world position of a site's lock node (and `needsVisualLockProp`) via the leader's lockSitePositionCallback. *(internal)* | 36 |
| `controller_couplings_containerLockFollow.reset(jbeamData)` | Clears the alignment forces, forces the re-evaluation of the activation and resets the lock electrics to 0. *(internal)* | 159 |
| `controller_couplings_containerLockFollow.updateGFX(dt)` | Every frame: applies the alignment force, enables or disables each site according to its electrics, publishes the locked state and adjusts the stiffness of the lock beams (locked only if all sites are). *(internal)* | 93 |

### Parameter details

#### `controller_couplings_containerLockFollow.applyAligningForce(lockSiteId, forceVector)`

Called remotely by the leader: stores the alignment force to apply to the site's alignment node (ignored if the lock node is already coupled).

- `lockSiteId` (*integer*) : Site id.
- `forceVector` (*vec3|nil*) : Force vector (N), nil to cancel it.

#### `controller_couplings_containerLockFollow.beamBroken(id, energy)`

Beam break hook, empty.

- `id` (*integer*) : cid of the beam.
- `energy` (*number*) : Break energy.

#### `controller_couplings_containerLockFollow.init(jbeamData)`

Builds the lock sites from the jbeam (nodes, tags, lock beams, electrics) and softens the lock beams.

- `jbeamData` (*table*) : Controller jbeam data.

#### `controller_couplings_containerLockFollow.onCouplerAttached(nodeId, obj2id, obj2nodeId)`

Hook: if the node is a lock node, sets the site to the locked state, clears the alignment force and stiffens the lock beams.

- `nodeId` (*integer*) : cid of the local node.
- `obj2id` (*integer*) : Id of the other vehicle.
- `obj2nodeId` (*integer*) : cid of the other vehicle's node.

#### `controller_couplings_containerLockFollow.onCouplerDetached(nodeId, obj2id, obj2nodeId, breakForce)`

Hook: clears the site's alignment force and, for a lock node, sets the site back to unlocked.

- `nodeId` (*integer*) : cid of the local node.
- `obj2id` (*integer*) : Id of the other vehicle.
- `obj2nodeId` (*integer*) : cid of the other vehicle's node.
- `breakForce` (*number*) : Breaking force (unused).

#### `controller_couplings_containerLockFollow.requestFollowLastLockCouplerPosition(objId, controllerName, lockCouplerNodeId)`

Called remotely by the leader: returns the world position of the lock node of the site whose lock node has the given id, via the leader's lastLockCouplerPositionCallback.

- `objId` (*integer*) : Id of the leader vehicle to call back.
- `controllerName` (*string*) : Name of the leader controller.
- `lockCouplerNodeId` (*integer*) : cid of this vehicle's lock node.

#### `controller_couplings_containerLockFollow.requestFollowLockCouplerPosition(objId, controllerName, lockSiteId)`

Called remotely by the leader: returns the world position of a site's lock node (and `needsVisualLockProp`) via the leader's lockSitePositionCallback.

- `objId` (*integer*) : Id of the leader vehicle to call back.
- `controllerName` (*string*) : Name of the leader controller.
- `lockSiteId` (*integer*) : Site id (cid of the feeler node).

#### `controller_couplings_containerLockFollow.reset(jbeamData)`

Clears the alignment forces, forces the re-evaluation of the activation and resets the lock electrics to 0.

- `jbeamData` (*table*) : Jbeam data.

#### `controller_couplings_containerLockFollow.updateGFX(dt)`

Every frame: applies the alignment force, enables or disables each site according to its electrics, publishes the locked state and adjusts the stiffness of the lock beams (locked only if all sites are).

- `dt` (*number*) : Time step in seconds.

## Fields

| Field | Type | Description |
|---|---|---|
| `type` | string | "auxiliary". |

## Calls into the engine (C++)

- `obj:` `applyForceVectorTime`, `getNodeCoupler`, `getNodePosition`, `getPosition`, `queueObjectLuaCommand`, `setBeamSpringDamp`, `setNodeTag`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/vehicle/controller/couplings/containerLockFollow.lua`.*
