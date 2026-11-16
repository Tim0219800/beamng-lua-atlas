---@meta
-- tim19Atlas stub generated from lua/vehicle/main.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Makes onPhysicsStep relay extensions.hook('onPhysicsStep', dt) and forces the re-evaluation of the engine flag. To be called in onExtensionLoaded by any extension that defines onPhysicsStep (the hook is never disabled afterwards).
---Source: lua/vehicle/main.lua:65
function enablePhysicsStepHook() end

--- Called by the engine before a Lua reload: serializes the extensions (serializePackages('reload')) and hands them to the engine via obj:setPersistentData.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/main.lua:533
function exportPersistentData() end

--- Called by the engine after a reload: deserializes the persistent data and gives it back to the extensions (deserializePackages).
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/main.lua:539
---@param s string Serialized data produced by exportPersistentData.
function importPersistentData(s) end

--- Called by the engine at vehicle spawn. Adjusts package.path to the vehicle folder, loads the modules as globals, decodes initData (lpack) and builds the vehicle data (v.loadVehicleStage2), calls initSystems, loads the base extensions (skeleton, auto folder, gameplayStatistic) and emits 'onVehicleLoaded'.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/main.lua:206
---@param path string Vehicle folder (added to package.path and used to load its lua/ scripts).
---@param initData string Spawn data serialized with lpack, must contain `vdata`.
---@return boolean|nil  false = asks the engine to unload the Lua; true on success; nil if obj is absent.
function init(path, initData) end

--- Initializes all subsystems in the order described in the notes, emits the 'onInit' hook, enables global write detection (detectGlobalWrites) and sets the physics step flag. Called by init().
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/main.lua:139
function initSystems() end

--- Called by the engine when a beam breaks. Relays to beamstate, wheels, powertrain, energyStorage, controller, bdebug, then extensions.hook('onBeamBroke').
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/main.lua:366
---@param id integer Beam identifier (cid).
---@param energy number Energy of the break.
function onBeamBroke(id, energy) end

--- Called by the engine only for beams that have deformation triggers. Relays to beamstate and controller then to the 'onBeamDeformed' hook.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/main.lua:377
---@param id integer Beam identifier (cid).
---@param ratio number Deformation ratio.
function onBeamDeformed(id, ratio) end

--- Generic callback used by the engine to call a Lua function by name. Resolves `funName` either as a global ("maFonction") or as "module.function" (a single level, the module must be a global table) and calls it with `data`. Silently ignores anything that is not a function.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/main.lua:345
---@param funName string Function name, with at most one dot.
---@param data any Single argument passed.
function onCallEvent(funName, data) end

--- Called by the engine when a coupler attaches. Relays to the same modules as onCouplerFound then to the 'onCouplerAttached' hook.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/main.lua:397
---@param nodeId integer Coupler node of this vehicle.
---@param obj2id integer Id of the other vehicle.
---@param obj2nodeId integer Coupler node of the other vehicle.
---@param attachSpeed number Relative speed at attachment.
---@param attachEnergy number Energy at attachment.
function onCouplerAttached(nodeId, obj2id, obj2nodeId, attachSpeed, attachEnergy) end

--- Called by the engine when a coupler detaches. Relays to the same modules then to the 'onCouplerDetached' hook.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/main.lua:406
---@param nodeId integer Coupler node of this vehicle.
---@param obj2id integer Id of the other vehicle.
---@param obj2nodeId integer Coupler node of the other vehicle.
---@param breakForce number Detachment force.
function onCouplerDetached(nodeId, obj2id, obj2nodeId, breakForce) end

--- Called by the engine when a coupler finds a compatible coupler in range. Relays to beamstate, controller, powertrain, energyStorage then to the 'onCouplerFound' hook.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/main.lua:388
---@param nodeId integer Coupler node of this vehicle.
---@param obj2id integer Id of the other vehicle.
---@param obj2nodeId integer Coupler node of the other vehicle.
---@param nodeDist number Distance between the nodes.
function onCouplerFound(nodeId, obj2id, obj2nodeId, nodeDist) end

--- Called by the engine every debug draw frame. Updates the shared focus position, calls bdebug.debugDraw, ai.debugDraw, beamstate.debugDraw, controller.debugDraw, hydros.debugDraw, then extensions.hook('onDebugDraw', focusPos) and, if a player is seated, 'onDebugDrawActive'.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/main.lua:126
---@param x number X of the focus position (camera).
---@param y number Y of the focus.
---@param z number Z of the focus.
function onDebugDraw(x, y, z) end

--- Called by the engine when the vehicle is removed: hydros.destroy(), protocols.destroy() and, if the global odometer exists, odometer.submitStatistic().
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/main.lua:430
function onDespawnObject() end

--- Engine callback when a dynamic beam is added; empty body.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/main.lua:420
---@param dbId integer Dynamic beam id.
---@param nodeId integer Node.
---@param tag any Label.
function onDynamicBeamAdded(dbId, nodeId, tag) end

