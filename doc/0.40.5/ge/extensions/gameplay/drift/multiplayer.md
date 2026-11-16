# `gameplay_drift_multiplayer`

*File: `lua/ge/extensions/gameplay/drift/multiplayer.lua` · VM: Game Engine (GE) · 88 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `gameplay_drift_multiplayer`: `extensions.load("gameplay_drift_multiplayer")`, then the global `gameplay_drift_multiplayer`

Bridge between the drift gameplay and the multiplayer scoreboard (multiplayer_multiplayerScoreboard). When a drift spot starts, creates a scoreboard with the columns potentialScore, driftLevel and score; then pushes the player's score, drift level, status (finishLine / disqualified) and pulses red on a crash. Does nothing if multiplayer_multiplayerScoreboard does not exist.

## Notes

- Score updates are only sent if the drift context is "inFreeroamChallenge".
- The drift level (driftLevel) is sent every frame only when the value of gameplay_drift_scoring.getDriftPerformanceFactor() changes.
- functionDriftSpotEnded (badly formed local name) sets driftLevel back to 0 and hasDriftSpotStarted to false; scoreboardHandle is never set back to nil.

**Dependencies (loaded first):** `gameplay_drift_general`

## Functions

| Function | Description | Line |
|---|---|---|
| `gameplay_drift_multiplayer.getDriftDebugInfo()` | Returns the table {default=false, canBeChanged=false} describing this module's debug setting (used by the drift debug window). | 59 |
| `gameplay_drift_multiplayer.onDriftCrash()` | Hook: crash during a challenge, makes the player's color pulse red in the scoreboard. *(internal)* *(hook)* | 53 |
| `gameplay_drift_multiplayer.onDriftScoreChanged(data)` | Hook: pushes to the scoreboard the current potential score, score and drift level, in the inFreeroamChallenge context. *(internal)* *(hook)* | 18 |
| `gameplay_drift_multiplayer.onDriftSpotFailed()` | Hook: spot failed, pushes the "disqualified" status to the scoreboard. *(internal)* *(hook)* | 46 |
| `gameplay_drift_multiplayer.onDriftSpotFinishLineCrossed()` | Hook: finish line crossed, pushes the "finishLine" status to the scoreboard. *(internal)* *(hook)* | 39 |
| `gameplay_drift_multiplayer.onDriftSpotStarted(data)` | Hook: when entering a drift spot, creates a new multiplayer scoreboard sorted by descending score. *(internal)* *(hook)* | 25 |
| `gameplay_drift_multiplayer.onUpdate()` | Called every frame: sends the drift level to the scoreboard if it changed since the last frame. *(internal)* *(hook)* | 72 |

### Parameter details

#### `gameplay_drift_multiplayer.getDriftDebugInfo()`

Returns the table {default=false, canBeChanged=false} describing this module's debug setting (used by the drift debug window).

- **returns**: table {default = false, canBeChanged = false}

#### `gameplay_drift_multiplayer.onDriftScoreChanged(data)`

Hook: pushes to the scoreboard the current potential score, score and drift level, in the inFreeroamChallenge context.

- `data` (*table*) : Score change data (unused here: the score is re-read via gameplay_drift_scoring.getScore()).

#### `gameplay_drift_multiplayer.onDriftSpotStarted(data)`

Hook: when entering a drift spot, creates a new multiplayer scoreboard sorted by descending score.

- `data` (*table*) : Contains lineId, passed to startNewScoreboard.

## Fields

| Field | Type | Description |
|---|---|---|
| `dependencies` | string[] | gameplay_drift_general, loaded beforehand. |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/gameplay/drift/multiplayer.lua`.*
