# `controller_sbrGauges`

*File: `lua/vehicle/controller/sbrGauges.lua` · VM: Vehicle · 159 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** controller `sbrGauges` declared in the jbeam (`controller`), reachable with `controller.getController("name")`

OBSOLETE auxiliary controller (log E at load: to be replaced by genericGauges) that feeds an HTML dashboard screen (htmlTexture) for an electric vehicle: speed, gear, sensors, navigation map, average/instantaneous consumption (W, kWh/100 km) and estimated range based on the energy of the electric motors' batteries.

## Notes

- jbeam keys read: materialName (HTML texture material, required), htmlPath (path of the HTML page, required). Without either one, logs E and updateGFX becomes nop.
- Data is sent only if a player is seated and if obj:getUpdateUIflag() is true (limited rate). JS calls: updateData, updateMap, updateConsum, appendGraphConsum (every 5 s), setUnits, updateMode.
- The unit is read from the uiUnitLength setting ("metric" by default).
- The electric motor must expose registeredEnergyStorages for the batteries to be counted.
- reset calls htmlTexture.call even if gaugesScreenName is nil (missing material).

## Functions

| Function | Description | Line |
|---|---|---|
| `controller_sbrGauges.init(jbeamData)` | Creates the HTML texture, finds the electric motors' batteries and initializes the consumption smoothers. *(internal)* | 95 |
| `controller_sbrGauges.reset()` | Returns the length unit to the HTML page. *(internal)* | 137 |
| `controller_sbrGauges.setParameters(parameters)` | Applies external parameters: if modeName and modeColor are present, calls setUIMode. | 145 |
| `controller_sbrGauges.setUIMode(modeName, modeColor)` | Displays the name and color of the driving mode on the HTML screen (updateMode). | 141 |
| `controller_sbrGauges.updateGFX(dt)` | Every frame: computes power and consumption and sends the data to the HTML page. *(internal)* | 37 |

### Parameter details

#### `controller_sbrGauges.init(jbeamData)`

Creates the HTML texture, finds the electric motors' batteries and initializes the consumption smoothers.

- `jbeamData` (*table*) : Controller jbeam data.

#### `controller_sbrGauges.setParameters(parameters)`

Applies external parameters: if modeName and modeColor are present, calls setUIMode.

- `parameters` (*table*) : Table {modeName, modeColor}.

#### `controller_sbrGauges.setUIMode(modeName, modeColor)`

Displays the name and color of the driving mode on the HTML screen (updateMode).

- `modeName` (*string*) : Mode text.
- `modeColor` (*string*) : Color (inferred from code: CSS value passed as is).

#### `controller_sbrGauges.updateGFX(dt)`

Every frame: computes power and consumption and sends the data to the HTML page.

- `dt` (*number*) : Time step in seconds.

## Fields

| Field | Type | Description |
|---|---|---|
| `type` | string | "auxiliary". |

## Calls into the engine (C++)

- `obj:` `getDirectionVector`, `getEnvTemperature`, `getID`, `getPositionXYZ`, `getUpdateUIflag`, `queueGameEngineLua`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/vehicle/controller/sbrGauges.lua`.*
