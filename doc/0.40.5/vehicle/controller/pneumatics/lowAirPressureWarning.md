# `controller_pneumatics_lowAirPressureWarning`

*File: `lua/vehicle/controller/pneumatics/lowAirPressureWarning.lua` · VM: Vehicle · 77 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** controller `pneumatics/lowAirPressureWarning` declared in the jbeam (`controller`), reachable with `controller.getController("name")`

Auxiliary low air pressure warning controller (heavy trucks). Monitors the pressure of a tank: below airTooLowPressure and with the ignition on (ignitionLevel > 0), it sets the warning electrics value to 1, plays a sound loop and displays a message; above airOkPressure or with the ignition off it resets everything to zero (hysteresis).

## Notes

- jbeam keys read: lowAirWarningElectric ("lowAirPressure"), airTooLowPressure (600000 Pa relative) and airOkPressure (650000 Pa), both added to powertrain.currentEnvPressure, relevantPressureTankName ("mainAirTank"), lowAirWarningSoundEvent (audio event name, optional), lowAirWarningSoundNode (node name, 0 if absent), lowAirWarningSoundVolume (0.5).
- If the tank does not exist, the pressure is considered 0 and the warning triggers as soon as the ignition is on.
- The sound is an "AudioDefaultLoop3D" loop source created in initSounds.

## Functions

| Function | Description | Line |
|---|---|---|
| `controller_pneumatics_lowAirPressureWarning.init(jbeamData)` | Reads the pressure thresholds and the monitored tank. *(internal)* | 60 |
| `controller_pneumatics_lowAirPressureWarning.initSounds(jbeamData)` | Creates the warning sound source (if lowAirWarningSoundEvent is defined) and sets its volume. Called by the engine at sound initialization. *(internal)* | 47 |
| `controller_pneumatics_lowAirPressureWarning.reset(jbeamData)` | Resets the warning electrics value to 0. *(internal)* | 43 |
| `controller_pneumatics_lowAirPressureWarning.resetSounds(jbeamData)` | Stops the warning sound and resets the playback state. *(internal)* | 36 |
| `controller_pneumatics_lowAirPressureWarning.updateGFX(dt)` | Every frame: compares the tank pressure to the thresholds and updates the warning electrics value, the sound and the message. *(internal)* | 18 |

### Parameter details

#### `controller_pneumatics_lowAirPressureWarning.init(jbeamData)`

Reads the pressure thresholds and the monitored tank.

- `jbeamData` (*table*) : Controller jbeam data.

#### `controller_pneumatics_lowAirPressureWarning.initSounds(jbeamData)`

Creates the warning sound source (if lowAirWarningSoundEvent is defined) and sets its volume. Called by the engine at sound initialization.

- `jbeamData` (*table*) : Jbeam data.

#### `controller_pneumatics_lowAirPressureWarning.reset(jbeamData)`

Resets the warning electrics value to 0.

- `jbeamData` (*table*) : Jbeam data.

#### `controller_pneumatics_lowAirPressureWarning.resetSounds(jbeamData)`

Stops the warning sound and resets the playback state.

- `jbeamData` (*table*) : Jbeam data.

#### `controller_pneumatics_lowAirPressureWarning.updateGFX(dt)`

Every frame: compares the tank pressure to the thresholds and updates the warning electrics value, the sound and the message.

- `dt` (*number*) : Time step in seconds.

## Fields

| Field | Type | Description |
|---|---|---|
| `type` | string | "auxiliary". |

## Calls into the engine (C++)

- `obj:` `createSFXSource2`, `playSFX`, `setVolume`, `stopSFX`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/vehicle/controller/pneumatics/lowAirPressureWarning.lua`.*
