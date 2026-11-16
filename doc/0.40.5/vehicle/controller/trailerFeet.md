# `controller_trailerFeet`

*File: `lua/vehicle/controller/trailerFeet.lua` · VM: Vehicle · 40 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** controller `trailerFeet` declared in the jbeam (`controller`), reachable with `controller.getController("name")`

Auxiliary controller for trailer kickstands: writes an electric ("feet" by default) to an "attached" value when a coupler of this vehicle attaches to ANOTHER vehicle and to a "detached" value when it detaches. The electric is used to animate/retract the kickstands.

## Notes

- jbeam keys read: electricsName ("feet"), attachedValue (1), detachedValue (0), startValue (0, initial value).
- Couplers attached to the same vehicle (obj2id == obj:getId()) are ignored.
- Pitfall: the expression `jbeamData.attachedValue or 1` gives 1 if the jbeam value is false, but 0 is a valid value in Lua so it is OK; only watch out for nil values.

## Functions

| Function | Description | Line |
|---|---|---|
| `controller_trailerFeet.init(jbeamData)` | Reads the configuration and initializes the electric to startValue. *(internal)* | 26 |
| `controller_trailerFeet.onCouplerAttached(nodeId, obj2id, obj2nodeId)` | Hook called by the engine when a coupler attaches; if the other object is another vehicle, sets the electric to attachedValue. *(internal)* *(hook)* | 14 |
| `controller_trailerFeet.onCouplerDetached(nodeId, obj2id, obj2nodeId, breakForce)` | Hook called when a coupler detaches; if the other object is another vehicle, sets the electric to detachedValue. *(internal)* *(hook)* | 20 |

### Parameter details

#### `controller_trailerFeet.init(jbeamData)`

Reads the configuration and initializes the electric to startValue.

- `jbeamData` (*table*) : Jbeam data.

#### `controller_trailerFeet.onCouplerAttached(nodeId, obj2id, obj2nodeId)`

Hook called by the engine when a coupler attaches; if the other object is another vehicle, sets the electric to attachedValue.

- `nodeId` (*integer*) : Coupler node of this vehicle.
- `obj2id` (*integer*) : Id of the other vehicle.
- `obj2nodeId` (*integer*) : Node of the other vehicle.

#### `controller_trailerFeet.onCouplerDetached(nodeId, obj2id, obj2nodeId, breakForce)`

Hook called when a coupler detaches; if the other object is another vehicle, sets the electric to detachedValue.

- `nodeId` (*integer*) : Coupler node of this vehicle.
- `obj2id` (*integer*) : Id of the other vehicle.
- `obj2nodeId` (*integer*) : Node of the other vehicle.
- `breakForce` (*number*) : Breaking force (unused).

## Fields

| Field | Type | Description |
|---|---|---|
| `type` | string | "auxiliary". |

## Calls into the engine (C++)

- `obj:` `getId`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/vehicle/controller/trailerFeet.lua`.*
