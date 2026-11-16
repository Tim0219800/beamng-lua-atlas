---@meta
-- tim19Atlas stub generated from lua/ge/extensions/telemetry/clientFacts.test.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Unit tests of telemetry/clientFacts, run with extensions.testFramework_TestManager:runTestFiles("clientFacts"). Each testXxx(ctx) function receives a test context (ctx:assert, ctx:assertEqual). Of no direct interest to a modder, except as an example of clientFacts usage.
--- Access: extension `telemetry_clientFacts.test`: `extensions.load("telemetry_clientFacts.test")`, then the global `telemetry_clientFacts.test`
---@class telemetry_clientFacts.test
telemetry_clientFacts.test = {}

--- Checks that each known CI environment variable (JENKINS_URL, GITLAB_CI, GITHUB_ACTIONS, TF_BUILD, TEAMCITY_VERSION, BUILDKITE, CIRCLECI, TRAVIS, APPVEYOR, CI) gives the right provider.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/telemetry/clientFacts.test.lua:17
---@param ctx table Test framework context.
function telemetry_clientFacts.test.testCiProviderDetection(ctx) end

--- Checks that jenkins wins when several CI variables are defined.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/telemetry/clientFacts.test.lua:39
---@param ctx table Test framework context.
function telemetry_clientFacts.test.testCiProviderPriority(ctx) end

--- Mocks Engine, os.getenv and the beamng_* globals, calls clientFacts.collect('30') then checks the resulting fields (platform 'pc', provider gitlab, osVersion, deviceType 'desktop', memory, GPU, false booleans kept, VR). Then restores the globals.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/telemetry/clientFacts.test.lua:64
---@param ctx table Test framework context.
function telemetry_clientFacts.test.testCollectedContextContract(ctx) end

--- Checks normalizePlatform: '' gives 'pc', 'steamdeck' is kept, nil stays nil.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/telemetry/clientFacts.test.lua:137
---@param ctx table Test framework context.
function telemetry_clientFacts.test.testDesktopPlatformNormalization(ctx) end

--- Checks that the values '0', 'false', 'FALSE' and '' do not trigger CI detection.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/telemetry/clientFacts.test.lua:51
---@param ctx table Test framework context.
function telemetry_clientFacts.test.testFalseCiFlags(ctx) end

--- Checks selectPreferredGPU: first dedicated adapter preferred, fallback to the first, nil for an empty list.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/telemetry/clientFacts.test.lua:143
---@param ctx table Test framework context.
function telemetry_clientFacts.test.testPreferredGpuSelection(ctx) end

