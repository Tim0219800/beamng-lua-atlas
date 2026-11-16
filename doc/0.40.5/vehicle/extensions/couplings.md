# `couplings`

*File: `lua/vehicle/extensions/couplings.lua` · VM: Vehicle · 69 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `couplings`: `extensions.load (vehicle VM)("couplings")`, then the global `couplings`

Extension managing fifth wheel type hitches. It reacts to beamstate events (enabling/disabling of automatic coupling, detaching) by relaying them to the 'couplings/fifthwheel' controllers and answers beamstate's questions about the coupling state.

## Example

```lua
-- called by beamstate, not by the modder directly
extensions.couplings.isCouplerAttached()
```

## Notes

- isAutoCouplingActive always returns false; isCouplerAttached returns true if at least one fifth wheel is attached, otherwise nil (not false).
- couplingAttached calls obj:stopLatching() then beamstate.disableAutoCoupling(): automatic coupling is cut as soon as a coupling is made.
- couplingDetached and onReset are empty.

## Functions

| Function | Description | Line |
|---|---|---|
| `couplings.couplingAttached(nodeId, obj2id, obj2nodeId)` | Called by the engine/beamstate when a coupler attaches: stops the automatic latching and disables auto coupling. *(internal)* | 30 |
| `couplings.couplingDetached(nodeId, obj2id, obj2nodeId)` | Called when a coupler detaches; does nothing. *(internal)* | 35 |
| `couplings.isAutoCouplingActive()` | Indicates whether automatic coupling is active for this extension (always false). *(internal)* | 39 |
| `couplings.isCouplerAttached()` | Indicates whether at least one fifth wheel is attached. *(internal)* | 44 |
| `couplings.onBeamstateActivateAutoCoupling()` | Called by beamstate on activation of automatic coupling: displays the indicator of each fifth wheel. *(internal)* *(hook)* | 7 |
| `couplings.onBeamstateDetachCouplers()` | Called by beamstate to detach the couplers: detaches each fifth wheel. *(internal)* *(hook)* | 23 |
| `couplings.onBeamstateDisableAutoLatching()` | Called by beamstate on deactivation of automatic coupling: hides the indicator of each fifth wheel. *(internal)* *(hook)* | 15 |
| `couplings.onReset()` | Vehicle reset hook; empty. *(internal)* *(hook)* | 53 |

### Parameter details

#### `couplings.couplingAttached(nodeId, obj2id, obj2nodeId)`

Called by the engine/beamstate when a coupler attaches: stops the automatic latching and disables auto coupling.

- `nodeId` (*integer*) : Coupler node.
- `obj2id` (*integer*) : Identifier of the other vehicle.
- `obj2nodeId` (*integer*) : Coupler node of the other vehicle.

#### `couplings.couplingDetached(nodeId, obj2id, obj2nodeId)`

Called when a coupler detaches; does nothing.

- `nodeId` (*integer*) : Coupler node.
- `obj2id` (*integer*) : Other vehicle.
- `obj2nodeId` (*integer*) : Node of the other vehicle.

#### `couplings.isAutoCouplingActive()`

Indicates whether automatic coupling is active for this extension (always false).

- **returns**: boolean false.

#### `couplings.isCouplerAttached()`

Indicates whether at least one fifth wheel is attached.

- **returns**: boolean|nil true if attached, otherwise nil.

## Calls into the engine (C++)

- `obj:` `stopLatching`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/vehicle/extensions/couplings.lua`.*
