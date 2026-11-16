# `core_schemeCommandServer`

*File: `lua/ge/extensions/core/schemeCommandServer.lua` · VM: Game Engine (GE) · 38 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `core_schemeCommandServer`: `extensions.load("core_schemeCommandServer")`, then the global `core_schemeCommandServer`

Old local UDP server (127.0.0.1:22137) that received the commands of the 'beamng:' URL scheme and passed them to commandhandler.onSchemeCommand. The code is marked OBSOLETE: the default scheme handler is now a Windows pipe.

## Notes

- Only packets starting with 'beamng:' are processed; the 7-character prefix is removed before the call.
- Only one packet (4096 bytes max) is read per frame.
- onFirstUpdate returns false if the port cannot be opened, but this return value is not used by a hook.

## Functions

| Function | Description | Line |
|---|---|---|
| `core_schemeCommandServer.onFirstUpdate()` | First-update hook: opens the UDP socket 127.0.0.1:22137 (non-blocking). Logs a warning if the opening fails. *(internal)* *(hook)* | 11 |
| `core_schemeCommandServer.onUpdate()` | Update hook: reads a UDP packet; if the text starts with 'beamng:', calls commandhandler.onSchemeCommand with the rest. *(internal)* *(hook)* | 22 |

### Parameter details

#### `core_schemeCommandServer.onFirstUpdate()`

First-update hook: opens the UDP socket 127.0.0.1:22137 (non-blocking). Logs a warning if the opening fails.

- **returns**: boolean|nil false if the socket could not be opened.

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/core/schemeCommandServer.lua`.*
