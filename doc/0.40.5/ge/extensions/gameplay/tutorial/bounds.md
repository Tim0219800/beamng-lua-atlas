# `gameplay_tutorial_bounds`

*File: `lua/ge/extensions/gameplay/tutorial/bounds.lua` · VM: Game Engine (GE) · 287 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `gameplay_tutorial_bounds`: `extensions.load("gameplay_tutorial_bounds")`, then the global `gameplay_tutorial_bounds`

Manages the bounds of the career tutorial zone. It checks that the player stays within the active zones of the tutorial sites; otherwise it displays a warning with a 5 s countdown in the task list, then triggers an automatic return via callbacks (onCareerTutorial... hooks). Can also draw the active zones in debug.

## Example

```lua
gameplay_tutorial_bounds.setActiveZones({'evalZone'})
gameplay_tutorial_bounds.setDebugDrawBounds(true)
```

## Notes

- Constants: 5 s countdown (OOB_AUTO_RESET_SECONDS), "automatic return" message displayed 1 s before the timeout callback.
- Default callbacks: onOutOfBoundsStarted -> hook onCareerTutorialOutOfBoundsStarted; onOutOfBoundsEnded -> onCareerTutorialOutOfBoundsEnded; onOutOfBoundsTimedOut(stepId) -> hook onCareerTutorialOutOfBoundsTimedOut if the current step is '04timeTrial', otherwise onCareerTutorialLeftBounds; onOutOfBoundsWhileNotAllowed -> onCareerTutorialLeftBounds.
- Without an active zone or without loaded sites, the player is always considered within bounds.
- The warning texts are in English and hardcoded (no translation key).
- The tested position is that of player 0's vehicle, or the camera if there is none.
- Tracking is inactive as long as the runtime's activity getter (setRuntimeActiveGetter) returns false.

## Functions

| Function | Description | Line |
|---|---|---|
| `gameplay_tutorial_bounds.cleanup()` | Leaves the out-of-bounds state and resets sites, active zones, disabled zones and debug. | 278 |
| `gameplay_tutorial_bounds.getActiveZoneNames()` | Returns the sorted list of active zone names. | 188 |
| `gameplay_tutorial_bounds.getDebugDrawBounds()` | Indicates whether the debug drawing of the zones is active. | 205 |
| `gameplay_tutorial_bounds.getEnabledZones()` | Returns the internal zoneEnabled table (name -> boolean), direct reference. | 197 |
| `gameplay_tutorial_bounds.getZoneEnabled(zoneName)` | Indicates whether a zone is enabled (true by default if never set). | 183 |
| `gameplay_tutorial_bounds.isInBounds()` | Indicates whether the player is within bounds. Returns true if the tutorial is not active. | 209 |
| `gameplay_tutorial_bounds.onPreRender(dtReal, dtSim, dtRaw)` | Render hook called every frame; draws the active zones if debug is enabled and the tutorial is active. *(internal)* *(hook)* | 271 |
| `gameplay_tutorial_bounds.setActiveZones(names)` | Sets the list of zones in which the player is allowed (replaces the previous list). | 170 |
| `gameplay_tutorial_bounds.setCallbacks(newCallbacks)` | Replaces all or some of the out-of-bounds callbacks; absent keys keep their current callback. | 71 |
| `gameplay_tutorial_bounds.setCurrentStepGetter(getter)` | Sets the function that returns the current tutorial step identifier (passed to the timeout callback). | 63 |
| `gameplay_tutorial_bounds.setDebugDrawBounds(enabled)` | Enables or disables the debug drawing of the active zones (semi-transparent yellow), done in onPreRender. | 201 |
| `gameplay_tutorial_bounds.setRuntimeActiveGetter(getter)` | Sets the function that indicates whether the tutorial is active. A non-function value resets it to a function returning false. | 55 |
| `gameplay_tutorial_bounds.setSites(newSites)` | Sets the sites object (with zones) used to test the bounds. If it is nil, update loads it from gameplay_tutorial_setup. | 166 |
| `gameplay_tutorial_bounds.setZoneEnabled(zoneName, enabled)` | Temporarily enables or disables a zone without removing it from the active list. | 179 |
| `gameplay_tutorial_bounds.update(dtReal)` | To call every frame: if the tutorial is active, tests the bounds; when out of bounds, displays the warning with countdown, and after 5 s triggers (via a job with a 1 s pause) the onOutOfBoundsTimedOut callback. If automatic return is not allowed (gameplay_tutorial_setup.isOutOfBoundsResetAllowed), only calls onOutOfBoundsWhileNotAllowed. | 214 |

