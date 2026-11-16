# `controller_couplings_containerLockLead`

*File: `lua/vehicle/controller/couplings/containerLockLead.lua` · VM: Vehicle · 640 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** controller `couplings/containerLockLead` declared in the jbeam (`controller`), reachable with `controller.getController("name")`

"Leader" side of the container locking system (twist-locks): placed on the vehicle carrying the locks (crane, gantry, container chassis). For each site, a "feeler" coupler looks for a container, then the leader queries the container's `containerLockFollow` controller for the target lock position, computes an alignment force within a cone (applied to both vehicles) and, when the vertical alignment is sufficient, activates the lock coupler. Handles the feeling, locking, locked states, lock stability and the props visibility electrics.

## Notes

- States of a site: feeling (searching), locking (lock armed), locked (locked). The global `lockState` is locked only if all sites are.
- Common jbeam keys: `feelerCouplerRadius` (0.35), `feelerCouplerLockRadius` (0.005), `feelerCouplerLatchSpeed` (1.0), `feelerCouplerStrength` (500), `aligningForceMaximum` (10000 N), `lockCouplerRadius` (0.05), `lockCouplerLockRadius` (0.02), `lockCouplerLatchSpeed` (0.05), `lockCouplerStrength` (10001000), `aligningForceConeVerticalOffset` (0.05), `aligningForceConeSlope` (0.2), `aligningForceConeTransitionWidth` (0.01), `aligningForceConeDeadzoneRadius` (lockCouplerRadius × 0.5), `aligningForceSmootherIn` (math.huge), `aligningForceSmootherOut` (aligningForceMaximum), `stableLockTime` (0.5 s).
- Per-site keys (`lockSites` table): `name`, `feelerCouplerNodeName`, `lockCouplerNodeName`, `verticalReferenceNodeName`, `feelerCouplerTag`, `lockCouplerTag`, `lockStateElectricsName` (`<name>_lock_state` by default).
- Electrics written: `<site>_lock_state` (0 at rest, 0.5 in feeling/locking, 1 locked), `<name>_<site>_lock_is_visible` and `<name>_<site>_lock_is_locked`.
- The alignment force grows as the vertical distance decreases (0 to 0.5 m); the horizontal component is limited by a cone then a dead tube; the reaction force is sent to the follower by `applyAligningForce`.
- Locking when the vertical distance is below 0.8 × lockCouplerRadius; back to feeling if it rises above 0.9 × lockCouplerRadius.
- After a normal unlock (breakForce <= 0) of a stable lock, the site remembers the last target so as not to lock again onto the same container until the lock has moved by more than 0.2 m; toggleLockState clears this memory.
- A debug stream `containerLockDebug` is sent via `gui.send` if the stream is being listened to. The debugDraw function is written but not exported in M (never called). `beamBroken`, `onCouplerFound`, `initSounds` are exported empty.
- If no site is defined, updateGFX is replaced by `nop`.
- Anomaly: toggleLockState, in both branches, calls setLockState(feeling); only the unlocked branch also clears the last target memory.

## Functions

| Function | Description | Line |
|---|---|---|
| `controller_couplings_containerLockLead.beamBroken(id, energy)` | Beam break hook, empty. *(internal)* | 388 |
| `controller_couplings_containerLockLead.init(jbeamData)` | Reads the common parameters and the sites from the jbeam, resolves the nodes by name, creates the lookup tables and initializes the electrics. *(internal)* | 513 |
| `controller_couplings_containerLockLead.initSounds(jbeamData)` | Empty. *(internal)* | 510 |
| `controller_couplings_containerLockLead.lastLockCouplerPositionCallback(lockCouplerNodeId, lastLockCouplerPosition)` | Callback from the follower: records the last known position of the previously released lock, to detect that the leader has moved away from it. *(internal)* | 48 |
| `controller_couplings_containerLockLead.lockSitePositionCallback(lockSiteId, lockCouplerPosition, needsVisualLockProp)` | Callback from the follower: records the world position of the follower's lock and whether a visual prop is required. *(internal)* | 65 |
| `controller_couplings_containerLockLead.onCouplerAttached(nodeId, obj2id, obj2nodeId)` | Hook: if the node is a feeler, stores the follower vehicle and the site id, clears the alignment; if it is a lock, sets the site to locked and removes the follower's alignment force. *(internal)* *(hook)* | 394 |
| `controller_couplings_containerLockLead.onCouplerDetached(nodeId, obj2id, obj2nodeId, breakForce)` | Hook: forgets the follower for a feeler; for a lock, stores the previous target if the detachment is normal and the lock stable (otherwise clears it) and puts the site back to feeling. *(internal)* *(hook)* | 427 |
| `controller_couplings_containerLockLead.onCouplerFound(nodeId, obj2id, obj2nodeId)` | Coupler found hook, empty. *(internal)* *(hook)* | 391 |
| `controller_couplings_containerLockLead.reset(jbeamData)` | Puts all sites back to feeling with neutral values and the electrics to 0. *(internal)* | 482 |
| `controller_couplings_containerLockLead.toggleLockState()` | Brings all sites back to feeling (which unlocks them if they are locked). When nothing is locked, also clears the last target memory to allow locking the same one again. | 464 |
| `controller_couplings_containerLockLead.updateGFX(dt)` | Every frame: runs the search of inactive feelers (10 Hz), queries the followers, computes and applies the alignment force, moves sites from feeling to locking, updates the lock stability and the electrics, and sends the debug data. *(internal)* | 231 |

