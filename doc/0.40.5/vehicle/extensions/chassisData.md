# `chassisData`

*File: `lua/vehicle/extensions/chassisData.lua` · VM: Vehicle · 114 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `chassisData`: `extensions.load (vehicle VM)("chassisData")`, then the global `chassisData`

Extension that computes the vehicle's wheelbase (wheelBase) and track width (trackWidth) from the wheel node positions in the jbeam data, then returns them by Lua command to another object (vehicle or VM). Used by tools that need the chassis geometry.

## Example

```lua
-- request the data from vehicle 12, result sent back to a named function
extensions.chassisData.requestChassisData(objID, 'myReceiveFunction', false)
-- the function will receive a JSON string: {trackWidth, wheelBase, objectID, vehicleName}
```

## Notes

- The result is cached after the first successful computation; forceRefresh = true recomputes it.
- The computation identifies the front left, front right and rear left wheels by the relative position of node1 with respect to the wheel center, in the refNodes frame. If one of these three wheels cannot be found (vehicle with fewer than 3 wheels, etc.), getChassisData returns nil and nothing is sent.
- Units: meters (jbeam positions). trackWidth = distance between the outer edges of the front wheels minus the half-width of a wheel node to the other, hence the track between tread centers. wheelBase = Y gap between the front left and rear left wheels.
- Sending is done by obj:queueObjectLuaCommand(objID, "<callback>(<json>)"): the target must have an accessible global function with that name and receive a quoted JSON string.
- The export name is requestChassisData (alias of sendChassisData).

## Functions

| Function | Description | Line |
|---|---|---|
| `chassisData.requestChassisData(objID, callback, forceRefresh)` | Computes (or reads from cache) the chassis data and sends it to the object objID by calling the Lua function callback with the data JSON as argument. | 101 |

### Parameter details

#### `chassisData.requestChassisData(objID, callback, forceRefresh)`

Computes (or reads from cache) the chassis data and sends it to the object objID by calling the Lua function callback with the data JSON as argument.

- `objID` (*integer*) : Identifier of the destination object.
- `callback` (*string*) : Name of the Lua function to call on the destination.
- `forceRefresh` (*boolean|nil*) : true to ignore the cache.

## Calls into the engine (C++)

- `obj:` `queueObjectLuaCommand`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/vehicle/extensions/chassisData.lua`.*