### Parameter details

#### `gameplay_tutorial_bounds.getActiveZoneNames()`

Returns the sorted list of active zone names.

- **returns**: string[] Names sorted alphabetically.

#### `gameplay_tutorial_bounds.getDebugDrawBounds()`

Indicates whether the debug drawing of the zones is active.

- **returns**: boolean State of the debug drawing.

#### `gameplay_tutorial_bounds.getEnabledZones()`

Returns the internal zoneEnabled table (name -> boolean), direct reference.

- **returns**: table<string, boolean> Zones explicitly enabled/disabled.

#### `gameplay_tutorial_bounds.getZoneEnabled(zoneName)`

Indicates whether a zone is enabled (true by default if never set).

- `zoneName` (*string*) : Zone name.
- **returns**: boolean Activation state.

#### `gameplay_tutorial_bounds.isInBounds()`

Indicates whether the player is within bounds. Returns true if the tutorial is not active.

- **returns**: boolean true if in an active and enabled zone (or if there is nothing to check).

#### `gameplay_tutorial_bounds.onPreRender(dtReal, dtSim, dtRaw)`

Render hook called every frame; draws the active zones if debug is enabled and the tutorial is active.

- `dtReal` (*number*) : Real-time delta.
- `dtSim` (*number*) : Simulation time delta.
- `dtRaw` (*number*) : Raw time delta.

#### `gameplay_tutorial_bounds.setActiveZones(names)`

Sets the list of zones in which the player is allowed (replaces the previous list).

- `names` (*string[]|nil*) : Zone names; nil clears the list (no more limit).

#### `gameplay_tutorial_bounds.setCallbacks(newCallbacks)`

Replaces all or some of the out-of-bounds callbacks; absent keys keep their current callback.

- `newCallbacks` (*table*) : Possible keys: onOutOfBoundsStarted, onOutOfBoundsEnded, onOutOfBoundsTimedOut(currentStepId), onOutOfBoundsWhileNotAllowed.

#### `gameplay_tutorial_bounds.setCurrentStepGetter(getter)`

Sets the function that returns the current tutorial step identifier (passed to the timeout callback).

- `getter` (*function*) : Function with no argument returning the step id (string) or nil.

#### `gameplay_tutorial_bounds.setDebugDrawBounds(enabled)`

Enables or disables the debug drawing of the active zones (semi-transparent yellow), done in onPreRender.

- `enabled` (*boolean*) : true to draw.

#### `gameplay_tutorial_bounds.setRuntimeActiveGetter(getter)`

Sets the function that indicates whether the tutorial is active. A non-function value resets it to a function returning false.

- `getter` (*function*) : Function with no argument returning a boolean.

#### `gameplay_tutorial_bounds.setSites(newSites)`

Sets the sites object (with zones) used to test the bounds. If it is nil, update loads it from gameplay_tutorial_setup.

- `newSites` (*table|nil*) : Sites object with sites.zones.byName / sites.zones.objects or the getZonesForPosition method.

#### `gameplay_tutorial_bounds.setZoneEnabled(zoneName, enabled)`

Temporarily enables or disables a zone without removing it from the active list.

- `zoneName` (*string*) : Zone name.
- `enabled` (*boolean*) : false to ignore this zone.

#### `gameplay_tutorial_bounds.update(dtReal)`

To call every frame: if the tutorial is active, tests the bounds; when out of bounds, displays the warning with countdown, and after 5 s triggers (via a job with a 1 s pause) the onOutOfBoundsTimedOut callback. If automatic return is not allowed (gameplay_tutorial_setup.isOutOfBoundsResetAllowed), only calls onOutOfBoundsWhileNotAllowed.

- `dtReal` (*number*) : Real-time delta in seconds.

## Emitted hooks

Events broadcast to extensions by `extensions.hook`:

- `onCareerTutorialLeftBounds` — listened to by 8 module(s)
- `onCareerTutorialOutOfBoundsEnded` — listened to by 1 module(s)
- `onCareerTutorialOutOfBoundsStarted` — listened to by 1 module(s)
- `onCareerTutorialOutOfBoundsTimedOut` — listened to by 1 module(s)

**UI events (guihooks.trigger):** `DiscardTasklistItem`, `SetTasklistTask`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/gameplay/tutorial/bounds.lua`.*
