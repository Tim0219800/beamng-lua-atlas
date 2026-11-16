# `controller_mechanics_beamSegments`

*File: `lua/vehicle/controller/mechanics/beamSegments.lua` · VM: Vehicle · 89 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** controller `mechanics/beamSegments` declared in the jbeam (`controller`), reachable with `controller.getController("name")`

Mechanics controller (type "auxiliary") that distributes the length of a "sensor" beam over several "segment" beams: every frame, each segment receives the sensor length divided by the number of segments, multiplied by a factor. Used to build telescopic elements or chains of segments whose total length follows a sensor.

## Notes

- jbeam keys (default): segmentBeamTag (required, tag of the segments), sensorBeamTag (required, the first beam found serves as the sensor), sensorBeamLengthMultiplier (1, set the number of parallel spans).
- If there is no segment or no sensor, an error is logged and the controller stays inactive.
- Inconsistency: beamBroken sets isActiveCoef to 0 but updateGFX never checks it, so nothing stops when a beam breaks.

## Functions

| Function | Description | Line |
|---|---|---|
| `controller_mechanics_beamSegments.beamBroken(id, energy)` | Hook: called when a beam breaks; marks the controller inactive if it is a segment or the sensor (see notes). *(internal)* | 29 |
| `controller_mechanics_beamSegments.init(jbeamData)` | Finds the segment and sensor beams by tag. *(internal)* | 40 |
| `controller_mechanics_beamSegments.reset(jbeamData)` | Reactivates the controller. *(internal)* | 36 |
| `controller_mechanics_beamSegments.updateGFX(dt)` | Sets the length of each segment from that of the sensor. (dynamically assigned) *(internal)* | dyn |

### Parameter details

#### `controller_mechanics_beamSegments.beamBroken(id, energy)`

Hook: called when a beam breaks; marks the controller inactive if it is a segment or the sensor (see notes).

- `id` (*integer*) : Identifier (cid) of the broken beam.
- `energy` (*number*) : Break energy.

#### `controller_mechanics_beamSegments.init(jbeamData)`

Finds the segment and sensor beams by tag.

- `jbeamData` (*table*) : Controller jbeam data.

#### `controller_mechanics_beamSegments.reset(jbeamData)`

Reactivates the controller.

- `jbeamData` (*table*) : Controller jbeam data.

#### `controller_mechanics_beamSegments.updateGFX(dt)`

Sets the length of each segment from that of the sensor. (dynamically assigned)

- `dt` (*number*) : Time step (s).

## Fields

| Field | Type | Description |
|---|---|---|
| `type` | string | "auxiliary". |

## Calls into the engine (C++)

- `obj:` `getBeamLength`, `setBeamLength`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/vehicle/controller/mechanics/beamSegments.lua`.*
