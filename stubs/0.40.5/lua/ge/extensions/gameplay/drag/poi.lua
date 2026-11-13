---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/drag/poi.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `gameplay_drag_poi` : `extensions.load("gameplay_drag_poi")`, puis la globale `gameplay_drag_poi`
---@class gameplay_drag_poi
---@field dependencies table
gameplay_drag_poi = {}

---Source : lua/ge/extensions/gameplay/drag/poi.lua:55
---@param data any
---@param stripId any
---@param levelId any
function gameplay_drag_poi.applyUserRulesToData(data, stripId, levelId) end

--- racers still at the stage line won't rejoin a new drag until they drive out of all stage triggers
---Source : lua/ge/extensions/gameplay/drag/poi.lua:40
function gameplay_drag_poi.blockRejoinForStagedRacers() end

---Source : lua/ge/extensions/gameplay/drag/poi.lua:51
function gameplay_drag_poi.clearRejoinBlocks() end

---Source : lua/ge/extensions/gameplay/drag/poi.lua:68
---@param data any
---@param lane any
---@param laneIndex any
function gameplay_drag_poi.createStagePoi(data, lane, laneIndex) end

---Source : lua/ge/extensions/gameplay/drag/poi.lua:205
---@param levelIdentifier any
---@param elements any
function gameplay_drag_poi.onGetRawPoiListForLevel(levelIdentifier, elements) end

