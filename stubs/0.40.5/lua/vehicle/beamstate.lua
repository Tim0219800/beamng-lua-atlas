---@meta
-- tim19Atlas stub generated from lua/vehicle/beamstate.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Physical state of the vehicle on the Lua side (vehicle VM, global `beamstate`). Tracks broken or deformed beams, break groups (breakGroup) and deform groups (deformGroup), the damage score per part and per body zone, flat tires, planets (local gravity attractors) and all couplers (hitches, trailers). A modder uses it to break groups, puncture tires, add damage, read damage, attach or detach couplers, save or load the state of nodes and beams. The hooks beamBroken, onBeamDeformed, onCouplerAttached and onCouplerDetached are called by the C++ engine; updateGFX and init/reset by the vehicle's main loop.
--- Access: global `beamstate`
---@class beamstate
---@field activeParts string[] Names of the active parts of the vehicle, collected from `v.data.slotMap`.
---@field attachedCouplers table<integer, table> Couplers currently attached, by local node cid: {obj2id, obj2nodeId, exportElectrics?, exportInputs?}.
---@field brokenBreakGroups table<string, boolean> Names of the breakGroups already broken (value true). Table recreated on every init.
---@field couplerCache table<integer, table> Copy of the jbeam nodes that have a couplerTag or a tag, keyed by node cid (fields couplerTag, couplerWeld, couplerLock, couplerStrength, couplerRadius, couplerLockRadius, couplerLatchSpeed, couplerTargets, couplerStartRadius, breakGroup, importElectrics, importInputs).
---@field damage number Cumulative vehicle damage (dissipated energy + damageExt), updated in updateGFX.
---@field damageExt number Artificially added damage (addDamage, punctured tires +1000). Reset to 0 by init.
---@field debugDraw function nop by default; draws spheres on the free coupler nodes whose tag is visible (setCouplerVisiblityExternal).
---@field deformGroupDamage table<string, table> Per deformGroup: {eventCount, damage, maxEvents, invMaxEvents}. `damage` = eventCount / maxEvents, from 0 to about 1.
---@field deformGroupsTriggerBeam table<string, integer> Per deformGroup, cid of the first beam that triggered it (deformation or break).
---@field deformedBeams table<integer, number> Alias of beamDamageTracker: per beam cid, deformation ratio (onBeamDeformed) or 1 if broken.
---@field linkTagBeamMap table<string, integer[]> Beam linkTag -> list of beam ids.
---@field lowpressure boolean true as soon as at least one tire has been deflated. Reset to false by reset().
---@field monetaryDamage number Reset to 0 by init, not modified elsewhere in this file.
---@field nodeNameMap table<string, integer> Jbeam name of a node -> cid.
---@field tagBeamMap table<string, integer[]> Beam tag -> list of ids of beams carrying this tag.
---@field update function nop except during the progressive precompression of beams/torsion bars; called by the physics loop.
---@field updateRemoteElectrics function nop by default; becomes the real function after sendExportCouplerData. Called twice by electrics.lua: merges into electrics.values the values received from a coupled vehicle. Parameter retainReceivedElectrics: if false/nil, empties the received list.
beamstate = {}

--- Enables automatic coupling: for 60 s max, every 0.5 s the couplers (all, or those of the given tags) are rearmed via attachCouplers. Broadcasts tag visibility to other vehicles. Without argument, also arms the `couplings` extension. Does nothing if the vehicle has no tagged coupler.
---Source: lua/vehicle/beamstate.lua:252
---@param _nodetag string|string[]|nil Coupler tag(s) to target; nil = all free couplers (neither welded nor locked).
function beamstate.activateAutoCoupling(_nodetag) end

--- Adds artificial damage to `damageExt` (and therefore to `damage`).
---Source: lua/vehicle/beamstate.lua:1426
---@param damage number Amount to add.
function beamstate.addDamage(damage) end

--- Adds a planet (attractor) via obj:setPlanets. With dt, the planet is temporary: if it already exists with dt > 0 its duration is extended, with dt = 0 it is removed.
---Source: lua/vehicle/beamstate.lua:631
---@param center vec3 Center.
---@param radius number Radius.
---@param mass number Mass.
---@param dt number|nil Lifetime in seconds; nil = permanent.
function beamstate.addPlanet(center, radius, mass, dt) end

