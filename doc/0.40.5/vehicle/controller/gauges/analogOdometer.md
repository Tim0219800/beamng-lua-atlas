# `controller_gauges_analogOdometer`

*File: `lua/vehicle/controller/gauges/analogOdometer.lua` · VM: Vehicle · 107 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** controller `gauges/analogOdometer` declared in the jbeam (`controller`), reachable with `controller.getController("name")`

Auxiliary controller for an analog odometer displayed by an HTML texture (htmlTexture). It sends the total (electrics.values.odometer) and the trip (extensions.odometer.getRelativeRecording()) to the page only when one of them has changed by more than one update step (1000 m, or 1609.34 m in imperial, divided by 10 with a decimal separator).

## Notes

- jbeam keys: configuration (table, merged with the "configuration_xxx" keys) with materialName, htmlPath, displayWidth, displayHeight (required to display), unit ("imperial" = step of 1609.34, otherwise 1000), odometerHasDecimalSeparator, tripHasDecimalSeparator (step divided by 10). The whole configuration table is sent to the page by callJS("setup").
- The texture is created in "manual" mode at 1 FPS. Sending only happens if a player is seated and the UI needs refreshing.
- M.init = nop (global engine function). setParameters does nothing.

## Functions

| Function | Description | Line |
|---|---|---|
| `controller_gauges_analogOdometer.initSecondStage(jbeamData)` | Reads the configuration, computes the update step, creates the HTML texture and sends the configuration to the page. *(internal)* | 50 |
| `controller_gauges_analogOdometer.reset()` | Forces a new data send at the next updateGFX. *(internal)* | 46 |
| `controller_gauges_analogOdometer.setParameters(parameters)` | Does nothing. | 95 |
| `controller_gauges_analogOdometer.updateGFX(dt)` | Sends trip and odometer to the page when they have changed by at least one step. *(internal)* | 25 |

### Parameter details

#### `controller_gauges_analogOdometer.initSecondStage(jbeamData)`

Reads the configuration, computes the update step, creates the HTML texture and sends the configuration to the page.

- `jbeamData` (*table*) : Controller jbeam data.

#### `controller_gauges_analogOdometer.setParameters(parameters)`

Does nothing.

- `parameters` (*table*) : Ignored.

#### `controller_gauges_analogOdometer.updateGFX(dt)`

Sends trip and odometer to the page when they have changed by at least one step.

- `dt` (*number*) : Time step (s).

## Fields

| Field | Type | Description |
|---|---|---|
| `init` | function | nop. |
| `type` | string | "auxiliary". |

## Calls into the engine (C++)

- `obj:` `getUpdateUIflag`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/vehicle/controller/gauges/analogOdometer.lua`.*
