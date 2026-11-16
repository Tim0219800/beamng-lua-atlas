# `ui_arrowGPS.test`

*File: `lua/ge/extensions/ui/arrowGPS.test.lua` · VM: Game Engine (GE) · 182 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `ui_arrowGPS.test`: `extensions.load("ui_arrowGPS.test")`, then the global `ui_arrowGPS.test`

Unit tests of the ui_arrowGPS extension (floating on-screen GPS arrow). The file loads arrowGPS.lua in a simulated environment (fake TSStatic createObject, fake core_camera, GFXDevice, scenetree) via loadfile + setfenv, then checks the lazy creation of the arrow, its reuse, its color, its rotation toward the highest-priority target and its recreation after the object is deleted. Useful to a modder to understand the ui_arrowGPS contract (setTarget, removeTarget, setScale, setDepth, setAppScreenPos, onPreRender).

## Example

```lua
require('testFramework/TestManager'):runTestFiles('ui/arrowGPS')
```

## Notes

- This is not a game extension: the module is run by testFramework/TestManager, not by extensions.load.
- Each test receives a ctx context (assert, assertEqual, assertNear) provided by the TestManager.
- Contract inferred from the tests: the arrow is only created on the first onPreRender with a target AND a player vehicle; the smallest priority value wins (priority 1 before 10); the shape used is art/shapes/interface/s_mm_arrow_floating.dae and the default color is '1 0.4 0.2 1'.

## Functions

| Function | Description | Line |
|---|---|---|
| `ui_arrowGPS.test.testIdleExtensionDoesNotCreateArrow(ctx)` | Checks that no object is created as long as no valid target (with pos) is set: onPreRender, setTarget without pos, removeTarget and onExtensionUnloaded create nothing. *(internal)* | 54 |
| `ui_arrowGPS.test.testPriorityColorAndTargetRemoval(ctx)` | Checks that the lowest-priority target (1) dictates the arrow's color and direction, that removeTarget switches to the next target, and that the arrow is hidden when there is no target left. *(internal)* | 97 |
| `ui_arrowGPS.test.testRenderedArrowIsReusedAndHidesWithoutPlayer(ctx)` | Checks the default color and shape, that the arrow is hidden when the player disappears then shown again, without recreation (a single object created). *(internal)* | 81 |
| `ui_arrowGPS.test.testSceneDeletionRecreatesArrowWithoutTargetUpdate(ctx)` | Checks that if the scene object is deleted, onPreRender recreates the arrow keeping color and scale (setScale), without a new call to setTarget. *(internal)* | 115 |
| `ui_arrowGPS.test.testSettingsBeforeCreationAffectFirstRender(ctx)` | Checks that setScale, setDepth and setAppScreenPos called before the arrow is created are taken into account from the first render (scale 0.08, depth 0.3, screen position 0.75/0.25). *(internal)* | 145 |
| `ui_arrowGPS.test.testTargetUpdateAfterSceneDeletionDoesNotUseOldObject(ctx)` | Checks that a setTarget/setScale after the object's deletion does not access the old object (the fake object raises an error otherwise) and that the recreation happens at the next onPreRender. *(internal)* | 131 |
| `ui_arrowGPS.test.testTargetWaitsForPlayerAndRender(ctx)` | Checks that the arrow waits for a player vehicle and an onPreRender: without a player nothing is created, as soon as the player exists the arrow is created and visible. *(internal)* | 68 |
| `ui_arrowGPS.test.testUnloadClearsObjectAndTargetState(ctx)` | Checks that onExtensionUnloaded deletes the object and empties the targets state, and that the extension remains usable afterwards with new targets. *(internal)* | 162 |

### Parameter details

#### `ui_arrowGPS.test.testIdleExtensionDoesNotCreateArrow(ctx)`

Checks that no object is created as long as no valid target (with pos) is set: onPreRender, setTarget without pos, removeTarget and onExtensionUnloaded create nothing.

- `ctx` (*table*) : TestManager test context.

#### `ui_arrowGPS.test.testPriorityColorAndTargetRemoval(ctx)`

Checks that the lowest-priority target (1) dictates the arrow's color and direction, that removeTarget switches to the next target, and that the arrow is hidden when there is no target left.

- `ctx` (*table*) : TestManager test context.

#### `ui_arrowGPS.test.testRenderedArrowIsReusedAndHidesWithoutPlayer(ctx)`

Checks the default color and shape, that the arrow is hidden when the player disappears then shown again, without recreation (a single object created).

- `ctx` (*table*) : TestManager test context.

#### `ui_arrowGPS.test.testSceneDeletionRecreatesArrowWithoutTargetUpdate(ctx)`

Checks that if the scene object is deleted, onPreRender recreates the arrow keeping color and scale (setScale), without a new call to setTarget.

- `ctx` (*table*) : TestManager test context.

#### `ui_arrowGPS.test.testSettingsBeforeCreationAffectFirstRender(ctx)`

Checks that setScale, setDepth and setAppScreenPos called before the arrow is created are taken into account from the first render (scale 0.08, depth 0.3, screen position 0.75/0.25).

- `ctx` (*table*) : TestManager test context.

#### `ui_arrowGPS.test.testTargetUpdateAfterSceneDeletionDoesNotUseOldObject(ctx)`

Checks that a setTarget/setScale after the object's deletion does not access the old object (the fake object raises an error otherwise) and that the recreation happens at the next onPreRender.

- `ctx` (*table*) : TestManager test context.

#### `ui_arrowGPS.test.testTargetWaitsForPlayerAndRender(ctx)`

Checks that the arrow waits for a player vehicle and an onPreRender: without a player nothing is created, as soon as the player exists the arrow is created and visible.

- `ctx` (*table*) : TestManager test context.

#### `ui_arrowGPS.test.testUnloadClearsObjectAndTargetState(ctx)`

Checks that onExtensionUnloaded deletes the object and empties the targets state, and that the extension remains usable afterwards with new targets.

- `ctx` (*table*) : TestManager test context.

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/ui/arrowGPS.test.lua`.*
