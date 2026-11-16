# `ui_extApp`

*File: `lua/ge/extensions/ui/extApp.lua` · VM: Game Engine (GE) · 72 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `ui_extApp`: `extensions.load("ui_extApp")`, then the global `ui_extApp`

Web/WebSocket server to display the game's interface on an external device (phone). On load, it starts via utils/wsUtils a server on port 8084 (protocol 'bng-ext-app-v1', page /ui/entrypoints/main/index.html), over HTTPS/WSS so that the phone's motion sensors are accessible, and publishes the URL to the UI via guihooks.trigger('externalUIURL', url). Usage: extensions.load('ui_extApp').

## Notes

- Stream data is handled on the C++ side; _handleData only logs an "unknown command" error for any JSON message received.
- The server listens on all addresses ('any'); the announced address is the one chosen by wsUtils.createOrGetWS.
- On unload, externalUIURL is emitted with no argument to clear the URL on the UI side.

## Functions

| Function | Description | Line |
|---|---|---|
| `ui_extApp.onExtensionLoaded()` | Load hook: creates or gets the WebSocket/HTTPS server, logs the URL and publishes it to the UI. *(internal)* *(hook)* | 26 |
| `ui_extApp.onExtensionUnloaded()` | Unload hook: destroys the server (BNGWebWSServer.destroy) and clears the URL on the UI side. *(internal)* *(hook)* | 32 |
| `ui_extApp.onUpdate()` | Per-frame hook: reads the events from the WebSocket peers, decodes the JSON messages of type 'D' and passes them to _handleData (which logs an error because everything is handled in C++). *(internal)* *(hook)* | 45 |
| `ui_extApp.requestUIData()` | Sends the server URL back to the UI (guihooks.trigger('externalUIURL', url)). Alias of updateUIData. | 21 |

**UI events (guihooks.trigger):** `externalUIURL`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/ui/extApp.lua`.*
