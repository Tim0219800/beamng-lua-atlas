---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/crawlEditor/trails.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Tool instance. Fields: currentTab ("paths" by default), trail (edited trail), snapToTerrain (true), ImGui buffers (name, fileName, description, rules, thumbnail, preview, missionName, pathReversed, isFromMission).
---@class editor_crawlEditor_trails
local editor_crawlEditor_trails = {}

--- Does nothing (no selection to clear for trails).
---Source: lua/ge/extensions/editor/crawlEditor/trails.lua:563
function editor_crawlEditor_trails:clearSelection() end

--- Draws the zone sphere (translucent green) and the icon (red) of the starting position referenced by the trail, with labels.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/crawlEditor/trails.lua:577
---@param mouseInfo table mouse info
function editor_crawlEditor_trails:draw(mouseInfo) end

--- Draws the trail detail panel: Goto buttons (camera to the starting position or the first node of the path) and Test From Start, fields, thumbnail/preview selectors, path/boundary/position references, prefabs, rules.
---Source: lua/ge/extensions/editor/crawlEditor/trails.lua:150
---@param trail table displayed trail
function editor_crawlEditor_trails:drawTrailDetail(trail) end

--- Draws the "Add Trail" button and the selectable list; right click offers Delete (also deletes the trail's file).
---Source: lua/ge/extensions/editor/crawlEditor/trails.lua:95
---@param allTrails table[] all trails (modified in place)
---@param selection table {index, clicked}
function editor_crawlEditor_trails:drawTrailsList(allTrails, selection) end

--- Creates a default trail (name "New Trail", empty references, pathReversed false, empty prefabs, default rules, metadata version "1.0").
---Source: lua/ge/extensions/editor/crawlEditor/trails.lua:534
---@return table  new trail
function editor_crawlEditor_trails:getNewTrail() end

--- Lists the *.prefab.json files of the /levels/<level>/crawls/ folder of the current level.
---Source: lua/ge/extensions/editor/crawlEditor/trails.lua:77
---@return string[]  file paths (empty if no level)
function editor_crawlEditor_trails:getPrefabFiles() end

--- Initializes the current tab to "paths", no trail selected, snapToTerrain = true.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/crawlEditor/trails.lua:71
function editor_crawlEditor_trails:init() end

--- Mouse handling: empty for trails.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/crawlEditor/trails.lua:571
---@param mouseInfo table mouse info (unused)
function editor_crawlEditor_trails:input(mouseInfo) end

--- Stores the editor's current tab.
---Source: lua/ge/extensions/editor/crawlEditor/trails.lua:567
---@param tab string tab name
function editor_crawlEditor_trails:setCurrentTab(tab) end

--- Fills the ImGui buffers from the trail.
---Source: lua/ge/extensions/editor/crawlEditor/trails.lua:138
---@param trail table trail
function editor_crawlEditor_trails:setFields(trail) end

--- Sets the trail being edited.
---Source: lua/ge/extensions/editor/crawlEditor/trails.lua:559
---@param trailParam table|nil trail
function editor_crawlEditor_trails:setTrail(trailParam) end

