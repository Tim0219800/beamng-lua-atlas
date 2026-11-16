---@meta
-- tim19Atlas stub generated from lua/vehicle/extensions/couplings.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Extension managing fifth wheel type hitches. It reacts to beamstate events (enabling/disabling of automatic coupling, detaching) by relaying them to the 'couplings/fifthwheel' controllers and answers beamstate's questions about the coupling state.
--- Access: extension `couplings`: `extensions.load (vehicle VM)("couplings")`, then the global `couplings`
---@class couplings
couplings = {}

--- Called by the engine/beamstate when a coupler attaches: stops the automatic latching and disables auto coupling.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/extensions/couplings.lua:30
---@param nodeId integer Coupler node.
---@param obj2id integer Identifier of the other vehicle.
---@param obj2nodeId integer Coupler node of the other vehicle.
function couplings.couplingAttached(nodeId, obj2id, obj2nodeId) end

--- Called when a coupler detaches; does nothing.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/extensions/couplings.lua:35
---@param nodeId integer Coupler node.
---@param obj2id integer Other vehicle.
---@param obj2nodeId integer Node of the other vehicle.
function couplings.couplingDetached(nodeId, obj2id, obj2nodeId) end

--- Indicates whether automatic coupling is active for this extension (always false).
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/extensions/couplings.lua:39
---@return boolean  false.
function couplings.isAutoCouplingActive() end

--- Indicates whether at least one fifth wheel is attached.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/extensions/couplings.lua:44
---@return boolean|nil  true if attached, otherwise nil.
function couplings.isCouplerAttached() end

--- Called by beamstate on activation of automatic coupling: displays the indicator of each fifth wheel.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/extensions/couplings.lua:7
function couplings.onBeamstateActivateAutoCoupling() end

--- Called by beamstate to detach the couplers: detaches each fifth wheel.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/extensions/couplings.lua:23
function couplings.onBeamstateDetachCouplers() end

--- Called by beamstate on deactivation of automatic coupling: hides the indicator of each fifth wheel.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/extensions/couplings.lua:15
function couplings.onBeamstateDisableAutoLatching() end

--- Vehicle reset hook; empty.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/extensions/couplings.lua:53
function couplings.onReset() end

