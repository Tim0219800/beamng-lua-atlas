# `controller_couplings_kingpin`

*File: `lua/vehicle/controller/couplings/kingpin.lua` · VM: Vehicle · 56 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** controller `couplings/kingpin` declared in the jbeam (`controller`), reachable with `controller.getController("name")`

Auxiliary kingpin controller of a semi-trailer. It only answers the tractor's `couplings/fifthwheel` controller: if the fifth wheel's key matches its own, it returns its node cid and its world position. It can also display its node in debug when the fifth wheel requests the indicator display.

## Notes

- Jbeam keys read by init: `kingpinNode` (node name, resolved via `beamstate.nodeNameMap`) and `kingpinKey` ("fifthwheel_v2" by default, must be identical to the fifth wheel's `fifthwheelKey`).
- No update: everything is done through remote calls (`obj:queueObjectLuaCommand` from the tractor).
- `M.debugDraw` is nil by default; setKingpinVisibility sets or removes it then calls `controller.cacheAllControllerFunctions()`.

## Functions

| Function | Description | Line |
|---|---|---|
| `controller_couplings_kingpin.init(jbeamData)` | Finds the kingpin node by name and reads the key. *(internal)* | 42 |
| `controller_couplings_kingpin.reset(jbeamData)` | Empty. *(internal)* | 39 |
| `controller_couplings_kingpin.sendDataToVehicle(objId, controllerName, couplerTag)` | Called remotely by a fifth wheel: if `couplerTag` equals this kingpin's key, returns {nodeId, nodePosition} to `kingpinDataCallback` of the requesting vehicle's fifth wheel controller. *(internal)* | 13 |
| `controller_couplings_kingpin.setKingpinVisibility(key, visible)` | Enables or removes the kingpin node debug display if the key matches. *(internal)* | 31 |

### Parameter details

#### `controller_couplings_kingpin.init(jbeamData)`

Finds the kingpin node by name and reads the key.

- `jbeamData` (*table*) : Controller jbeam data.

#### `controller_couplings_kingpin.reset(jbeamData)`

Empty.

- `jbeamData` (*table*) : Jbeam data.

#### `controller_couplings_kingpin.sendDataToVehicle(objId, controllerName, couplerTag)`

Called remotely by a fifth wheel: if `couplerTag` equals this kingpin's key, returns {nodeId, nodePosition} to `kingpinDataCallback` of the requesting vehicle's fifth wheel controller.

- `objId` (*integer*) : Id of the requesting vehicle (tractor).
- `controllerName` (*string*) : Name of the fifth wheel controller to call back.
- `couplerTag` (*string*) : Requested fifth wheel key.

#### `controller_couplings_kingpin.setKingpinVisibility(key, visible)`

Enables or removes the kingpin node debug display if the key matches.

- `key` (*string*) : Fifth wheel key concerned.
- `visible` (*boolean*) : true to show.

## Fields

| Field | Type | Description |
|---|---|---|
| `debugDraw` | function|nil | nil by default; drawing function of the kingpin node when the indicator is visible. |
| `type` | string | "auxiliary". |

## Calls into the engine (C++)

- `obj:` `getNodePosition`, `getPosition`, `queueObjectLuaCommand`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/vehicle/controller/couplings/kingpin.lua`.*
