# `ui_gamemodes_gamemodesTabProvider`

*File: `lua/ge/extensions/ui/gamemodes/gamemodesTabProvider.lua` · VM: Game Engine (GE) · 113 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `ui_gamemodes_gamemodesTabProvider`: `extensions.load("ui_gamemodes_gamemodesTabProvider")`, then the global `ui_gamemodes_gamemodesTabProvider`

Facade used by the UI's "game modes" tab. Depending on whether a multiplayer session exists (multiplayer_sessionManager.getCurrentSession() non-nil), calls are redirected to multiplayer_uiBackend_multiplayerUIManager, otherwise to gameplay_multiseat_gamemodeManager (split screen). Each function checks that the target module is loaded and does nothing otherwise.

## Notes

- restartGamemode does nothing in a network session; selectGamemode, deselectGamemode, startReadyUp, stopReadyUp, setOwnerPreReadyRole and requestSetOwnGamemodeRole do nothing outside a network session.

## Functions

| Function | Description | Line |
|---|---|---|
| `ui_gamemodes_gamemodesTabProvider.deselectGamemode()` | Network only: the host deselects the mode (deselectGamemodeForOwner). | 61 |
| `ui_gamemodes_gamemodesTabProvider.requestGamemodeData()` | Requests that the game mode data be sent to the UI (requestMultiplayerTabData on network, requestGamemodeData in split screen). | 8 |
| `ui_gamemodes_gamemodesTabProvider.requestSetOwnGamemodeRole(role)` | Network only: requests to change one's own role in the game mode. | 93 |
| `ui_gamemodes_gamemodesTabProvider.restartGamemode(name, settings)` | Restarts a game mode in split screen (gamemodeManager.restart). No effect in a network session. | 44 |
| `ui_gamemodes_gamemodesTabProvider.selectGamemode(name)` | Network only: the host selects a mode (selectGamemodeForOwner). | 53 |
| `ui_gamemodes_gamemodesTabProvider.setOwnerPreReadyRole(role)` | Network only: sets the host's role before the "ready" phase. | 85 |
| `ui_gamemodes_gamemodesTabProvider.startGamemode(name, settings)` | Starts a game mode (multiplayerUIManager.startGamemode or gamemodeManager.start). | 20 |
| `ui_gamemodes_gamemodesTabProvider.startReadyUp(gamemodeInfo)` | Network only: starts the players' "ready" phase for a mode. | 69 |
| `ui_gamemodes_gamemodesTabProvider.stopGamemode()` | Stops the current game mode (stopGamemode on network, stop in split screen). | 32 |
| `ui_gamemodes_gamemodesTabProvider.stopReadyUp()` | Network only: stops the "ready" phase. | 77 |

### Parameter details

#### `ui_gamemodes_gamemodesTabProvider.requestSetOwnGamemodeRole(role)`

Network only: requests to change one's own role in the game mode.

- `role` (*any*) : Requested role (inferred from code: passed as is).

#### `ui_gamemodes_gamemodesTabProvider.restartGamemode(name, settings)`

Restarts a game mode in split screen (gamemodeManager.restart). No effect in a network session.

- `name` (*string*) : Game mode name.
- `settings` (*table|nil*) : Mode settings.

#### `ui_gamemodes_gamemodesTabProvider.selectGamemode(name)`

Network only: the host selects a mode (selectGamemodeForOwner).

- `name` (*string*) : Game mode name.

#### `ui_gamemodes_gamemodesTabProvider.setOwnerPreReadyRole(role)`

Network only: sets the host's role before the "ready" phase.

- `role` (*any*) : Role (inferred from code: passed as is).

#### `ui_gamemodes_gamemodesTabProvider.startGamemode(name, settings)`

Starts a game mode (multiplayerUIManager.startGamemode or gamemodeManager.start).

- `name` (*string*) : Game mode name.
- `settings` (*table|nil*) : Mode settings (inferred from code: passed as is).

#### `ui_gamemodes_gamemodesTabProvider.startReadyUp(gamemodeInfo)`

Network only: starts the players' "ready" phase for a mode.

- `gamemodeInfo` (*table*) : Mode information (inferred from code: passed as is).

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/ui/gamemodes/gamemodesTabProvider.lua`.*
