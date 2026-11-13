# `gameplay_crawl_display`

*Fichier : `lua/ge/extensions/gameplay/crawl/display.lua` · VM : Game Engine (GE) · 249 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `gameplay_crawl_display` : `extensions.load("gameplay_crawl_display")`, puis la globale `gameplay_crawl_display`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `gameplay_crawl_display.clearDisqualifiedWaitingMessage(crawlerId)` |  | 188 |
| `gameplay_crawl_display.clearPointsMessage(crawlerId)` |  | 156 |
| `gameplay_crawl_display.onCrawlComplete()` | *(hook)* | 133 |
| `gameplay_crawl_display.onCrawlResultsShown()` | *(hook)* | 137 |
| `gameplay_crawl_display.onCrawlStarted()` | *(hook)* | 128 |
| `gameplay_crawl_display.onExtensionLoaded()` | *(hook)* | 141 |
| `gameplay_crawl_display.onExtensionUnloaded()` | *(hook)* | 145 |
| `gameplay_crawl_display.showBonusCheckpointMessage(penaltyPoints, crawlerId)` |  | 212 |
| `gameplay_crawl_display.showBoundaryViolationMessage(crawlerId)` |  | 208 |
| `gameplay_crawl_display.showCrawlCompletedMessage(time, points, crawlerId)` |  | 160 |
| `gameplay_crawl_display.showDNFMessage(crawlerId)` |  | 220 |
| `gameplay_crawl_display.showDisqualifiedMessage(eventData)` |  | 179 |
| `gameplay_crawl_display.showDisqualifiedWaitingMessage(crawlerId)` |  | 184 |
| `gameplay_crawl_display.showDrivingBackwardsMessage(crawlerId)` |  | 192 |
| `gameplay_crawl_display.showGateClearedMessage(penaltyPoints, crawlerId)` |  | 216 |
| `gameplay_crawl_display.showGateReachedMessage(crawlerId)` |  | 171 |
| `gameplay_crawl_display.showPointsMessage(points, crawlerId)` |  | 150 |
| `gameplay_crawl_display.showSkippedCheckpointsMessage(skippedCount, crawlerId)` |  | 167 |
| `gameplay_crawl_display.showStartedCrawlMessage(crawlerId)` |  | 175 |
| `gameplay_crawl_display.showVehicleFlippedUprightMessage(crawlerId)` |  | 196 |
| `gameplay_crawl_display.showVehicleRecoveredMessage(crawlerId)` |  | 204 |
| `gameplay_crawl_display.showVehicleResetMessage(crawlerId)` |  | 200 |

**Évènements UI (guihooks.trigger) :** `Message`

## Appels vers le moteur (C++)

- `be:` `getPlayerVehicleID`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/crawl/display.lua`.*
