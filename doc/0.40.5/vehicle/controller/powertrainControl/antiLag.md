# `controller_powertrainControl_antiLag`

*File: `lua/vehicle/controller/powertrainControl/antiLag.lua` · VM: Vehicle · 231 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** controller `powertrainControl/antiLag` declared in the jbeam (`controller`), reachable with `controller.getController("name")`

Auxiliary anti-lag (ALS) controller for a turbocharged engine. State machine off / idle / armed / manualOverride / timeout: in idle it arms after a few seconds of full throttle at high RPM; when armed, when the vehicle is moving, the throttle is lifted (or the brake pressed) and the engine runs fast enough, it uses a PID to drive the engine's anti-lag coefficient (engine:setAntilagCoef) to keep the turbo at turboTargetRPM. A maximum continuous time prevents overheating. Publishes electrics.values.alsActive (boolean) and alsState (string).

## Example

```lua
local als = controller.getController("antiLag")
als.setAntilagState("manualOverride") -- forced anti-lag (coef = 1)
als.setAntilagState("off")
```

## Notes

- jbeam keys read: controlledEngine ("mainEngine"), turboTargetRPM (90000), minActiveEngineRPM (2000), minActiveWheelSpeed (1 m/s), maxActiveThrottleInput (0.2), minActiveBrakeInput (0.2), timeoutTime (30 s), timeoutResetTime (2 s), autoArmMinRPM (5000), autoArmMinThrottle (0.5), autoArmTime (1 s), autoDisarmMaxRPM (3000), autoDisarmMaxThrottle (0.3), autoDisarmTime (3 s).
- Valid states for setAntilagState: "off", "idle", "armed", "manualOverride", "timeout" (no validation: any value is accepted as is).
- Without an engine or if the engine has no turbocharger (engine.turbocharger), log E and updateGFX becomes nop.
- The timeout accumulates when the anti-lag is active and decreases 3 times faster otherwise.
- reset always sets the state back to idle even if the previous mode was off, and does not reset the arming/disarming timers.
- getState/setState expose a remote mode: "off", "automatic" (idle/armed/timeout) or "manualOverride" (key <controller name>_mode).

## Functions

| Function | Description | Line |
|---|---|---|
| `controller_powertrainControl_antiLag.getState()` | Saveable state: remote mode (off / automatic / manualOverride). | 204 |
| `controller_powertrainControl_antiLag.init(jbeamData)` | Gets the engine and its turbocharger, reads the jbeam thresholds and creates the turbo RPM PID. *(internal)* | 134 |
| `controller_powertrainControl_antiLag.reset(jbeamData)` | Resets timeout, PID and state (idle) to zero and the alsActive/alsState electrics. *(internal)* | 126 |
| `controller_powertrainControl_antiLag.setAntilagState(newState)` | Forces the internal state of the state machine (off, idle, armed, manualOverride, timeout). | 47 |
| `controller_powertrainControl_antiLag.setState(data)` | Restores the mode from the table (unknown modes ignored). | 209 |
| `controller_powertrainControl_antiLag.updateGFX(dt)` | Every frame: advances the state machine and applies the anti-lag coefficient to the engine. *(internal)* | 51 |

### Parameter details

#### `controller_powertrainControl_antiLag.getState()`

Saveable state: remote mode (off / automatic / manualOverride).

- **returns**: table State table.

#### `controller_powertrainControl_antiLag.init(jbeamData)`

Gets the engine and its turbocharger, reads the jbeam thresholds and creates the turbo RPM PID.

- `jbeamData` (*table*) : Controller jbeam data.

#### `controller_powertrainControl_antiLag.reset(jbeamData)`

Resets timeout, PID and state (idle) to zero and the alsActive/alsState electrics.

- `jbeamData` (*table*) : Jbeam data.

#### `controller_powertrainControl_antiLag.setAntilagState(newState)`

Forces the internal state of the state machine (off, idle, armed, manualOverride, timeout).

- `newState` (*string*) : State name.

#### `controller_powertrainControl_antiLag.setState(data)`

Restores the mode from the table (unknown modes ignored).

- `data` (*table|nil*) : Table produced by getState.

#### `controller_powertrainControl_antiLag.updateGFX(dt)`

Every frame: advances the state machine and applies the anti-lag coefficient to the engine.

- `dt` (*number*) : Time step in seconds.

## Fields

| Field | Type | Description |
|---|---|---|
| `type` | string | "auxiliary". |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/vehicle/controller/powertrainControl/antiLag.lua`.*
