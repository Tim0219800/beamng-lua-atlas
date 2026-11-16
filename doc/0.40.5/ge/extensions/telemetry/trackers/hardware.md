# `telemetry_trackers_hardware`

*File: `lua/ge/extensions/telemetry/trackers/hardware.lua` · VM: Game Engine (GE) · 315 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `telemetry_trackers_hardware`: `extensions.load("telemetry_trackers_hardware")`, then the global `telemetry_trackers_hardware`

Hardware telemetry tracker: collects system, graphics, display, audio, storage and input device information for minimum-spec and optimization decisions. The "hardwareSurvey" survey is large and changes little: it is only sent every 30 days (24*30 h by default, modifiable via the server config). Changes of controllers, audio output and display mode are separate one-off events.

## Notes

- Survey content: device type (desktop, laptop, steamdeck, unknown), OS (including OS/Steam/applied languages), CPU, GPU (name, driver, API, memories), memory, displays (resolutions, DPI, HDR, video mode), audio, VR (OpenXR), Steam (language, branch, state), disk space, presence of OneDrive in the user path, number of cache.* files, and a piracy flag if the global variable sailingTheHighSeas exists.
- On load, a "gpuMemorySnapshot" event is emitted per GPU that reports memory usage.
- The last survey sent is kept in surveys/hardwareSurvey.json; its modification date is the send date. Reducing surveyIntervalHours on the server side makes all clients re-survey, as does a change of surveyVersion (3 currently).
- The input bindings load on onFirstUpdate, which main.lua triggers before settings.finalizeInit loads telemetry: the devices are therefore already enumerated when this tracker starts.
- Depends on the submodules telemetry/hardwareAudio, hardwareChanges and hardwareInput.

**Dependencies (loaded first):** `telemetry_core`

## Functions

| Function | Description | Line |
|---|---|---|
| `telemetry_trackers_hardware.onAudioOutputDeviceChanged()` | Hook called when the audio output changes: emits "audioOutputChanged" (sample rate, speaker mode, channels). *(internal)* *(hook)* | 197 |
| `telemetry_trackers_hardware.onDeviceChanged()` | Hook called when an input device changes: compares with the known controllers and emits an "inputDeviceConnection" event per difference. *(internal)* *(hook)* | 185 |
| `telemetry_trackers_hardware.onDisplayModeChanged(from, to)` | Hook called on display mode change: emits "displayModeChanged" only for the tracked transitions. *(internal)* *(hook)* | 208 |
| `telemetry_trackers_hardware.onExtensionLoaded()` | Hook called on load: remembers the connected controllers, emits the GPU memory snapshots, sends the hardware survey if it is due, then switches to manual unload. *(internal)* *(hook)* | 278 |

### Parameter details

#### `telemetry_trackers_hardware.onDisplayModeChanged(from, to)`

Hook called on display mode change: emits "displayModeChanged" only for the tracked transitions.

- `from` (*string*) : Old mode.
- `to` (*string*) : New mode.

## Fields

| Field | Type | Description |
|---|---|---|
| `dependencies` | string[] | telemetry_core. |

## Calls into the engine (C++)

- `FS:` `findFiles`, `getUserPath`, `isGamePathCaseSensitive`, `isUserPathCaseSensitive`, `stat`
- `Lua:` `getOSLanguage`, `getSelectedLanguage`, `getSteamLanguage`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/telemetry/trackers/hardware.lua`.*
