---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/achievement.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `gameplay_achievement` : `extensions.load("gameplay_achievement")`, puis la globale `gameplay_achievement`
---@class gameplay_achievement
---@field dependencies table
gameplay_achievement = {}

---Source : lua/ge/extensions/gameplay/achievement.lua:376
function gameplay_achievement.onClientStartMission() end

---Source : lua/ge/extensions/gameplay/achievement.lua:380
function gameplay_achievement.onExtensionUnloaded() end

---Source : lua/ge/extensions/gameplay/achievement.lua:364
function gameplay_achievement.onFirstUpdate() end

---Source : lua/ge/extensions/gameplay/achievement.lua:372
function gameplay_achievement.onOnlineServiceProviderReady() end

---Source : lua/ge/extensions/gameplay/achievement.lua:108
---@param key any
---@param oldvalue any
---@param newvalue any
function gameplay_achievement.statCallback(key, oldvalue, newvalue) end

---Source : lua/ge/extensions/gameplay/achievement.lua:385
---@param achievementId any
function gameplay_achievement.unlockAchievement(achievementId) end

