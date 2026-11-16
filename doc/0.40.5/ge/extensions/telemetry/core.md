# `telemetry_core`

*File: `lua/ge/extensions/telemetry/core.lua` · VM: Game Engine (GE) · 507 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `telemetry_core`: `extensions.load("telemetry_core")`, then the global `telemetry_core`

BeamNG's telemetry core (GE extension telemetry_core, depends on telemetry_configManager). It decides whether telemetry is active (consent in the settings, launch arguments, server config), buffers the events sent by the trackers (addEvent), writes them as JSON Lines in /telemetry/sessions/<id>.jsonl, automatically loads the trackers from the telemetry/trackers/ folder enabled by the config and the jsonFileReporter reporter that sends the sessions of previous runs. A modder normally does not need to call it; they can only observe the onTelemetryEventAdded hook.

## Example

```lua
-- from a tracker: one-off event and duration
telemetry_core.addEvent({name = "monEvenement", valeur = 3})
telemetry_core.startActivity("menu", {page = "options"})
telemetry_core.endActivity("menu")
```

## Notes

- Disabling: platform ps5/ps5pro; argument -notelemetry (takes priority over everything); AI agent mode (Engine.isAgentMode); verified tech license; otherwise the settings onlineFeatures == 'enable' and telemetry == 'enable' are required (the value 'ask' keeps telemetry off).
- Argument -telemetryLocal: all trackers active, nothing sent, data in /telemetry/local/. Argument -telemetry, or any non-shipping build: telemetry forced (a code comment says the non-shipping case is temporary).
- When telemetry is off, eventBuffer is nil and addEvent returns false without doing anything.
- Events are written to disk every 100 events, on deactivation and on triggerReportWrite. Each event receives a field t = os.clockhp(); do not set event.t yourself (an error is logged).
- The session identifier is 'YYYY-MM-DDTHH-MM-SSZ_<sha256 of random bytes>' (85 characters). After a reload of the Lua VMs (luaVmStartReason == 'reload'), the session is resumed if the runIds have not changed.
- The 'session' tracker is loaded first (priority 1), the others at priority 500; on unload the order is reversed. A tracker absent or disabled in moduleConfigs is not loaded.
- If the runIds change after the session is opened, a new session is created; the old one is deleted if it was not collecting for any run ("stub" session from startup).

**Dependencies (loaded first):** `telemetry_configManager`

## Functions

