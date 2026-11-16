# `controller_propAnimation_googlyEyes`

*File: `lua/vehicle/controller/propAnimation/googlyEyes.lua` · VM: Vehicle · 96 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** controller `propAnimation/googlyEyes` declared in the jbeam (`controller`), reachable with `controller.getController("name")`

Humorous vehicle "eyes" auxiliary controller: enlarges or shrinks tagged beams (eye beams, limiters, attachments) according to the vertical acceleration (sensors.gz) to make the eyes bulge; they are at maximum size at ignition 3 (starter).

## Notes

- jbeam keys read: eyeBeamTag ("eyeBeam"), eyeLimiterBeamTag ("eyeLimiterBeam"), eyeAttachmentBeamTag ("eyeAttachmentBeam"); maxSizeCoef (1), minSizeCoef (1), minSizeBoundCoef (1), maxSizeBoundCoef (1), attachmentMinSizeCoef (1), attachmentMaxSizeCoef (1), sizeSmoothingShrink (5), sizeSmoothingGrow (5), gravityMaxSizeCoef (1).
- The beams are found via beamstate.tagBeamMap[tag]; their length is modified by obj:setBeamLength and the long bound of the limiter beams by obj:setBoundedBeamLongBound.
- Pitfall: sizeSmoothingShrink is passed as the first argument ("in" rate) of the smoother and sizeSmoothingGrow as the second ("out"): their roles depend on the newTemporalSmoothingNonLinear convention.
- All coefficients are 1 by default: without configuration the controller changes nothing.

## Functions

| Function | Description | Line |
|---|---|---|
| `controller_propAnimation_googlyEyes.init(jbeamData)` | Finds the beams by tag, stores their rest lengths and reads the jbeam coefficients. *(internal)* | 52 |
| `controller_propAnimation_googlyEyes.reset(jbeamData)` | Resets the size smoother to 1. *(internal)* | 48 |
| `controller_propAnimation_googlyEyes.updateGFX(dt)` | Every frame: computes the size coefficient according to sensors.gz and adjusts the beam lengths and bounds. *(internal)* | 23 |

### Parameter details

#### `controller_propAnimation_googlyEyes.init(jbeamData)`

Finds the beams by tag, stores their rest lengths and reads the jbeam coefficients.

- `jbeamData` (*table*) : Controller jbeam data.

#### `controller_propAnimation_googlyEyes.reset(jbeamData)`

Resets the size smoother to 1.

- `jbeamData` (*table*) : Jbeam data.

#### `controller_propAnimation_googlyEyes.updateGFX(dt)`

Every frame: computes the size coefficient according to sensors.gz and adjusts the beam lengths and bounds.

- `dt` (*number*) : Time step in seconds.

## Fields

| Field | Type | Description |
|---|---|---|
| `type` | string | "auxiliary". |

## Calls into the engine (C++)

- `obj:` `getBeamRestLength`, `setBeamLength`, `setBoundedBeamLongBound`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/vehicle/controller/propAnimation/googlyEyes.lua`.*
