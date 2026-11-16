---@meta
-- tim19Atlas stub generated from lua/vehicle/controller/couplings/containerLockLead.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- "Leader" side of the container locking system (twist-locks): placed on the vehicle carrying the locks (crane, gantry, container chassis). For each site, a "feeler" coupler looks for a container, then the leader queries the container's `containerLockFollow` controller for the target lock position, computes an alignment force within a cone (applied to both vehicles) and, when the vertical alignment is sufficient, activates the lock coupler. Handles the feeling, locking, locked states, lock stability and the props visibility electrics.
--- Access: controller `couplings/containerLockLead` declared in the jbeam (`controller`), reachable with `controller.getController("name")`
---@class controller_couplings_containerLockLead
---@field type string "auxiliary".
local controller_couplings_containerLockLead = {}

--- Beam break hook, empty.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/couplings/containerLockLead.lua:388
---@param id integer cid of the beam.
---@param energy number Break energy.
function controller_couplings_containerLockLead.beamBroken(id, energy) end

--- Reads the common parameters and the sites from the jbeam, resolves the nodes by name, creates the lookup tables and initializes the electrics.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/couplings/containerLockLead.lua:513
---@param jbeamData table Controller jbeam data.
function controller_couplings_containerLockLead.init(jbeamData) end

--- Empty.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/couplings/containerLockLead.lua:510
---@param jbeamData table Not used.
function controller_couplings_containerLockLead.initSounds(jbeamData) end

--- Callback from the follower: records the last known position of the previously released lock, to detect that the leader has moved away from it.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/couplings/containerLockLead.lua:48
---@param lockCouplerNodeId integer cid of the follower's lock node.
---@param lastLockCouplerPosition vec3 World position.
function controller_couplings_containerLockLead.lastLockCouplerPositionCallback(lockCouplerNodeId, lastLockCouplerPosition) end

--- Callback from the follower: records the world position of the follower's lock and whether a visual prop is required.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/couplings/containerLockLead.lua:65
---@param lockSiteId integer Site id (cid of the feeler node on the follower side).
---@param lockCouplerPosition vec3 World position of the follower's lock.
---@param needsVisualLockProp boolean true if the visual lock prop is needed.
function controller_couplings_containerLockLead.lockSitePositionCallback(lockSiteId, lockCouplerPosition, needsVisualLockProp) end

--- Hook: if the node is a feeler, stores the follower vehicle and the site id, clears the alignment; if it is a lock, sets the site to locked and removes the follower's alignment force.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/couplings/containerLockLead.lua:394
---@param nodeId integer cid of the local node.
---@param obj2id integer Id of the other vehicle.
---@param obj2nodeId integer cid of the other vehicle's node.
function controller_couplings_containerLockLead.onCouplerAttached(nodeId, obj2id, obj2nodeId) end

--- Hook: forgets the follower for a feeler; for a lock, stores the previous target if the detachment is normal and the lock stable (otherwise clears it) and puts the site back to feeling.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/couplings/containerLockLead.lua:427
---@param nodeId integer cid of the local node.
---@param obj2id integer Id of the other vehicle.
---@param obj2nodeId integer cid of the other vehicle's node.
---@param breakForce number Break force (> 0 if the lock broke).
function controller_couplings_containerLockLead.onCouplerDetached(nodeId, obj2id, obj2nodeId, breakForce) end

--- Coupler found hook, empty.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/couplings/containerLockLead.lua:391
---@param nodeId integer cid of the local node.
---@param obj2id integer Id of the other vehicle.
---@param obj2nodeId integer cid of the other vehicle's node.
function controller_couplings_containerLockLead.onCouplerFound(nodeId, obj2id, obj2nodeId) end

--- Puts all sites back to feeling with neutral values and the electrics to 0.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/couplings/containerLockLead.lua:482
---@param jbeamData table Jbeam data.
function controller_couplings_containerLockLead.reset(jbeamData) end

--- Brings all sites back to feeling (which unlocks them if they are locked). When nothing is locked, also clears the last target memory to allow locking the same one again.
---Source: lua/vehicle/controller/couplings/containerLockLead.lua:464
function controller_couplings_containerLockLead.toggleLockState() end

--- Every frame: runs the search of inactive feelers (10 Hz), queries the followers, computes and applies the alignment force, moves sites from feeling to locking, updates the lock stability and the electrics, and sends the debug data.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/couplings/containerLockLead.lua:231
---@param dt number Time step in seconds.
function controller_couplings_containerLockLead.updateGFX(dt) end

return controller_couplings_containerLockLead
