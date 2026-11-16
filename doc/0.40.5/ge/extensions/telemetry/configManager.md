# `telemetry_configManager`

*File: `lua/ge/extensions/telemetry/configManager.lua` · VM: Game Engine (GE) · 257 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `telemetry_configManager`: `extensions.load("telemetry_configManager")`, then the global `telemetry_configManager`

GE extension (depends on telemetry_userIdentity) that manages the telemetry configuration: reading the /telemetry/config.json cache, validation, periodic fetching from the server (s11/v1/telemetryConfig, with the clientFacts facts and the anonymous identifier), then application via a callback. It indicates which modules/trackers are enabled (moduleConfigs). Starting with the -telemetryLocal argument enables all trackers with their default values without ever contacting the server or sending anything.

## Notes

- Without a valid configuration, everything is disabled: getModuleConfig always returns the same table {enabled = false} (no allocation).
- Validation: enabled boolean; runIds list of <= 32 strings of 4 to 64 characters of the form ^R[A-Z0-9]+$; ttlHours and reportIntervalHours numeric between 1/60 and 168 h.
- The cache is reused as long as its age is below ttlHours (24 h by default); a new fetch attempt at most every 300 s; expiry test every 60 s when polling is active and the online session is authenticated.
- On a network failure, the last known server configuration is kept.
- The telemetry schema version is the string '30'.
- The extension is in 'manual' unload mode.

**Dependencies (loaded first):** `telemetry_userIdentity`

## Functions

| Function | Description | Line |
|---|---|---|
| `telemetry_configManager.checkConfigExpiry()` | If the retry delay has elapsed and the config's TTL is exceeded, relaunches fetchConfigFromAPI and applies the new config. At most one attempt every 300 s. | 145 |
| `telemetry_configManager.fetchConfigFromAPI(callback)` | Calls core_online.apiCall('s11/v1/telemetryConfig') sending the client facts and the anonymous identifier. If the response is valid, saves it to /telemetry/config.json and calls callback; otherwise, calls callback with a disabled default config (unless a config already exists). | 105 |
| `telemetry_configManager.getConfig()` | Returns the currently applied configuration. | 158 |
| `telemetry_configManager.getModuleConfig(moduleName)` | Returns the configuration of a telemetry module: {enabled = true} in local mode, the moduleConfigs[moduleName] table if it exists, otherwise the shared table {enabled = false}. | 162 |
| `telemetry_configManager.getSurveyIntervalHours(moduleName, defaultHours)` | Sampling interval of a module in hours: surveyIntervalHours, or surveyIntervalDays * 24 for old caches, otherwise the default value. Old caches in days are still read until all installations have picked up the hours format. | 176 |
| `telemetry_configManager.getTelemetryVersion()` | Returns the telemetry schema version. | 187 |
| `telemetry_configManager.initializeConfig(callback)` | Loads the configuration: in local mode, applies an enabled default config; otherwise enables polling, applies the cache if it is valid and recent, otherwise a disabled default config (the actual fetch happens after online authentication). *(internal)* | 191 |
| `telemetry_configManager.isLocalOnly()` | Indicates whether the game was launched with -telemetryLocal: all trackers are active with their default values, the server is never queried and nothing is sent. | 31 |
| `telemetry_configManager.isModuleEnabled(moduleName)` | Indicates whether a module is enabled (getModuleConfig(...).enabled == true). | 170 |
| `telemetry_configManager.onExtensionLoaded()` | Load hook: sets the extension to manual unload mode. *(internal)* *(hook)* | 241 |
| `telemetry_configManager.setPollingEnabled(enabled)` | Enables or turns off polling: installs/removes the onUpdate hooks (expiry test every 60 s if the online session is authenticated) and onOnlineStateChanged (test as soon as connected), then calls extensions.hookUpdate. | 230 |

### Parameter details

#### `telemetry_configManager.fetchConfigFromAPI(callback)`

Calls core_online.apiCall('s11/v1/telemetryConfig') sending the client facts and the anonymous identifier. If the response is valid, saves it to /telemetry/config.json and calls callback; otherwise, calls callback with a disabled default config (unless a config already exists).

- `callback` (*function|nil*) : Called with the obtained configuration.

#### `telemetry_configManager.getConfig()`

Returns the currently applied configuration.

- **returns**: table|nil Config (enabled, ttlHours, reportIntervalHours, runIds, moduleConfigs) or nil before initializeConfig.

#### `telemetry_configManager.getModuleConfig(moduleName)`

Returns the configuration of a telemetry module: {enabled = true} in local mode, the moduleConfigs[moduleName] table if it exists, otherwise the shared table {enabled = false}.

- `moduleName` (*string*) : Module/tracker name.
- **returns**: table Module config (do not modify it: it may be shared).

#### `telemetry_configManager.getSurveyIntervalHours(moduleName, defaultHours)`

Sampling interval of a module in hours: surveyIntervalHours, or surveyIntervalDays * 24 for old caches, otherwise the default value. Old caches in days are still read until all installations have picked up the hours format.

- `moduleName` (*string*) : Module name.
- `defaultHours` (*number*) : Value returned if nothing is configured.
- **returns**: number Interval in hours.

#### `telemetry_configManager.getTelemetryVersion()`

Returns the telemetry schema version.

- **returns**: string Currently '30'.

#### `telemetry_configManager.initializeConfig(callback)`

Loads the configuration: in local mode, applies an enabled default config; otherwise enables polling, applies the cache if it is valid and recent, otherwise a disabled default config (the actual fetch happens after online authentication).

- `callback` (*function|nil*) : Called with the config on each application (and stored for later updates).

#### `telemetry_configManager.isLocalOnly()`

Indicates whether the game was launched with -telemetryLocal: all trackers are active with their default values, the server is never queried and nothing is sent.

- **returns**: boolean true if the argument is present.

#### `telemetry_configManager.isModuleEnabled(moduleName)`

Indicates whether a module is enabled (getModuleConfig(...).enabled == true).

- `moduleName` (*string*) : Module/tracker name.
- **returns**: boolean true if enabled.

#### `telemetry_configManager.setPollingEnabled(enabled)`

Enables or turns off polling: installs/removes the onUpdate hooks (expiry test every 60 s if the online session is authenticated) and onOnlineStateChanged (test as soon as connected), then calls extensions.hookUpdate.

- `enabled` (*boolean*) : true to enable.

## Fields

| Field | Type | Description |
|---|---|---|
| `dependencies` | string[] | {'telemetry_userIdentity'}. |

## Emitted hooks

Events broadcast to extensions by `extensions.hook`:

- `onOnlineStateChanged` — listened to by 3 module(s)
- `onUpdate` — listened to by 186 module(s)

## Calls into the engine (C++)

- `Engine.` `getStartingArgs`
- `FS:` `directoryCreate`, `directoryExists`, `fileExists`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/telemetry/configManager.lua`.*
