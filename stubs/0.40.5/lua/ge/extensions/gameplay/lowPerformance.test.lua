---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/lowPerformance.test.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Automated tests of the gameplay/lowPerformance detector, to be run with require('testFramework/TestManager'):runTestFiles('gameplay/lowPerformance'). Each test loads lowPerformance.lua in a mocked environment (setfenv with fake settings, Engine, ui_router, VariableRegistry, guihooks...) then advances frames at a given rate to verify state transitions. This is not a game API: no direct use for a modder, except as an example of a test with a mocked environment.
--- Access: extension `gameplay_lowPerformance.test`: `extensions.load("gameplay_lowPerformance.test")`, then the global `gameplay_lowPerformance.test`
---@class gameplay_lowPerformance.test
gameplay_lowPerformance.test = {}

--- In mission mode nothing is detected or notified; switching from freeroam to mission cancels the effect (isLowPerformance false, no pause notice).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/lowPerformance.test.lua:91
---@param ctx table Test context.
function gameplay_lowPerformance.test.testCuratedContentIsNeverChecked(ctx) end

--- A brief drop (average below 25 for about 3 s, less than the required 5 s) triggers nothing; a prolonged drop to 5 FPS triggers.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/lowPerformance.test.lua:57
---@param ctx table Test context.
function gameplay_lowPerformance.test.testDipShorterThanDwellDoesNotTrigger(ctx) end

--- Verifies muteAndConfirmPendingSpawn (notifyLowPerformance setting = false, detection kept without notification) and simple menu mode (notifications always active, 2-button dialog instead of 3).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/lowPerformance.test.lua:131
---@param ctx table Test context.
function gameplay_lowPerformance.test.testNotificationsCanBeMuted(ctx) end

--- Verifies that pausing (route other than play), a vehicle spawn and an ongoing screen fade restart the grace period.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/lowPerformance.test.lua:70
---@param ctx table Test context.
function gameplay_lowPerformance.test.testSkippedFramesRestartGrace(ctx) end

--- confirmSpawn executes directly outside low performance; in low performance it returns false and defers until confirmPendingSpawn; the warning only appears once per episode (two dialogs over two episodes).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/lowPerformance.test.lua:107
---@param ctx table Test context.
function gameplay_lowPerformance.test.testSpawnWarningOncePerEpisode(ctx) end

--- 20 FPS for 12 s must enable low performance (a single toast); 60 FPS for 15 s must disable it.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/lowPerformance.test.lua:48
---@param ctx table Test context.
function gameplay_lowPerformance.test.testSustainedLowFpsEntersAndRecovers(ctx) end

