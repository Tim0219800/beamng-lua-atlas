# `gameplay_speedTraps`

*File: `lua/ge/extensions/gameplay/speedTraps.lua` · VM: Game Engine (GE) · 121 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `gameplay_speedTraps`: `extensions.load("gameplay_speedTraps")`, then the global `gameplay_speedTraps`

Extension that manages the speed cameras and red light cameras placed in levels as BeamNGTrigger triggers carrying a speedTrapType field ("speed" or "redLight"). When a vehicle enters the trigger, in the right direction and too fast, it emits the hooks onSpeedTrapTriggered or onRedLightCamTriggered and makes the associated light flash. Inactive during a foreground mission.

## Example

```lua
function M.onSpeedTrapTriggered(data, speed, overSpeed)
  print(data.triggerName, speed, overSpeed)
end
```

## Notes

- Data expected in data: event ('enter'), speedTrapType, speedLimit (m/s), speedLimitTolerance (default 10% of the limit), speedTrapLightName, subjectID, triggerID, triggerName; for a red light: triggerSpeed (default 5 m/s) and trafficSignalId.
- Speed camera: triggered if the speed exceeds limit + tolerance. Red light camera: triggered if the speed exceeds triggerSpeed AND the signal is "redTrafficLight".
- Ignored if the vehicle is more than 100 m from the camera or if the vehicle is driving in the opposite direction to the trigger's Y axis.
- The flash lasts 0.1 s (speed camera); for a red light: flash 0.1 s, pause of 10 / speed s, second flash 0.1 s.
- For a red light camera, trafficSignal is used without a nil check: if trafficSignalId is invalid, Lua error.

## Functions

| Function | Description | Line |
|---|---|---|
| `gameplay_speedTraps.getSpeedTrapsInCurrentLevel(speedTrapType)` | Lists the BeamNGTrigger triggers of the current level whose speedTrapType matches. | 105 |
| `gameplay_speedTraps.onBeamNGTrigger(data)` | Hook called by the engine on each BeamNGTrigger event. Only handles triggers with speedTrapType and the 'enter' event. Computes the vehicle speed, checks the direction of passage and emits onSpeedTrapTriggered(data, vehSpeed, overSpeed) or onRedLightCamTriggered(data, vehSpeed), then turns on the named light. *(internal)* *(hook)* | 45 |

### Parameter details

#### `gameplay_speedTraps.getSpeedTrapsInCurrentLevel(speedTrapType)`

Lists the BeamNGTrigger triggers of the current level whose speedTrapType matches.

- `speedTrapType` (*string*) : 'speed' or 'redLight'.
- **returns**: table[] Trigger objects (empty table if none).

#### `gameplay_speedTraps.onBeamNGTrigger(data)`

Hook called by the engine on each BeamNGTrigger event. Only handles triggers with speedTrapType and the 'enter' event. Computes the vehicle speed, checks the direction of passage and emits onSpeedTrapTriggered(data, vehSpeed, overSpeed) or onRedLightCamTriggered(data, vehSpeed), then turns on the named light.

- `data` (*table*) : Trigger data (see notes).

## Emitted hooks

Events broadcast to extensions by `extensions.hook`:

- `onRedLightCamTriggered` — listened to by 2 module(s)
- `onSpeedTrapTriggered` — listened to by 3 module(s)

## Calls into the engine (C++)

- `be:` `getObjectPositionXYZ`, `getObjectVelocityXYZ`
- `scenetree.` `findObject`, `findObjectById`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/gameplay/speedTraps.lua`.*
