# `freeroam_specialTriggers`

*File: `lua/ge/extensions/freeroam/specialTriggers.lua` · VM: Game Engine (GE) · 547 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `freeroam_specialTriggers`: `extensions.load("freeroam_specialTriggers")`, then the global `freeroam_specialTriggers`

Data-driven special triggers: links BeamNGTriggers (or zones) to showing/hiding scene objects (TSStatic, PointLight/SpotLight lights, SimGroup) with delays, random order and random steps, and to Lua commands (GE or vehicle VM) when a vehicle enters/exits. At level start it reads `triggers.json` in the level folder. A modder uses it to animate lighting or scenery when the player enters a zone, without writing Lua. Global: freeroam_specialTriggers.

## Example

```lua
freeroam_specialTriggers.addTrigger('myTrigger', {
  subjectType = 'player',
  objects = { MyLightGroup = { enterDelay = 0.5, exitDelay = 2, enterRandomMin = 0.05, enterRandomMax = 0.2, randomOrder = true } },
  enterCommand = "print('enter')",
  enterVehCommand = "electrics.set_warn_signal(1)"
})
```

## Notes

- triggers.json format: object { triggerName = { type, triggers, subjectType, subjectIds, objects, enterCommand, exitCommand, enterVehCommand, exitVehCommand } }. `type` = 'trigger' or 'zone'. `triggers` (list of names) creates aliases: several BeamNGTriggers drive the same trigger, which only becomes inactive when all the group's triggers are inactive. subjectType: 'player' (default), 'notPlayer', 'all'; subjectIds: vehicle ids accepted in addition.
- `objects`: table sceneObjectName -> {enterDelay, exitDelay, enterRandomMin, enterRandomMax, exitRandomMin, exitRandomMax, randomOrder}. Delays are in simulation seconds (dtSim). If Random Max is 0 or the object is not a group, the state is applied all at once after the delay; otherwise the SimGroup's children are enabled one by one with a random delay between min and max (shuffled order if randomOrder). Nested SimGroups are processed in parallel (isNested).
- setState stores each object's original state (`isEnabled` for PointLight/SpotLight, `hidden` for the others); if the original state is "hidden/off", the logic is inverted so that "active" makes the object visible. reset(true) restores the original state.
- enterCommand/exitCommand are GE Lua compiled with load() and run under pcall; enterVehCommand/exitVehCommand are sent via queueLuaCommand to the relevant vehicle's VM.
- The zone test (onTick) is disabled: the function does `if true then return end` right after the activity check, so 'zone' type triggers do not fire automatically.
- onSerialize uses `ipairs(triggers)` on a table indexed by names: the loop never runs (restoring inactive states on a Lua reload).
- setTriggerActive contains a debug print(tostring(active)) when `active` is nil (toggle).
- M.active (true by default) disables all reactions to the hooks; M.debugMode adds detailed logs.

## Functions

| Function | Description | Line |
|---|---|---|
| `freeroam_specialTriggers.addTrigger(key, data)` | Creates a trigger (initial state inactive, enabled) with its linked objects, its aliases and its commands; computes for each object group the maximum number of children (maxIdx). | 109 |
| `freeroam_specialTriggers.getTriggers()` | Returns the internal table of all the triggers (including aliases). | 206 |
| `freeroam_specialTriggers.loadTriggers(filePath)` | Reads a triggers file (by default `triggers.json` in the current level folder, via getMissionFilename) and calls setupTriggers. | 195 |
| `freeroam_specialTriggers.onBeamNGTrigger(data)` | BeamNGTrigger hook: handles the enter/exit/tick event of a known trigger (useTrigger). *(internal)* *(hook)* | 512 |
| `freeroam_specialTriggers.onClientEndMission()` | End-of-level hook: reset(true). *(internal)* *(hook)* | 399 |
| `freeroam_specialTriggers.onClientStartMission()` | Level start hook: loads the level's triggers.json. *(internal)* *(hook)* | 395 |
| `freeroam_specialTriggers.onDeserialized(data)` | After Lua reload: restores the triggers table. *(internal)* *(hook)* | 525 |
| `freeroam_specialTriggers.onSerialize()` | Before Lua reload: returns {triggers} (see the bug in the notes). *(internal)* *(hook)* | 518 |
| `freeroam_specialTriggers.onUpdate(dt, dtSim)` | Per-frame hook: advances the delays and random steps of each object group in simulated time, applies the states, and calls onTick (zones) every 0.25 s if a zone-type trigger exists. *(internal)* *(hook)* | 403 |
| `freeroam_specialTriggers.onVehicleActiveChanged(vehId, active)` | Hook: if a vehicle becomes inactive, removes it from the triggers. *(internal)* *(hook)* | 387 |
| `freeroam_specialTriggers.onVehicleDestroyed(vehId)` | Hook: removes the vehicle from the occupant lists of all triggers. *(internal)* *(hook)* | 377 |
| `freeroam_specialTriggers.onVehicleSwitched(oldId, newId)` | Vehicle change hook: sends a valid "exit" event to the triggers for which the new vehicle is a valid subject (prevents a state from staying stuck). *(internal)* *(hook)* | 362 |
| `freeroam_specialTriggers.removeTrigger(key, useOrigState)` | Deletes a trigger and its aliases; restores the linked objects' original state if useOrigState. | 155 |
| `freeroam_specialTriggers.reset(useOrigState)` | Resets: with useOrigState, deletes all the triggers while restoring the objects' original state; clears the memory of original states. | 170 |
| `freeroam_specialTriggers.setTriggerActive(tName, active, instant)` | Manually enables/disables a trigger (simulates a valid enter/exit event with vehId 0, which keeps it active). With instant=true, applies the state to the objects immediately with no delay. | 313 |
| `freeroam_specialTriggers.setupTriggers(data)` | Resets everything (reset(true)) then creates one trigger per entry of the data table. | 184 |

