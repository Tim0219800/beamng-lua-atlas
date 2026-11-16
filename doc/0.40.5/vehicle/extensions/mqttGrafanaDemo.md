# `mqttGrafanaDemo`

*File: `lua/vehicle/extensions/mqttGrafanaDemo.lua` · VM: Vehicle · 170 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `mqttGrafanaDemo`: `extensions.load (vehicle VM)("mqttGrafanaDemo")`, then the global `mqttGrafanaDemo`

Demo: publishes the vehicle telemetry to an MQTT broker (127.0.0.1) on the topic 'car_data', as JSON, every frame, to display it for example in Grafana. Data: geometry and state of each wheel, dashboard electrics values, acceleration and steering wheel force sensors, position and attitude.

## Example

```lua
extensions.load('mqttGrafanaDemo')   -- (file comment)
```

## Notes

- The broker is hard-coded (mqttBrokerURI = '127.0.0.1'). The connection is started by client:start_connecting(); on failure the client is set to nil and nothing is published.
- Published keys: wheel_<name> {caster, sai, camber, toe (degrees), pressure (psi), angularVelocity, brakeSurfaceTemperature, brakeCoreTemperature, isBrakeMolten, radius, wheelDir, propulsionTorque, lastSlip, downForce, brakingTorque, brakeTorque}, temp (°C), electrics values (signal_L/R, lights, highbeam, lowpressure, lowfuel, parkingbrake, checkengine, hazard, oil, cruiseControlActive, gear, rpmTacho, fuel, watertemp, engineRunning, wheelspeed, esc, escActive, tcs, tcsActive, clutch, brake, throttle), engineInfo, gx/gy/gz/gx2/gy2/gz2, forceAtWheelNorm, forceAtDriverNorm, curForceLimitNorm, position, roll, pitch, yaw, gravity.
- Anomaly: data.pwr receives `powerDisplay`, a variable not defined in this file (nil); the key therefore does not exist in the JSON.
- Anomaly: M.reset = reset assigns an undefined global variable `reset` (nil): no effective reset hook.
- Message reception (subscribe/on_message) is commented-out code (TODO).
- Publishing every frame, with a full jsonEncode, is costly; this is a demo.

## Functions

| Function | Description | Line |
|---|---|---|
| `mqttGrafanaDemo.onExtensionLoaded()` | Called on load: creates the MQTT client and starts the connection. *(internal)* *(hook)* | 142 |
| `mqttGrafanaDemo.onExtensionUnloaded()` | Called on unload: disconnects the MQTT client. *(internal)* *(hook)* | 155 |
| `mqttGrafanaDemo.updateGFX(dt)` | Called every frame: collects the data and publishes it on the topic 'car_data' if the client is connected. *(internal)* | 116 |

### Parameter details

#### `mqttGrafanaDemo.updateGFX(dt)`

Called every frame: collects the data and publishes it on the topic 'car_data' if the client is connected.

- `dt` (*number*) : Time step in seconds (unused).

## Fields

| Field | Type | Description |
|---|---|---|
| `reset` | any |  ⚠ reference `reset` not defined in the file (probably nil) |

## Calls into the engine (C++)

- `obj:` `getDirectionVector`, `getDirectionVectorUp`, `getEnvTemperature`, `getGravity`, `getGroupPressure`, `getPositionXYZ`, `getRollPitchYaw`, `nodeVecCos`, `nodeVecPlanarCos`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/vehicle/extensions/mqttGrafanaDemo.lua`.*
