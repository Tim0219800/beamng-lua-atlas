---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/achievement.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- GE extension that links the game statistics (gameplay_statistic) to the achievements and statistics of the online provider (OnlineServiceProvider: Steam, EOS...). At startup it reads lua/ge/extensions/gameplay/achievements.json, builds the list of pending achievements and statistics to publish, then subscribes to the corresponding metrics. When a metric reaches the unlockAt threshold, the achievement is unlocked. It also handles three "manual" achievements (VEHICLE_EXPLORER, LEVEL_EXPLORER, VEHICLE_FAVOURITE). A modder mostly uses it through unlockAchievement.
--- Access: extension `gameplay_achievement`: `extensions.load("gameplay_achievement")`, then the global `gameplay_achievement`
---@class gameplay_achievement
---@field dependencies table<integer, string> Extensions loaded before: {"gameplay_statistic"}.
gameplay_achievement = {}

--- Hook called when a level starts; launches startup() again (no effect if already started).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/achievement.lua:376
function gameplay_achievement.onClientStartMission() end

--- Hook called when the extension unloads; sends the statistics and progress still queued.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/achievement.lua:380
function gameplay_achievement.onExtensionUnloaded() end

--- Hook called on the game's first update: launches startup() if the online provider works, otherwise logs a warning.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/achievement.lua:364
function gameplay_achievement.onFirstUpdate() end

--- Hook called when the online service provider becomes ready; launches startup().
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/achievement.lua:372
function gameplay_achievement.onOnlineServiceProviderReady() end

--- Callback registered with gameplay_statistic for each tracked metric. Publishes the corresponding online statistics, pushes achievement progress and unlocks those whose value reaches unlockAt (then removes them from the pending list). Unsubscribes the metric if nobody uses it anymore.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/achievement.lua:108
---@param key string Name of the changed metric.
---@param oldvalue table|nil Old entry of the metric (unused).
---@param newvalue table New entry: fields value (number) and career (boolean).
function gameplay_achievement.statCallback(key, oldvalue, newvalue) end

--- Unlocks an achievement by its identifier via OnlineServiceProvider.unlockAchievement. Only does so once per session for a given identifier.
---Source: lua/ge/extensions/gameplay/achievement.lua:385
---@param achievementId string Achievement identifier on the platform side.
function gameplay_achievement.unlockAchievement(achievementId) end

