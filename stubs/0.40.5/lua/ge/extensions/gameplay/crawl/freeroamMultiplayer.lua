---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/crawl/freeroamMultiplayer.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Crawl integration in multiplayer freeroam. Loaded by gameplay_crawl_general when a multiplayer session starts (onMPSessionChanged), unloaded when it ends. It shows the "scoreboard" app at the top left and creates a scoreboard (multiplayer_multiplayerScoreboard) with a penalty points column (ascending sort). It updates the local player's score, makes their row flash red (penalty) or green (bonus), and indicates disqualification or finish.
--- Access: extension `gameplay_crawl_freeroamMultiplayer`: `extensions.load("gameplay_crawl_freeroamMultiplayer")`, then the global `gameplay_crawl_freeroamMultiplayer`
---@class gameplay_crawl_freeroamMultiplayer
gameplay_crawl_freeroamMultiplayer = {}

--- Hook called on disqualification: "disqualified" status in the scoreboard and hiding of the scoreboard app.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/crawl/freeroamMultiplayer.lua:38
function gameplay_crawl_freeroamMultiplayer.onCrawlDisqualified() end

--- Hook called when the penalty score changes: sends the new value to the scoreboard and makes the player's row flash.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/crawl/freeroamMultiplayer.lua:22
---@param eventData table {penaltyScore, oldPenaltyScore}.
function gameplay_crawl_freeroamMultiplayer.onCrawlPenaltyScoreChanged(eventData) end

--- Hook called when the results are shown: pushes the final points and the "finishLine" status.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/crawl/freeroamMultiplayer.lua:45
---@param eventData table {points, time}.
function gameplay_crawl_freeroamMultiplayer.onCrawlResultsShown(eventData) end

--- Hook called when a crawl starts: shows the scoreboard app, creates a scoreboard and pushes the initial score 0.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/crawl/freeroamMultiplayer.lua:9
---@param trail table Event data; its id field is used as the scoreboard identifier (see notes).
function gameplay_crawl_freeroamMultiplayer.onCrawlStarted(trail) end

