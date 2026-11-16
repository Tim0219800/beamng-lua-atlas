# `beamstate`

*File: `lua/vehicle/beamstate.lua` · VM: Vehicle · 1700 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** global `beamstate`

Physical state of the vehicle on the Lua side (vehicle VM, global `beamstate`). Tracks broken or deformed beams, break groups (breakGroup) and deform groups (deformGroup), the damage score per part and per body zone, flat tires, planets (local gravity attractors) and all couplers (hitches, trailers). A modder uses it to break groups, puncture tires, add damage, read damage, attach or detach couplers, save or load the state of nodes and beams. The hooks beamBroken, onBeamDeformed, onCouplerAttached and onCouplerDetached are called by the C++ engine; updateGFX and init/reset by the vehicle's main loop.

## Example

```lua
-- break a group, puncture a tire, read the damage
beamstate.breakBreakGroup("doorFL_break")
beamstate.deflateTire(0)
local zones = beamstate.getBodyZoneDamage() -- {FL=0..1, FR=..., ML, MR, RL, RR}
print(beamstate.damage)
-- toggle couplers
beamstate.toggleCouplers()
```

## Notes

- `beamstate.damage` = dissipated energy of the engine (`obj:getDissipatedEnergy()`) + `damageExt`, recomputed on every updateGFX. `damageExt` is incremented by addDamage and by 1000 each time a tire deflates.
- Beam, node, wheel and triangle ids are `cid` (0-based engine index).
- Body zones: letter 1 = front/middle/rear (F, M, R according to y in thirds), letter 2 = L/R according to x (half). Wheel beams (wheelID) do not count. Damage values from 0 to about 1.
- breakGroupType of a beam: 0 or nil = breaking this beam breaks the whole group; 1 = the beam is broken by the group but does not trigger it.
- A beam with `beamPrecompressionTime` (or a torsion bar with `precompressionTime`) activates `M.update` during the progressive precompression time; afterwards `M.update` goes back to `nop`.
- M.update, M.updateRemoteElectrics and M.debugDraw are `nop` (the game's empty function) and not nil; the fields listed as `nop` references are therefore empty functions. `update` is active only during precompression; `updateRemoteElectrics` is installed at the first coupler data export; `debugDraw` is active as long as coupler visibility is requested.
- Potential bug: in init, `for _, tag in b.tag do` (and the linkTag variant) iterates without `pairs`, so a beam whose `tag` or `linkTag` is a table causes a Lua error. The linkTag branch also tests `type(b.tag)` instead of `type(b.linkTag)`.
- Potential bug: onCouplerAttached reads `n.breakGroup` without checking that `n` (node) is non-nil, whereas the previous test checks it.
- `beamstate.getVehicleState` contains a deliberate fake 1-second delay (busy-wait loop) and a warning log: do not call it in a game loop.
- `brokenBreakGroups` is replaced by a new table on every init/reset: do not keep an old reference. On the other hand `deformedBeams`, `couplerCache`, `attachedCouplers`, `nodeNameMap`, `tagBeamMap` are emptied then filled in place.
- Fields exported but never written in this file: `lowpressure` is set to true as soon as a tire is deflated and reset to false only by reset().

## Functions

| Function | Description | Line |
|---|---|---|
| `beamstate.activateAutoCoupling(_nodetag)` | Enables automatic coupling: for 60 s max, every 0.5 s the couplers (all, or those of the given tags) are rearmed via attachCouplers. Broadcasts tag visibility to other vehicles. Without argument, also arms the `couplings` extension. Does nothing if the vehicle has no tagged coupler. | 252 |
| `beamstate.addDamage(damage)` | Adds artificial damage to `damageExt` (and therefore to `damage`). | 1426 |
| `beamstate.addPlanet(center, radius, mass, dt)` | Adds a planet (attractor) via obj:setPlanets. With dt, the planet is temporary: if it already exists with dt > 0 its duration is extended, with dt = 0 it is removed. | 631 |
| `beamstate.attachCouplers(_nodetag)` | Arms (obj:attachCoupler) the non-welded couplers carrying a couplerTag, with their jbeam parameters (couplerStrength default 1000000, couplerRadius 0.2, couplerLockRadius 0.025, couplerLatchSpeed 0.3, couplerTargets 0). | 304 |
| `beamstate.beamBroken(id, energy)` | C++ hook called when a beam breaks. Updates the damage tracking (body zone, part), deflates the relevant tire or pressure group, breaks collision triangles and meshes, rails, propagates to the breakGroup (breakGroupType 0/nil), changes the material (deformSwitches) and spawns particles (plastic, glass, wood). *(internal)* | 806 |
| `beamstate.breakAllBreakgroups()` | Breaks all beams that have a breakGroup (obj:breakBeam) and also breaks the groups that contain only couplers. | 1356 |
| `beamstate.breakBreakGroup(g)` | Breaks a group: marks it in brokenBreakGroups, hides the group's props, breaks all its beams, detaches its couplers and breaks the collision triangles of the same group. Also notifies the camera if it is an occupant group (ocpAttach...). | 169 |
| `beamstate.breakHinges()` | Breaks the beams with a breakGroup containing "hinge" or "latch" (hinges, latches), as well as coupler groups of this type. | 1368 |
| `beamstate.couplerExists(_nodetag)` | Indicates whether a coupler tag (couplerTag or tag) exists on this vehicle. | 313 |
| `beamstate.couplerFound(nodeId, obj2id, obj2nodeId)` | C++ hook called when a nearby coupler is found. Empty body in this version (only a commented-out print). *(internal)* | 381 |
| `beamstate.deflateRandomTire()` | Deflates a randomly chosen tire among those not already deflated. | 1397 |
| `beamstate.deflateTire(wheelid)` | Deflates a tire. On the first call for the wheel: marks isTireDeflated, displays the message, plays the burst sound, records the damage, calls the hook `onTireDeflated(wheelid)` via extensions.hook, adds 1000 to damageExt and softens the beams of the tread, sidewalls and pressure. Subsequent calls increment the counter; beyond 4 the pressure group is emptied. | 524 |
| `beamstate.deflateTires()` | Calls deflateTire for all wheels. | 1391 |
| `beamstate.delPlanet(center, radius, mass)` | Removes a planet (gravity attractor) identified by exact center, radius and mass, then updates the engine. | 621 |
| `beamstate.detachCouplers(_nodetag, forceLocked, forceWelded)` | Detaches (obj:detachCoupler) the couplers of a tag or all of them. Locked or welded couplers are ignored unless forced. Notifies the game (onCouplerDetach) and the couplings extension. | 317 |
| `beamstate.disableAutoCoupling()` | Stops automatic coupling, clears the visible tags and notifies the couplings extension. | 291 |
| `beamstate.exportCouplerData(nodeid, dataList)` | Called from the vehicle that wants to import electrics. On the provider, adds the requested electrics/inputs to the list sent every frame (in updateGFX) to the other vehicle. *(internal)* | 479 |
| `beamstate.exportPartDamageData()` | Writes the damage per part to the file `partDamage.json` (dumpToFile). Debug tool. | 1627 |
| `beamstate.getBodyZoneDamage()` | Damage of the six body zones. | 1618 |
| `beamstate.getBodyZoneDamageValue(zone)` | Damage of a body zone (sum of broken beams + deformation ratios, divided by the number of beams in the zone). | 1606 |
| `beamstate.getCouplerOffset(couplerTag)` | Returns the position of each coupler relative to the vehicle's reference node (refNodes[0].ref). | 463 |
| `beamstate.getPartCondition(partId, partTypeData)` | Estimates the state of a part from its broken breakGroups and deformed beams (`beamDamage`). The part (which must have a flexbody) is said to need replacement if too many groups are broken (>1, or all), more than 1% of beams are deformed (>= 0.01) or more than 2 beams are broken (>= 0.9). | 106 |
| `beamstate.getPartDamageBySignalName(name)` | Damage score of a part from its signal name. | 1581 |
| `beamstate.getPartDamageData()` | Returns the parts with strictly positive damage. | 1560 |
| `beamstate.getPartDamageScores()` | Flat table signal-name -> damage score for all parts, including those at 0. | 1572 |
| `beamstate.getPartDamageSignalList()` | Sorted list of available part signal names. | 1593 |
| `beamstate.getVehicleState(...)` | Returns a snapshot of the vehicle (id, parts conditions, config itemId, position, front and up vectors). Contains a deliberate fake 1 s delay (see notes). | 1539 |
| `beamstate.hasCouplers(couplerTag)` | Indicates whether the vehicle has at least one non-welded coupler carrying a couplerTag. | 1447 |
| `beamstate.importCouplerData(nodeId, data)` | Called by the provider host. Stores the received electrics (then merged into electrics.values by updateRemoteElectrics) and replays the inputs via input.event(name, value, 2). Ignores the data if the coupler is no longer attached. *(internal)* | 496 |
| `beamstate.init()` | Rebuilds the whole state from `v.data`: resets damage to zero, empties caches, reindexes triangles, breakGroups, deformGroups, couplers, beam tags, body zones, part data; prepares the delayed precompression, the part signal list, and registers the couplers radial menu. Called when the vehicle loads. *(internal)* | 1049 |
| `beamstate.isPhysicsStepUsed()` | Indicates whether beamstate needs the physics loop (true only while the delayed precompression is in progress). *(internal)* | 1632 |
| `beamstate.isTriangleBroken(triId)` | Indicates whether a collision triangle is broken (absent from the internal tracking). | 961 |
| `beamstate.load(filename)` | Reloads a file written by save. Checks that the number of nodes/beams, the vehicle folder and the format match, otherwise logs an error and aborts. Restores nodes, masses, lengths, broken/deformed beams then calls obj:commitLoad(). | 1496 |
| `beamstate.onBeamDeformed(id, ratio)` | C++ hook called only for beams that have a deformation threshold. Updates `deformedBeams`, zone and part damage, changes material (deformSwitches) and counts the events of the deformGroup(s). *(internal)* *(hook)* | 1308 |
| `beamstate.onCouplerAttached(nodeId, obj2id, obj2nodeId, attachSpeed, attachEnergy)` | C++ hook called when a coupler attaches. Records the coupling in attachedCouplers, copies the lock/weld flags between couplers of the same vehicle, stops auto coupling if it was for this tag, requests the import of electrics/inputs if the node has importElectrics/importInputs, restores its coupler breakGroups, then notifies the game (onCouplerAttached on the GE side, only once: by the vehicle with the lowest id). *(internal)* *(hook)* | 402 |
| `beamstate.onCouplerDetached(nodeId, obj2id, obj2nodeId, breakForce)` | C++ hook called when a coupler detaches. Removes the coupling, breaks the node's breakGroups if breakGroupType is 0 or nil, then notifies the game (onCouplerDetached on the GE side, only once per pair). *(internal)* *(hook)* | 441 |
| `beamstate.registerExternalCouplerBreakGroup(breakGroup, cid)` | Registers a coupler node cid in a breakGroup, so that a later breakBreakGroup detaches it. Used by coupling extensions. | 776 |
| `beamstate.requestSkeleton()` | For the UI: sends the beam geometry (pairs of node positions) via guihooks "VehicleSkeleton", then the skeleton state. Does nothing displayable if no player is seated. | 1430 |
| `beamstate.requestSkeletonState()` | Sends the beam state (`beamDamageTracker`) to the UI via guihooks "VehicleSkeletonState" if a player is seated in this vehicle. Also called every 0.25 s when damage has changed. | 517 |
| `beamstate.reset()` | Reinitializes the state (calls init) and resets `lowpressure` to false. Called on vehicle reset. *(internal)* | 1351 |
| `beamstate.save(filename)` | Writes a JSON ("v2" format) of the state: node positions and masses, rest length, beam breakage and deformation, hydro state and serialized Lua packets. | 1457 |
| `beamstate.sendExportCouplerData(obj2Id, obj2nodeId, data)` | Asks the other vehicle (queueObjectLuaCommand -> exportCouplerData) to export certain electrics/inputs values to us, and activates updateRemoteElectrics. | 397 |
| `beamstate.setCouplerVisiblityExternal(sourceObjectID, visibleTags)` | Called by another vehicle (via BeamEngine:queueAllObjectLua) to enable/disable the highlighting of couplers whose tag is in the list. (The name contains the typo "Visiblity".) *(internal)* | 242 |
| `beamstate.setPartCondition(partId, partTypeData, odometer, integrity, visual)` | Would apply an integrity/visual state to a part. In this version the body is almost empty (the useful code is commented out): does nothing useful. *(internal)* | 71 |
| `beamstate.setPlanets(p)` | Replaces all planets. The array is read in triplets (center, radius, mass). | 659 |
| `beamstate.toggleCouplers(_nodetag, forceLocked, forceWelded, forceAutoCoupling)` | Toggles couplers; called when the L key is pressed. Without tag: stops auto coupling if active, detaches everything if a coupler is attached, otherwise starts auto coupling. With a tag: detaches if attached, otherwise attaches it (unless forceAutoCoupling). | 351 |
| `beamstate.torsionBarBroken(id, energy)` | C++ hook called when a torsion bar breaks. If it has a breakGroup, hides the props and breaks the group (breakGroupType 0 or nil), as beamBroken does for beams. *(internal)* | 781 |
| `beamstate.triggerDeformGroup(group)` | Triggers the material change of the first deformSwitches matching the given deform group. | 1409 |
| `beamstate.updateGFX(dt)` | Called every graphics frame. Handles the timers of temporary planets, recomputes `damage`, the damage score per part, sends the skeleton state to the UI (at most every 0.25 s), drives automatic coupling (60 s timeout) and passes the requested electrics/inputs to coupled vehicles. *(internal)* | 672 |

### Parameter details

#### `beamstate.activateAutoCoupling(_nodetag)`

Enables automatic coupling: for 60 s max, every 0.5 s the couplers (all, or those of the given tags) are rearmed via attachCouplers. Broadcasts tag visibility to other vehicles. Without argument, also arms the `couplings` extension. Does nothing if the vehicle has no tagged coupler.

- `_nodetag` (*string|string[]|nil*) : Coupler tag(s) to target; nil = all free couplers (neither welded nor locked).

#### `beamstate.addDamage(damage)`

Adds artificial damage to `damageExt` (and therefore to `damage`).

- `damage` (*number*) : Amount to add.

#### `beamstate.addPlanet(center, radius, mass, dt)`

Adds a planet (attractor) via obj:setPlanets. With dt, the planet is temporary: if it already exists with dt > 0 its duration is extended, with dt = 0 it is removed.

- `center` (*vec3*) : Center.
- `radius` (*number*) : Radius.
- `mass` (*number*) : Mass.
- `dt` (*number|nil*) : Lifetime in seconds; nil = permanent.

#### `beamstate.attachCouplers(_nodetag)`

Arms (obj:attachCoupler) the non-welded couplers carrying a couplerTag, with their jbeam parameters (couplerStrength default 1000000, couplerRadius 0.2, couplerLockRadius 0.025, couplerLatchSpeed 0.3, couplerTargets 0).

- `_nodetag` (*string|nil*) : Processes only this couplerTag; nil = all.

#### `beamstate.beamBroken(id, energy)`

C++ hook called when a beam breaks. Updates the damage tracking (body zone, part), deflates the relevant tire or pressure group, breaks collision triangles and meshes, rails, propagates to the breakGroup (breakGroupType 0/nil), changes the material (deformSwitches) and spawns particles (plastic, glass, wood).

- `id` (*integer*) : cid of the beam.
- `energy` (*number*) : Break energy (unused).

#### `beamstate.breakBreakGroup(g)`

Breaks a group: marks it in brokenBreakGroups, hides the group's props, breaks all its beams, detaches its couplers and breaks the collision triangles of the same group. Also notifies the camera if it is an occupant group (ocpAttach...).

- `g` (*string|nil*) : Name of the breakGroup. nil: does nothing.

#### `beamstate.couplerExists(_nodetag)`

Indicates whether a coupler tag (couplerTag or tag) exists on this vehicle.

- `_nodetag` (*string*) : Tag searched.
- **returns**: boolean|nil true if it exists, otherwise nil.

#### `beamstate.couplerFound(nodeId, obj2id, obj2nodeId)`

C++ hook called when a nearby coupler is found. Empty body in this version (only a commented-out print).

- `nodeId` (*integer*) : cid of the local node.
- `obj2id` (*integer*) : Id of the other vehicle.
- `obj2nodeId` (*integer*) : cid of the other vehicle's node.

#### `beamstate.deflateTire(wheelid)`

Deflates a tire. On the first call for the wheel: marks isTireDeflated, displays the message, plays the burst sound, records the damage, calls the hook `onTireDeflated(wheelid)` via extensions.hook, adds 1000 to damageExt and softens the beams of the tread, sidewalls and pressure. Subsequent calls increment the counter; beyond 4 the pressure group is emptied.

- `wheelid` (*integer*) : Wheel index (v.data.wheels / wheels.wheels).

#### `beamstate.delPlanet(center, radius, mass)`

Removes a planet (gravity attractor) identified by exact center, radius and mass, then updates the engine.

- `center` (*vec3*) : Center.
- `radius` (*number*) : Radius.
- `mass` (*number*) : Mass.

#### `beamstate.detachCouplers(_nodetag, forceLocked, forceWelded)`

Detaches (obj:detachCoupler) the couplers of a tag or all of them. Locked or welded couplers are ignored unless forced. Notifies the game (onCouplerDetach) and the couplings extension.

- `_nodetag` (*string|nil*) : Tag to detach; nil = all.
- `forceLocked` (*boolean|nil*) : Also detaches couplerLock couplers.
- `forceWelded` (*boolean|nil*) : Also detaches couplerWeld couplers.

#### `beamstate.exportCouplerData(nodeid, dataList)`

Called from the vehicle that wants to import electrics. On the provider, adds the requested electrics/inputs to the list sent every frame (in updateGFX) to the other vehicle.

- `nodeid` (*integer*) : cid of the local coupler node.
- `dataList` (*table*) : {electrics = string[], inputs = string[]}.

#### `beamstate.getBodyZoneDamage()`

Damage of the six body zones.

- **returns**: table<string, number> {FL=, FR=, ML=, MR=, RL=, RR=}.

#### `beamstate.getBodyZoneDamageValue(zone)`

Damage of a body zone (sum of broken beams + deformation ratios, divided by the number of beams in the zone).

- `zone` (*string*) : "FL", "FR", "ML", "MR", "RL" or "RR".
- **returns**: number Damage value, 0 if the zone is unknown or empty.

#### `beamstate.getCouplerOffset(couplerTag)`

Returns the position of each coupler relative to the vehicle's reference node (refNodes[0].ref).

- `couplerTag` (*string|nil*) : Filter on couplerTag or tag; nil or "" = all.
- **returns**: table<integer, table> Per cid: {x, y, z, couplerTag, tag}. Empty table if there are no nodes.

#### `beamstate.getPartCondition(partId, partTypeData)`

Estimates the state of a part from its broken breakGroups and deformed beams (`beamDamage`). The part (which must have a flexbody) is said to need replacement if too many groups are broken (>1, or all), more than 1% of beams are deformed (>= 0.01) or more than 2 beams are broken (>= 0.9).

- `partId` (*string*) : Part identifier (for debug).
- `partTypeData` (*string[]|nil*) : Part tags of the form "jbeam:breakGroup:name", "jbeam:flexbody", "jbeam:beamDamage:<cid>".
- **returns**: table {integrityValue, integrityState, visualValue, visualState}; visualState.needsReplacement = true and integrityValue = 0 if the part is too damaged.
- **returns**: boolean true if a state could be provided.

#### `beamstate.getPartDamageBySignalName(name)`

Damage score of a part from its signal name.

- `name` (*string*) : Signal name (see getPartDamageSignalList).
- **returns**: number|nil Score 0 to 1, nil if the name is unknown.

#### `beamstate.getPartDamageData()`

Returns the parts with strictly positive damage.

- **returns**: table<string, table> partPath -> {name, damage}; damage = max(broken beams / threshold, deformed beams / threshold), between 0 and 1.

#### `beamstate.getPartDamageScores()`

Flat table signal-name -> damage score for all parts, including those at 0.

- **returns**: table<string, number> Short part name (or path with "_" in case of duplicates) -> score 0 to 1.

#### `beamstate.getPartDamageSignalList()`

Sorted list of available part signal names.

- **returns**: table[] {{name = string, type = "number"}, ...}.

#### `beamstate.getVehicleState(...)`

Returns a snapshot of the vehicle (id, parts conditions, config itemId, position, front and up vectors). Contains a deliberate fake 1 s delay (see notes).

- `...` (*any*) : Values returned as is after the state.
- **returns**: table {objId, partsCondition, itemId, pos, front, up}.
- **returns**: any The extra arguments passed as input.

#### `beamstate.hasCouplers(couplerTag)`

Indicates whether the vehicle has at least one non-welded coupler carrying a couplerTag.

- `couplerTag` (*string|nil*) : Filter on couplerTag or tag; nil = all.
- **returns**: boolean true if a coupler matches.

#### `beamstate.importCouplerData(nodeId, data)`

Called by the provider host. Stores the received electrics (then merged into electrics.values by updateRemoteElectrics) and replays the inputs via input.event(name, value, 2). Ignores the data if the coupler is no longer attached.

- `nodeId` (*integer*) : cid of the local node.
- `data` (*table*) : {electrics = table<string, any>, inputs = table<string, number>}.

#### `beamstate.isPhysicsStepUsed()`

Indicates whether beamstate needs the physics loop (true only while the delayed precompression is in progress).

- **returns**: boolean true if M.update is active.

#### `beamstate.isTriangleBroken(triId)`

Indicates whether a collision triangle is broken (absent from the internal tracking).

- `triId` (*integer*) : cid of the triangle.
- **returns**: boolean true if broken or unknown.

#### `beamstate.load(filename)`

Reloads a file written by save. Checks that the number of nodes/beams, the vehicle folder and the format match, otherwise logs an error and aborts. Restores nodes, masses, lengths, broken/deformed beams then calls obj:commitLoad().

- `filename` (*string|nil*) : Path; by default `<vehicleDirectory>/vehicle.save.json`.

#### `beamstate.onBeamDeformed(id, ratio)`

C++ hook called only for beams that have a deformation threshold. Updates `deformedBeams`, zone and part damage, changes material (deformSwitches) and counts the events of the deformGroup(s).

- `id` (*integer*) : cid of the beam.
- `ratio` (*number*) : Deformation ratio of the beam.

#### `beamstate.onCouplerAttached(nodeId, obj2id, obj2nodeId, attachSpeed, attachEnergy)`

C++ hook called when a coupler attaches. Records the coupling in attachedCouplers, copies the lock/weld flags between couplers of the same vehicle, stops auto coupling if it was for this tag, requests the import of electrics/inputs if the node has importElectrics/importInputs, restores its coupler breakGroups, then notifies the game (onCouplerAttached on the GE side, only once: by the vehicle with the lowest id).

- `nodeId` (*integer*) : cid of the local node.
- `obj2id` (*integer*) : Id of the other vehicle.
- `obj2nodeId` (*integer*) : cid of the other vehicle's node.
- `attachSpeed` (*number*) : Attach speed (not used here).
- `attachEnergy` (*number*) : Attach energy (not used here).

#### `beamstate.onCouplerDetached(nodeId, obj2id, obj2nodeId, breakForce)`

C++ hook called when a coupler detaches. Removes the coupling, breaks the node's breakGroups if breakGroupType is 0 or nil, then notifies the game (onCouplerDetached on the GE side, only once per pair).

- `nodeId` (*integer*) : cid of the local node.
- `obj2id` (*integer*) : Id of the other vehicle.
- `obj2nodeId` (*integer*) : cid of the other vehicle's node.
- `breakForce` (*number*) : Break force passed to the game.

#### `beamstate.registerExternalCouplerBreakGroup(breakGroup, cid)`

Registers a coupler node cid in a breakGroup, so that a later breakBreakGroup detaches it. Used by coupling extensions.

- `breakGroup` (*string*) : Group name.
- `cid` (*integer*) : cid of the coupler node.

#### `beamstate.save(filename)`

Writes a JSON ("v2" format) of the state: node positions and masses, rest length, beam breakage and deformation, hydro state and serialized Lua packets.

- `filename` (*string|nil*) : Path; by default `<vehicleDirectory>/vehicle.save.json`.

#### `beamstate.sendExportCouplerData(obj2Id, obj2nodeId, data)`

Asks the other vehicle (queueObjectLuaCommand -> exportCouplerData) to export certain electrics/inputs values to us, and activates updateRemoteElectrics.

- `obj2Id` (*integer*) : Id of the other vehicle.
- `obj2nodeId` (*integer*) : cid of the other vehicle's coupler node.
- `data` (*table*) : {electrics = string[], inputs = string[]}.

#### `beamstate.setCouplerVisiblityExternal(sourceObjectID, visibleTags)`

Called by another vehicle (via BeamEngine:queueAllObjectLua) to enable/disable the highlighting of couplers whose tag is in the list. (The name contains the typo "Visiblity".)

- `sourceObjectID` (*integer*) : Id of the broadcasting vehicle (unused).
- `visibleTags` (*table<string, boolean>|false|nil*) : Visible tags; false/nil disables the display.

#### `beamstate.setPartCondition(partId, partTypeData, odometer, integrity, visual)`

Would apply an integrity/visual state to a part. In this version the body is almost empty (the useful code is commented out): does nothing useful.

- `partId` (*string*) : Part identifier.
- `partTypeData` (*string[]*) : List of part types (e.g. "jbeam:breakGroup:name").
- `odometer` (*any*) : Unused.
- `integrity` (*number|table*) : Integrity value or table.
- `visual` (*number|table*) : Visual state value or table.

#### `beamstate.setPlanets(p)`

Replaces all planets. The array is read in triplets (center, radius, mass).

- `p` (*table*) : {vec3, radius, mass, vec3, radius, mass, ...}.

#### `beamstate.toggleCouplers(_nodetag, forceLocked, forceWelded, forceAutoCoupling)`

Toggles couplers; called when the L key is pressed. Without tag: stops auto coupling if active, detaches everything if a coupler is attached, otherwise starts auto coupling. With a tag: detaches if attached, otherwise attaches it (unless forceAutoCoupling).

- `_nodetag` (*string|nil*) : Target tag.
- `forceLocked` (*boolean|nil*) : Passed to detachCouplers.
- `forceWelded` (*boolean|nil*) : Passed to detachCouplers.
- `forceAutoCoupling` (*boolean|nil*) : With a tag, forces the automatic coupling logic.

#### `beamstate.torsionBarBroken(id, energy)`

C++ hook called when a torsion bar breaks. If it has a breakGroup, hides the props and breaks the group (breakGroupType 0 or nil), as beamBroken does for beams.

- `id` (*integer*) : Index of the torsion bar in v.data.torsionbars.
- `energy` (*number*) : Break energy (unused).

#### `beamstate.triggerDeformGroup(group)`

Triggers the material change of the first deformSwitches matching the given deform group.

- `group` (*string|nil*) : Name of the deformGroup; nil does nothing.

#### `beamstate.updateGFX(dt)`

Called every graphics frame. Handles the timers of temporary planets, recomputes `damage`, the damage score per part, sends the skeleton state to the UI (at most every 0.25 s), drives automatic coupling (60 s timeout) and passes the requested electrics/inputs to coupled vehicles.

- `dt` (*number*) : Time step in seconds.

## Fields

| Field | Type | Description |
|---|---|---|
| `activeParts` | string[] | Names of the active parts of the vehicle, collected from `v.data.slotMap`. |
| `attachedCouplers` | table<integer, table> | Couplers currently attached, by local node cid: {obj2id, obj2nodeId, exportElectrics?, exportInputs?}. |
| `brokenBreakGroups` | table<string, boolean> | Names of the breakGroups already broken (value true). Table recreated on every init. |
| `couplerCache` | table<integer, table> | Copy of the jbeam nodes that have a couplerTag or a tag, keyed by node cid (fields couplerTag, couplerWeld, couplerLock, couplerStrength, couplerRadius, couplerLockRadius, couplerLatchSpeed, couplerTargets, couplerStartRadius, breakGroup, importElectrics, importInputs). |
| `damage` | number | Cumulative vehicle damage (dissipated energy + damageExt), updated in updateGFX. |
| `damageExt` | number | Artificially added damage (addDamage, punctured tires +1000). Reset to 0 by init. |
| `debugDraw` | function | nop by default; draws spheres on the free coupler nodes whose tag is visible (setCouplerVisiblityExternal). |
| `deformGroupDamage` | table<string, table> | Per deformGroup: {eventCount, damage, maxEvents, invMaxEvents}. `damage` = eventCount / maxEvents, from 0 to about 1. |
| `deformGroupsTriggerBeam` | table<string, integer> | Per deformGroup, cid of the first beam that triggered it (deformation or break). |
| `deformedBeams` | table<integer, number> | Alias of beamDamageTracker: per beam cid, deformation ratio (onBeamDeformed) or 1 if broken. |
| `linkTagBeamMap` | table<string, integer[]> | Beam linkTag -> list of beam ids. |
| `lowpressure` | boolean | true as soon as at least one tire has been deflated. Reset to false by reset(). |
| `monetaryDamage` | number | Reset to 0 by init, not modified elsewhere in this file. |
| `nodeNameMap` | table<string, integer> | Jbeam name of a node -> cid. |
| `tagBeamMap` | table<string, integer[]> | Beam tag -> list of ids of beams carrying this tag. |
| `update` | function | nop except during the progressive precompression of beams/torsion bars; called by the physics loop. |
| `updateRemoteElectrics` | function | nop by default; becomes the real function after sendExportCouplerData. Called twice by electrics.lua: merges into electrics.values the values received from a coupled vehicle. Parameter retainReceivedElectrics: if false/nil, empties the received list. |

## Emitted hooks

Events broadcast to extensions by `extensions.hook`:

- `onTireDeflated`

**UI events (guihooks.trigger):** `VehicleSkeleton`, `VehicleSkeletonState`

## Calls into the engine (C++)

- `BeamEngine:` `queueAllObjectLua`
- `obj:` `addParticleByNodesRelative`, `attachCoupler`, `beamIsBroken`, `breakBeam`, `breakCollisionTriangle`, `breakMeshes`, `breakRails`, `changePressureGroupDrag`, `commitLoad`, `deflatePressureGroup`, `detachCoupler`, `getBeamDeformation`, `getBeamRestLength`, `getDirectionVector`, `getDirectionVectorUp`, `getDissipatedEnergy`, `getGroupPressure`, `getId`, `getNodeMass`, `getNodePosition`, `getOriginalNodeMass`, `getPosition`, `playSFXOnceCT`, `queueGameEngineLua`, `queueObjectLuaCommand`, `setBeamLength`, `setBeamPressureRel`, `setBeamSpringDamp`, `setGroupPressure`, `setNodeFrictionSlidingCoefs`, `setNodeMass`, `setNodePosition`, `setPlanets`, `setPrecompressionRatio`, `setTorsionbarPrecompressionAngle`, `stopLatching`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/vehicle/beamstate.lua`.*
