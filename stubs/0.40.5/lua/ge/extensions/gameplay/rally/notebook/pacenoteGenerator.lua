---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/rally/notebook/pacenoteGenerator.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `gameplay_rally_notebook_pacenoteGenerator` : `extensions.load("gameplay_rally_notebook_pacenoteGenerator")`, puis la globale `gameplay_rally_notebook_pacenoteGenerator`
---@class gameplay_rally_notebook_pacenoteGenerator
---@field defaultParams table
gameplay_rally_notebook_pacenoteGenerator = {}

--- Main function: detect corners from a list of driveline points
---  @param pointList: array of driveline points with .pos property
---  @param params: optional parameter table (uses defaultParams if nil)
---  @return table with `sections` for debug drawing and `corners` for pacenote generation.
---Source : lua/ge/extensions/gameplay/rally/notebook/pacenoteGenerator.lua:218
---@param pointList any
---@param params any
function gameplay_rally_notebook_pacenoteGenerator.detectCorners(pointList, params) end