--- Arms (obj:attachCoupler) the non-welded couplers carrying a couplerTag, with their jbeam parameters (couplerStrength default 1000000, couplerRadius 0.2, couplerLockRadius 0.025, couplerLatchSpeed 0.3, couplerTargets 0).
---Source: lua/vehicle/beamstate.lua:304
---@param _nodetag string|nil Processes only this couplerTag; nil = all.
function beamstate.attachCouplers(_nodetag) end

--- C++ hook called when a beam breaks. Updates the damage tracking (body zone, part), deflates the relevant tire or pressure group, breaks collision triangles and meshes, rails, propagates to the breakGroup (breakGroupType 0/nil), changes the material (deformSwitches) and spawns particles (plastic, glass, wood).
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/beamstate.lua:806
---@param id integer cid of the beam.
---@param energy number Break energy (unused).
function beamstate.beamBroken(id, energy) end

--- Breaks all beams that have a breakGroup (obj:breakBeam) and also breaks the groups that contain only couplers.
---Source: lua/vehicle/beamstate.lua:1356
function beamstate.breakAllBreakgroups() end

--- Breaks a group: marks it in brokenBreakGroups, hides the group's props, breaks all its beams, detaches its couplers and breaks the collision triangles of the same group. Also notifies the camera if it is an occupant group (ocpAttach...).
---Source: lua/vehicle/beamstate.lua:169
---@param g string|nil Name of the breakGroup. nil: does nothing.
function beamstate.breakBreakGroup(g) end

--- Breaks the beams with a breakGroup containing "hinge" or "latch" (hinges, latches), as well as coupler groups of this type.
---Source: lua/vehicle/beamstate.lua:1368
function beamstate.breakHinges() end

--- Indicates whether a coupler tag (couplerTag or tag) exists on this vehicle.
---Source: lua/vehicle/beamstate.lua:313
---@param _nodetag string Tag searched.
---@return boolean|nil  true if it exists, otherwise nil.
function beamstate.couplerExists(_nodetag) end

--- C++ hook called when a nearby coupler is found. Empty body in this version (only a commented-out print).
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/beamstate.lua:381
---@param nodeId integer cid of the local node.
---@param obj2id integer Id of the other vehicle.
---@param obj2nodeId integer cid of the other vehicle's node.
function beamstate.couplerFound(nodeId, obj2id, obj2nodeId) end

--- Deflates a randomly chosen tire among those not already deflated.
---Source: lua/vehicle/beamstate.lua:1397
function beamstate.deflateRandomTire() end

--- Deflates a tire. On the first call for the wheel: marks isTireDeflated, displays the message, plays the burst sound, records the damage, calls the hook `onTireDeflated(wheelid)` via extensions.hook, adds 1000 to damageExt and softens the beams of the tread, sidewalls and pressure. Subsequent calls increment the counter; beyond 4 the pressure group is emptied.
---Source: lua/vehicle/beamstate.lua:524
---@param wheelid integer Wheel index (v.data.wheels / wheels.wheels).
function beamstate.deflateTire(wheelid) end

--- Calls deflateTire for all wheels.
---Source: lua/vehicle/beamstate.lua:1391
function beamstate.deflateTires() end

--- Removes a planet (gravity attractor) identified by exact center, radius and mass, then updates the engine.
---Source: lua/vehicle/beamstate.lua:621
---@param center vec3 Center.
---@param radius number Radius.
---@param mass number Mass.
function beamstate.delPlanet(center, radius, mass) end

--- Detaches (obj:detachCoupler) the couplers of a tag or all of them. Locked or welded couplers are ignored unless forced. Notifies the game (onCouplerDetach) and the couplings extension.
---Source: lua/vehicle/beamstate.lua:317
---@param _nodetag string|nil Tag to detach; nil = all.
---@param forceLocked boolean|nil Also detaches couplerLock couplers.
---@param forceWelded boolean|nil Also detaches couplerWeld couplers.
function beamstate.detachCouplers(_nodetag, forceLocked, forceWelded) end

