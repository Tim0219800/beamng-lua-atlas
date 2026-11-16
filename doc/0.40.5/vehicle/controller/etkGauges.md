# `controller_etkGauges`

*File: `lua/vehicle/controller/etkGauges.lua` · VM: Vehicle · 106 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** controller `etkGauges` declared in the jbeam (`controller`), reachable with `controller.getController("name")`

Old HTML instruments controller (type "auxiliary"), deprecated: init logs an error asking to switch to genericGauges. It creates an HTML texture (htmlTexture.create) and sends 30 times per second: engaged gear, average consumption, consumption display, outside temperature, time (HH:MM), wheel speed. Not to be used for new vehicles.

## Notes

- jbeam keys: materialName (required), htmlPath (required), unitType ("metric" by default), textureWidth (512), textureHeight (256). Without materialName or htmlPath, updateGFX is replaced by nop.
- The HTML page must define setUnits and updateData; data is only sent after uiReady is called and only if a player is seated and the UI needs updating.
- Consumption in l/100 km inferred from the variation of electrics.values.fuelVolume; averageFuelConsumption is bounded to 30, fuelDisplay to -1..3. Temperature in °C (obj:getEnvTemperature() - 273.15), speed in m/s.

## Functions

| Function | Description | Line |
|---|---|---|
| `controller_etkGauges.init(jbeamData)` | Logs the deprecation warning, resets the smoothers and creates the HTML texture. *(internal)* | 68 |
| `controller_etkGauges.uiReady()` | To be called when the HTML page is loaded: sends setUnits with unitType and allows updates. | 96 |
| `controller_etkGauges.updateGFX(dt)` | Periodically sends the data to the HTML dashboard via htmlTexture.call("updateData"). *(internal)* | 28 |

### Parameter details

#### `controller_etkGauges.init(jbeamData)`

Logs the deprecation warning, resets the smoothers and creates the HTML texture.

- `jbeamData` (*table*) : Controller jbeam data.

#### `controller_etkGauges.updateGFX(dt)`

Periodically sends the data to the HTML dashboard via htmlTexture.call("updateData").

- `dt` (*number*) : Time step (s).

## Fields

| Field | Type | Description |
|---|---|---|
| `type` | string | "auxiliary". |

## Calls into the engine (C++)

- `obj:` `getEnvTemperature`, `getUpdateUIflag`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/vehicle/controller/etkGauges.lua`.*
