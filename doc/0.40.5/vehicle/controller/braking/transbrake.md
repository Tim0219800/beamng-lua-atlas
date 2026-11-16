# `controller_braking_transbrake`

*File: `lua/vehicle/controller/braking/transbrake.lua` · VM: Vehicle · 116 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** controller `braking/transbrake` declared in the jbeam (`controller`), reachable with `controller.getController("name")`

Auxiliary transbrake controller (drag racing gearbox brake): it locks the gearbox via `gearbox:setLock(value)`. The lock is active when `gearbox.lockCoef == 0`. Publishes this state in `electrics.values[electricsName]` and adds an entry to the radial menu. Can also be commanded by the gameplay event `controller:<name>`.

## Example

```lua
controller.getControllerSafe("transbrake").setTransbrake(true)
-- or, on the game side:
-- onGameplayEvent("controller:transbrake", {"setTransbrake", true})
```

## Notes

- Jbeam keys read by init: `gearboxName` ("gearbox"), `electricsName` ("transbrake").
- `M.updateGFX` is declared as `nop` at the bottom of the file but init replaces it with the real function if the gearbox exists (otherwise it stays `nop`).
- onGameplayEvent hook: the event must be "controller:<typeName or name>" and `eventData` a table {"setTransbrake", boolean}; an incorrect type is logged as an error.
- This controller is relocated: the old name `transbrake` is redirected to `braking/transbrake`.
- State saved under the key `<name>Active` (boolean).

## Functions

| Function | Description | Line |
|---|---|---|
| `controller_braking_transbrake.getState()` | Returns whether the transbrake is active. | 74 |
| `controller_braking_transbrake.init(jbeamData)` | Finds the gearbox, chooses the updateGFX function and adds the radial menu entry (only once). *(internal)* | 37 |
| `controller_braking_transbrake.onGameplayEvent(event, eventData)` | Hook from controller.lua. If the event name is "controller:<typeName>" or "controller:<name>", runs the command contained in eventData: {"setTransbrake", boolean}. Example: onGameplayEvent("controller:transbrake", {"setTransbrake", true}). *(internal)* *(hook)* | 92 |
| `controller_braking_transbrake.setState(data)` | Enables or disables the transbrake to match the saved state (silently). | 79 |
| `controller_braking_transbrake.setTransbrake(value, silent)` | Applies or releases the gearbox lock (`gearbox:setLock`) and displays a message unless silent. | 21 |
| `controller_braking_transbrake.toggleTransbrake()` | Toggles the transbrake state. | 30 |

### Parameter details

#### `controller_braking_transbrake.getState()`

Returns whether the transbrake is active.

- **returns**: table Key `<name>Active` (boolean).

#### `controller_braking_transbrake.init(jbeamData)`

Finds the gearbox, chooses the updateGFX function and adds the radial menu entry (only once).

- `jbeamData` (*table*) : Controller jbeam data.

#### `controller_braking_transbrake.onGameplayEvent(event, eventData)`

Hook from controller.lua. If the event name is "controller:<typeName>" or "controller:<name>", runs the command contained in eventData: {"setTransbrake", boolean}. Example: onGameplayEvent("controller:transbrake", {"setTransbrake", true}).

- `event` (*string*) : Event name.
- `eventData` (*table*) : {commandName, value}.

#### `controller_braking_transbrake.setState(data)`

Enables or disables the transbrake to match the saved state (silently).

- `data` (*table|nil*) : State table.

#### `controller_braking_transbrake.setTransbrake(value, silent)`

Applies or releases the gearbox lock (`gearbox:setLock`) and displays a message unless silent.

- `value` (*boolean*) : true to lock.
- `silent` (*boolean|nil*) : true to not display a message.

## Fields

| Field | Type | Description |
|---|---|---|
| `type` | string | "auxiliary". |
| `updateGFX` | function | nop by default, replaced in init by the function that publishes the electrics when the gearbox exists. |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/vehicle/controller/braking/transbrake.lua`.*
