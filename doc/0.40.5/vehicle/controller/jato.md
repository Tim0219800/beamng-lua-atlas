# `controller_jato`

*File: `lua/vehicle/controller/jato.lua` · VM: Vehicle · 181 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** controller `jato` declared in the jbeam (`controller`), reachable with `controller.getController("name")`

Auxiliary controller for JATO thrusters (booster rockets, type "auxiliary", defaultOrder 1100). When electrics.values.jatoInput > 0, or when the throttle is fully pressed in gamepad/direct mode and moving forward, it consumes fuel, emits particles at the thruster nodes and plays a loop sound. Writes electrics.values.jato (0..1) and jatofuel (remaining fuel, ratio 0..1). A "JATO" button is added to the powertrain simplified control panel.

## Notes

- jbeam keys (default): fuel (20, units of thrust time at full consumption), thrusterNodes_nodes (flat list of node pairs: emission node, direction node; the number of elements must be even otherwise an error is logged), thrusterLoopName ("event:>Vehicle>Thrusters").
- The thrust itself (force) is not applied by this file: it only produces smoke, sound and electrics values (jato, jatofuel); the force must come from other jbeam elements that read electrics.values.jato.
- Hidden function: the Konami code "uuddlrlrba" entered, registered by extensions.inputAnalyzer.registerInputString, toggles fuelCoef between 1 and 0 (infinite fuel when 0) and displays "When in doubt, JATO".
- The interface button sets electrics.values.jatoInput to 1 - jatoInput. The field M.fuelCoef (1 by default) multiplies the consumption.

## Functions

| Function | Description | Line |
|---|---|---|
| `controller_jato.getState()` | Returns fuel and fuelCoef for saving. | 148 |
| `controller_jato.init(jbeamData)` | Reads fuel and the thruster nodes, initializes electrics.values.jatoInput/jato and registers the secret code. *(internal)* | 114 |
| `controller_jato.inputStringCallback(string)` | Called by inputAnalyzer when the secret code is entered: toggles fuelCoef between 1 and 0. *(internal)* | 34 |
| `controller_jato.reset()` | Resets the fuel to the initial level, stops the sounds and sets jatoInput/jato back to 0. *(internal)* | 100 |
| `controller_jato.setState(data)` | Restores fuel (bounded 0..initial fuel) and fuelCoef (0..1). | 154 |
| `controller_jato.updateGFX(dt)` | Consumes fuel, emits particles and sounds, writes electrics.values.jato and jatofuel. *(internal)* | 45 |
| `controller_jato.updateSimpleControlButtons()` | (Re)creates the "JATO" button of the simplified panel with the remaining fuel ratio. | 41 |

### Parameter details

#### `controller_jato.getState()`

Returns fuel and fuelCoef for saving.

- **returns**: table State table (reused).

#### `controller_jato.init(jbeamData)`

Reads fuel and the thruster nodes, initializes electrics.values.jatoInput/jato and registers the secret code.

- `jbeamData` (*table*) : Controller jbeam data.

#### `controller_jato.inputStringCallback(string)`

Called by inputAnalyzer when the secret code is entered: toggles fuelCoef between 1 and 0.

- `string` (*string*) : Entered string.

#### `controller_jato.setState(data)`

Restores fuel (bounded 0..initial fuel) and fuelCoef (0..1).

- `data` (*table|nil*) : State table.

#### `controller_jato.updateGFX(dt)`

Consumes fuel, emits particles and sounds, writes electrics.values.jato and jatofuel.

- `dt` (*number*) : Time step (s).

## Fields

| Field | Type | Description |
|---|---|---|
| `defaultOrder` | number | 1100. |
| `fuelCoef` | number | Fuel consumption coefficient (1 normal, 0 = infinite). |
| `type` | string | "auxiliary". |

## Calls into the engine (C++)

- `obj:` `addParticleByNodes`, `createSFXSource2`, `playSFX`, `setVolume`, `stopSFX`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/vehicle/controller/jato.lua`.*
