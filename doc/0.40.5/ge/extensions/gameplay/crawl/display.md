# `gameplay_crawl_display`

*File: `lua/ge/extensions/gameplay/crawl/display.lua` · VM: Game Engine (GE) · 249 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `gameplay_crawl_display`: `extensions.load("gameplay_crawl_display")`, then the global `gameplay_crawl_display`

On-screen message display for crawl mode. Each showXxxMessage function sends a translated notification (ui.crawl.* keys) via ui_message, or via guihooks.trigger('Message') targeted at a player's panel in split screen (multiseat). It handles penalty, waypoint, finish, disqualification and DNF messages. Penalty categories are only displayed if the crawler has penalties (gameplay_crawl_utils.hasPenalties).

## Notes

- An empty message ('') is used to clear a category; clearMessage uses it.
- In split screen, a message with crawlerId is only sent to the player who controls that vehicle; if it is no longer associated with a player, it is ignored. Without crawlerId, it is broadcast to all stored or connected players.
- showPointsMessage displays nothing if the multiplayer session is host (multiplayer_sessionManager.isSessionHost()).
- setCrawlUILayout is entirely commented out: the UI layout change does nothing.
- The displayed penalty points come from gameplay_crawl_utils.infractionPoints.
- onCrawlResultsShown and onExtensionLoaded are empty bodies.

## Functions

| Function | Description | Line |
|---|---|---|
| `gameplay_crawl_display.clearDisqualifiedWaitingMessage(crawlerId)` | Clears the disqualification waiting message. | 188 |
| `gameplay_crawl_display.clearPointsMessage(crawlerId)` | Clears the points message. | 156 |
| `gameplay_crawl_display.onCrawlComplete()` | Hook called at the end of a crawl: calls setCrawlUILayout(false) (no effect). *(internal)* *(hook)* | 133 |
| `gameplay_crawl_display.onCrawlResultsShown()` | Hook called when the results are displayed: empty body. *(internal)* *(hook)* | 137 |
| `gameplay_crawl_display.onCrawlStarted()` | Hook called when a crawl starts: logs and calls setCrawlUILayout (no effect). *(internal)* *(hook)* | 128 |
| `gameplay_crawl_display.onExtensionLoaded()` | Hook called on load: empty body. *(internal)* *(hook)* | 141 |
| `gameplay_crawl_display.onExtensionUnloaded()` | Hook called on unload: forgets the players stored for the messages. *(internal)* *(hook)* | 145 |
| `gameplay_crawl_display.showBonusCheckpointMessage(penaltyPoints, crawlerId)` | Displays the bonus waypoint message. | 212 |
| `gameplay_crawl_display.showBoundaryViolationMessage(crawlerId)` | Displays the zone exit message with the boundaryViolation penalty. | 208 |
| `gameplay_crawl_display.showCrawlCompletedMessage(time, points, crawlerId)` | Displays "crawl finished", then (10 s) the time and points if the crawler has penalties. | 160 |
| `gameplay_crawl_display.showDNFMessage(crawlerId)` | Displays the abandon (DNF) message. | 220 |
| `gameplay_crawl_display.showDisqualifiedMessage(eventData)` | Displays the disqualification message. | 179 |
| `gameplay_crawl_display.showDisqualifiedWaitingMessage(crawlerId)` | Displays the waiting message after disqualification (600 s). | 184 |
| `gameplay_crawl_display.showDrivingBackwardsMessage(crawlerId)` | Displays the backwards driving warning with the drivingBackwards penalty. | 192 |
| `gameplay_crawl_display.showGateClearedMessage(penaltyPoints, crawlerId)` | Displays the message for a gate cleared cleanly. | 216 |
| `gameplay_crawl_display.showGateReachedMessage(crawlerId)` | Displays "gate reached" (ui.crawl.gateReached). | 171 |
| `gameplay_crawl_display.showPointsMessage(points, crawlerId)` | Displays the total penalty points (duration 600 s, category 'points'), unless hosting a multiplayer session. | 150 |
| `gameplay_crawl_display.showSkippedCheckpointsMessage(skippedCount, crawlerId)` | Displays the number of skipped waypoints and the penalty (skippedCount × infractionPoints.skippedCheckpoint). | 167 |
| `gameplay_crawl_display.showStartedCrawlMessage(crawlerId)` | Displays the crawl start message. | 175 |
| `gameplay_crawl_display.showVehicleFlippedUprightMessage(crawlerId)` | Displays the vehicle-put-back-on-its-wheels message with the vehicleFlippedUpright penalty. | 196 |
| `gameplay_crawl_display.showVehicleRecoveredMessage(crawlerId)` | Displays the vehicle recovery message; the displayed penalty is infractionPoints.vehicleReset (no vehicleRecovered key). | 204 |
| `gameplay_crawl_display.showVehicleResetMessage(crawlerId)` | Displays the vehicle reset message with the vehicleReset penalty. | 200 |

