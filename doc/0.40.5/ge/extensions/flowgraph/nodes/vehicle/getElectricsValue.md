# `flowgraph_nodes_vehicle_getElectricsValue`

*File: `lua/ge/extensions/flowgraph/nodes/vehicle/getElectricsValue.lua` · VM: Game Engine (GE) · 92 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/vehicle/getElectricsValue")` (file under extensions/ but not a regular extension)

Node "Get Electrics Value" (category `once_f_duration`). Reads an `electrics` value of the vehicle: subscribes with `core_vehicleBridge.registerValueChangeNotification(veh, key)` then reads the cache `getCachedVehicleData`. Pins: inputs `vehId`, `key` (string, with predefined templates: throttle, throttle_input, rpm, brake, brake_input, parkingbrake, parkingbrake_input, gear, clutch...); output `value` (any). Uses the duration state (inactive, started, finished).

## Notes

- The `key` template list is in `postInit` (excerpt here, longer in the code).
- The node goes to `finished` as soon as a non-nil value is received; the notification is removed on reset/stop.

## Class `C`

Flowgraph node class (returned by `_flowgraph_createNode(C)`). Definition fields: name, description, category, pinSchema, tags.

| Method | Description | Line |
|---|---|---|
| `C:_executionStarted()` | Called by the manager when the flowgraph project execution starts; resets the internal state to zero. | 41 |
| `C:_executionStopped()` | Called by the manager when the project execution stops; cleans up the internal state. | 44 |
| `C:clearNotification()` | Unsubscribes from the value change notification (`unregisterValueChangeNotification`) and clears `_setupData`. | 48 |
| `C:init()` | Node constructor, called at its creation by the flowgraph editor/manager; initializes the internal state. | 25 |
| `C:onNodeReset()` | Goes to `inactive` duration and removes the notification. | 59 |
| `C:postInit()` | Defines `hardTemplates` of the `key` pin: list of common electrics keys offered in the editor. | 28 |
| `C:work()` | Reads the cached value; if it exists, writes it to `value` and goes to `finished`. | 78 |
| `C:workOnce()` | Subscribes to the vehicle's `key` value and goes to `started` duration. | 64 |

## Calls into the engine (C++)

- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/vehicle/getElectricsValue.lua`.*