--- Stops automatic coupling, clears the visible tags and notifies the couplings extension.
---Source: lua/vehicle/beamstate.lua:291
function beamstate.disableAutoCoupling() end

--- Called from the vehicle that wants to import electrics. On the provider, adds the requested electrics/inputs to the list sent every frame (in updateGFX) to the other vehicle.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/beamstate.lua:479
---@param nodeid integer cid of the local coupler node.
---@param dataList table {electrics = string[], inputs = string[]}.
function beamstate.exportCouplerData(nodeid, dataList) end

--- Writes the damage per part to the file `partDamage.json` (dumpToFile). Debug tool.
---Source: lua/vehicle/beamstate.lua:1627
function beamstate.exportPartDamageData() end

--- Damage of the six body zones.
---Source: lua/vehicle/beamstate.lua:1618
---@return table<string, number>  {FL=, FR=, ML=, MR=, RL=, RR=}.
function beamstate.getBodyZoneDamage() end

--- Damage of a body zone (sum of broken beams + deformation ratios, divided by the number of beams in the zone).
---Source: lua/vehicle/beamstate.lua:1606
---@param zone string "FL", "FR", "ML", "MR", "RL" or "RR".
---@return number  Damage value, 0 if the zone is unknown or empty.
function beamstate.getBodyZoneDamageValue(zone) end

--- Returns the position of each coupler relative to the vehicle's reference node (refNodes[0].ref).
---Source: lua/vehicle/beamstate.lua:463
---@param couplerTag string|nil Filter on couplerTag or tag; nil or "" = all.
---@return table<integer, table>  Per cid: {x, y, z, couplerTag, tag}. Empty table if there are no nodes.
function beamstate.getCouplerOffset(couplerTag) end

--- Estimates the state of a part from its broken breakGroups and deformed beams (`beamDamage`). The part (which must have a flexbody) is said to need replacement if too many groups are broken (>1, or all), more than 1% of beams are deformed (>= 0.01) or more than 2 beams are broken (>= 0.9).
---Source: lua/vehicle/beamstate.lua:106
---@param partId string Part identifier (for debug).
---@param partTypeData string[]|nil Part tags of the form "jbeam:breakGroup:name", "jbeam:flexbody", "jbeam:beamDamage:<cid>".
---@return table  {integrityValue, integrityState, visualValue, visualState}; visualState.needsReplacement = true and integrityValue = 0 if the part is too damaged.
---@return boolean  true if a state could be provided.
function beamstate.getPartCondition(partId, partTypeData) end

--- Damage score of a part from its signal name.
---Source: lua/vehicle/beamstate.lua:1581
---@param name string Signal name (see getPartDamageSignalList).
---@return number|nil  Score 0 to 1, nil if the name is unknown.
function beamstate.getPartDamageBySignalName(name) end

--- Returns the parts with strictly positive damage.
---Source: lua/vehicle/beamstate.lua:1560
---@return table<string, table>  partPath -> {name, damage}; damage = max(broken beams / threshold, deformed beams / threshold), between 0 and 1.
function beamstate.getPartDamageData() end

--- Flat table signal-name -> damage score for all parts, including those at 0.
---Source: lua/vehicle/beamstate.lua:1572
---@return table<string, number>  Short part name (or path with "_" in case of duplicates) -> score 0 to 1.
function beamstate.getPartDamageScores() end

--- Sorted list of available part signal names.
---Source: lua/vehicle/beamstate.lua:1593
---@return table[]  {{name = string, type = "number"}, ...}.
function beamstate.getPartDamageSignalList() end

--- Returns a snapshot of the vehicle (id, parts conditions, config itemId, position, front and up vectors). Contains a deliberate fake 1 s delay (see notes).
---Source: lua/vehicle/beamstate.lua:1539
---@param ... any Values returned as is after the state.
---@return table  {objId, partsCondition, itemId, pos, front, up}.
---@return any  The extra arguments passed as input.
function beamstate.getVehicleState(...) end

