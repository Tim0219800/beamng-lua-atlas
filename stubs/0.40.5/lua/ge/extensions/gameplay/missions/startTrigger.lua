---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/missions/startTrigger.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `gameplay_missions_startTrigger` : `extensions.load("gameplay_missions_startTrigger")`, puis la globale `gameplay_missions_startTrigger`
---@class gameplay_missions_startTrigger
gameplay_missions_startTrigger = {}

---Source : lua/ge/extensions/gameplay/missions/startTrigger.lua:16
---@param location any
---@param level any
---@param playerPosition any
---@param mission any
function gameplay_missions_startTrigger.defaultLocationCheck(location, level, playerPosition, mission) end

---Source : lua/ge/extensions/gameplay/missions/startTrigger.lua:21
---@param location any
---@param playerPosition any
function gameplay_missions_startTrigger.defaultLocationDisplayMarker(location, playerPosition) end

---Source : lua/ge/extensions/gameplay/missions/startTrigger.lua:127
---@param mergeRadius any
function gameplay_missions_startTrigger.getMissionClusters(mergeRadius) end

---Source : lua/ge/extensions/gameplay/missions/startTrigger.lua:187
function gameplay_missions_startTrigger.onAnyMissionChanged() end

--- creates a list of locations from a start trigger.
---Source : lua/ge/extensions/gameplay/missions/startTrigger.lua:62
---@param mission any
function gameplay_missions_startTrigger.parseMission(mission) end

