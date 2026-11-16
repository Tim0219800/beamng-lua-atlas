# `controller_pyrotechnicCharge`

*File: `lua/vehicle/controller/pyrotechnicCharge.lua` · VM: Vehicle · 87 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** controller `pyrotechnicCharge` declared in the jbeam (`controller`), reachable with `controller.getController("name")`

Auxiliary single-use pyrotechnic charge controller: as soon as one of the electrics listed in triggerElectrics equals 1 or true, it plays a sound, breaks breakgroups and detaches couplers, then displays a message. Used for explosive separations (bolts, stages, trailers). Can also be triggered manually by trigger().

## Example

```lua
controller.getController("pyrotechnicCharge").trigger()
```

## Notes

- jbeam keys read: triggerElectrics (list of electric names), breakgroups (list of breakgroup names), couplers (list of coupler names), eventName ("event:>Vehicle>Failures>pyrotechnic_charge"), eventVolume (1), uiName ("", used in the message), eventNode (node name; first node with that name, otherwise 0).
- A trigger through updateGFX happens only once (hasTriggered) until reset; the direct call to trigger() is not protected and does not set hasTriggered to true.
- Couplers are detached with beamstate.detachCouplers(name, true, true).

## Functions

| Function | Description | Line |
|---|---|---|
| `controller_pyrotechnicCharge.init(jbeamData)` | Reads the jbeam configuration and finds the sound node. *(internal)* | 52 |
| `controller_pyrotechnicCharge.reset()` | Rearms the charge (hasTriggered = false). *(internal)* | 48 |
| `controller_pyrotechnicCharge.trigger()` | Fires the charge: plays the sound on the node, breaks the breakgroups, detaches the couplers and displays a 5 s message. | 19 |
| `controller_pyrotechnicCharge.updateGFX(dt)` | Every frame: if a trigger electric is active and the charge has not already been fired, calls trigger(). *(internal)* | 32 |

### Parameter details

#### `controller_pyrotechnicCharge.init(jbeamData)`

Reads the jbeam configuration and finds the sound node.

- `jbeamData` (*table*) : Controller jbeam data.

#### `controller_pyrotechnicCharge.updateGFX(dt)`

Every frame: if a trigger electric is active and the charge has not already been fired, calls trigger().

- `dt` (*number*) : Time step in seconds.

## Fields

| Field | Type | Description |
|---|---|---|
| `type` | string | "auxiliary". |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/vehicle/controller/pyrotechnicCharge.lua`.*
