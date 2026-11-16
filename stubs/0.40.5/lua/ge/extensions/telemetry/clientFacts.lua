---@meta
-- tim19Atlas stub generated from lua/ge/extensions/telemetry/clientFacts.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Module (loaded by require, not an extension) that gathers the telemetry's "client facts": game version, platform, build type, OS, CPU, preferred GPU, memory, battery, VR, headless mode, continuous integration provider, tech license, etc. configManager sends it to the server when fetching the telemetry configuration. Unknown or invalid values are omitted (nil).
--- Access: extension `telemetry_clientFacts`: `extensions.load("telemetry_clientFacts")`, then the global `telemetry_clientFacts`
---@class telemetry_clientFacts
telemetry_clientFacts = {}

--- Builds the client facts table by querying Engine.Platform (OS, CPU, memory, power, GPU), Engine.Render (adapter type), the beamng_* globals, headless_mode, OnlineServiceProvider.branch, ResearchVerifier.isTechLicenseVerified() and render_openxr.state. Tolerates the absence of these APIs.
---Source: lua/ge/extensions/telemetry/clientFacts.lua:101
---@param version string Telemetry schema version (telemetryVersion from configManager).
---@return table  Fields: version, product, productVersion, platform, buildType, buildNumber, arch, isCiRunner, ciProvider, osType, osBits, osVersion*, deviceType, systemMemoryBytes, cpu*, gpu*, gfxAdapterType, headless, distributionBranch, techLicense, batteryPresent, vrAvailable.
function telemetry_clientFacts.collect(version) end

--- Detects a continuous integration runner via environment variables. Priority order: jenkins (JENKINS_URL, JENKINS_HOME), gitlab (GITLAB_CI), github-actions, azure-pipelines (TF_BUILD), teamcity, buildkite, circleci, travis, appveyor, then 'generic' if CI is defined. A value of '', '0' or 'false' (case-insensitive) counts as undefined.
---Source: lua/ge/extensions/telemetry/clientFacts.lua:47
---@param getEnvironment function|nil Function name -> value; os.getenv by default (injectable for tests).
---@return boolean  true if a CI runner is detected.
---@return string|nil  Provider name.
function telemetry_clientFacts.detectCiProvider(getEnvironment) end

--- Normalizes the platform name: the empty string (PC) becomes 'pc', 'unknown' or a non-text value becomes nil, the rest is kept.
---Source: lua/ge/extensions/telemetry/clientFacts.lua:62
---@param platform string|nil Raw value of Engine.Platform.getPlatform().
---@return string|nil  Normalized platform.
function telemetry_clientFacts.normalizePlatform(platform) end

--- Chooses the graphics adapter: the first of type 'dedicated', otherwise the first in the list; nil if the list is absent or empty.
---Source: lua/ge/extensions/telemetry/clientFacts.lua:67
---@param adapters table[]|nil List from Engine.Platform.getGPUAdaptersInfo().
---@return table|nil  Chosen adapter.
function telemetry_clientFacts.selectPreferredGPU(adapters) end

