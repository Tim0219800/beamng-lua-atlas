---@meta
-- tim19Atlas stub generated from lua/vehicle/controller/advancedCouplerControl.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Auxiliary controller that drives a group of local latches (doors, hatches, tailgates, latches) made of node pairs of the same vehicle, via `obj:attachLocalCoupler`. It tracks the group state (attached, coupling, autoCoupling, detached, broken, desyncedAttached, desyncedDetached), plays the attach/detach sounds, applies an opening or closing force for a short duration, registers the couplers' break groups with `beamstate`, and publishes two electrics `<name>_attached` and `<name>_notAttached` (1/0). It is instantiated once per group, with a unique `name`.
--- Access: controller `advancedCouplerControl` declared in the jbeam (`controller`), reachable with `controller.getController("name")`
---@class controller_advancedCouplerControl
---@field type string "auxiliary".
local controller_advancedCouplerControl = {}

--- Detaches all pairs of the group, triggers the opening force if all `openForceConditions` (required states of other groups) are met and displays `detachUIMessage`. Does nothing if the group is already detached or in autoCoupling.
---Source: lua/vehicle/controller/advancedCouplerControl.lua:175
function controller_advancedCouplerControl.detachGroup() end

--- Returns the group state.
---Source: lua/vehicle/controller/advancedCouplerControl.lua:377
---@return string  "attached", "coupling", "autoCoupling", "detached", "broken", "desyncedAttached" or "desyncedDetached".
function controller_advancedCouplerControl.getGroupState() end

--- Returns the group state under the key `<name>_groupState`.
---Source: lua/vehicle/controller/advancedCouplerControl.lua:512
---@return table<string, string>  State table.
function controller_advancedCouplerControl.getState() end

--- Builds the group from the jbeam (node pairs, sounds, forces, messages), registers the couplers' break groups, starts the initial attaches and synchronizes the state.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/advancedCouplerControl.lua:412
---@param jbeamData table Group jbeam data.
function controller_advancedCouplerControl.init(jbeamData) end

--- Empty; present for the lifecycle.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/advancedCouplerControl.lua:409
---@param jbeamData table Not used.
function controller_advancedCouplerControl.initSounds(jbeamData) end

--- Hook: a pair of the group has attached. Updates the state, plays the attach sound (volume tied to the force) and cancels ongoing forces when the whole group is attached.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/advancedCouplerControl.lua:331
---@param nodeId integer cid of the local node.
---@param obj2id integer Id of the other vehicle.
---@param obj2nodeId integer cid of the node on the other side.
---@param attachForce number In practice receives the `attachSpeed` argument from controller.lua (inferred from code); used for the sound's aggressiveness.
function controller_advancedCouplerControl.onCouplerAttached(nodeId, obj2id, obj2nodeId, attachForce) end

--- Hook: a pair of the group has detached. State `detached` if breakForce <= 0, otherwise `broken`; re-queues the automatic latch and plays the detach sound.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/advancedCouplerControl.lua:357
---@param nodeId integer cid of the local node.
---@param obj2id integer Id of the other vehicle.
---@param obj2nodeId integer cid of the node on the other side.
---@param breakForce number Break force (0 = normal detachment).
function controller_advancedCouplerControl.onCouplerDetached(nodeId, obj2id, obj2nodeId, breakForce) end

--- Hook from controller.lua when a nearby coupler is found; empty here.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/advancedCouplerControl.lua:323
---@param nodeId integer cid of the local node.
---@param obj2id integer Id of the other vehicle.
---@param obj2nodeId integer cid of the other vehicle's node.
function controller_advancedCouplerControl.onCouplerFound(nodeId, obj2id, obj2nodeId) end

--- Gameplay event hook, empty in this controller.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/advancedCouplerControl.lua:374
---@param eventName string Event name.
---@param ... any Event arguments.
function controller_advancedCouplerControl.onGameplayEvent(eventName, ...) end

--- Resets all latches to the detached state, restarts the initial attaches (`couplingStartRadius`) and re-registers the break groups.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/advancedCouplerControl.lua:390
---@param jbeamData table Jbeam data.
function controller_advancedCouplerControl.reset(jbeamData) end

--- Empty; present for the lifecycle.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/advancedCouplerControl.lua:387
---@param jbeamData table Not used.
function controller_advancedCouplerControl.resetSounds(jbeamData) end

--- Tries to reproduce a saved state (attach, detach or break of all pairs).
---Source: lua/vehicle/controller/advancedCouplerControl.lua:517
---@param data table|nil Table containing `<name>_groupState`.
function controller_advancedCouplerControl.setState(data) end

--- Opens or closes the group depending on its state. Ignored while an opening or closing force is in progress.
---Source: lua/vehicle/controller/advancedCouplerControl.lua:211
function controller_advancedCouplerControl.toggleGroup() end

--- Like toggleGroup, but first checks conditions on other advancedCouplerControl controllers; if one is in the forbidden state, displays the error message and does nothing.
---Source: lua/vehicle/controller/advancedCouplerControl.lua:223
---@param conditions table[] List of {controllerName, forbiddenState, errorMessage?}.
function controller_advancedCouplerControl.toggleGroupConditional(conditions) end

--- Tries to close the group again: depending on groupType, restarts the local attaches of detached pairs, triggers the `attachingUIMessage` message and a closing force of `closeForceDuration`. No effect if the group is already attached.
---Source: lua/vehicle/controller/advancedCouplerControl.lua:144
function controller_advancedCouplerControl.tryAttachGroupImpulse() end

--- Every frame: handles the sound delay, the lock/unlock electrics triggers, pending automatic latches, the search for the closest cid2 node in multipoint mode, and applies the opening/closing forces.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/advancedCouplerControl.lua:254
---@param dt number Time step in seconds.
function controller_advancedCouplerControl.updateGFX(dt) end

return controller_advancedCouplerControl
