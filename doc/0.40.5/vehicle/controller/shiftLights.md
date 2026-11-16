# `controller_shiftLights`

*File: `lua/vehicle/controller/shiftLights.lua` · VM: Vehicle · 110 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** controller `shiftLights` declared in the jbeam (`controller`), reachable with `controller.getController("name")`

Auxiliary shift light LED controller. Splits the RPM range [minRPM, maxRPM] into steps (one per electric listed in outputElectrics) and sets each electric to 1 when the RPM reaches its step; above maxRPM (or engine stalled if hasStallWarning), the "flashing" LEDs blink and electrics.values.shouldShift becomes true.

## Example

```lua
-- jbeam: "outputElectrics":["shiftLight1","shiftLight2","shiftLight3"], "maxRPM":6800, "rpmRange":1500
```

## Notes

- jbeam keys read: rpmRange (3000), engineName and maxEngineRPMOffset (maxRPM = engine.maxRPM - offset), hasStallWarning (false), maxRPM (7000 by default without an engine), minRPM (maxRPM - rpmRange), inputElectricsName ("rpm"), keepLEDsActive (true: the lower LEDs stay lit), flashDuration (0.1 s), outputElectrics (ordered list of the step electrics), flashingOutputElectrics and flashingAlternateOutputElectrics (electrics that blink in phase / in opposition).
- Each step writes electrics.values[name] = 0 or 1 (numbers, not booleans); shouldShift is a boolean.
- The stall warning exists only if engineName AND maxEngineRPMOffset are defined and hasStallWarning is true.
- If outputElectrics is empty, stepCount = 0 and the rpmStep computation divides by zero (inf), with no effect afterwards since no step is created.

## Functions

| Function | Description | Line |
|---|---|---|
| `controller_shiftLights.init(jbeamData)` | Reads the jbeam keys and builds the RPM steps and the flashing LED lists. *(internal)* | 59 |
| `controller_shiftLights.updateGFX(dt)` | Every frame: updates the step electrics, shouldShift and the blinking. *(internal)* | 25 |

### Parameter details

#### `controller_shiftLights.init(jbeamData)`

Reads the jbeam keys and builds the RPM steps and the flashing LED lists.

- `jbeamData` (*table*) : Controller jbeam data.

#### `controller_shiftLights.updateGFX(dt)`

Every frame: updates the step electrics, shouldShift and the blinking.

- `dt` (*number*) : Time step in seconds.

## Fields

| Field | Type | Description |
|---|---|---|
| `type` | string | "auxiliary". |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/vehicle/controller/shiftLights.lua`.*
