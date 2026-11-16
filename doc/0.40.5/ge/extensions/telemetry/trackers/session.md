# `telemetry_trackers_session`

*File: `lua/ge/extensions/telemetry/trackers/session.lua` · VM: Game Engine (GE) · 124 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `telemetry_trackers_session`: `extensions.load("telemetry_trackers_session")`, then the global `telemetry_trackers_session`

Session telemetry tracker: marks the start and end of the session. It loads first and unloads last, so it brackets all other events. A game engine Lua reload continues the current session. At the start: "session" event (type start) with facts about the client, languages, telemetry version, tech license, timezone, anonymous ID, Big Picture mode, power and VR. At the end: "session" (type end) with the duration.

## Notes

- All local times can be off by several hours. The "login" event (emitted as soon as authentication is available) gives the offset from the server clock (clockOffset), the local UTC time, the adjusted time and the server timestamp as received, to anchor the other events.
- On a session continued after a Lua reload, no new start event is emitted; loginLogged is taken from the previous state.
- The session end is emitted only once and not during a Lua reload (onSerialize with reason == "reload").

**Dependencies (loaded first):** `telemetry_core`

## Functions

| Function | Description | Line |
|---|---|---|
| `telemetry_trackers_session.onExtensionLoaded(previousState)` | Hook called on load: emits the session start event (except for a continued session), tries to emit the login and switches to manual unload. *(internal)* *(hook)* | 59 |
| `telemetry_trackers_session.onExtensionUnloaded()` | Hook called on unload: emits the session end event with the duration (except on a Lua reload). *(internal)* *(hook)* | 95 |
| `telemetry_trackers_session.onOnlineStateChanged(connected)` | Hook called when the online connection state changes: once the connection is back (first moment the server clock is known), emits the login event. *(internal)* *(hook)* | 115 |
| `telemetry_trackers_session.onSerialize(reason)` | Hook called before unload: remembers whether it is a Lua reload and returns {loginLogged}. *(internal)* *(hook)* | 108 |

### Parameter details

#### `telemetry_trackers_session.onExtensionLoaded(previousState)`

Hook called on load: emits the session start event (except for a continued session), tries to emit the login and switches to manual unload.

- `previousState` (*table|nil*) : State returned by onSerialize ({loginLogged}) during a reload.

#### `telemetry_trackers_session.onOnlineStateChanged(connected)`

Hook called when the online connection state changes: once the connection is back (first moment the server clock is known), emits the login event.

- `connected` (*boolean*) : true if connected.

#### `telemetry_trackers_session.onSerialize(reason)`

Hook called before unload: remembers whether it is a Lua reload and returns {loginLogged}.

- `reason` (*string*) : Reason ("reload" for a reload).
- **returns**: table {loginLogged}

## Fields

| Field | Type | Description |
|---|---|---|
| `dependencies` | string[] | telemetry_core. |

## Calls into the engine (C++)

- `Lua:` `getOSLanguage`, `getSelectedLanguage`
- `ResearchVerifier.` `isTechLicenseVerified`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/telemetry/trackers/session.lua`.*
