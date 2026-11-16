---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/crawlEditor.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- World Editor "crawl" (rock crawling) data editor, "Crawl Data Editor" window (Gameplay menu). It loads, edits and saves four kinds of objects via gameplay/crawl/saveSystem: trails (routes linking a path, a boundary and a starting position), paths (nodes), boundaries (zones) and starting positions. It also lists objects coming from missions (/gameplay/missions/<level>/crawl/<mission>/). It delegates editing to the submodules crawlEditor/paths, boundaries, trails, startingPositions, input and missionPortTool, registers four edit modes (pathEditMode, boundaryEditMode, startingPositionEditMode, trailEditMode) and permanently draws the selected nodes, boundaries and starting positions. Useful to a modder who creates crawl routes for a level or wants to read the loaded data from another extension.
--- Access: extension `editor_crawlEditor`: `extensions.load("editor_crawlEditor")`, then the global `editor_crawlEditor`
---@class editor_crawlEditor
editor_crawlEditor = {}

--- Returns the list of level boundaries.
---Source: lua/ge/extensions/editor/crawlEditor.lua:1419
---@return table  List of boundaries
function editor_crawlEditor.getAllBoundaries() end

--- Returns the list of boundaries coming from missions.
---Source: lua/ge/extensions/editor/crawlEditor.lua:1420
---@return table  List of mission boundaries
function editor_crawlEditor.getAllMissionBoundaries() end

--- Returns the list of paths coming from missions.
---Source: lua/ge/extensions/editor/crawlEditor.lua:1418
---@return table  List of mission paths
function editor_crawlEditor.getAllMissionPaths() end

--- Returns the list of trails coming from the crawl missions of the current level.
---Source: lua/ge/extensions/editor/crawlEditor.lua:1416
---@return table  List of mission trails
function editor_crawlEditor.getAllMissionTrails() end

--- Returns the list of level paths.
---Source: lua/ge/extensions/editor/crawlEditor.lua:1417
---@return table  List of paths
function editor_crawlEditor.getAllPaths() end

--- Returns the list of starting positions.
---Source: lua/ge/extensions/editor/crawlEditor.lua:1421
---@return table  List of starting positions
function editor_crawlEditor.getAllStartingPositions() end

--- Returns the list of loaded level trails.
---Source: lua/ge/extensions/editor/crawlEditor.lua:1415
---@return table  List of trails (internal table)
function editor_crawlEditor.getAllTrails() end

--- Returns the selected boundary (level or mission).
---Source: lua/ge/extensions/editor/crawlEditor.lua:280
---@return table|nil  Boundary or nil
function editor_crawlEditor.getSelectedBoundary() end

--- Returns the index of the selected boundary.
---Source: lua/ge/extensions/editor/crawlEditor.lua:1424
---@return integer  Index
function editor_crawlEditor.getSelectedBoundaryIndex() end

--- Returns the selected path (level or mission).
---Source: lua/ge/extensions/editor/crawlEditor.lua:271
---@return table|nil  Path or nil
function editor_crawlEditor.getSelectedPath() end

--- Returns the index of the selected path.
---Source: lua/ge/extensions/editor/crawlEditor.lua:1423
---@return integer  Index
function editor_crawlEditor.getSelectedPathIndex() end

--- Returns the selected starting position.
---Source: lua/ge/extensions/editor/crawlEditor.lua:289
---@return table|nil  Starting position or nil
function editor_crawlEditor.getSelectedStartingPosition() end

--- Returns the index of the selected starting position.
---Source: lua/ge/extensions/editor/crawlEditor.lua:1425
---@return integer  Index
function editor_crawlEditor.getSelectedStartingPositionIndex() end

--- Returns the selected trail (level or mission).
---Source: lua/ge/extensions/editor/crawlEditor.lua:262
---@return table|nil  Trail or nil
function editor_crawlEditor.getSelectedTrail() end

--- Returns the index of the selected trail.
---Source: lua/ge/extensions/editor/crawlEditor.lua:1422
---@return integer  Index (> 0 if selected)
function editor_crawlEditor.getSelectedTrailIndex() end

--- Reloads from disk the trails, paths, boundaries and starting positions (via saveSystem.getAll...Files / get...ById), as well as those of the crawl missions of the current level. First clears the in-memory lists.
---Source: lua/ge/extensions/editor/crawlEditor.lua:167
function editor_crawlEditor.loadAllObjects() end

--- Marks an object as modified (unsaved).
---Source: lua/ge/extensions/editor/crawlEditor.lua:304
---@param objectType string "trail", "path", "boundary" or "startingPosition"
---@param index integer Global index (mission objects included except for startingPosition)
function editor_crawlEditor.markAsDirty(objectType, index) end

--- Moves a mission trail to /levels/<level>/crawls/: rewrites pathId and boundaryId to point to this folder, saves the trail, deletes the old file, then reloads everything. Fails if the trail is not from a mission, if no level is loaded or if the file already exists.
---Source: lua/ge/extensions/editor/crawlEditor.lua:456
---@param trail table Trail with _isFromMission = true
---@return boolean  true if moved
function editor_crawlEditor.moveTrailToLevel(trail) end

--- Restores the state returned by onSerialize (indices default to -1).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/crawlEditor.lua:860
---@param data table|nil Data from onSerialize
function editor_crawlEditor.onDeserialized(data) end

--- Called every frame: updates the mouse (crawlEditor/input), draws the permanent overlays (nodes, boundaries, starting positions), the window (File menu with Save All, lists on the left, details on the right, Save/Delete buttons) and the mission porting window.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/crawlEditor.lua:873
function editor_crawlEditor.onEditorGui() end

--- Registers the "Crawl Data Editor" window (1800x900), the menu entry (Gameplay group) and the four edit modes with their auxiliary shortcuts. Called once at editor initialization.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/crawlEditor.lua:781
function editor_crawlEditor.onEditorInitialized() end

--- Serialization hook before Lua reload: returns the current folder/file name, crawlData, current tab and selection indices.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/crawlEditor.lua:846
---@return table  Data to restore
function editor_crawlEditor.onSerialize() end

--- Renames the file of a crawl object and updates the trails' references.
---Source: lua/ge/extensions/editor/crawlEditor.lua:74
---@param oldFilePath string Old path
---@param newFilePath string New path (must not exist)
---@param objectType string "trail", "path", "boundary" or "startingPosition"
---@return boolean  true if renamed; false if identical/nil paths, existing target or failure
function editor_crawlEditor.renameObjectFile(oldFilePath, newFilePath, objectType) end

--- Sets the index of the selected boundary.
---Source: lua/ge/extensions/editor/crawlEditor.lua:1428
---@param index integer Index
function editor_crawlEditor.setSelectedBoundaryIndex(index) end

--- Sets the index of the selected path.
---Source: lua/ge/extensions/editor/crawlEditor.lua:1427
---@param index integer Index
function editor_crawlEditor.setSelectedPathIndex(index) end

--- Sets the index of the selected starting position.
---Source: lua/ge/extensions/editor/crawlEditor.lua:1429
---@param index integer Index
function editor_crawlEditor.setSelectedStartingPositionIndex(index) end

--- Sets the index of the selected trail without touching the other selections.
---Source: lua/ge/extensions/editor/crawlEditor.lua:1426
---@param index integer Index (1 = first)
function editor_crawlEditor.setSelectedTrailIndex(index) end

