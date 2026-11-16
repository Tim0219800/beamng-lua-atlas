# `gameplay_lowPerformance.test`

*File: `lua/ge/extensions/gameplay/lowPerformance.test.lua` · VM: Game Engine (GE) · 161 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `gameplay_lowPerformance.test`: `extensions.load("gameplay_lowPerformance.test")`, then the global `gameplay_lowPerformance.test`

Automated tests of the gameplay/lowPerformance detector, to be run with require('testFramework/TestManager'):runTestFiles('gameplay/lowPerformance'). Each test loads lowPerformance.lua in a mocked environment (setfenv with fake settings, Engine, ui_router, VariableRegistry, guihooks...) then advances frames at a given rate to verify state transitions. This is not a game API: no direct use for a modder, except as an example of a test with a mocked environment.

## Notes

- The local function runtime(mode) builds the mocked environment; runFrames(detector, state, fps, seconds) calls onUpdate with dt = 1/fps.
- Each testXxx function receives a ctx context (assert and assertEqual methods) provided by testFramework/TestManager.

## Functions

| Function | Description | Line |
|---|---|---|
| `gameplay_lowPerformance.test.testCuratedContentIsNeverChecked(ctx)` | In mission mode nothing is detected or notified; switching from freeroam to mission cancels the effect (isLowPerformance false, no pause notice). *(internal)* | 91 |
| `gameplay_lowPerformance.test.testDipShorterThanDwellDoesNotTrigger(ctx)` | A brief drop (average below 25 for about 3 s, less than the required 5 s) triggers nothing; a prolonged drop to 5 FPS triggers. *(internal)* | 57 |
| `gameplay_lowPerformance.test.testNotificationsCanBeMuted(ctx)` | Verifies muteAndConfirmPendingSpawn (notifyLowPerformance setting = false, detection kept without notification) and simple menu mode (notifications always active, 2-button dialog instead of 3). *(internal)* | 131 |
| `gameplay_lowPerformance.test.testSkippedFramesRestartGrace(ctx)` | Verifies that pausing (route other than play), a vehicle spawn and an ongoing screen fade restart the grace period. *(internal)* | 70 |
| `gameplay_lowPerformance.test.testSpawnWarningOncePerEpisode(ctx)` | confirmSpawn executes directly outside low performance; in low performance it returns false and defers until confirmPendingSpawn; the warning only appears once per episode (two dialogs over two episodes). *(internal)* | 107 |
| `gameplay_lowPerformance.test.testSustainedLowFpsEntersAndRecovers(ctx)` | 20 FPS for 12 s must enable low performance (a single toast); 60 FPS for 15 s must disable it. *(internal)* | 48 |

### Parameter details

#### `gameplay_lowPerformance.test.testCuratedContentIsNeverChecked(ctx)`

In mission mode nothing is detected or notified; switching from freeroam to mission cancels the effect (isLowPerformance false, no pause notice).

- `ctx` (*table*) : Test context.

#### `gameplay_lowPerformance.test.testDipShorterThanDwellDoesNotTrigger(ctx)`

A brief drop (average below 25 for about 3 s, less than the required 5 s) triggers nothing; a prolonged drop to 5 FPS triggers.

- `ctx` (*table*) : Test context.

#### `gameplay_lowPerformance.test.testNotificationsCanBeMuted(ctx)`

Verifies muteAndConfirmPendingSpawn (notifyLowPerformance setting = false, detection kept without notification) and simple menu mode (notifications always active, 2-button dialog instead of 3).

- `ctx` (*table*) : Test context.

#### `gameplay_lowPerformance.test.testSkippedFramesRestartGrace(ctx)`

Verifies that pausing (route other than play), a vehicle spawn and an ongoing screen fade restart the grace period.

- `ctx` (*table*) : Test context.

#### `gameplay_lowPerformance.test.testSpawnWarningOncePerEpisode(ctx)`

confirmSpawn executes directly outside low performance; in low performance it returns false and defers until confirmPendingSpawn; the warning only appears once per episode (two dialogs over two episodes).

- `ctx` (*table*) : Test context.

#### `gameplay_lowPerformance.test.testSustainedLowFpsEntersAndRecovers(ctx)`

20 FPS for 12 s must enable low performance (a single toast); 60 FPS for 15 s must disable it.

- `ctx` (*table*) : Test context.

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/gameplay/lowPerformance.test.lua`.*
