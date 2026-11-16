# `controller_beamNavigator`

*File: `lua/vehicle/controller/beamNavigator.lua` · VM: Vehicle · 59 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** controller `beamNavigator` declared in the jbeam (`controller`), reachable with `controller.getController("name")`

Auxiliary controller that displays a live navigation map on a vehicle screen. It creates an HTML texture (`htmlTexture` module) on a screen material, asks the game for the dashboard map (`ui_uinavi.requestVehicleDashboardMap`) and sends it 15 times per second the vehicle's position, orientation, speed and ignition, as long as a player is seated.

## Notes

- Jbeam keys read by init: `screenMaterialName` ("@screen_gps"), `htmlFilePath` ("local://local/vehicles/common/navi_screen.html"), `textureWidth` (256), `textureHeight` (128), `textureFPS` (30), `bootscreenImage` (optional URL of the boot screen).
- Data sent to `map.updateData`: x, y, rotation (degrees = direction + 180), speed (km/h = airspeed × 3.6), zoom (min(150 + speed × 1.5, 250), unused on the dashboard), ignitionLevel.
- `M.reset = nop` (empty function): without it controller.reset would call init again and recreate the texture. The `reset` field is therefore not nil.
- The call uses `obj:getID()` for the vehicle identifier.

## Functions

| Function | Description | Line |
|---|---|---|
| `controller_beamNavigator.init(jbeamData)` | Creates the screen's HTML texture, asks the game for the map and displays the boot image if `bootscreenImage` is provided. *(internal)* | 40 |
| `controller_beamNavigator.updateGFX(dt)` | Sends the GPS data to the HTML texture at 15 Hz when a player is seated. *(internal)* | 21 |

### Parameter details

#### `controller_beamNavigator.init(jbeamData)`

Creates the screen's HTML texture, asks the game for the map and displays the boot image if `bootscreenImage` is provided.

- `jbeamData` (*table*) : Controller jbeam data.

#### `controller_beamNavigator.updateGFX(dt)`

Sends the GPS data to the HTML texture at 15 Hz when a player is seated.

- `dt` (*number*) : Time step in seconds.

## Fields

| Field | Type | Description |
|---|---|---|
| `reset` | function | nop: avoids calling init again on vehicle reset. |
| `type` | string | "auxiliary". |

## Calls into the engine (C++)

- `obj:` `getDirection`, `getID`, `getPosition`, `queueGameEngineLua`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/vehicle/controller/beamNavigator.lua`.*