### Parameter details

#### `gameplay_crawl_display.clearDisqualifiedWaitingMessage(crawlerId)`

Clears the disqualification waiting message.

- `crawlerId` (*integer|nil*) : Vehicle id.

#### `gameplay_crawl_display.clearPointsMessage(crawlerId)`

Clears the points message.

- `crawlerId` (*integer|nil*) : Vehicle id.

#### `gameplay_crawl_display.showBonusCheckpointMessage(penaltyPoints, crawlerId)`

Displays the bonus waypoint message.

- `penaltyPoints` (*number*) : Points (bonus) to display.
- `crawlerId` (*integer|nil*) : Vehicle id.

#### `gameplay_crawl_display.showBoundaryViolationMessage(crawlerId)`

Displays the zone exit message with the boundaryViolation penalty.

- `crawlerId` (*integer|nil*) : Vehicle id.

#### `gameplay_crawl_display.showCrawlCompletedMessage(time, points, crawlerId)`

Displays "crawl finished", then (10 s) the time and points if the crawler has penalties.

- `time` (*number*) : Time in seconds (displayed with 3 decimals).
- `points` (*number*) : Penalty points.
- `crawlerId` (*integer|nil*) : Vehicle id.

#### `gameplay_crawl_display.showDNFMessage(crawlerId)`

Displays the abandon (DNF) message.

- `crawlerId` (*integer|nil*) : Vehicle id.

#### `gameplay_crawl_display.showDisqualifiedMessage(eventData)`

Displays the disqualification message.

- `eventData` (*table|integer*) : Either a table with crawlerId, or directly the vehicle id.

#### `gameplay_crawl_display.showDisqualifiedWaitingMessage(crawlerId)`

Displays the waiting message after disqualification (600 s).

- `crawlerId` (*integer|nil*) : Vehicle id.

#### `gameplay_crawl_display.showDrivingBackwardsMessage(crawlerId)`

Displays the backwards driving warning with the drivingBackwards penalty.

- `crawlerId` (*integer|nil*) : Vehicle id.

#### `gameplay_crawl_display.showGateClearedMessage(penaltyPoints, crawlerId)`

Displays the message for a gate cleared cleanly.

- `penaltyPoints` (*number*) : Points to display.
- `crawlerId` (*integer|nil*) : Vehicle id.

#### `gameplay_crawl_display.showGateReachedMessage(crawlerId)`

Displays "gate reached" (ui.crawl.gateReached).

- `crawlerId` (*integer|nil*) : Vehicle id.

#### `gameplay_crawl_display.showPointsMessage(points, crawlerId)`

Displays the total penalty points (duration 600 s, category 'points'), unless hosting a multiplayer session.

- `points` (*number*) : Penalty points.
- `crawlerId` (*integer|nil*) : Id of the vehicle concerned.

#### `gameplay_crawl_display.showSkippedCheckpointsMessage(skippedCount, crawlerId)`

Displays the number of skipped waypoints and the penalty (skippedCount × infractionPoints.skippedCheckpoint).

- `skippedCount` (*integer*) : Number of skipped waypoints.
- `crawlerId` (*integer|nil*) : Vehicle id.

#### `gameplay_crawl_display.showStartedCrawlMessage(crawlerId)`

Displays the crawl start message.

- `crawlerId` (*integer|nil*) : Vehicle id.

#### `gameplay_crawl_display.showVehicleFlippedUprightMessage(crawlerId)`

Displays the vehicle-put-back-on-its-wheels message with the vehicleFlippedUpright penalty.

- `crawlerId` (*integer|nil*) : Vehicle id.

#### `gameplay_crawl_display.showVehicleRecoveredMessage(crawlerId)`

Displays the vehicle recovery message; the displayed penalty is infractionPoints.vehicleReset (no vehicleRecovered key).

- `crawlerId` (*integer|nil*) : Vehicle id.

#### `gameplay_crawl_display.showVehicleResetMessage(crawlerId)`

Displays the vehicle reset message with the vehicleReset penalty.

- `crawlerId` (*integer|nil*) : Vehicle id.

**UI events (guihooks.trigger):** `Message`

## Calls into the engine (C++)

- `be:` `getPlayerVehicleID`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/gameplay/crawl/display.lua`.*
