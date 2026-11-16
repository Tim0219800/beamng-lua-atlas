# `controller_beaconSpin`

*File: `lua/vehicle/controller/beaconSpin.lua` · VM: Vehicle · 27 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** controller `beaconSpin` declared in the jbeam (`controller`), reachable with `controller.getController("name")`

Minimal auxiliary controller that animates the rotating elements of a light bar: as long as `electrics.values.lightbar` is greater than 0, it rotates an electrics value (angle in degrees, modulo 360); otherwise it resets it to 0.

## Notes

- Jbeam keys read by init: `spinSpeed` (320 degrees per second by default) and `electricsName` ("beaconSpin" by default).
- The code comment specifies that the value must return to 0 when the light bar is off, otherwise the projectors stay lit.
- updateGFX reads `electrics.values.lightbar` without a nil test: the value must exist (otherwise comparison error).

## Functions

| Function | Description | Line |
|---|---|---|
| `controller_beaconSpin.init(jbeamData)` | Reads `spinSpeed` and `electricsName` and initializes the electrics value to 1. *(internal)* | 17 |
| `controller_beaconSpin.updateGFX(dt)` | Every frame: advances the angle by dt × spinSpeed (modulo 360) if the light bar is active, otherwise sets the value to 0. *(internal)* | 13 |

### Parameter details

#### `controller_beaconSpin.init(jbeamData)`

Reads `spinSpeed` and `electricsName` and initializes the electrics value to 1.

- `jbeamData` (*table*) : Controller jbeam data.

#### `controller_beaconSpin.updateGFX(dt)`

Every frame: advances the angle by dt × spinSpeed (modulo 360) if the light bar is active, otherwise sets the value to 0.

- `dt` (*number*) : Time step in seconds.

## Fields

| Field | Type | Description |
|---|---|---|
| `type` | string | "auxiliary". |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/vehicle/controller/beaconSpin.lua`.*
