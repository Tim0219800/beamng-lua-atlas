# `controller_wendoverGauges`

*File: `lua/vehicle/controller/wendoverGauges.lua` · VM: Vehicle · 102 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** controller `wendoverGauges` declared in the jbeam (`controller`), reachable with `controller.getController("name")`

OBSOLETE auxiliary controller (replaced by 'genericGauges') for the digital dashboard screen of the Wendover: HTML texture (1024 x jbeam height, 161 by default) fed with electrics values and a computed average fuel consumption.

## Example

```lua
-- jbeam: controller "wendoverGauges" with materialName, htmlPath and optional height
```

## Notes

- jbeam fields read: materialName, htmlPath (required), height (default 161). Without either one, updateGFX becomes nop. init writes an obsolescence error log.
- Data sent ('updateData'): electrics.{signal_L, signal_R, lights, highbeam, lowfuel, parkingbrake, checkengine, hazard, oil, oiltemp, gear, rpmTacho, fuel, watertemp, engineRunning, wheelspeed, abs, absActive}, averageFuelConsumption, gearboxType (type of the first device of category gearbox, otherwise 'none').
- Instantaneous consumption = (previous fuelVolume - fuelVolume) / (dt * wheelspeed) * 1000 * 100 bounded to 0..100; the average is only accumulated if wheelspeed > 1.4 m/s and is bounded to 0..50. It uses electrics.values.fuelVolume (written elsewhere).
- Refresh: texture at 8 FPS, data updated at most every 0.1 s, only if a player is seated and if obj:getUpdateUIflag() is true.

## Functions

| Function | Description | Line |
|---|---|---|
| `controller_wendoverGauges.init(jbeamData)` | Called at initialization: creates the HTML texture and determines the gearbox type. *(internal)* | 67 |
| `controller_wendoverGauges.reset()` | Called at reset; does nothing (the consumption counters are not reset). *(internal)* | 94 |
| `controller_wendoverGauges.updateGFX(dt)` | Called every frame: sends the dashboard values to the HTML texture about 10 times per second. *(internal)* | 26 |

### Parameter details

#### `controller_wendoverGauges.init(jbeamData)`

Called at initialization: creates the HTML texture and determines the gearbox type.

- `jbeamData` (*table*) : Controller jbeam data.

#### `controller_wendoverGauges.updateGFX(dt)`

Called every frame: sends the dashboard values to the HTML texture about 10 times per second.

- `dt` (*number*) : Time step in seconds.

## Fields

| Field | Type | Description |
|---|---|---|
| `type` | string | 'auxiliary': controller type. |

## Calls into the engine (C++)

- `obj:` `getUpdateUIflag`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/vehicle/controller/wendoverGauges.lua`.*
