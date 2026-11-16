# `ui_gameplayScoreboard`

*File: `lua/ge/extensions/ui/gameplayScoreboard.lua` · VM: Game Engine (GE) · 172 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `ui_gameplayScoreboard`: `extensions.load("ui_gameplayScoreboard")`, then the global `ui_gameplayScoreboard`

Scoreboard data layer, independent of the source (local split screen or multiplayer network). Keeps the players' state (name, color, scores, status, rank) and pushes it to the UI through the "scoreboard" stream (guihooks.queueStream). Sorting is done according to the style (orderBy.key, asc/desc direction), with "disqualified" players placed after the others; ties share the rank.

## Example

```lua
ui_gameplayScoreboard.startNewScoreboard({entries={{key='score', name='Score', order=1, type='points'}}, orderBy={key='score', direction='desc'}})
ui_gameplayScoreboard.ensurePlayer('p1', 'Alice', {1,0,0,1}, 1)
ui_gameplayScoreboard.updatePlayerScores('p1', {score = 10})
```

## Notes

- startNewScoreboard must be called to activate the scoreboard: updatePlayerScores, updatePlayerStatus and pulsePlayerColor do nothing as long as active is false (and after clear).
- Default style: one "score" column (type points), descending sort on score.
- A missing score is 0; on a tie, the order follows playerIndex.
- setPlayerName does not push to the UI (no pushToUI): the name only appears at the next push.
- clear() resets the default style, deactivates the scoreboard and pushes an empty state to the UI.

## Functions

| Function | Description | Line |
|---|---|---|
| `ui_gameplayScoreboard.clear()` | Empties the players, resets the default style, deactivates the scoreboard and pushes the empty state to the UI. | 86 |
| `ui_gameplayScoreboard.ensurePlayer(playerId, name, color, playerIndex)` | Creates the player if it does not exist (default name = playerId, empty scores); otherwise updates the color, index and name provided (non-nil). Does not push to the UI. | 100 |
| `ui_gameplayScoreboard.getPlayers()` | Returns the players table (playerId -> {mpClientId, name, scores, status, color, playerIndex, rank}). | 147 |
| `ui_gameplayScoreboard.isActive()` | Indicates whether a scoreboard is active (startNewScoreboard called and no clear since). | 96 |
| `ui_gameplayScoreboard.pulsePlayerColor(playerId, color)` | Triggers a color pulse on the player's row via guihooks.trigger('scoreboardPlayerPulseColor', {mpClientId, color}). No effect if inactive. | 137 |
| `ui_gameplayScoreboard.setLocalMPClientId(id)` | Tells the UI which player is the local client (mpClientId) and pushes the state. | 142 |
| `ui_gameplayScoreboard.setPlayerColor(playerId, color)` | Changes a player's color (creates it if needed) and pushes to the UI. | 115 |
| `ui_gameplayScoreboard.setPlayerName(playerId, name)` | Changes a player's name (creates it if needed). Does not send an update to the UI. | 110 |
| `ui_gameplayScoreboard.startNewScoreboard(_scoreboardStyle)` | Resets (clear), activates the scoreboard with the given style and pushes the state to the UI. | 152 |
| `ui_gameplayScoreboard.updatePlayerScores(playerId, scores)` | Merges the given values into the player's scores (key by key) and pushes to the UI. No effect if the scoreboard is not active. | 121 |
| `ui_gameplayScoreboard.updatePlayerStatus(playerId, status)` | Sets a player's status (e.g. "disqualified" ranks them last) and pushes to the UI. No effect if inactive. | 130 |

### Parameter details

#### `ui_gameplayScoreboard.ensurePlayer(playerId, name, color, playerIndex)`

Creates the player if it does not exist (default name = playerId, empty scores); otherwise updates the color, index and name provided (non-nil). Does not push to the UI.

- `playerId` (*string*) : Player identifier (also stored in mpClientId).
- `name` (*string|nil*) : Displayed name.
- `color` (*any*) : Player color (format passed as is to the UI).
- `playerIndex` (*integer|nil*) : Player index, used as the sort tiebreaker.

#### `ui_gameplayScoreboard.getPlayers()`

Returns the players table (playerId -> {mpClientId, name, scores, status, color, playerIndex, rank}).

- **returns**: table<string, table> Internal players table (not copied).

#### `ui_gameplayScoreboard.isActive()`

Indicates whether a scoreboard is active (startNewScoreboard called and no clear since).

- **returns**: boolean true if active.

#### `ui_gameplayScoreboard.pulsePlayerColor(playerId, color)`

Triggers a color pulse on the player's row via guihooks.trigger('scoreboardPlayerPulseColor', {mpClientId, color}). No effect if inactive.

- `playerId` (*string*) : Player identifier.
- `color` (*any*) : Pulse color.

#### `ui_gameplayScoreboard.setLocalMPClientId(id)`

Tells the UI which player is the local client (mpClientId) and pushes the state.

- `id` (*string|nil*) : Local player identifier.

#### `ui_gameplayScoreboard.setPlayerColor(playerId, color)`

Changes a player's color (creates it if needed) and pushes to the UI.

- `playerId` (*string*) : Player identifier.
- `color` (*any*) : New color.

#### `ui_gameplayScoreboard.setPlayerName(playerId, name)`

Changes a player's name (creates it if needed). Does not send an update to the UI.

- `playerId` (*string*) : Player identifier.
- `name` (*string*) : New name.

#### `ui_gameplayScoreboard.startNewScoreboard(_scoreboardStyle)`

Resets (clear), activates the scoreboard with the given style and pushes the state to the UI.

- `_scoreboardStyle` (*table|nil*) : Style definition: entries (list of {key, name, order, type}) and orderBy ({key, direction}). Default: one-column score style.

#### `ui_gameplayScoreboard.updatePlayerScores(playerId, scores)`

Merges the given values into the player's scores (key by key) and pushes to the UI. No effect if the scoreboard is not active.

- `playerId` (*string*) : Player identifier.
- `scores` (*table<string, number>*) : Values by column key (e.g. {score = 10}).

#### `ui_gameplayScoreboard.updatePlayerStatus(playerId, status)`

Sets a player's status (e.g. "disqualified" ranks them last) and pushes to the UI. No effect if inactive.

- `playerId` (*string*) : Player identifier.
- `status` (*string|nil*) : Status; only the value "disqualified" is interpreted by the sort.

**UI events (guihooks.trigger):** `scoreboardPlayerPulseColor`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/ui/gameplayScoreboard.lua`.*
