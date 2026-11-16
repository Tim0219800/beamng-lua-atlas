# `gameplay_crawl_freeroamMultiplayer`

*File: `lua/ge/extensions/gameplay/crawl/freeroamMultiplayer.lua` · VM: Game Engine (GE) · 59 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `gameplay_crawl_freeroamMultiplayer`: `extensions.load("gameplay_crawl_freeroamMultiplayer")`, then the global `gameplay_crawl_freeroamMultiplayer`

Crawl integration in multiplayer freeroam. Loaded by gameplay_crawl_general when a multiplayer session starts (onMPSessionChanged), unloaded when it ends. It shows the "scoreboard" app at the top left and creates a scoreboard (multiplayer_multiplayerScoreboard) with a penalty points column (ascending sort). It updates the local player's score, makes their row flash red (penalty) or green (bonus), and indicates disqualification or finish.

## Notes

- No function is callable: the module only exports crawl event hooks.
- onCrawlPenaltyScoreChanged expects eventData.penaltyScore and eventData.oldPenaltyScore; a score increase (penalty) gives a red flash, a decrease a green flash.
- The scoreboard is identified by trail.id (onCrawlStarted receives the {trail = ...} table from the gameplay_crawl_general hooks, so trail.id is that of this table, not of the trail: possible inconsistency, since the caller passes {trail = trail}).
- The scoreboard app is hidden only on disqualification (endCrawlFreeroam); it stays displayed on a normal finish.

## Functions

| Function | Description | Line |
|---|---|---|
| `gameplay_crawl_freeroamMultiplayer.onCrawlDisqualified()` | Hook called on disqualification: "disqualified" status in the scoreboard and hiding of the scoreboard app. *(internal)* *(hook)* | 38 |
| `gameplay_crawl_freeroamMultiplayer.onCrawlPenaltyScoreChanged(eventData)` | Hook called when the penalty score changes: sends the new value to the scoreboard and makes the player's row flash. *(internal)* *(hook)* | 22 |
| `gameplay_crawl_freeroamMultiplayer.onCrawlResultsShown(eventData)` | Hook called when the results are shown: pushes the final points and the "finishLine" status. *(internal)* *(hook)* | 45 |
| `gameplay_crawl_freeroamMultiplayer.onCrawlStarted(trail)` | Hook called when a crawl starts: shows the scoreboard app, creates a scoreboard and pushes the initial score 0. *(internal)* *(hook)* | 9 |

### Parameter details

#### `gameplay_crawl_freeroamMultiplayer.onCrawlPenaltyScoreChanged(eventData)`

Hook called when the penalty score changes: sends the new value to the scoreboard and makes the player's row flash.

- `eventData` (*table*) : {penaltyScore, oldPenaltyScore}.

#### `gameplay_crawl_freeroamMultiplayer.onCrawlResultsShown(eventData)`

Hook called when the results are shown: pushes the final points and the "finishLine" status.

- `eventData` (*table*) : {points, time}.

#### `gameplay_crawl_freeroamMultiplayer.onCrawlStarted(trail)`

Hook called when a crawl starts: shows the scoreboard app, creates a scoreboard and pushes the initial score 0.

- `trail` (*table*) : Event data; its id field is used as the scoreboard identifier (see notes).

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/gameplay/crawl/freeroamMultiplayer.lua`.*
