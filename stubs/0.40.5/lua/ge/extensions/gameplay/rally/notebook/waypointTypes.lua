---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/rally/notebook/waypointTypes.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Constants for the waypoint types of a rally pacenote: corner start ("cornerStart") and corner end ("cornerEnd"). Also provides a function that abbreviates these types to "Cs" / "Ce" for display in the editor.
--- Access: extension `gameplay_rally_notebook_waypointTypes`: `extensions.load("gameplay_rally_notebook_waypointTypes")`, then the global `gameplay_rally_notebook_waypointTypes`
---@class gameplay_rally_notebook_waypointTypes
---@field wpTypeCornerEnd string Value "cornerEnd": corner end waypoint.
---@field wpTypeCornerStart string Value "cornerStart": corner start waypoint.
gameplay_rally_notebook_waypointTypes = {}

--- Returns the abbreviation of a waypoint type: "Cs" for cornerStart, "Ce" for cornerEnd, nil otherwise.
---Source: lua/ge/extensions/gameplay/rally/notebook/waypointTypes.lua:15
---@param wpType string Waypoint type (wpTypeCornerStart or wpTypeCornerEnd).
---@return string|nil  Abbreviation, or nil if the type is unknown.
function gameplay_rally_notebook_waypointTypes.shortenWaypointType(wpType) end

