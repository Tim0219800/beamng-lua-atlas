---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/crawl/debug.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- ImGui debug window "Crawl Debug Window" of crawl mode, reserved for developers (disabled by default). Once enabled, it displays for the first active crawler: trail info, vehicle position and speed, status in the zone, penalty points (DNF threshold 50), infraction cooldowns, recovery point, zone exit point (DNF at 10 m), list of nodes with times, log of the last 20 events and trail status. The data comes from gameplay_crawl_utils.getCrawlState.
--- Access: extension `gameplay_crawl_debug`: `extensions.load("gameplay_crawl_debug")`, then the global `gameplay_crawl_debug`
---@class gameplay_crawl_debug
---@field dependencies table<integer, string> Extensions loaded before: {'ui_imgui'}.
gameplay_crawl_debug = {}

--- Empties the displayed data.
---Source: lua/ge/extensions/gameplay/crawl/debug.lua:351
function gameplay_crawl_debug.clearDebugData() end

--- Tells whether the debug window is enabled.
---Source: lua/ge/extensions/gameplay/crawl/debug.lua:347
---@return boolean  State.
function gameplay_crawl_debug.getEnableDebugWindow() end

--- Hook called at the end of a crawl: marks the data as finished (isFinished).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/crawl/debug.lua:292
---@param eventData table Event data (unused).
function gameplay_crawl_debug.onCrawlComplete(eventData) end

--- Hook called on disqualification: marks the data as finished and disqualified.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/crawl/debug.lua:299
---@param eventData table Event data (unused).
function gameplay_crawl_debug.onCrawlDisqualified(eventData) end

--- Hook called at the start of a crawl: opens the window if debug is enabled.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/crawl/debug.lua:285
---@param eventData table Event data (unused).
function gameplay_crawl_debug.onCrawlStarted(eventData) end

--- Hook called when the extension loads: resets the window state.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/crawl/debug.lua:307
function gameplay_crawl_debug.onExtensionLoaded() end

--- Hook called when the extension unloads: resets the window state.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/crawl/debug.lua:313
function gameplay_crawl_debug.onExtensionUnloaded() end

--- Hook called before rendering: updates the data from the first active crawler and draws the window.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/crawl/debug.lua:319
---@param dtReal number Real time delta (s).
---@param dtSim number Simulation time delta (s).
---@param dtRaw number Raw time delta (s).
function gameplay_crawl_debug.onPreRender(dtReal, dtSim, dtRaw) end

--- Enables or disables the debug window; disabling it closes it and empties the data.
---Source: lua/ge/extensions/gameplay/crawl/debug.lua:338
---@param enabled boolean true to enable.
function gameplay_crawl_debug.setEnableDebugWindow(enabled) end

