# `controller_powertrainControl_activeCenterDiff`

*File: `lua/vehicle/controller/powertrainControl/activeCenterDiff.lua` · VM: Vehicle · 146 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** controller `powertrainControl/activeCenterDiff` declared in the jbeam (`controller`), reachable with `controller.getController("name")`

Auxiliary controlled center differential controller. Every physics step, it combines several jbeam maps (throttle, slip between axles, brake, left-foot brake, steering, handbrake) to compute a desired locking rate 0..1 and writes it into centerDiff.activeLockCoef. Under acceleration the target mixes understeer/oversteer (biasOversteerVsTraction) and traction; under deceleration it depends on the brake and steering.

## Notes

- jbeam keys read in init: biasOversteerVsTraction (0.5), throttleLockMap, allowedSlipMap, slipLockMap, brakeLockMap, leftFootBrakeLockMap, steeringLockMap, handbrakeLockMap (maps for interpolatedMap: input x = pedal/steering/slip, y = speed in m/s), centerDiffName, axleDiff1Name, axleDiff2Name (powertrain device names).
- Reads electrics.values: wheelspeed, throttle_input, brake_input, parkingbrake, steering_input, absActive. Slip = |AV_front - AV_rear| / max(|AV|, 0.1) with the inputAV of the two axle differentials.
- The locking is set to 0 when the ABS is active (factor 1 - absActive) and multiplied by the handbrake map.
- Deceleration mode if throttle_input - brake_input < -0.01, otherwise acceleration.
- If one of the three differentials is not found: print "Diff(s) not found" and updateFixedStep/updateGFX are set to nil.
- The source comments mention initLastStage/resetLastStage functions not exported in M.

## Functions

| Function | Description | Line |
|---|---|---|
| `controller_powertrainControl_activeCenterDiff.init(jbeamData)` | Loads the seven jbeam maps and gets the center differential and the two axle differentials. *(internal)* | 86 |
| `controller_powertrainControl_activeCenterDiff.reset(jbeamData)` | Does nothing. *(internal)* | 80 |
| `controller_powertrainControl_activeCenterDiff.updateFixedStep(dt)` | Physics step: computes the desired locking and sets it on centerDiff.activeLockCoef. *(internal)* | 28 |
| `controller_powertrainControl_activeCenterDiff.updateGFX(dt)` | Does nothing. *(internal)* | 77 |

### Parameter details

#### `controller_powertrainControl_activeCenterDiff.init(jbeamData)`

Loads the seven jbeam maps and gets the center differential and the two axle differentials.

- `jbeamData` (*table*) : Controller jbeam data.

#### `controller_powertrainControl_activeCenterDiff.reset(jbeamData)`

Does nothing.

- `jbeamData` (*table*) : Jbeam data.

#### `controller_powertrainControl_activeCenterDiff.updateFixedStep(dt)`

Physics step: computes the desired locking and sets it on centerDiff.activeLockCoef.

- `dt` (*number*) : Physics step in seconds.

#### `controller_powertrainControl_activeCenterDiff.updateGFX(dt)`

Does nothing.

- `dt` (*number*) : Time step in seconds.

## Fields

| Field | Type | Description |
|---|---|---|
| `type` | string | "auxiliary". |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/vehicle/controller/powertrainControl/activeCenterDiff.lua`.*
