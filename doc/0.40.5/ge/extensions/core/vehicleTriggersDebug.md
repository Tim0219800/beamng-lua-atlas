# `core_vehicleTriggersDebug`

*File: `lua/ge/extensions/core/vehicleTriggersDebug.lua` · VM: Game Engine (GE) · 496 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `core_vehicleTriggersDebug`: `extensions.load("core_vehicleTriggersDebug")`, then the global `core_vehicleTriggersDebug`

"Vehicle event debug" ImGui window to inspect vehicle triggers: shows the state of core_vehicleTriggers (camera, held trigger, hovered position, labels), lists vehicles with their triggers, action links and JBeam events, and lets you fire them with the mouse. Loaded by core_vehicleTriggers.enableDebugUI() and unloaded by disableDebugUI(). A vehicle modder uses it to check their triggers and triggerEventLinks sections.

## Example

```lua
core_vehicleTriggers.enableDebugUI()  -- opens the window
core_vehicleTriggers.disableDebugUI() -- closes it
```

## Notes

- Not to be used directly: it depends on core_vehicleTriggers and core_vehicle_vehicleTriggerHighlight and reads core_vehicleTriggers.state.
- The "trigger" buttons execute the Lua onDown/onUp strings of the events in the vehicle (queueLuaCommand); links go through a local copy of executeLink that forces player 0 (a difference from the local executeLink function of vehicleTriggers.lua, which passes the player).
- The local copy of executeLink does not fire the onVehicleTriggersExecuteLink hook.

**Dependencies (loaded first):** `core_vehicleTriggers`, `core_vehicle_vehicleTriggerHighlight`

## Functions

| Function | Description | Line |
|---|---|---|
| `core_vehicleTriggersDebug.onDeserialized(data)` | Hook called after an extensions reload: restores the highlighted triggers through core_vehicle_vehicleTriggerHighlight.setSerializedHighlightedTriggerData. *(internal)* *(hook)* | 485 |
| `core_vehicleTriggersDebug.onSerialize()` | Hook called before an extensions reload: saves the highlighted triggers. *(internal)* *(hook)* | 475 |
| `core_vehicleTriggersDebug.onUpdate(dtReal, dtSim, dtRaw)` | Hook called every frame: draws the debug ImGui window. *(internal)* *(hook)* | 471 |

### Parameter details

#### `core_vehicleTriggersDebug.onDeserialized(data)`

Hook called after an extensions reload: restores the highlighted triggers through core_vehicle_vehicleTriggerHighlight.setSerializedHighlightedTriggerData.

- `data` (*table|nil*) : Data from onSerialize ({highLightedTriggerData}).

#### `core_vehicleTriggersDebug.onSerialize()`

Hook called before an extensions reload: saves the highlighted triggers.

- **returns**: table {highLightedTriggerData = highlight data or nil}

#### `core_vehicleTriggersDebug.onUpdate(dtReal, dtSim, dtRaw)`

Hook called every frame: draws the debug ImGui window.

- `dtReal` (*number*) : Elapsed real time (s).
- `dtSim` (*number*) : Simulation elapsed time (s).
- `dtRaw` (*number*) : Raw elapsed time (s).

## Fields

| Field | Type | Description |
|---|---|---|
| `dependencies` | string[] | core_vehicleTriggers and core_vehicle_vehicleTriggerHighlight. |

## Calls into the engine (C++)

- `be:` `getObject`, `getObjectCount`, `getPlayerVehicleID`
- `scenetree.` `findObject`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/core/vehicleTriggersDebug.lua`.*
