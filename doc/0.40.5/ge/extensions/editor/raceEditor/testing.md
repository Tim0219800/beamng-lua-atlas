# `editor_raceEditor_testing`

*File: `lua/ge/extensions/editor/raceEditor/testing.lua` · VM: Game Engine (GE) · 170 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/editor/raceEditor/testing")` (file under extensions/ but not a regular extension)

"Race Test" window of the race editor: lets you try the race being edited. It creates a gameplay/race/race object from the current path (debug draw enabled), offers lap count, teleporting the vehicle to a start position, normal or rolling start (Start / Start Rolling, which disables the editor), AI driving tests (current vehicle or all), then displays times and an event log. State machine: setup, race, stopped. The module returns a constructor: require('/lua/ge/extensions/editor/raceEditor/testing')(raceEditor).

## Notes

- C:draw is only called when the window is open (editor_raceEditor.onUpdate); in "race" state, it calls race:onUpdate(dt) every frame.
- "AI Drive Test All Vehicles" only keeps vehicles within 100 m (squared distance ≤ 10000) of the default start position, if it exists; otherwise all vehicles.
- The AI is started with startAiVehicle(id, 0.8).
- The functions drawSetup, drawRace, drawStopped use self.race: setupRace must have been called before draw, otherwise self.race is nil.

## Class `C`

Race test window (windowDescription = 'General'). Instantiated with init(raceEditor). Fields: race (gameplay/race/race object), state ('setup', 'race' or 'stopped'), path.

The module returns a constructor: `local obj = require("editor_raceEditor_testing")(options)`.

| Method | Description | Line |
|---|---|---|
| `C:draw(dt)` | Draws the UI according to the state (setup, race with race update, stopped). | 44 |
| `C:drawEventLog()` | Displays the first vehicle's event log via race:inDrawEventlog. | 154 |
| `C:drawRace(dt)` | In-race UI: Stop button (aborts the race for all vehicles and reopens the editor), State (state dump), Recover (requestRecover), then times and log. | 110 |
| `C:drawSetup()` | Setup UI: lap count, "Move to <start>" buttons, Start, Start Rolling, move all vehicles to the start positions, AI tests. | 55 |
| `C:drawStopped()` | After-stop UI: Restart button (back to setup), times and log. | 131 |
| `C:drawTimes()` | Displays the first vehicle's times via race:inDrawTimes; a click toggles the detailed display. | 142 |
| `C:init(raceEditor)` | Stores raceEditor, startIndex = -1 and the 'setup' state. | 9 |
| `C:setPath(path)` | Sets the race path to test. | 15 |
| `C:setupRace()` | Creates a new race object for the path (keeping the previous lap count, otherwise 1), enables useDebugDraw, assigns the player vehicle and switches to the 'setup' state. | 19 |
| `C:startRace(vehIds, enableAi, rollingStart)` | Starts the race: applies config.rollingStart to the path, assigns the vehicles, calls race:startRace(), switches to the 'race' state and, if enableAi, starts the AI on each vehicle (relative speed 0.8). | 29 |

## Calls into the engine (C++)

- `be:` `getPlayerVehicleID`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/raceEditor/testing.lua`.*
