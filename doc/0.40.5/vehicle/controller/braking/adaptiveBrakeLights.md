# `controller_braking_adaptiveBrakeLights`

*File: `lua/vehicle/controller/braking/adaptiveBrakeLights.lua` · VM: Vehicle · 177 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** controller `braking/adaptiveBrakeLights` declared in the jbeam (`controller`), reachable with `controller.getController("name")`

Auxiliary controller that computes the brake light value (`electrics.values.brakelights` by default) beyond the simple brake pedal: blinking during ABS, turning on during an ESC intervention above 14 m/s, turning on when deceleration ("one pedal" regeneration) exceeds a threshold, adding regenerative braking, and automatically turning on the hazard lights after emergency braking until stop. Call order: `defaultOrder = 900` (late).

## Notes

- Jbeam keys read by init: `electricsName` ("brakelights"), `indicateESCUsageWithBrakelights` (true), `activateHazardsAfterEmergencyBraking` (true), `hazardArmSpeed` (10 m/s), `hazardActivateSpeed` (3 m/s), `hazardDeactivateThrottle` (0.3), `hazardDeactivateSpeed` (3 m/s), `blinkOnTime` (0.1 s), `blinkOffTime` (0.1 s), `activateBrakeLightsFromDecel` (true), `decelThreshold` (1.3 m/s², UK legal threshold according to the comment).
- Electrics read: brake, absActive, escActive, isYCBrakeActive (takes priority over escActive if it exists), wheelspeed, throttle, regenFromOnePedal, regenFromBrake. Electrics written: the value of `electricsName`, rounded up (0 or 1).
- The jbeam field has no safe access: updateGFX uses `electrics.values.wheelspeed` and `electrics.values.brake` without a default value in some computations; they must exist.
- The hazard lights are activated by `electrics.set_warn_signal(true)`, deactivated when the throttle exceeds the threshold at sufficient speed.

## Functions

| Function | Description | Line |
|---|---|---|
| `controller_braking_adaptiveBrakeLights.init(jbeamData)` | Reads the jbeam parameters and creates the smoothers (ABS, ESC, acceleration). *(internal)* | 139 |
| `controller_braking_adaptiveBrakeLights.reset()` | Turns off the hazard lights triggered by this controller and resets the timers, smoothers and latches. *(internal)* | 122 |
| `controller_braking_adaptiveBrakeLights.setParameters(parameters)` | Enables or disables the adaptive behavior; when disabled, the lights simply follow the brake. | 165 |
| `controller_braking_adaptiveBrakeLights.updateGFX(dt)` | Every frame: computes the brake light value (brake + ESC + deceleration + regeneration, clamped to 1), applies the ABS blinking and handles the emergency braking hazard lights. *(internal)* | 48 |

### Parameter details

#### `controller_braking_adaptiveBrakeLights.init(jbeamData)`

Reads the jbeam parameters and creates the smoothers (ABS, ESC, acceleration).

- `jbeamData` (*table*) : Controller jbeam data.

#### `controller_braking_adaptiveBrakeLights.setParameters(parameters)`

Enables or disables the adaptive behavior; when disabled, the lights simply follow the brake.

- `parameters` (*table*) : Optional field: isEnabled (boolean).

#### `controller_braking_adaptiveBrakeLights.updateGFX(dt)`

Every frame: computes the brake light value (brake + ESC + deceleration + regeneration, clamped to 1), applies the ABS blinking and handles the emergency braking hazard lights.

- `dt` (*number*) : Time step in seconds.

## Fields

| Field | Type | Description |
|---|---|---|
| `defaultOrder` | number | 900: default call rank, late in the sorted list. |
| `type` | string | "auxiliary". |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/vehicle/controller/braking/adaptiveBrakeLights.lua`.*