--- Indicates whether the vehicle has at least one non-welded coupler carrying a couplerTag.
---Source: lua/vehicle/beamstate.lua:1447
---@param couplerTag string|nil Filter on couplerTag or tag; nil = all.
---@return boolean  true if a coupler matches.
function beamstate.hasCouplers(couplerTag) end

--- Called by the provider host. Stores the received electrics (then merged into electrics.values by updateRemoteElectrics) and replays the inputs via input.event(name, value, 2). Ignores the data if the coupler is no longer attached.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/beamstate.lua:496
---@param nodeId integer cid of the local node.
---@param data table {electrics = table<string, any>, inputs = table<string, number>}.
function beamstate.importCouplerData(nodeId, data) end

--- Rebuilds the whole state from `v.data`: resets damage to zero, empties caches, reindexes triangles, breakGroups, deformGroups, couplers, beam tags, body zones, part data; prepares the delayed precompression, the part signal list, and registers the couplers radial menu. Called when the vehicle loads.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/beamstate.lua:1049
function beamstate.init() end

--- Indicates whether beamstate needs the physics loop (true only while the delayed precompression is in progress).
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/beamstate.lua:1632
---@return boolean  true if M.update is active.
function beamstate.isPhysicsStepUsed() end

--- Indicates whether a collision triangle is broken (absent from the internal tracking).
---Source: lua/vehicle/beamstate.lua:961
---@param triId integer cid of the triangle.
---@return boolean  true if broken or unknown.
function beamstate.isTriangleBroken(triId) end

--- Reloads a file written by save. Checks that the number of nodes/beams, the vehicle folder and the format match, otherwise logs an error and aborts. Restores nodes, masses, lengths, broken/deformed beams then calls obj:commitLoad().
---Source: lua/vehicle/beamstate.lua:1496
---@param filename string|nil Path; by default `<vehicleDirectory>/vehicle.save.json`.
function beamstate.load(filename) end

--- C++ hook called only for beams that have a deformation threshold. Updates `deformedBeams`, zone and part damage, changes material (deformSwitches) and counts the events of the deformGroup(s).
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/beamstate.lua:1308
---@param id integer cid of the beam.
---@param ratio number Deformation ratio of the beam.
function beamstate.onBeamDeformed(id, ratio) end

--- C++ hook called when a coupler attaches. Records the coupling in attachedCouplers, copies the lock/weld flags between couplers of the same vehicle, stops auto coupling if it was for this tag, requests the import of electrics/inputs if the node has importElectrics/importInputs, restores its coupler breakGroups, then notifies the game (onCouplerAttached on the GE side, only once: by the vehicle with the lowest id).
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/beamstate.lua:402
---@param nodeId integer cid of the local node.
---@param obj2id integer Id of the other vehicle.
---@param obj2nodeId integer cid of the other vehicle's node.
---@param attachSpeed number Attach speed (not used here).
---@param attachEnergy number Attach energy (not used here).
function beamstate.onCouplerAttached(nodeId, obj2id, obj2nodeId, attachSpeed, attachEnergy) end

--- C++ hook called when a coupler detaches. Removes the coupling, breaks the node's breakGroups if breakGroupType is 0 or nil, then notifies the game (onCouplerDetached on the GE side, only once per pair).
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/beamstate.lua:441
---@param nodeId integer cid of the local node.
---@param obj2id integer Id of the other vehicle.
---@param obj2nodeId integer cid of the other vehicle's node.
---@param breakForce number Break force passed to the game.
function beamstate.onCouplerDetached(nodeId, obj2id, obj2nodeId, breakForce) end

--- Registers a coupler node cid in a breakGroup, so that a later breakBreakGroup detaches it. Used by coupling extensions.
---Source: lua/vehicle/beamstate.lua:776
---@param breakGroup string Group name.
---@param cid integer cid of the coupler node.
function beamstate.registerExternalCouplerBreakGroup(breakGroup, cid) end

--- For the UI: sends the beam geometry (pairs of node positions) via guihooks "VehicleSkeleton", then the skeleton state. Does nothing displayable if no player is seated.
---Source: lua/vehicle/beamstate.lua:1430
function beamstate.requestSkeleton() end

