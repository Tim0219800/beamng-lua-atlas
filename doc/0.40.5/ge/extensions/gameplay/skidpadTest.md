# `gameplay_skidpadTest`

*File: `lua/ge/extensions/gameplay/skidpadTest.lua` · VM: Game Engine (GE) · 61 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `gameplay_skidpadTest`: `extensions.load("gameplay_skidpadTest")`, then the global `gameplay_skidpadTest`

Skidpad test extension: teleports a vehicle to the "skidpadSpawn" start point then makes the AI follow the circuit defined by the waypoints skidpadWP1 to skidpadWP4 (2 laps). Uses util_stepHandler to chain the steps. The level must contain these scene objects.

## Example

```lua
extensions.load('gameplay_skidpadTest')
gameplay_skidpadTest.startTest(be:getPlayerVehicleID(0))
```

## Notes

- testResults is never filled by this file: getData() always returns nil (reset to nil at start).
- cancelTest only raises a cancelTestRequested flag that is read nowhere: cancellation has no effect.
- startTest assumes the "skidpadSpawn" object exists, otherwise Lua error (spawnPoint nil).

## Functions

| Function | Description | Line |
|---|---|---|
| `gameplay_skidpadTest.cancelTest()` | Raises the cancel flag (no real effect, see notes). | 53 |
| `gameplay_skidpadTest.getData()` | Returns the test results (testResults). | 49 |
| `gameplay_skidpadTest.startTest(vehId)` | Starts the sequence: safe teleport of the vehicle onto skidpadSpawn (orientation flipped 180°), wait 0.2 s, then ai.driveUsingPath on the waypoints skidpadWP1..4, WP1 with noOfLaps = 2 and aggression = 1. | 44 |

### Parameter details

#### `gameplay_skidpadTest.getData()`

Returns the test results (testResults).

- **returns**: table|nil Always nil in this version (never filled).

#### `gameplay_skidpadTest.startTest(vehId)`

Starts the sequence: safe teleport of the vehicle onto skidpadSpawn (orientation flipped 180°), wait 0.2 s, then ai.driveUsingPath on the waypoints skidpadWP1..4, WP1 with noOfLaps = 2 and aggression = 1.

- `vehId` (*integer*) : Identifier of the vehicle to test.

## Calls into the engine (C++)

- `scenetree.` `findObject`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/gameplay/skidpadTest.lua`.*
