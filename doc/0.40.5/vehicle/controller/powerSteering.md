# `controller_powerSteering`

*File: `lua/vehicle/controller/powerSteering.lua` · VM: Vehicle · 56 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** controller `powerSteering` declared in the jbeam (`controller`), reachable with `controller.getController("name")`

Auxiliary power steering controller. Sets hydros.wheelPowerSteeringCoef (assist coefficient applied by the steering engine): fixed value 1 + constantOffset, or, if the parameters allow it, a value that varies linearly with wheel speed between speedSlow and speedFast.

## Notes

- jbeam keys read in init: strengthFast (1), strengthSlow (1), speedSlow (0 m/s), speedFast (0 m/s), constantOffset (-0.2).
- The variation with speed is only enabled if speedFast > speedSlow AND strengthFast > strengthSlow; otherwise M.updateGFX stays nil and only the fixed coefficient 1 + constantOffset is applied (an assist that would decrease with speed is therefore not handled).
- Formula: coef = max(max((strengthFast-strengthSlow) * (min(speed, speedFast) - speedSlow) / (speedFast-speedSlow) + strengthSlow, 0) + constantOffset, 0), speed = electrics.values.wheelspeed (m/s).
- M.updateGFX is nil at declaration and reassigned in init.

## Functions

| Function | Description | Line |
|---|---|---|
| `controller_powerSteering.init(jbeamData)` | Reads the jbeam keys, sets hydros.wheelPowerSteeringCoef = 1 + constantOffset and enables updateGFX if the assist varies with speed. *(internal)* | 34 |
| `controller_powerSteering.reset()` | Resets hydros.wheelPowerSteeringCoef to 1 + constantOffset. *(internal)* | 30 |

### Parameter details

#### `controller_powerSteering.init(jbeamData)`

Reads the jbeam keys, sets hydros.wheelPowerSteeringCoef = 1 + constantOffset and enables updateGFX if the assist varies with speed.

- `jbeamData` (*table*) : Controller jbeam data.

## Fields

| Field | Type | Description |
|---|---|---|
| `type` | string | "auxiliary". |
| `updateGFX` | function|nil | Assist update function according to speed; nil if the controller does not vary. |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/vehicle/controller/powerSteering.lua`.*
