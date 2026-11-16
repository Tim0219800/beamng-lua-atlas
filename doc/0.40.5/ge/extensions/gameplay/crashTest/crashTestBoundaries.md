# `gameplay_crashTest_crashTestBoundaries`

*File: `lua/ge/extensions/gameplay/crashTest/crashTestBoundaries.lua` · VM: Game Engine (GE) · 106 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `gameplay_crashTest_crashTestBoundaries`: `extensions.load("gameplay_crashTest_crashTestBoundaries")`, then the global `gameplay_crashTest_crashTestBoundaries`

Manages the zone bounds of the collision test scenario (crash test). Loads a .sites.json file of the mission (bounds.sites.json, or boundsStep<id>.sites.json if the step has its own file) and checks every frame whether the player's vehicle is outside all the zones. If so, it calls gameplay_crashTest_scenarioManager.onPlayerOutOfBounds(). Also draws the zones in white, or in flashing red when the player is outside.

## Notes

- Probable bug: in checkOutOfBounds, the loop 'for i = 0, 8' always calls oobb:getPoint(0) instead of getPoint(i); only the box's first corner is tested.
- Probable bug: setParameters tests params.drawBoundsWhenNear_ == nil (with a trailing underscore) and then sets drawBoundsWhenNear to true; the field is therefore never actually read and drawing is enabled as soon as a file is given.
- setDebug stores isBeingDebugged but this variable is never used elsewhere.
- checkForStepBoundsFile contains a debug dump("new step") left in the code.
- Depends on the foreground mission (gameplay_missions_missionManager) to resolve the bounds file paths.

## Functions

| Function | Description | Line |
|---|---|---|
| `gameplay_crashTest_crashTestBoundaries.deactivateBounds()` | Disables the bounds (equivalent to setParameters without filePath). | 96 |
| `gameplay_crashTest_crashTestBoundaries.onNewCrashTestStep(stepData)` | Hook called at the start of a crash test step: loads this step's bounds file (or bounds.sites.json by default). *(internal)* *(hook)* | 92 |
| `gameplay_crashTest_crashTestBoundaries.onUpdate()` | Hook called every frame: tests whether the player vehicle is out of bounds, notifies scenarioManager if so and draws the bounds. *(internal)* *(hook)* | 64 |
| `gameplay_crashTest_crashTestBoundaries.setDebug(debug)` | Stores a debug flag (not used elsewhere in the file). | 75 |
| `gameplay_crashTest_crashTestBoundaries.setParameters(params)` | Loads the bounds zones from a sites file and finalizes them. Without filePath, removes the bounds and sets isPlayerOutOfBounds back to false. | 16 |

### Parameter details

#### `gameplay_crashTest_crashTestBoundaries.onNewCrashTestStep(stepData)`

Hook called at the start of a crash test step: loads this step's bounds file (or bounds.sites.json by default).

- `stepData` (*table*) : Step data: id, hasStepBoundsFile.

#### `gameplay_crashTest_crashTestBoundaries.setDebug(debug)`

Stores a debug flag (not used elsewhere in the file).

- `debug` (*boolean*) : Debug flag.

#### `gameplay_crashTest_crashTestBoundaries.setParameters(params)`

Loads the bounds zones from a sites file and finalizes them. Without filePath, removes the bounds and sets isPlayerOutOfBounds back to false.

- `params` (*table|nil*) : Table with filePath (string): path of the .sites.json file; drawBoundsWhenNear_ (see notes).

## Calls into the engine (C++)

- `be:` `getPlayerVehicleID`
- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/gameplay/crashTest/crashTestBoundaries.lua`.*
