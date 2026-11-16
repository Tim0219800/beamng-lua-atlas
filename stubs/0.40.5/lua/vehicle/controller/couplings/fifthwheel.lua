---@meta
-- tim19Atlas stub generated from lua/vehicle/controller/couplings/fifthwheel.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Auxiliary fifth wheel controller of the tractor: among the colliding vehicles, it looks for compatible kingpins by requesting their data from the trailer's `couplings/kingpin` controller, computes the distances, and attaches an external coupler (`obj:attachExternalCoupler`) when a kingpin comes within 80% of the coupler radius. It tracks the state attached, attaching, detaching, detached, plays sounds and publishes an attach electrics.
--- Access: controller `couplings/fifthwheel` declared in the jbeam (`controller`), reachable with `controller.getController("name")`
---@class controller_couplings_fifthwheel
---@field debugDraw function|nil nil by default; becomes the fifth wheel node drawing function when the indicator is visible.
---@field type string "auxiliary".
local controller_couplings_fifthwheel = {}

--- Detaches the fifth wheel coupler (obj:detachCoupler). Called by the radial menu entry.
---Source: lua/vehicle/controller/couplings/fifthwheel.lua:64
function controller_couplings_fifthwheel.detachFifthwheel() end

--- Finds the fifth wheel node, reads the coupler parameters from this node, initializes the state and adds the detach radial menu entry (only once).
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/couplings/fifthwheel.lua:233
---@param jbeamData table Controller jbeam data.
function controller_couplings_fifthwheel.init(jbeamData) end

--- Reads the attach and detach sound events and volumes.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/couplings/fifthwheel.lua:226
---@param jbeamData table Controller jbeam data.
function controller_couplings_fifthwheel.initSounds(jbeamData) end

--- Indicates whether the fifth wheel is attached to a kingpin.
---Source: lua/vehicle/controller/couplings/fifthwheel.lua:202
---@return boolean  true if the state is attached.
function controller_couplings_fifthwheel.isAttached() end

--- Callback from a trailer's kingpin controller: computes the distance between the fifth wheel and the kingpin and caches it.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/couplings/fifthwheel.lua:75
---@param obj2Id integer Trailer vehicle id.
---@param data table {nodeId = kingpin cid, nodePosition = world position}.
function controller_couplings_fifthwheel.kingpinDataCallback(obj2Id, data) end

--- Hook: for the fifth wheel node, switches to attached, stores the kingpin, plays the attach sound and notifies the couplings extension. Hides the indicator.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/couplings/fifthwheel.lua:171
---@param nodeId integer cid of the local node.
---@param obj2id integer Trailer vehicle id.
---@param obj2nodeId integer cid of the kingpin.
---@param attachForce number In practice receives `attachSpeed` from controller.lua (inferred from code); used for the sound's aggressiveness.
function controller_couplings_fifthwheel.onCouplerAttached(nodeId, obj2id, obj2nodeId, attachForce) end

--- Hook: for the fifth wheel node, switches to detaching, stores the kingpin left, plays the detach sound and notifies the couplings extension.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/couplings/fifthwheel.lua:187
---@param nodeId integer cid of the local node.
---@param obj2id integer Trailer vehicle id.
---@param obj2nodeId integer cid of the kingpin.
---@param breakForce number Breaking force (unused).
function controller_couplings_fifthwheel.onCouplerDetached(nodeId, obj2id, obj2nodeId, breakForce) end

--- Coupler found hook, empty.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/couplings/fifthwheel.lua:167
---@param nodeId integer cid of the local node.
---@param obj2id integer Id of the other vehicle.
---@param obj2nodeId integer cid of the other vehicle's node.
function controller_couplings_fifthwheel.onCouplerFound(nodeId, obj2id, obj2nodeId) end

--- Puts the state back to detached and empties the kingpin caches.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/couplings/fifthwheel.lua:212
---@param jbeamData table Jbeam data.
function controller_couplings_fifthwheel.reset(jbeamData) end

--- Shows or hides the fifth wheel debug indicator here and on the kingpins of all vehicles (by key).
---Source: lua/vehicle/controller/couplings/fifthwheel.lua:53
---@param visible boolean true to show.
function controller_couplings_fifthwheel.setFifthwheelIndicatorVisibility(visible) end

--- Toggles the indicator visibility.
---Source: lua/vehicle/controller/couplings/fifthwheel.lua:60
function controller_couplings_fifthwheel.toggleFifthwheelIndicatorVisibility() end

--- Every frame: updates the collisions and the request delays, queries nearby kingpins, handles leaving the detaching state, triggers the external attach to the nearest kingpin and publishes the electrics.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/couplings/fifthwheel.lua:95
---@param dt number Time step in seconds.
function controller_couplings_fifthwheel.updateGFX(dt) end

return controller_couplings_fifthwheel
