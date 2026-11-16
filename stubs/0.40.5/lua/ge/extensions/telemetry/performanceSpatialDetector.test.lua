---@meta
-- tim19Atlas stub generated from lua/ge/extensions/telemetry/performanceSpatialDetector.test.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Unit tests of telemetry/performanceSpatialDetector (runTestFiles("performanceSpatialDetector")).
--- Access: extension `telemetry_performanceSpatialDetector.test`: `extensions.load("telemetry_performanceSpatialDetector.test")`, then the global `telemetry_performanceSpatialDetector.test`
---@class telemetry_performanceSpatialDetector.test
telemetry_performanceSpatialDetector.test = {}

--- Checks that a drop below the absolute FPS threshold produces an event on return to normal.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/telemetry/performanceSpatialDetector.test.lua:27
---@param ctx table Test framework context.
function telemetry_performanceSpatialDetector.test.testAbsoluteDip(ctx) end

--- Checks that the cooldown delay suppresses a new episode.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/telemetry/performanceSpatialDetector.test.lua:132
---@param ctx table Test framework context.
function telemetry_performanceSpatialDetector.test.testCooldownSuppressesDip(ctx) end

--- Checks that a drop shorter than dipMinDurationMs produces nothing.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/telemetry/performanceSpatialDetector.test.lua:51
---@param ctx table Test framework context.
function telemetry_performanceSpatialDetector.test.testDipMustBeSustained(ctx) end

--- Checks that with absoluteAllowed = false, a capped FPS does not trigger an absolute dip.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/telemetry/performanceSpatialDetector.test.lua:99
---@param ctx table Test framework context.
function telemetry_performanceSpatialDetector.test.testIntentionalCapDisablesAbsoluteTrigger(ctx) end

--- Checks that an episode exceeding maxEpisodeMs is split.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/telemetry/performanceSpatialDetector.test.lua:121
---@param ctx table Test framework context.
function telemetry_performanceSpatialDetector.test.testLongDipIsSegmented(ctx) end

--- Checks that finish() closes an open, sustained episode.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/telemetry/performanceSpatialDetector.test.lua:109
---@param ctx table Test framework context.
function telemetry_performanceSpatialDetector.test.testOpenSustainedDipCanBeFinished(ctx) end

--- Checks that the worst frame is captured once then that the event is emitted on recovery.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/telemetry/performanceSpatialDetector.test.lua:75
---@param ctx table Test framework context.
function telemetry_performanceSpatialDetector.test.testRecoveryEmitsWorstFrameOnce(ctx) end

--- Checks that an episode with no observed duration (a single sample) does not emit an event.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/telemetry/performanceSpatialDetector.test.lua:65
---@param ctx table Test framework context.
function telemetry_performanceSpatialDetector.test.testRecoveryWithoutObservedDurationDoesNotEmit(ctx) end

--- Checks that a frame time above baseline * ratio produces an event.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/telemetry/performanceSpatialDetector.test.lua:39
---@param ctx table Test framework context.
function telemetry_performanceSpatialDetector.test.testRelativeDip(ctx) end

--- Checks that maxDipEventsPerSession caps the number of events.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/telemetry/performanceSpatialDetector.test.lua:153
---@param ctx table Test framework context.
function telemetry_performanceSpatialDetector.test.testSessionCapSuppressesDip(ctx) end

