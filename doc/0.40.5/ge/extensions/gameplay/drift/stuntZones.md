# `gameplay_drift_stuntZones`

*File: `lua/ge/extensions/gameplay/drift/stuntZones.lua` · VM: Game Engine (GE) · 394 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `gameplay_drift_stuntZones`: `extensions.load("gameplay_drift_stuntZones")`, then the global `gameplay_drift_stuntZones`

Manager of the stunt zones of drift/Gymkhana mode. setStuntZones(zones) creates one object per zone by loading the submodule of the requested type (donut, driftThrough, hitPole, nearPole, in gameplay/drift/stuntZones/<type>); then, every frame, while the player is drifting, it calls detectStunt() on the available zones the player is in. When a zone is accomplished, it emits onAnyStuntZoneAccomplished, which this module relays to the stallingSystem and to a sub-hook (onDonutDriftAccomplished, onDriftThroughAccomplished, onHitPoleAccomplished, onNearPoleAccomplished) handled by gameplay_drift_scoring. Loaded by gameplay_drift_general in the inChallenge context; zones come from gameplay_drift_saveLoad.loadDriftData.

## Example

```lua
gameplay_drift_stuntZones.setStuntZones({
  {type = "donut", cooldown = 8, pos = vec3(0, 0, 0), scl = 10},
  {type = "hitPole", pos = vec3(-10, 0, 0)}
})
```

## Notes

- Zone format: {type, pos = vec3, scl, rot = quat, cooldown, score?}. donut: scl = radius in m (number); driftThrough: scl = vec3 of half-dimensions and rot = quat; hitPole/nearPole: only pos (a "delineator" pole is spawned).
- "Near" distance for the onNearStuntZoneFirst(stuntZone) hook: scl + 6 if scl is a number, max(scl.x, y, z) + 4 if it is a vec3, 6 otherwise; emitted only once per zone type (on-screen help).
- If the zone has no score field, it is filled with scoreOptions.defaultPoints[type]; but the score actually awarded comes from gameplay_drift_scoring.getStuntZoneBasePoints(type) (the submodules do not use zoneData.score).
- Zones are only evaluated if drift is neither paused nor frozen, and if the player has a vehicle (doesPlHaveVeh).
- onSerialize calls clear(): spawned poles are removed before a Lua reload. onExtensionUnloaded does the same.
- When the player stops drifting, the donuts' angle counter is reset to zero (onDriftStatusChanged).
- increaseDecalPool uses a global variable decals that is not declared in this file: only call it if it exists elsewhere (it is not called in this file).
- getDecalColor contains conditions like ((t * 100) or (100 - t * 100)) that are always true on the first operand: the second branch is never used.

**Dependencies (loaded first):** `gameplay_drift_general`

## Functions