| Function | Description | Line |
|---|---|---|
| `telemetry_core.addEvent(event)` | Adds an event to the session buffer. The event must be a table with a name field (non-empty string). Adds t = os.clockhp() to it, calls the hook onTelemetryEventAdded(event), encodes it as JSON on one line and flushes the buffer to disk every 100 events. | 75 |
| `telemetry_core.endActivity(activityName, data)` | Adds the event {name = activityName, type = 'end'} merged with data. | 479 |
| `telemetry_core.getDataFolder()` | Telemetry data folder: '/telemetry/local/' in -telemetryLocal mode (separate sessions and surveys, never sent by a normal run's reporter), otherwise '/telemetry/'. | 30 |
| `telemetry_core.getRunIds()` | List of telemetry runs (runIds from the server config) for which the session collects. Set before the trackers are loaded. | 457 |
| `telemetry_core.getRunTime()` | Elapsed time in seconds (os.clockhp()), used by the trackers to measure durations. | 452 |
| `telemetry_core.getSessionFile()` | .jsonl file of the current session. The reporter must neither send nor delete it. | 40 |
| `telemetry_core.getSessionId()` | Session identifier: timestamp plus random bytes, unrelated to the account token or an identity. Used to recognize a duplicate resend after a lost response. | 47 |
| `telemetry_core.isPlatformSupported(platform)` | Returns false for the 'ps5' and 'ps5pro' platforms, true otherwise. | 123 |
| `telemetry_core.isSessionContinued()` | Indicates whether the current session resumes the one from before a Lua reload. | 461 |
| `telemetry_core.onExit()` | Hook called when the game closes; same function as onExtensionUnloaded. *(internal)* *(hook)* | 436 |
| `telemetry_core.onExtensionLoaded(previousSession)` | Load hook: sets the unload mode to manual, enables telemetry if shouldTelemetryBeActive(); otherwise closes the previous session and stays in no-effect mode. *(internal)* *(hook)* | 403 |
| `telemetry_core.onExtensionUnloaded()` | Unload hook: disables telemetry (writes the remaining events, unloads trackers and reporter) and turns off the config polling. *(internal)* *(hook)* | 436 |
| `telemetry_core.onSerialize(reason)` | Serialization hook: on a Lua reload (reason == 'reload') with a valid session, returns {sessionId, runIds} to resume the session afterwards. *(internal)* *(hook)* | 443 |
| `telemetry_core.onSettingsChanged()` | Hook called when the settings change: enables or disables telemetry according to consent, and turns off config polling if it is inactive. *(internal)* *(hook)* | 421 |
| `telemetry_core.startActivity(activityName, data)` | Adds the event {name = activityName, type = 'start'} merged with data, to measure a duration with endActivity. | 473 |
| `telemetry_core.triggerReportWrite()` | Immediately writes the buffered events to the session file, so they survive a crash. | 466 |

### Parameter details

#### `telemetry_core.addEvent(event)`

Adds an event to the session buffer. The event must be a table with a name field (non-empty string). Adds t = os.clockhp() to it, calls the hook onTelemetryEventAdded(event), encodes it as JSON on one line and flushes the buffer to disk every 100 events.

- `event` (*table*) : Event: name required, other fields free, t forbidden.
- **returns**: boolean true if the event was stored, false if it was refused (telemetry inactive, invalid table, missing name).

#### `telemetry_core.endActivity(activityName, data)`

Adds the event {name = activityName, type = 'end'} merged with data.

- `activityName` (*string*) : Name of the started activity.
- `data` (*table|nil*) : Additional fields of the event.

#### `telemetry_core.getDataFolder()`

Telemetry data folder: '/telemetry/local/' in -telemetryLocal mode (separate sessions and surveys, never sent by a normal run's reporter), otherwise '/telemetry/'.

- **returns**: string Folder path.

#### `telemetry_core.getRunIds()`

List of telemetry runs (runIds from the server config) for which the session collects. Set before the trackers are loaded.

- **returns**: string[]|nil Run identifiers.

#### `telemetry_core.getRunTime()`

Elapsed time in seconds (os.clockhp()), used by the trackers to measure durations.

- **returns**: number Seconds.

#### `telemetry_core.getSessionFile()`

.jsonl file of the current session. The reporter must neither send nor delete it.

- **returns**: string|nil Path, or nil if there is no session.

#### `telemetry_core.getSessionId()`

Session identifier: timestamp plus random bytes, unrelated to the account token or an identity. Used to recognize a duplicate resend after a lost response.

- **returns**: string|nil Session identifier.

#### `telemetry_core.isPlatformSupported(platform)`

Returns false for the 'ps5' and 'ps5pro' platforms, true otherwise.

- `platform` (*string*) : Value of Engine.Platform.getPlatform() ('' on PC).
- **returns**: boolean true if telemetry can run.

#### `telemetry_core.isSessionContinued()`

Indicates whether the current session resumes the one from before a Lua reload.

- **returns**: boolean true if the session is resumed.

#### `telemetry_core.onExtensionLoaded(previousSession)`

Load hook: sets the unload mode to manual, enables telemetry if shouldTelemetryBeActive(); otherwise closes the previous session and stays in no-effect mode.

- `previousSession` (*table|nil*) : Data returned by onSerialize before a Lua reload (sessionId, runIds).
- **returns**: boolean Always true (stays loaded).

#### `telemetry_core.onSerialize(reason)`

Serialization hook: on a Lua reload (reason == 'reload') with a valid session, returns {sessionId, runIds} to resume the session afterwards.

- `reason` (*string*) : Reason for the serialization ('reload'...).
- **returns**: table|nil Resume data.

#### `telemetry_core.startActivity(activityName, data)`

Adds the event {name = activityName, type = 'start'} merged with data, to measure a duration with endActivity.

- `activityName` (*string*) : Activity name.
- `data` (*table|nil*) : Additional fields of the event.

## Fields

| Field | Type | Description |
|---|---|---|
| `dependencies` | string[] | {'telemetry_configManager'}: declared but not called on demand, so that the trackers do not start before the config is initialized. |

## Emitted hooks

Events broadcast to extensions by `extensions.hook`:

- `onTelemetryEventAdded`

## Calls into the engine (C++)

- `Engine.` `getStartingArgs`, `isAgentMode`
- `FS:` `directoryCreate`, `directoryExists`, `fileExists`, `findFiles`, `removeFile`
- `ResearchVerifier.` `isTechLicenseVerified`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/telemetry/core.lua`.*