### Parameter details

#### `freeroam_specialTriggers.addTrigger(key, data)`

Creates a trigger (initial state inactive, enabled) with its linked objects, its aliases and its commands; computes for each object group the maximum number of children (maxIdx).

- `key` (*string*) : Trigger or zone name.
- `data` (*table|nil*) : Data (see notes).

#### `freeroam_specialTriggers.getTriggers()`

Returns the internal table of all the triggers (including aliases).

- **returns**: table<string, table> Triggers.

#### `freeroam_specialTriggers.loadTriggers(filePath)`

Reads a triggers file (by default `triggers.json` in the current level folder, via getMissionFilename) and calls setupTriggers.

- `filePath` (*string|nil*) : JSON file path.

#### `freeroam_specialTriggers.onBeamNGTrigger(data)`

BeamNGTrigger hook: handles the enter/exit/tick event of a known trigger (useTrigger).

- `data` (*table*) : {triggerName, event, subjectID}

#### `freeroam_specialTriggers.onDeserialized(data)`

After Lua reload: restores the triggers table.

- `data` (*table*) : Table returned by onSerialize.

#### `freeroam_specialTriggers.onSerialize()`

Before Lua reload: returns {triggers} (see the bug in the notes).

- **returns**: table {triggers = ...}

#### `freeroam_specialTriggers.onUpdate(dt, dtSim)`

Per-frame hook: advances the delays and random steps of each object group in simulated time, applies the states, and calls onTick (zones) every 0.25 s if a zone-type trigger exists.

- `dt` (*number*) : Real duration (s).
- `dtSim` (*number*) : Simulated duration (s).

#### `freeroam_specialTriggers.onVehicleActiveChanged(vehId, active)`

Hook: if a vehicle becomes inactive, removes it from the triggers.

- `vehId` (*integer*) : Id.
- `active` (*boolean*) : New active state.

#### `freeroam_specialTriggers.onVehicleDestroyed(vehId)`

Hook: removes the vehicle from the occupant lists of all triggers.

- `vehId` (*integer*) : Vehicle id.

#### `freeroam_specialTriggers.onVehicleSwitched(oldId, newId)`

Vehicle change hook: sends a valid "exit" event to the triggers for which the new vehicle is a valid subject (prevents a state from staying stuck).

- `oldId` (*integer*) : Old vehicle.
- `newId` (*integer*) : New vehicle.

#### `freeroam_specialTriggers.removeTrigger(key, useOrigState)`

Deletes a trigger and its aliases; restores the linked objects' original state if useOrigState.

- `key` (*string*) : Trigger name.
- `useOrigState` (*boolean|nil*) : Restore the objects.

#### `freeroam_specialTriggers.reset(useOrigState)`

Resets: with useOrigState, deletes all the triggers while restoring the objects' original state; clears the memory of original states.

- `useOrigState` (*boolean|nil*) : true to restore the objects.

#### `freeroam_specialTriggers.setTriggerActive(tName, active, instant)`

Manually enables/disables a trigger (simulates a valid enter/exit event with vehId 0, which keeps it active). With instant=true, applies the state to the objects immediately with no delay.

- `tName` (*string*) : Trigger name.
- `active` (*boolean|nil*) : New state; nil = toggle.
- `instant` (*boolean|nil*) : Apply with no delay.

#### `freeroam_specialTriggers.setupTriggers(data)`

Resets everything (reset(true)) then creates one trigger per entry of the data table.

- `data` (*table*) : Table name -> trigger data (see notes).

## Fields

| Field | Type | Description |
|---|---|---|
| `active` | boolean | Master switch: if false, the trigger hooks are ignored. |
| `debugMode` | boolean | Enables debug logs (state changes, delay ends). |

## Calls into the engine (C++)

- `be:` `getObjectActive`, `getPlayerVehicleID`
- `obj:` `getClassName`, `getCount`, `getGroup`, `getID`, `getLightEnabled`, `getObjects`
- `scenetree.` `findObject`, `findObjectById`, `objectExists`, `objectExistsById`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/freeroam/specialTriggers.lua`.*