| Function | Description | Line |
|---|---|---|
| `gameplay_drift_stuntZones.clear()` | Removes all zones (poles and markers included) and forgets the zone types already approached. | 215 |
| `gameplay_drift_stuntZones.clearStuntZone(id)` | INTERNAL: removes a zone by id (calls its clear if it exists, then removes it from the list). Used by destroyed poles. *(internal)* | 299 |
| `gameplay_drift_stuntZones.getDecalColor(cooldownPerc, filledPerc, t)` | Chooses the color of a segment of a donut's circle: blue (filled portion), green (ready), red/white (during cooldown). | 63 |
| `gameplay_drift_stuntZones.getDrawLines()` | TEST: indicates whether zone drawing is enabled ("Draw lines" imgui checkbox, true by default). | 333 |
| `gameplay_drift_stuntZones.getDriftDebugInfo()` | Returns {default=true, canBeChanged=true} for the drift debug window. | 349 |
| `gameplay_drift_stuntZones.getGreenColor()` | Green color (zone ready). | 337 |
| `gameplay_drift_stuntZones.getLineThickness(linePos)` | Debug line thickness depending on distance to the camera (250 / distance). | 353 |
| `gameplay_drift_stuntZones.getRedColor()` | Red color (cooldown). | 345 |
| `gameplay_drift_stuntZones.getStuntZones()` | Returns the list of instantiated zone objects (each object has data = {id, zoneData, nearDist, drawData}, activeData and the type's methods). | 312 |
| `gameplay_drift_stuntZones.getWhiteColor()` | White color (cooldown). | 341 |
| `gameplay_drift_stuntZones.increaseDecalPool(max)` | Grows the global decal pool up to max elements (red arrow, fade 100 to 150). Depends on a global variable decals not defined here. | 48 |
| `gameplay_drift_stuntZones.onAnyStuntZoneAccomplished(data)` | Hook: a zone is accomplished; informs the stallingSystem (processStuntZone) then relays the requested sub-hook with its data. *(internal)* *(hook)* | 361 |
| `gameplay_drift_stuntZones.onDriftDebugChanged()` | Hook: re-enables zone drawing when debug changes. *(internal)* *(hook)* | 357 |
| `gameplay_drift_stuntZones.onDriftStatusChanged(isDrifting)` | Hook: when the drift stops, resets the accumulated angle of donut zones to zero. *(internal)* *(hook)* | 289 |
| `gameplay_drift_stuntZones.onExtensionUnloaded()` | Hook: removes all zones on unload. *(internal)* *(hook)* | 316 |
| `gameplay_drift_stuntZones.onSerialize()` | Hook: removes all zones before a Lua reload (returns no data). *(internal)* *(hook)* | 320 |
| `gameplay_drift_stuntZones.onUpdate(dtReal, dtSim, dtRaw)` | Called every frame: debug window, then (when not paused/frozen) for each available zone detects the approach (onNearStuntZoneFirst), calls detectStunt() if the player is drifting in the zone, then the zone's onUpdate and cooldown handling. *(internal)* *(hook)* | 167 |
| `gameplay_drift_stuntZones.onVehicleDestroyed(vehId)` | Hook: relays a vehicle's destruction to the zones (destroyed poles remove themselves). *(internal)* *(hook)* | 325 |
| `gameplay_drift_stuntZones.reset()` | Calls reset() on each zone (cooldowns, counters, poles put back in place). | 209 |
| `gameplay_drift_stuntZones.setStuntZones(zones)` | Replaces all zones with the given list: clears the existing zones (clear), computes the "near" distance, the default score and the draw data, then instantiates each zone via require("gameplay/drift/stuntZones/<type>"). Ids are assigned from 1 to n. | 224 |

### Parameter details

#### `gameplay_drift_stuntZones.clearStuntZone(id)`

INTERNAL: removes a zone by id (calls its clear if it exists, then removes it from the list). Used by destroyed poles.

- `id` (*integer*) : Zone id.

#### `gameplay_drift_stuntZones.getDecalColor(cooldownPerc, filledPerc, t)`

Chooses the color of a segment of a donut's circle: blue (filled portion), green (ready), red/white (during cooldown).

- `cooldownPerc` (*number|nil*) : Elapsed cooldown percentage (100 = ready).
- `filledPerc` (*number|nil*) : Percentage of the turn already completed.
- `t` (*number*) : Position of the segment on the circle, from 0 to 1.
- **returns**: ColorF Segment color.

#### `gameplay_drift_stuntZones.getDrawLines()`

TEST: indicates whether zone drawing is enabled ("Draw lines" imgui checkbox, true by default).

- **returns**: boolean true if drawing.

#### `gameplay_drift_stuntZones.getDriftDebugInfo()`

Returns {default=true, canBeChanged=true} for the drift debug window.

- **returns**: table {default = true, canBeChanged = true}

#### `gameplay_drift_stuntZones.getGreenColor()`

Green color (zone ready).

- **returns**: ColorF Green.

#### `gameplay_drift_stuntZones.getLineThickness(linePos)`

Debug line thickness depending on distance to the camera (250 / distance).

- `linePos` (*vec3*) : Position of the line point.
- **returns**: number Thickness.

#### `gameplay_drift_stuntZones.getRedColor()`

Red color (cooldown).

- **returns**: ColorF Red.

#### `gameplay_drift_stuntZones.getStuntZones()`

Returns the list of instantiated zone objects (each object has data = {id, zoneData, nearDist, drawData}, activeData and the type's methods).

- **returns**: table[] Active zones.

#### `gameplay_drift_stuntZones.getWhiteColor()`

White color (cooldown).

- **returns**: ColorF White.

#### `gameplay_drift_stuntZones.increaseDecalPool(max)`

Grows the global decal pool up to max elements (red arrow, fade 100 to 150). Depends on a global variable decals not defined here.

- `max` (*integer*) : Desired minimum pool size.

#### `gameplay_drift_stuntZones.onAnyStuntZoneAccomplished(data)`

Hook: a zone is accomplished; informs the stallingSystem (processStuntZone) then relays the requested sub-hook with its data.

- `data` (*table*) : {stuntZoneId, subHookName, subHookData}.

#### `gameplay_drift_stuntZones.onDriftStatusChanged(isDrifting)`

Hook: when the drift stops, resets the accumulated angle of donut zones to zero.

- `isDrifting` (*boolean*) : New drift state.

#### `gameplay_drift_stuntZones.onUpdate(dtReal, dtSim, dtRaw)`

Called every frame: debug window, then (when not paused/frozen) for each available zone detects the approach (onNearStuntZoneFirst), calls detectStunt() if the player is drifting in the zone, then the zone's onUpdate and cooldown handling.

- `dtReal` (*number*) : Real-time delta.
- `dtSim` (*number*) : Simulated delta time (cooldowns).
- `dtRaw` (*number*) : Raw time delta (unused).

#### `gameplay_drift_stuntZones.onVehicleDestroyed(vehId)`

Hook: relays a vehicle's destruction to the zones (destroyed poles remove themselves).

- `vehId` (*integer*) : Destroyed vehicle.

#### `gameplay_drift_stuntZones.setStuntZones(zones)`

Replaces all zones with the given list: clears the existing zones (clear), computes the "near" distance, the default score and the draw data, then instantiates each zone via require("gameplay/drift/stuntZones/<type>"). Ids are assigned from 1 to n.

- `zones` (*table[]*) : List of {type, pos, scl, rot, cooldown, score}.

## Fields

| Field | Type | Description |
|---|---|---|
| `dependencies` | string[] | gameplay_drift_general, loaded beforehand. |

## Emitted hooks

Events broadcast to extensions by `extensions.hook`:

- `onNearStuntZoneFirst`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/gameplay/drift/stuntZones.lua`.*
