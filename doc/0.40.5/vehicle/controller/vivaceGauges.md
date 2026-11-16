# `controller_vivaceGauges`

*File: `lua/vehicle/controller/vivaceGauges.lua` · VM: Vehicle · 112 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** controller `vivaceGauges` declared in the jbeam (`controller`), reachable with `controller.getController("name")`

OBSOLETE auxiliary controller (replaced by the 'genericGauges' controller) that feeds the digital dashboard screen of the Vivace: it creates an HTML texture (1024x256) and periodically sends it electrics values (turn signals, indicators, RPM, speed, ESC/TCS, average power of the electric motors). Loaded via the jbeam; do not use for new vehicles.

## Example

```lua
-- jbeam: controller "vivaceGauges" with materialName and htmlPath; setParameters({modeName="ECO", modeColor="#00ff00"}) changes the displayed mode
```

## Notes

- jbeam fields read: materialName (screen material name, required), htmlPath (HTML page, required); the whole jbeamData is merged with {unit = uiUnitLength setting or 'metric'} then sent to the page by the JS call 'setup'.
- init always writes a log error saying the controller is obsolete. Without materialName or htmlPath, M.updateGFX is replaced by nop.
- Data sent (JS call 'updateData'): temp (ambient temperature in °C), electrics.{signal_L, signal_R, lights, highbeam, fog (always 0), lowpressure, lowfuel, parkingbrake, checkengine, hazard, oil, cruiseControlActive, gear, rpmTacho, fuel, watertemp, engineRunning, wheelspeed, esc, escActive, tcs, tcsActive, pwr}. pwr = average of (throttle - regenThrottle) of the electricMotor devices, forced to 0 if wheelspeed <= 0.5 m/s.
- Updates only if a player is seated and if obj:getUpdateUIflag() is true; the texture refresh rate is 15 FPS.
- Anomaly: updateTimer is incremented and reset to 0 but is never tested to limit the rate.

## Functions

| Function | Description | Line |
|---|---|---|
| `controller_vivaceGauges.init(jbeamData)` | Called at controller initialization: creates the HTML texture, gets the powertrain's electric motors and sends the configuration to the page ('setup'). *(internal)* | 63 |
| `controller_vivaceGauges.reset()` | Called at vehicle reset; does nothing. *(internal)* | 91 |
| `controller_vivaceGauges.setParameters(parameters)` | Changes the displayed mode (JS call 'updateMode' with {txt, col}) if modeName and modeColor are present. | 98 |
| `controller_vivaceGauges.updateGFX(dt)` | Called every frame: sends the dashboard values to the HTML texture when the UI needs updating. Is nop if the configuration is invalid. *(internal)* | 20 |

### Parameter details

#### `controller_vivaceGauges.init(jbeamData)`

Called at controller initialization: creates the HTML texture, gets the powertrain's electric motors and sends the configuration to the page ('setup').

- `jbeamData` (*table*) : Controller jbeam data (materialName, htmlPath, ...).

#### `controller_vivaceGauges.setParameters(parameters)`

Changes the displayed mode (JS call 'updateMode' with {txt, col}) if modeName and modeColor are present.

- `parameters` (*table*) : Table with modeName (text) and modeColor (color, format used by the HTML page).

#### `controller_vivaceGauges.updateGFX(dt)`

Called every frame: sends the dashboard values to the HTML texture when the UI needs updating. Is nop if the configuration is invalid.

- `dt` (*number*) : Time step in seconds.

## Fields

| Field | Type | Description |
|---|---|---|
| `type` | string | 'auxiliary': controller type in the controller system. |

## Calls into the engine (C++)

- `obj:` `getEnvTemperature`, `getUpdateUIflag`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/vehicle/controller/vivaceGauges.lua`.*