--- Sends the beam state (`beamDamageTracker`) to the UI via guihooks "VehicleSkeletonState" if a player is seated in this vehicle. Also called every 0.25 s when damage has changed.
---Source: lua/vehicle/beamstate.lua:517
function beamstate.requestSkeletonState() end

--- Reinitializes the state (calls init) and resets `lowpressure` to false. Called on vehicle reset.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/beamstate.lua:1351
function beamstate.reset() end

--- Writes a JSON ("v2" format) of the state: node positions and masses, rest length, beam breakage and deformation, hydro state and serialized Lua packets.
---Source: lua/vehicle/beamstate.lua:1457
---@param filename string|nil Path; by default `<vehicleDirectory>/vehicle.save.json`.
function beamstate.save(filename) end

--- Asks the other vehicle (queueObjectLuaCommand -> exportCouplerData) to export certain electrics/inputs values to us, and activates updateRemoteElectrics.
---Source: lua/vehicle/beamstate.lua:397
---@param obj2Id integer Id of the other vehicle.
---@param obj2nodeId integer cid of the other vehicle's coupler node.
---@param data table {electrics = string[], inputs = string[]}.
function beamstate.sendExportCouplerData(obj2Id, obj2nodeId, data) end

--- Called by another vehicle (via BeamEngine:queueAllObjectLua) to enable/disable the highlighting of couplers whose tag is in the list. (The name contains the typo "Visiblity".)
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/beamstate.lua:242
---@param sourceObjectID integer Id of the broadcasting vehicle (unused).
---@param visibleTags table<string, boolean>|false|nil Visible tags; false/nil disables the display.
function beamstate.setCouplerVisiblityExternal(sourceObjectID, visibleTags) end

--- Would apply an integrity/visual state to a part. In this version the body is almost empty (the useful code is commented out): does nothing useful.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/beamstate.lua:71
---@param partId string Part identifier.
---@param partTypeData string[] List of part types (e.g. "jbeam:breakGroup:name").
---@param odometer any Unused.
---@param integrity number|table Integrity value or table.
---@param visual number|table Visual state value or table.
function beamstate.setPartCondition(partId, partTypeData, odometer, integrity, visual) end

--- Replaces all planets. The array is read in triplets (center, radius, mass).
---Source: lua/vehicle/beamstate.lua:659
---@param p table {vec3, radius, mass, vec3, radius, mass, ...}.
function beamstate.setPlanets(p) end

--- Toggles couplers; called when the L key is pressed. Without tag: stops auto coupling if active, detaches everything if a coupler is attached, otherwise starts auto coupling. With a tag: detaches if attached, otherwise attaches it (unless forceAutoCoupling).
---Source: lua/vehicle/beamstate.lua:351
---@param _nodetag string|nil Target tag.
---@param forceLocked boolean|nil Passed to detachCouplers.
---@param forceWelded boolean|nil Passed to detachCouplers.
---@param forceAutoCoupling boolean|nil With a tag, forces the automatic coupling logic.
function beamstate.toggleCouplers(_nodetag, forceLocked, forceWelded, forceAutoCoupling) end

--- C++ hook called when a torsion bar breaks. If it has a breakGroup, hides the props and breaks the group (breakGroupType 0 or nil), as beamBroken does for beams.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/beamstate.lua:781
---@param id integer Index of the torsion bar in v.data.torsionbars.
---@param energy number Break energy (unused).
function beamstate.torsionBarBroken(id, energy) end

--- Triggers the material change of the first deformSwitches matching the given deform group.
---Source: lua/vehicle/beamstate.lua:1409
---@param group string|nil Name of the deformGroup; nil does nothing.
function beamstate.triggerDeformGroup(group) end

--- Called every graphics frame. Handles the timers of temporary planets, recomputes `damage`, the damage score per part, sends the skeleton state to the UI (at most every 0.25 s), drives automatic coupling (60 s timeout) and passes the requested electrics/inputs to coupled vehicles.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/beamstate.lua:672
---@param dt number Time step in seconds.
function beamstate.updateGFX(dt) end

