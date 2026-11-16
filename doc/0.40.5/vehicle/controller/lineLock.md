# `controller_lineLock`

*File: `lua/vehicle/controller/lineLock.lua` · VM: Vehicle · 156 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** controller `lineLock` declared in the jbeam (`controller`), reachable with `controller.getController("name")`

Dragster "line lock" auxiliary controller (type "auxiliary", defaultOrder 40): locks the brake pressure of the listed wheels (typically the front) at the current level to allow heating the rear tires. On activation, it stores the current main brake torque of each locked wheel and reapplies it at each step into wd.desiredBrakingTorque as long as the line lock is active. A "Line Lock" entry is added to the radial menu.

## Example

```lua
local ll = controller.getControllerSafe('lineLock')
ll.toggleLineLock()
```

## Notes

- jbeam keys (default): name (controller name, used by the radial menu to find it), lockedLines (list of wheel names), electricsName ("linelock").
- electrics.values[electricsName] is 1 when active, 0 otherwise. An interface message indicates the locked wheels and the brake percentage at the time of activation.
- setLineLock(value): value >= 1 activates; any value < 1 deactivates (stored torques reset to 0).

## Functions

| Function | Description | Line |
|---|---|---|
| `controller_lineLock.getState()` | Returns the active state and the stored torques per wheel. | 115 |
| `controller_lineLock.init(jbeamData)` | Reads the wheels to lock, registers the radial menu entry. *(internal)* | 66 |
| `controller_lineLock.setLineLock(value)` | Enables or disables the line lock and stores the current brake torque of the locked wheels. | 43 |
| `controller_lineLock.setState(data)` | Restores the state returned by getState. | 123 |
| `controller_lineLock.toggleLineLock()` | Toggles the line lock state. | 61 |
| `controller_lineLock.updateGFX(dt)` | Writes the state into electrics.values. *(internal)* | 39 |
| `controller_lineLock.updateWheelsIntermediate(dt)` | Every step: applies the stored brake torques to the locked wheels when the line lock is active. *(internal)* | 30 |

### Parameter details

#### `controller_lineLock.getState()`

Returns the active state and the stored torques per wheel.

- **returns**: table State table (reused).

#### `controller_lineLock.init(jbeamData)`

Reads the wheels to lock, registers the radial menu entry.

- `jbeamData` (*table*) : Controller jbeam data.

#### `controller_lineLock.setLineLock(value)`

Enables or disables the line lock and stores the current brake torque of the locked wheels.

- `value` (*number*) : 1 to activate, 0 to deactivate.

#### `controller_lineLock.setState(data)`

Restores the state returned by getState.

- `data` (*table|nil*) : State table.

#### `controller_lineLock.updateGFX(dt)`

Writes the state into electrics.values.

- `dt` (*number*) : Time step (s).

#### `controller_lineLock.updateWheelsIntermediate(dt)`

Every step: applies the stored brake torques to the locked wheels when the line lock is active.

- `dt` (*number*) : Time step (s).

## Fields

| Field | Type | Description |
|---|---|---|
| `defaultOrder` | number | 40. |
| `type` | string | "auxiliary". |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/vehicle/controller/lineLock.lua`.*
