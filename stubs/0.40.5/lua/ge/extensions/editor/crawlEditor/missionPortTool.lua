---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/crawlEditor/missionPortTool.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Migration tool of the crawl editor: converts old crawl missions (folder /gameplay/missions/<level>/crawl/<mission>/ containing bounds.sites.json and race.race.json) to the new crawl system. For each mission it generates a .boundary.json file (zone from bounds.sites.json), a .path.json (nodes from the pathnodes of race.race.json, with recovery flags), a .startingPosition.json (starting position) in /levels/<level>/crawls/, then a .trail.json in the mission folder, which links everything. Goes through gameplay/crawl/saveSystem (saveBoundary, savePath, saveStartingPosition, saveTrail).
--- Access: extension `editor_crawlEditor_missionPortTool`: `extensions.load("editor_crawlEditor_missionPortTool")`, then the global `editor_crawlEditor_missionPortTool`
---@class editor_crawlEditor_missionPortTool
editor_crawlEditor_missionPortTool = {}

--- Rescans the missions of the current level and opens the porting window.
---Source: lua/ge/extensions/editor/crawlEditor/missionPortTool.lua:492
function editor_crawlEditor_missionPortTool.openPortingDialog() end

--- Converts a crawl mission: reads bounds.sites.json, race.race.json, creates boundary/path/startingPosition in /levels/<level>/crawls/ and the trail in the mission folder. Logs each error with the tag mission_port_tool.
---Source: lua/ge/extensions/editor/crawlEditor/missionPortTool.lua:132
---@param missionDir string Path of the mission folder (the mission name is its last segment)
---@param targetLevel string|nil Destination level identifier; defaults to the loaded level
---@return boolean  true if boundary, path and trail were saved; false on failure (the starting position is optional)
function editor_crawlEditor_missionPortTool.portMission(missionDir, targetLevel) end

--- Draws the imgui window "Mission Port Tool" (Port All Missions, list of convertible missions of the current level with one button per mission, Refresh, Close) if the dialog is open. To be called every frame (from the editor).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/crawlEditor/missionPortTool.lua:409
function editor_crawlEditor_missionPortTool.showPortingDialog() end

