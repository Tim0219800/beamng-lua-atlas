# `telemetry_clientFacts`

*File: `lua/ge/extensions/telemetry/clientFacts.lua` · VM: Game Engine (GE) · 163 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `telemetry_clientFacts`: `extensions.load("telemetry_clientFacts")`, then the global `telemetry_clientFacts`

Module (loaded by require, not an extension) that gathers the telemetry's "client facts": game version, platform, build type, OS, CPU, preferred GPU, memory, battery, VR, headless mode, continuous integration provider, tech license, etc. configManager sends it to the server when fetching the telemetry configuration. Unknown or invalid values are omitted (nil).

## Notes

- The text values 'unknown' or empty, the numbers <= 0 (or < 0 depending on the field) and the booleans that are not booleans are replaced by nil.
- deviceType is 'steamdeck', 'laptop' or 'desktop' (depending on the presence of a battery, on PC), otherwise 'unknown'.
- osVersion has the form 'major.minor.build' and is only set if the three numbers are valid.

## Functions

| Function | Description | Line |
|---|---|---|
| `telemetry_clientFacts.collect(version)` | Builds the client facts table by querying Engine.Platform (OS, CPU, memory, power, GPU), Engine.Render (adapter type), the beamng_* globals, headless_mode, OnlineServiceProvider.branch, ResearchVerifier.isTechLicenseVerified() and render_openxr.state. Tolerates the absence of these APIs. | 101 |
| `telemetry_clientFacts.detectCiProvider(getEnvironment)` | Detects a continuous integration runner via environment variables. Priority order: jenkins (JENKINS_URL, JENKINS_HOME), gitlab (GITLAB_CI), github-actions, azure-pipelines (TF_BUILD), teamcity, buildkite, circleci, travis, appveyor, then 'generic' if CI is defined. A value of '', '0' or 'false' (case-insensitive) counts as undefined. | 47 |
| `telemetry_clientFacts.normalizePlatform(platform)` | Normalizes the platform name: the empty string (PC) becomes 'pc', 'unknown' or a non-text value becomes nil, the rest is kept. | 62 |
| `telemetry_clientFacts.selectPreferredGPU(adapters)` | Chooses the graphics adapter: the first of type 'dedicated', otherwise the first in the list; nil if the list is absent or empty. | 67 |

### Parameter details

#### `telemetry_clientFacts.collect(version)`

Builds the client facts table by querying Engine.Platform (OS, CPU, memory, power, GPU), Engine.Render (adapter type), the beamng_* globals, headless_mode, OnlineServiceProvider.branch, ResearchVerifier.isTechLicenseVerified() and render_openxr.state. Tolerates the absence of these APIs.

- `version` (*string*) : Telemetry schema version (telemetryVersion from configManager).
- **returns**: table Fields: version, product, productVersion, platform, buildType, buildNumber, arch, isCiRunner, ciProvider, osType, osBits, osVersion*, deviceType, systemMemoryBytes, cpu*, gpu*, gfxAdapterType, headless, distributionBranch, techLicense, batteryPresent, vrAvailable.

#### `telemetry_clientFacts.detectCiProvider(getEnvironment)`

Detects a continuous integration runner via environment variables. Priority order: jenkins (JENKINS_URL, JENKINS_HOME), gitlab (GITLAB_CI), github-actions, azure-pipelines (TF_BUILD), teamcity, buildkite, circleci, travis, appveyor, then 'generic' if CI is defined. A value of '', '0' or 'false' (case-insensitive) counts as undefined.

- `getEnvironment` (*function|nil*) : Function name -> value; os.getenv by default (injectable for tests).
- **returns**: boolean true if a CI runner is detected.
- **returns**: string|nil Provider name.

#### `telemetry_clientFacts.normalizePlatform(platform)`

Normalizes the platform name: the empty string (PC) becomes 'pc', 'unknown' or a non-text value becomes nil, the rest is kept.

- `platform` (*string|nil*) : Raw value of Engine.Platform.getPlatform().
- **returns**: string|nil Normalized platform.

#### `telemetry_clientFacts.selectPreferredGPU(adapters)`

Chooses the graphics adapter: the first of type 'dedicated', otherwise the first in the list; nil if the list is absent or empty.

- `adapters` (*table[]|nil*) : List from Engine.Platform.getGPUAdaptersInfo().
- **returns**: table|nil Chosen adapter.

## Calls into the engine (C++)

- `ResearchVerifier.` `isTechLicenseVerified`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/telemetry/clientFacts.lua`.*
