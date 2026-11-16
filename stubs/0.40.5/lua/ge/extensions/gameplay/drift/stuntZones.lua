---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/drift/stuntZones.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Manager of the stunt zones of drift/Gymkhana mode. setStuntZones(zones) creates one object per zone by loading the submodule of the requested type (donut, driftThrough, hitPole, nearPole, in gameplay/drift/stuntZones/<type>); then, every frame, while the player is drifting, it calls detectStunt() on the available zones the player is in. When a zone is accomplished, it emits onAnyStuntZoneAccomplished, which this module relays to the stallingSystem and to a sub-hook (onDonutDriftAccomplished, onDriftThroughAccomplished, onHitPoleAccomplished, onNearPoleAccomplished) handled by gameplay_drift_scoring. Loaded by gameplay_drift_general in the inChallenge context; zones come from gameplay_drift_saveLoad.loadDriftData.
--- Access: extension `gameplay_drift_stuntZones`: `extensions.load("gameplay_drift_stuntZones")`, then the global `gameplay_drift_stuntZones`
---@class gameplay_drift_stuntZones
---@field dependencies string[] gameplay_drift_general, loaded beforehand.
gameplay_drift_stuntZones = {}

--- Removes all zones (poles and markers included) and forgets the zone types already approached.
---Source: lua/ge/extensions/gameplay/drift/stuntZones.lua:215
function gameplay_drift_stuntZones.clear() end

--- INTERNAL: removes a zone by id (calls its clear if it exists, then removes it from the list). Used by destroyed poles.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/drift/stuntZones.lua:299
---@param id integer Zone id.
function gameplay_drift_stuntZones.clearStuntZone(id) end

--- Chooses the color of a segment of a donut's circle: blue (filled portion), green (ready), red/white (during cooldown).
---Source: lua/ge/extensions/gameplay/drift/stuntZones.lua:63
---@param cooldownPerc number|nil Elapsed cooldown percentage (100 = ready).
---@param filledPerc number|nil Percentage of the turn already completed.
---@param t number Position of the segment on the circle, from 0 to 1.
---@return ColorF  Segment color.
function gameplay_drift_stuntZones.getDecalColor(cooldownPerc, filledPerc, t) end

--- TEST: indicates whether zone drawing is enabled ("Draw lines" imgui checkbox, true by default).
---Source: lua/ge/extensions/gameplay/drift/stuntZones.lua:333
---@return boolean  true if drawing.
function gameplay_drift_stuntZones.getDrawLines() end

--- Returns {default=true, canBeChanged=true} for the drift debug window.
---Source: lua/ge/extensions/gameplay/drift/stuntZones.lua:349
---@return table  {default = true, canBeChanged = true}
function gameplay_drift_stuntZones.getDriftDebugInfo() end

--- Green color (zone ready).
---Source: lua/ge/extensions/gameplay/drift/stuntZones.lua:337
---@return ColorF  Green.
function gameplay_drift_stuntZones.getGreenColor() end

--- Debug line thickness depending on distance to the camera (250 / distance).
---Source: lua/ge/extensions/gameplay/drift/stuntZones.lua:353
---@param linePos vec3 Position of the line point.
---@return number  Thickness.
function gameplay_drift_stuntZones.getLineThickness(linePos) end

--- Red color (cooldown).
---Source: lua/ge/extensions/gameplay/drift/stuntZones.lua:345
---@return ColorF  Red.
function gameplay_drift_stuntZones.getRedColor() end

--- Returns the list of instantiated zone objects (each object has data = {id, zoneData, nearDist, drawData}, activeData and the type's methods).
---Source: lua/ge/extensions/gameplay/drift/stuntZones.lua:312
---@return table[]  Active zones.
function gameplay_drift_stuntZones.getStuntZones() end

--- White color (cooldown).
---Source: lua/ge/extensions/gameplay/drift/stuntZones.lua:341
---@return ColorF  White.
function gameplay_drift_stuntZones.getWhiteColor() end

--- Grows the global decal pool up to max elements (red arrow, fade 100 to 150). Depends on a global variable decals not defined here.
---Source: lua/ge/extensions/gameplay/drift/stuntZones.lua:48
---@param max integer Desired minimum pool size.
function gameplay_drift_stuntZones.increaseDecalPool(max) end

--- Hook: a zone is accomplished; informs the stallingSystem (processStuntZone) then relays the requested sub-hook with its data.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/drift/stuntZones.lua:361
---@param data table {stuntZoneId, subHookName, subHookData}.
function gameplay_drift_stuntZones.onAnyStuntZoneAccomplished(data) end

--- Hook: re-enables zone drawing when debug changes.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/drift/stuntZones.lua:357
function gameplay_drift_stuntZones.onDriftDebugChanged() end

--- Hook: when the drift stops, resets the accumulated angle of donut zones to zero.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/drift/stuntZones.lua:289
---@param isDrifting boolean New drift state.
function gameplay_drift_stuntZones.onDriftStatusChanged(isDrifting) end

--- Hook: removes all zones on unload.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/drift/stuntZones.lua:316
function gameplay_drift_stuntZones.onExtensionUnloaded() end

--- Hook: removes all zones before a Lua reload (returns no data).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/drift/stuntZones.lua:320
function gameplay_drift_stuntZones.onSerialize() end

--- Called every frame: debug window, then (when not paused/frozen) for each available zone detects the approach (onNearStuntZoneFirst), calls detectStunt() if the player is drifting in the zone, then the zone's onUpdate and cooldown handling.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/drift/stuntZones.lua:167
---@param dtReal number Real-time delta.
---@param dtSim number Simulated delta time (cooldowns).
---@param dtRaw number Raw time delta (unused).
function gameplay_drift_stuntZones.onUpdate(dtReal, dtSim, dtRaw) end

--- Hook: relays a vehicle's destruction to the zones (destroyed poles remove themselves).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/drift/stuntZones.lua:325
---@param vehId integer Destroyed vehicle.
function gameplay_drift_stuntZones.onVehicleDestroyed(vehId) end

--- Calls reset() on each zone (cooldowns, counters, poles put back in place).
---Source: lua/ge/extensions/gameplay/drift/stuntZones.lua:209
function gameplay_drift_stuntZones.reset() end

--- Replaces all zones with the given list: clears the existing zones (clear), computes the "near" distance, the default score and the draw data, then instantiates each zone via require("gameplay/drift/stuntZones/<type>"). Ids are assigned from 1 to n.
---Source: lua/ge/extensions/gameplay/drift/stuntZones.lua:224
---@param zones table[] List of {type, pos, scl, rot, cooldown, score}.
function gameplay_drift_stuntZones.setStuntZones(zones) end

