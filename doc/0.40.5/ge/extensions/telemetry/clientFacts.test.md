# `telemetry_clientFacts.test`

*File: `lua/ge/extensions/telemetry/clientFacts.test.lua` · VM: Game Engine (GE) · 160 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `telemetry_clientFacts.test`: `extensions.load("telemetry_clientFacts.test")`, then the global `telemetry_clientFacts.test`

Unit tests of telemetry/clientFacts, run with extensions.testFramework_TestManager:runTestFiles("clientFacts"). Each testXxx(ctx) function receives a test context (ctx:assert, ctx:assertEqual). Of no direct interest to a modder, except as an example of clientFacts usage.

## Functions

| Function | Description | Line |
|---|---|---|
| `telemetry_clientFacts.test.testCiProviderDetection(ctx)` | Checks that each known CI environment variable (JENKINS_URL, GITLAB_CI, GITHUB_ACTIONS, TF_BUILD, TEAMCITY_VERSION, BUILDKITE, CIRCLECI, TRAVIS, APPVEYOR, CI) gives the right provider. *(internal)* | 17 |
| `telemetry_clientFacts.test.testCiProviderPriority(ctx)` | Checks that jenkins wins when several CI variables are defined. *(internal)* | 39 |
| `telemetry_clientFacts.test.testCollectedContextContract(ctx)` | Mocks Engine, os.getenv and the beamng_* globals, calls clientFacts.collect('30') then checks the resulting fields (platform 'pc', provider gitlab, osVersion, deviceType 'desktop', memory, GPU, false booleans kept, VR). Then restores the globals. *(internal)* | 64 |
| `telemetry_clientFacts.test.testDesktopPlatformNormalization(ctx)` | Checks normalizePlatform: '' gives 'pc', 'steamdeck' is kept, nil stays nil. *(internal)* | 137 |
| `telemetry_clientFacts.test.testFalseCiFlags(ctx)` | Checks that the values '0', 'false', 'FALSE' and '' do not trigger CI detection. *(internal)* | 51 |
| `telemetry_clientFacts.test.testPreferredGpuSelection(ctx)` | Checks selectPreferredGPU: first dedicated adapter preferred, fallback to the first, nil for an empty list. *(internal)* | 143 |

### Parameter details

#### `telemetry_clientFacts.test.testCiProviderDetection(ctx)`

Checks that each known CI environment variable (JENKINS_URL, GITLAB_CI, GITHUB_ACTIONS, TF_BUILD, TEAMCITY_VERSION, BUILDKITE, CIRCLECI, TRAVIS, APPVEYOR, CI) gives the right provider.

- `ctx` (*table*) : Test framework context.

#### `telemetry_clientFacts.test.testCiProviderPriority(ctx)`

Checks that jenkins wins when several CI variables are defined.

- `ctx` (*table*) : Test framework context.

#### `telemetry_clientFacts.test.testCollectedContextContract(ctx)`

Mocks Engine, os.getenv and the beamng_* globals, calls clientFacts.collect('30') then checks the resulting fields (platform 'pc', provider gitlab, osVersion, deviceType 'desktop', memory, GPU, false booleans kept, VR). Then restores the globals.

- `ctx` (*table*) : Test framework context.

#### `telemetry_clientFacts.test.testDesktopPlatformNormalization(ctx)`

Checks normalizePlatform: '' gives 'pc', 'steamdeck' is kept, nil stays nil.

- `ctx` (*table*) : Test framework context.

#### `telemetry_clientFacts.test.testFalseCiFlags(ctx)`

Checks that the values '0', 'false', 'FALSE' and '' do not trigger CI detection.

- `ctx` (*table*) : Test framework context.

#### `telemetry_clientFacts.test.testPreferredGpuSelection(ctx)`

Checks selectPreferredGPU: first dedicated adapter preferred, fallback to the first, nil for an empty list.

- `ctx` (*table*) : Test framework context.

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/telemetry/clientFacts.test.lua`.*
