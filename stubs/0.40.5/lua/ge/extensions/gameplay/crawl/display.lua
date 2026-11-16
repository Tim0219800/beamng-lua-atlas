---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/crawl/display.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- On-screen message display for crawl mode. Each showXxxMessage function sends a translated notification (ui.crawl.* keys) via ui_message, or via guihooks.trigger('Message') targeted at a player's panel in split screen (multiseat). It handles penalty, waypoint, finish, disqualification and DNF messages. Penalty categories are only displayed if the crawler has penalties (gameplay_crawl_utils.hasPenalties).
--- Access: extension `gameplay_crawl_display`: `extensions.load("gameplay_crawl_display")`, then the global `gameplay_crawl_display`
---@class gameplay_crawl_display
gameplay_crawl_display = {}

--- Clears the disqualification waiting message.
---Source: lua/ge/extensions/gameplay/crawl/display.lua:188
---@param crawlerId integer|nil Vehicle id.
function gameplay_crawl_display.clearDisqualifiedWaitingMessage(crawlerId) end

--- Clears the points message.
---Source: lua/ge/extensions/gameplay/crawl/display.lua:156
---@param crawlerId integer|nil Vehicle id.
function gameplay_crawl_display.clearPointsMessage(crawlerId) end

--- Hook called at the end of a crawl: calls setCrawlUILayout(false) (no effect).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/crawl/display.lua:133
function gameplay_crawl_display.onCrawlComplete() end

--- Hook called when the results are displayed: empty body.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/crawl/display.lua:137
function gameplay_crawl_display.onCrawlResultsShown() end

--- Hook called when a crawl starts: logs and calls setCrawlUILayout (no effect).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/crawl/display.lua:128
function gameplay_crawl_display.onCrawlStarted() end

--- Hook called on load: empty body.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/crawl/display.lua:141
function gameplay_crawl_display.onExtensionLoaded() end

--- Hook called on unload: forgets the players stored for the messages.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/crawl/display.lua:145
function gameplay_crawl_display.onExtensionUnloaded() end

--- Displays the bonus waypoint message.
---Source: lua/ge/extensions/gameplay/crawl/display.lua:212
---@param penaltyPoints number Points (bonus) to display.
---@param crawlerId integer|nil Vehicle id.
function gameplay_crawl_display.showBonusCheckpointMessage(penaltyPoints, crawlerId) end

--- Displays the zone exit message with the boundaryViolation penalty.
---Source: lua/ge/extensions/gameplay/crawl/display.lua:208
---@param crawlerId integer|nil Vehicle id.
function gameplay_crawl_display.showBoundaryViolationMessage(crawlerId) end

--- Displays "crawl finished", then (10 s) the time and points if the crawler has penalties.
---Source: lua/ge/extensions/gameplay/crawl/display.lua:160
---@param time number Time in seconds (displayed with 3 decimals).
---@param points number Penalty points.
---@param crawlerId integer|nil Vehicle id.
function gameplay_crawl_display.showCrawlCompletedMessage(time, points, crawlerId) end

--- Displays the abandon (DNF) message.
---Source: lua/ge/extensions/gameplay/crawl/display.lua:220
---@param crawlerId integer|nil Vehicle id.
function gameplay_crawl_display.showDNFMessage(crawlerId) end

--- Displays the disqualification message.
---Source: lua/ge/extensions/gameplay/crawl/display.lua:179
---@param eventData table|integer Either a table with crawlerId, or directly the vehicle id.
function gameplay_crawl_display.showDisqualifiedMessage(eventData) end

--- Displays the waiting message after disqualification (600 s).
---Source: lua/ge/extensions/gameplay/crawl/display.lua:184
---@param crawlerId integer|nil Vehicle id.
function gameplay_crawl_display.showDisqualifiedWaitingMessage(crawlerId) end

--- Displays the backwards driving warning with the drivingBackwards penalty.
---Source: lua/ge/extensions/gameplay/crawl/display.lua:192
---@param crawlerId integer|nil Vehicle id.
function gameplay_crawl_display.showDrivingBackwardsMessage(crawlerId) end

--- Displays the message for a gate cleared cleanly.
---Source: lua/ge/extensions/gameplay/crawl/display.lua:216
---@param penaltyPoints number Points to display.
---@param crawlerId integer|nil Vehicle id.
function gameplay_crawl_display.showGateClearedMessage(penaltyPoints, crawlerId) end

--- Displays "gate reached" (ui.crawl.gateReached).
---Source: lua/ge/extensions/gameplay/crawl/display.lua:171
---@param crawlerId integer|nil Vehicle id.
function gameplay_crawl_display.showGateReachedMessage(crawlerId) end

--- Displays the total penalty points (duration 600 s, category 'points'), unless hosting a multiplayer session.
---Source: lua/ge/extensions/gameplay/crawl/display.lua:150
---@param points number Penalty points.
---@param crawlerId integer|nil Id of the vehicle concerned.
function gameplay_crawl_display.showPointsMessage(points, crawlerId) end

--- Displays the number of skipped waypoints and the penalty (skippedCount × infractionPoints.skippedCheckpoint).
---Source: lua/ge/extensions/gameplay/crawl/display.lua:167
---@param skippedCount integer Number of skipped waypoints.
---@param crawlerId integer|nil Vehicle id.
function gameplay_crawl_display.showSkippedCheckpointsMessage(skippedCount, crawlerId) end

--- Displays the crawl start message.
---Source: lua/ge/extensions/gameplay/crawl/display.lua:175
---@param crawlerId integer|nil Vehicle id.
function gameplay_crawl_display.showStartedCrawlMessage(crawlerId) end

--- Displays the vehicle-put-back-on-its-wheels message with the vehicleFlippedUpright penalty.
---Source: lua/ge/extensions/gameplay/crawl/display.lua:196
---@param crawlerId integer|nil Vehicle id.
function gameplay_crawl_display.showVehicleFlippedUprightMessage(crawlerId) end

--- Displays the vehicle recovery message; the displayed penalty is infractionPoints.vehicleReset (no vehicleRecovered key).
---Source: lua/ge/extensions/gameplay/crawl/display.lua:204
---@param crawlerId integer|nil Vehicle id.
function gameplay_crawl_display.showVehicleRecoveredMessage(crawlerId) end

--- Displays the vehicle reset message with the vehicleReset penalty.
---Source: lua/ge/extensions/gameplay/crawl/display.lua:200
---@param crawlerId integer|nil Vehicle id.
function gameplay_crawl_display.showVehicleResetMessage(crawlerId) end

