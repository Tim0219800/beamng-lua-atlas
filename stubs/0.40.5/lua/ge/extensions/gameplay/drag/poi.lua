---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/drag/poi.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Points of interest (POI) of the drag tracks. For each lane of each track of the level, creates an invisible trigger of 6 m radius placed on the stage line. When a vehicle enters it, the module arms the track (core.setDragRaceData with the saved user rules) and starts the race (core.startDragRaceActivity), or opens the MP menu if multiplayer mode is active. Also handles multiseat entry (several players, one per lane) and prevents rejoining immediately after a race as long as the vehicle stays at the line.
--- Access: extension `gameplay_drag_poi`: `extensions.load("gameplay_drag_poi")`, then the global `gameplay_drag_poi`
---@class gameplay_drag_poi
---@field dependencies string[] gameplay_drag_rulesMenu.
gameplay_drag_poi = {}

--- Applies to data the rules saved by the user for the track (dragType, importantTimerId, prefabs.christmasTree.treeType).
---Source: lua/ge/extensions/gameplay/drag/poi.lua:55
---@param data table Track data, modified in place.
---@param stripId string|nil Track identifier.
---@param levelId string|nil Level identifier.
function gameplay_drag_poi.applyUserRulesToData(data, stripId, levelId) end

--- Marks the racers still within 6 m of a stage line: they cannot restart a race until they have left all the stage triggers.
---Source: lua/ge/extensions/gameplay/drag/poi.lua:40
function gameplay_drag_poi.blockRejoinForStagedRacers() end

--- Clears the list of vehicles forbidden to restart.
---Source: lua/ge/extensions/gameplay/drag/poi.lua:51
function gameplay_drag_poi.clearRejoinBlocks() end

--- Creates the definition of a POI (id and multiseat markerInfo.invisibleTrigger with onInside/onExit) for a lane. Returns nil with a warning if the lane has no stage point.
---Source: lua/ge/extensions/gameplay/drag/poi.lua:68
---@param data table Track data (strip, _fnWithoutExt...).
---@param lane table Lane (waypoints.stage, shortName).
---@param laneIndex integer Lane index.
---@return table|nil  POI {id, markerInfo} or nil.
function gameplay_drag_poi.createStagePoi(data, lane, laneIndex) end

--- Hook (relayed by core): adds to elements one POI per lane of each drag track of the level, if drag is enabled.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/drag/poi.lua:205
---@param levelIdentifier string Level name.
---@param elements table[] POI list completed in place.
function gameplay_drag_poi.onGetRawPoiListForLevel(levelIdentifier, elements) end

