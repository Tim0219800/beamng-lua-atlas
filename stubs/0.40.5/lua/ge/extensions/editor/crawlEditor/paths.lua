---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/crawlEditor/paths.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe locale `C` de lua/ge/extensions/editor/crawlEditor/paths.lua (instanciée par la fonction renvoyée par le module)
---@class editor_crawlEditor_paths
local editor_crawlEditor_paths = {}

--- Adds a node in front of the camera, dropped onto the terrain, so new nodes don't spawn at the origin.
---Source : lua/ge/extensions/editor/crawlEditor/paths.lua:588
function editor_crawlEditor_paths:addNodeAtCamera() end

--- Sets each node's rotation to face the next node, fixing gate orientations in one click.
---Source : lua/ge/extensions/editor/crawlEditor/paths.lua:614
function editor_crawlEditor_paths:autoOrientNodes() end

---Source : lua/ge/extensions/editor/crawlEditor/paths.lua:545
function editor_crawlEditor_paths:beginDrag() end

---Source : lua/ge/extensions/editor/crawlEditor/paths.lua:554
function editor_crawlEditor_paths:dragging() end

---Source : lua/ge/extensions/editor/crawlEditor/paths.lua:720
---@param mouseInfo any
function editor_crawlEditor_paths:draw(mouseInfo) end

---Source : lua/ge/extensions/editor/crawlEditor/paths.lua:140
---@param path any
function editor_crawlEditor_paths:drawPathDetail(path) end

---Source : lua/ge/extensions/editor/crawlEditor/paths.lua:740
---@param mouseInfo any
function editor_crawlEditor_paths:drawPathnodeSelectionIndicators(mouseInfo) end

---Source : lua/ge/extensions/editor/crawlEditor/paths.lua:101
---@param allPaths any
---@param selection any
function editor_crawlEditor_paths:drawPathsList(allPaths, selection) end

---Source : lua/ge/extensions/editor/crawlEditor/paths.lua:578
---@param pos any
function editor_crawlEditor_paths:dropToTerrain(pos) end

---Source : lua/ge/extensions/editor/crawlEditor/paths.lua:698
function editor_crawlEditor_paths:endDragging() end

---Source : lua/ge/extensions/editor/crawlEditor/paths.lua:427
---@param mouseInfo any
---@param objects any
function editor_crawlEditor_paths:findPathnode(mouseInfo, objects) end

---Source : lua/ge/extensions/editor/crawlEditor/paths.lua:401
function editor_crawlEditor_paths:getNewPath() end

---Source : lua/ge/extensions/editor/crawlEditor/paths.lua:410
function editor_crawlEditor_paths:getNewPathnode() end

---Source : lua/ge/extensions/editor/crawlEditor/paths.lua:93
function editor_crawlEditor_paths:getSelectedPathnodeIndex() end

---Source : lua/ge/extensions/editor/crawlEditor/paths.lua:60
---@param crawlEditorParam any
function editor_crawlEditor_paths:init(crawlEditorParam) end

---Source : lua/ge/extensions/editor/crawlEditor/paths.lua:492
---@param mouseInfo any
function editor_crawlEditor_paths:input(mouseInfo) end

--- Renames every node to a clean sequential "Node N".
---Source : lua/ge/extensions/editor/crawlEditor/paths.lua:645
function editor_crawlEditor_paths:renumberNodes() end

--- Reverses node order (so the trail can be authored in either direction).
---Source : lua/ge/extensions/editor/crawlEditor/paths.lua:603
function editor_crawlEditor_paths:reversePathOrder() end

---Source : lua/ge/extensions/editor/crawlEditor/paths.lua:84
---@param index any
function editor_crawlEditor_paths:selectPathnode(index) end

--- Applies a single radius to every node.
---Source : lua/ge/extensions/editor/crawlEditor/paths.lua:636
---@param radius any
function editor_crawlEditor_paths:setAllRadii(radius) end

---Source : lua/ge/extensions/editor/crawlEditor/paths.lua:73
---@param path any
function editor_crawlEditor_paths:setFields(path) end

---Source : lua/ge/extensions/editor/crawlEditor/paths.lua:80
---@param pathParam any
function editor_crawlEditor_paths:setPath(pathParam) end

---Source : lua/ge/extensions/editor/crawlEditor/paths.lua:97
---@param index any
function editor_crawlEditor_paths:setSelectedPathnodeIndex(index) end

--- Drops every node onto the terrain.
---Source : lua/ge/extensions/editor/crawlEditor/paths.lua:654
function editor_crawlEditor_paths:snapAllToTerrain() end

---Source : lua/ge/extensions/editor/crawlEditor/paths.lua:459
---@param mouseInfo any
function editor_crawlEditor_paths:tryInsert(mouseInfo) end

---Source : lua/ge/extensions/editor/crawlEditor/paths.lua:535
function editor_crawlEditor_paths:updateTransform() end

--- Returns a list of human-readable problems found in the current path.
---Source : lua/ge/extensions/editor/crawlEditor/paths.lua:665
function editor_crawlEditor_paths:validatePath() end

