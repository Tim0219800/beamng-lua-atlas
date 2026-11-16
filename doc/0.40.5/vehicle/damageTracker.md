# `damageTracker`

*File: `lua/vehicle/damageTracker.lua` · VM: Vehicle · 127 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** global `damageTracker`

Registry of vehicle damage states, organized by group then by name (e.g. group 'energyStorage', tank name). Each change is queued and sent to the UI every 1/3 s via the `DamageData` hook, with optional callbacks for other modules. A modder calls setDamage to report a failure and getDamage to read it.

## Example

```lua
damageTracker.setDamage("engine", "overheat", true, true)   -- also notifies the UI
local broken = damageTracker.getDamage("engine", "overheat")
damageTracker.setDamageTemporary("engine", "overheat", true, false, 5)
```

## Notes

- The UI message uses the translation key `vehicle.<group>.<name>.<value>` and is only sent to seated players (guihooks.messageForSeatedPlayers).
- setDamage does nothing if the value is unchanged. It enables the updateGFXDirty loop, which resets to nop as soon as there is nothing left to send or expire.
- damageData is sent in full to the DamageData hook; callbacks receive (damageData, damageDataDelta) where damageDataDelta only contains the changes since the last send.
- getDamage returns false (not nil) for an unknown pair or a nil/false value.
- init also clears the callback list (registerDamageUpdateCallback), reset does not clear it.

## Functions

| Function | Description | Line |
|---|---|---|
| `damageTracker.getDamage(group, name)` | Reads the damage state of a group/name pair. | 78 |
| `damageTracker.init()` | Called at vehicle creation: clears data, deltas, callbacks and timeouts. *(internal)* | 106 |
| `damageTracker.registerDamageUpdateCallback(callback)` | Adds a callback called on each DamageData send with (damageData, damageDataDelta). Ignored if nil. | 91 |
| `damageTracker.reset()` | Called at reset: clears data, deltas and timeouts (keeps the callbacks). *(internal)* | 98 |
| `damageTracker.sendNow()` | Forces the sending of the DamageData hook and callbacks on the next frame (resets the timer to 0). | 82 |
| `damageTracker.setDamage(group, name, value, notifyUI)` | Sets the damage state of a group/name pair (cancels any ongoing timeout on this pair). | 46 |
| `damageTracker.setDamageTemporary(group, name, value, timeoutValue, timeout, notifyUI)` | Like setDamage but schedules a return to timeoutValue after timeout seconds. | 72 |
| `damageTracker.updateGFX(dt)` | Is nop at rest; becomes updateGFXDirty when a damage changes or must expire. Periodically sends DamageData and counts down temporary damages. Called every frame by the main loop. (dynamically assigned) *(internal)* | dyn |
| `damageTracker.willSend()` | Indicates whether a send has just been armed (timer at its full value) and a first player is seated. | 87 |

### Parameter details

#### `damageTracker.getDamage(group, name)`

Reads the damage state of a group/name pair.

- `group` (*string*) : Group.
- `name` (*string*) : Name.
- **returns**: any The value, or false if absent.

#### `damageTracker.registerDamageUpdateCallback(callback)`

Adds a callback called on each DamageData send with (damageData, damageDataDelta). Ignored if nil.

- `callback` (*function*) : function(damageData, damageDataDelta).

#### `damageTracker.setDamage(group, name, value, notifyUI)`

Sets the damage state of a group/name pair (cancels any ongoing timeout on this pair).

- `group` (*string*) : Damage group (e.g. 'energyStorage').
- `name` (*string*) : Name in the group.
- `value` (*boolean|number|string*) : Damage value (in practice true/false).
- `notifyUI` (*boolean|nil*) : If true, displays an on-screen message.

#### `damageTracker.setDamageTemporary(group, name, value, timeoutValue, timeout, notifyUI)`

Like setDamage but schedules a return to timeoutValue after timeout seconds.

- `group` (*string*) : Group.
- `name` (*string*) : Name.
- `value` (*any*) : Immediate value.
- `timeoutValue` (*any*) : Value applied at expiry.
- `timeout` (*number*) : Timeout in seconds.
- `notifyUI` (*boolean|nil*) : Notify the UI on immediate application.

#### `damageTracker.updateGFX(dt)`

Is nop at rest; becomes updateGFXDirty when a damage changes or must expire. Periodically sends DamageData and counts down temporary damages. Called every frame by the main loop. (dynamically assigned)

- `dt` (*number*) : Time step in seconds.

#### `damageTracker.willSend()`

Indicates whether a send has just been armed (timer at its full value) and a first player is seated.

- **returns**: boolean true if the send is imminent.

**UI events (guihooks.trigger):** `DamageData`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/vehicle/damageTracker.lua`.*
