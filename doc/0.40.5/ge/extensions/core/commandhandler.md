# `core_commandhandler`

*File: `lua/ge/extensions/core/commandhandler.lua` · VM: Game Engine (GE) · 333 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `core_commandhandler`: `extensions.load("core_commandhandler")`, then the global `core_commandhandler`

Executes the asynchronous commands sent to the game by the "beamng:v1/<command>/<data>" protocol scheme (browser link, -command command-line argument, pipe channel). Commands received before the interface is ready are queued then replayed on onUiReady. On the first update, reads the startup arguments (-command beamng:...).

## Example

```lua
-- equivalent to a link beamng:v1/core_input_actions/triggerDownUp/toggleCamera
core_commandhandler.onSchemeCommand('v1/core_input_actions/triggerDownUp/toggleCamera', false)
```

## Notes

- The text is decoded (%XX) then split on '/' into at most 3 parts: version, command, data (the '/' in the data are kept).
- v1 commands handled: showMod, subscriptionMod, downloadMod (core_repository), updateZipMod (core_modmanager), openMap (core_loadMapCmd), loadSnapshot (core_snapshot), tech_utils/<function> (calls extensions.tech_utils[function]()), core_input_actions/<function>/<args...> (calls extensions.core_input_actions[function](args)), openWorkbench and runRepro (guarded by core_reproGuard.isCommandAllowed, executed via executeShell, absent from shipping builds).
- Commands without a version test: startToolchainServer (loads networking_editorToolchain), startWorkbenchServer, startDebugServer, stopDebugServer, attachDebugger, detachDebugger.
- When isStartingArg is true (instance launched only to process the command), openWorkbench and runRepro quit the game (shutdown(0)) after use or on failure.
- tech_utils and core_input_actions allow calling an extension function by name from a link: keep this in mind for security.
- Point to note: M.onExtensionLoaded is `nop` (field marked "undefined" by the extraction, presumably an empty global engine function; inferred from code).

## Functions

| Function | Description | Line |
|---|---|---|
| `core_commandhandler.onDeserialized(d)` | Hook: restores ignoreStartupCmd. *(internal)* *(hook)* | 319 |
| `core_commandhandler.onFirstUpdate()` | Hook: on the first update, looks for "-command beamng:..." in Engine.getStartingArgs() and executes it (ignored if the extension was reloaded). *(internal)* *(hook)* | 291 |
| `core_commandhandler.onSchemeCommand(scheme, isStartingArg)` | Processes a "version/command/data" scheme command (without the "beamng:" prefix). Queues if the UI is not ready. Unknown or malformed commands are logged as errors. *(hook)* | 53 |
| `core_commandhandler.onSerialize()` | Hook: returns {ignoreStartupCmd = true} so that the GE reload does not replay the startup command. *(internal)* *(hook)* | 315 |
| `core_commandhandler.onUiReady()` | Hook: the interface is ready; runs the queued commands. *(internal)* *(hook)* | 283 |

### Parameter details

#### `core_commandhandler.onDeserialized(d)`

Hook: restores ignoreStartupCmd.

- `d` (*table*) : table returned by onSerialize

#### `core_commandhandler.onSchemeCommand(scheme, isStartingArg)`

Processes a "version/command/data" scheme command (without the "beamng:" prefix). Queues if the UI is not ready. Unknown or malformed commands are logged as errors.

- `scheme` (*string*) : e.g. "v1/openMap/{...json...}", percent-encoded
- `isStartingArg` (*boolean*) : true if the command comes from the game's startup arguments

#### `core_commandhandler.onSerialize()`

Hook: returns {ignoreStartupCmd = true} so that the GE reload does not replay the startup command.

- **returns**: table data to serialize

## Fields

| Field | Type | Description |
|---|---|---|
| `onExtensionLoaded` | function | Empty function (nop): the extension does nothing on load. |

## Calls into the engine (C++)

- `Engine.` `getStartingArgs`
- `FS:` `fileExists`, `getFileRealPath`

**Loads extensions:** `core_loadMapCmd`, `core_reproGuard`, `core_snapshot`, `networking_editorToolchain`, `workbench_webSocketHandler`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/core/commandhandler.lua`.*