--- Engine callback when a dynamic beam breaks; empty body.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/main.lua:426
---@param dbId integer Dynamic beam id.
---@param energy number Energy.
function onDynamicBeamBroke(dbId, energy) end

--- Engine callback when a dynamic beam is removed; empty body.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/main.lua:423
---@param dbId integer Dynamic beam id.
function onDynamicBeamDeleted(dbId) end

--- Called by the engine every graphics frame (once per render/simulation frame). Stores lastDt, updates GUI streams, sensors, wheels, AI, inputs, electrics, controllers, extensions (hook 'updateGFX'), hydros, powertrain, etc. in the order described in the notes.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/main.lua:86
---@param dtSim number Simulation time elapsed since the last frame, in seconds.
function onGraphicsStep(dtSim) end

--- Called by the engine on each filtered node collision. Fills particlefilter.particleData and passes it to wheels, fire, controller, particlefilter and bdebug.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/main.lua:491
---@param id1 integer Colliding node.
---@param pos vec3 Contact position.
---@param normal vec3 Contact normal.
---@param nodeVel vec3 Node velocity.
---@param perpendicularVel number Velocity perpendicular to the surface.
---@param slipVec vec3 Slip vector.
---@param slipVel number Slip speed.
---@param slipForce number Slip force.
---@param normalForce number Normal force.
---@param depth number Penetration depth.
---@param materialId1 integer Node material.
---@param materialId2 integer Material of the surface hit.
function onNodeCollision(id1, pos, normal, nodeVel, perpendicularVel, slipVec, slipVel, slipForce, normalForce, depth, materialId1, materialId2) end

--- Called by the engine at each physics step (high frequency) if the step is enabled. Runs the physics chain (see notes) then the 'onPhysicsStep' extension hook.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/main.lua:73
---@param dtPhys number Physics step in seconds (= physicsDt).
function onPhysicsStep(dtPhys) end

--- Called by the engine when a node cluster is teleported/repositioned. Enables ghost mode (obj:setGhostEnabled(true)) if ghostOnTp, then emits the 'onSetClusterPosRelRot' hook.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/main.lua:439
---@param cNodeId integer Reference node of the cluster.
---@param pos vec3 New position.
---@param relRot quat Relative rotation.
function onSetClusterPosRelRot(cNodeId, pos, relRot) end

--- Called by the engine when the settings change: settings.settingsChanged, 'onSettingsChanged' hook, then controller, input, wheels and protocols.settingsChanged.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/main.lua:545
function onSettingsChanged() end

--- Called by the engine when a slidenode leaves its rail; relays only to the 'onSlidenodeDetached' extension hook.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/main.lua:415
---@param nodeId integer Slidenode node.
---@param railId integer Rail left.
---@param energy number Energy.
function onSlidenodeDetached(nodeId, railId, energy) end

--- Called by the engine when a torsion bar breaks; relays to beamstate and to the 'onTorsionbarBroken' hook.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/main.lua:383
---@param id integer Identifier of the torsion bar.
---@param energy number Energy of the break.
function onTorsionbarBroken(id, energy) end

--- Called by the engine on vehicle reset (I key, recovery…). Re-enables ghost mode if ghostOnReset, resets all modules (order in the notes) and emits the 'onReset' hook.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/main.lua:448
---@param retainDebug boolean|nil Indicates whether the debug state must be kept; passed to onReset (inferred from the name, not used directly here).
function onVehicleReset(retainDebug) end

--- Replaces the standard print: sends the first argument converted to a string to the log (level 'A', tag 'print').
---Source: lua/vehicle/main.lua:16
---@param ... any Only the first argument is used (tostring(...)).
function print(...) end

--- Called by the engine when the list of players seated in this vehicle changes. Updates playerInfo (seatedPlayers, anyPlayerSeated, firstPlayerSeated), notifies the main controller/powertrain/damageTracker if a player is seated, notifies bdebug, protocols, ai, sounds, then emits 'onPlayersChanged'.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/main.lua:504
---@param players table<integer, boolean> Seated players, 0-based (e.g. {[0]=true}).
function setControllingPlayers(players) end

--- Sets playerInfo.persona (the player's persona identifier).
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/main.lua:529
---@param persona any Persona identifier.
function setPlayerPersona(persona) end

--- Enables or disables, on the engine side, the call of onPhysicsStep: obj:setPhysicsStepEnabled(true) if controller, powertrain, wheels, thrusters, hydros, beamstate or protocols need it (isPhysicsStepUsed) or if the extension hook is active. Called at the end of init and reset.
---Source: lua/vehicle/main.lua:61
function updateCorePhysicsStepEnabled() end

---@type any
backwardsCompatibility = nil
---@type any
extensions = nil
---@type vec3
float3 = nil
---@type number
lastDt = nil
---@type any
physicsDt = nil
---@type table
playerInfo = nil
---@type any
profilerPopEvent = nil
---@type any
profilerPopEvent1 = nil
---@type any
profilerPushEvent = nil
---@type any
profilerPushEvent1 = nil
---@type any
settings = nil
---@type any
shippingBuild = nil
---@type string
vmType = nil
