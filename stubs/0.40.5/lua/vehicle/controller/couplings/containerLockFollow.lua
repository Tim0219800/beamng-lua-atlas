---@meta
-- tim19Atlas stub generated from lua/vehicle/controller/couplings/containerLockFollow.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- "Follower" side of the container locking system (twist-locks): placed on the receiving vehicle (for example the container), it responds to the `containerLockLead` controller of another vehicle. It provides the position of its lock sites, receives an alignment force from the leader, enables or disables its couplers according to an electrics, and stiffens or softens the lock beams when all sites are locked. Exchanges between vehicles go through `obj:queueObjectLuaCommand` to `controller.getControllersByType('couplings/containerLockFollow')`.
--- Access: controller `couplings/containerLockFollow` declared in the jbeam (`controller`), reachable with `controller.getController("name")`
---@class controller_couplings_containerLockFollow
---@field type string "auxiliary".
local controller_couplings_containerLockFollow = {}

--- Called remotely by the leader: stores the alignment force to apply to the site's alignment node (ignored if the lock node is already coupled).
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/couplings/containerLockFollow.lua:51
---@param lockSiteId integer Site id.
---@param forceVector vec3|nil Force vector (N), nil to cancel it.
function controller_couplings_containerLockFollow.applyAligningForce(lockSiteId, forceVector) end

--- Beam break hook, empty.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/couplings/containerLockFollow.lua:133
---@param id integer cid of the beam.
---@param energy number Break energy.
function controller_couplings_containerLockFollow.beamBroken(id, energy) end

--- Builds the lock sites from the jbeam (nodes, tags, lock beams, electrics) and softens the lock beams.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/couplings/containerLockFollow.lua:167
---@param jbeamData table Controller jbeam data.
function controller_couplings_containerLockFollow.init(jbeamData) end

--- Hook: if the node is a lock node, sets the site to the locked state, clears the alignment force and stiffens the lock beams.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/couplings/containerLockFollow.lua:136
---@param nodeId integer cid of the local node.
---@param obj2id integer Id of the other vehicle.
---@param obj2nodeId integer cid of the other vehicle's node.
function controller_couplings_containerLockFollow.onCouplerAttached(nodeId, obj2id, obj2nodeId) end

--- Hook: clears the site's alignment force and, for a lock node, sets the site back to unlocked.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/couplings/containerLockFollow.lua:146
---@param nodeId integer cid of the local node.
---@param obj2id integer Id of the other vehicle.
---@param obj2nodeId integer cid of the other vehicle's node.
---@param breakForce number Breaking force (unused).
function controller_couplings_containerLockFollow.onCouplerDetached(nodeId, obj2id, obj2nodeId, breakForce) end

--- Called remotely by the leader: returns the world position of the lock node of the site whose lock node has the given id, via the leader's lastLockCouplerPositionCallback.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/couplings/containerLockFollow.lua:21
---@param objId integer Id of the leader vehicle to call back.
---@param controllerName string Name of the leader controller.
---@param lockCouplerNodeId integer cid of this vehicle's lock node.
function controller_couplings_containerLockFollow.requestFollowLastLockCouplerPosition(objId, controllerName, lockCouplerNodeId) end

--- Called remotely by the leader: returns the world position of a site's lock node (and `needsVisualLockProp`) via the leader's lockSitePositionCallback.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/couplings/containerLockFollow.lua:36
---@param objId integer Id of the leader vehicle to call back.
---@param controllerName string Name of the leader controller.
---@param lockSiteId integer Site id (cid of the feeler node).
function controller_couplings_containerLockFollow.requestFollowLockCouplerPosition(objId, controllerName, lockSiteId) end

--- Clears the alignment forces, forces the re-evaluation of the activation and resets the lock electrics to 0.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/couplings/containerLockFollow.lua:159
---@param jbeamData table Jbeam data.
function controller_couplings_containerLockFollow.reset(jbeamData) end

--- Every frame: applies the alignment force, enables or disables each site according to its electrics, publishes the locked state and adjusts the stiffness of the lock beams (locked only if all sites are).
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/couplings/containerLockFollow.lua:93
---@param dt number Time step in seconds.
function controller_couplings_containerLockFollow.updateGFX(dt) end

return controller_couplings_containerLockFollow