### Parameter details

#### `controller_couplings_containerLockLead.beamBroken(id, energy)`

Beam break hook, empty.

- `id` (*integer*) : cid of the beam.
- `energy` (*number*) : Break energy.

#### `controller_couplings_containerLockLead.init(jbeamData)`

Reads the common parameters and the sites from the jbeam, resolves the nodes by name, creates the lookup tables and initializes the electrics.

- `jbeamData` (*table*) : Controller jbeam data.

#### `controller_couplings_containerLockLead.initSounds(jbeamData)`

Empty.

- `jbeamData` (*table*) : Not used.

#### `controller_couplings_containerLockLead.lastLockCouplerPositionCallback(lockCouplerNodeId, lastLockCouplerPosition)`

Callback from the follower: records the last known position of the previously released lock, to detect that the leader has moved away from it.

- `lockCouplerNodeId` (*integer*) : cid of the follower's lock node.
- `lastLockCouplerPosition` (*vec3*) : World position.

#### `controller_couplings_containerLockLead.lockSitePositionCallback(lockSiteId, lockCouplerPosition, needsVisualLockProp)`

Callback from the follower: records the world position of the follower's lock and whether a visual prop is required.

- `lockSiteId` (*integer*) : Site id (cid of the feeler node on the follower side).
- `lockCouplerPosition` (*vec3*) : World position of the follower's lock.
- `needsVisualLockProp` (*boolean*) : true if the visual lock prop is needed.

#### `controller_couplings_containerLockLead.onCouplerAttached(nodeId, obj2id, obj2nodeId)`

Hook: if the node is a feeler, stores the follower vehicle and the site id, clears the alignment; if it is a lock, sets the site to locked and removes the follower's alignment force.

- `nodeId` (*integer*) : cid of the local node.
- `obj2id` (*integer*) : Id of the other vehicle.
- `obj2nodeId` (*integer*) : cid of the other vehicle's node.

#### `controller_couplings_containerLockLead.onCouplerDetached(nodeId, obj2id, obj2nodeId, breakForce)`

Hook: forgets the follower for a feeler; for a lock, stores the previous target if the detachment is normal and the lock stable (otherwise clears it) and puts the site back to feeling.

- `nodeId` (*integer*) : cid of the local node.
- `obj2id` (*integer*) : Id of the other vehicle.
- `obj2nodeId` (*integer*) : cid of the other vehicle's node.
- `breakForce` (*number*) : Break force (> 0 if the lock broke).

#### `controller_couplings_containerLockLead.onCouplerFound(nodeId, obj2id, obj2nodeId)`

Coupler found hook, empty.

- `nodeId` (*integer*) : cid of the local node.
- `obj2id` (*integer*) : Id of the other vehicle.
- `obj2nodeId` (*integer*) : cid of the other vehicle's node.

#### `controller_couplings_containerLockLead.reset(jbeamData)`

Puts all sites back to feeling with neutral values and the electrics to 0.

- `jbeamData` (*table*) : Jbeam data.

#### `controller_couplings_containerLockLead.updateGFX(dt)`

Every frame: runs the search of inactive feelers (10 Hz), queries the followers, computes and applies the alignment force, moves sites from feeling to locking, updates the lock stability and the electrics, and sends the debug data.

- `dt` (*number*) : Time step in seconds.

## Fields

| Field | Type | Description |
|---|---|---|
| `type` | string | "auxiliary". |

## Calls into the engine (C++)

- `obj:` `applyForceVectorTime`, `attachCoupler`, `detachCoupler`, `getNodeCoupler`, `getNodeLatch`, `getNodePosition`, `getNodesVector`, `getPosition`, `queueObjectLuaCommand`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/vehicle/controller/couplings/containerLockLead.lua`.*
