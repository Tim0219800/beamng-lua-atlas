# `remoteControl_remoteControl`

*File: `lua/ge/extensions/remoteControl/remoteControl.lua` · VM: Game Engine (GE) · 95 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `remoteControl_remoteControl`: `extensions.load("remoteControl_remoteControl")`, then the global `remoteControl_remoteControl`

Example/prototype of an HTTP remote control: on load, starts a small HTTP server (utils/simpleHttpServer) on 0.0.0.0:8081 that serves the files in /lua/ge/extensions/remoteControl/ and a few API routes, and registers a virtual input device "httpcontrollerv1" (1 axis, 2 buttons declared) with the virtual input manager. It serves as a basis for controlling the game from a phone or a browser.

## Notes

- HTTP routes: GET /hello/<number> returns "hello world: <number>"; /api/getInfo/ returns the version, architecture, ip and port; /api/ping returns ["pong"]; /api/btn toggles the state of button 0 and emits a vinput event.
- SECURITY: the server listens on all interfaces (0.0.0.0) without authentication.
- onUpdate continuously emits a sinusoidal axis value (sin(t)+1)/2 on axis 0: it is only a demonstration, not real control.
- M.onFirstUpdate is assigned to a local variable that is never defined (so nil): field with no effect.
- onUpdate calls ws.update() even if the server was not created (ws nil before onExtensionLoaded); in practice onExtensionLoaded precedes onUpdate.
- The variables httpListenPort and port are duplicated (8081 twice); the server uses `port`.

## Functions

| Function | Description | Line |
|---|---|---|
| `remoteControl_remoteControl.onExtensionLoaded()` | Hook called when the extension loads: starts the HTTP server and declares the routes. *(internal)* *(hook)* | 17 |
| `remoteControl_remoteControl.onExtensionUnloaded()` | Hook called on unload: unregisters the virtual device (the HTTP server is not explicitly stopped). *(internal)* *(hook)* | 62 |
| `remoteControl_remoteControl.onUpdate(dtReal, dtSim, dtRaw)` | Hook called every frame: processes HTTP requests and emits the virtual device's events (registers it on the first frame). *(internal)* *(hook)* | 46 |

### Parameter details

#### `remoteControl_remoteControl.onUpdate(dtReal, dtSim, dtRaw)`

Hook called every frame: processes HTTP requests and emits the virtual device's events (registers it on the first frame).

- `dtReal` (*number*) : Real time delta (s).
- `dtSim` (*number*) : Simulated time delta (s).
- `dtRaw` (*number*) : Raw time delta (s).

## Fields

| Field | Type | Description |
|---|---|---|
| `_unittests` | table | Unit test table (testExampleSuccess, testExampleFailure_shouldFail) for the game's test runner. |
| `onFirstUpdate` | nil | Reference to an undefined local variable: equals nil. ⚠ reference `onFirstUpdate` not defined in the file (probably nil) |

## Class `tests`

Example tests exposed by _unittests; the functions must start with "test".

| Method | Description | Line |
|---|---|---|
| `tests.testExampleFailure_shouldFail(context)` | Example test that fails on purpose. | 83 |
| `tests.testExampleSuccess(context)` | Example test that succeeds (42 == 42). | 72 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/remoteControl/remoteControl.lua`.*
