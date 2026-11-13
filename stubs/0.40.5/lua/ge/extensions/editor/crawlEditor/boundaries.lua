---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/crawlEditor/boundaries.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe locale `C` de lua/ge/extensions/editor/crawlEditor/boundaries.lua (instanciée par la fonction renvoyée par le module)
---@class editor_crawlEditor_boundaries
local editor_crawlEditor_boundaries = {}

---Source : lua/ge/extensions/editor/crawlEditor/boundaries.lua:506
function editor_crawlEditor_boundaries:beginDrag() end

---Source : lua/ge/extensions/editor/crawlEditor/boundaries.lua:113
function editor_crawlEditor_boundaries:clearSelection() end

---Source : lua/ge/extensions/editor/crawlEditor/boundaries.lua:519
function editor_crawlEditor_boundaries:dragging() end

---Source : lua/ge/extensions/editor/crawlEditor/boundaries.lua:625
---@param mouseInfo any
function editor_crawlEditor_boundaries:draw(mouseInfo) end

---Source : lua/ge/extensions/editor/crawlEditor/boundaries.lua:118
---@param allBoundaries any
---@param selection any
function editor_crawlEditor_boundaries:drawBoundariesList(allBoundaries, selection) end

---Source : lua/ge/extensions/editor/crawlEditor/boundaries.lua:158
---@param boundary any
function editor_crawlEditor_boundaries:drawBoundaryDetail(boundary) end

---Source : lua/ge/extensions/editor/crawlEditor/boundaries.lua:640
function editor_crawlEditor_boundaries:drawBoundaryEditor() end

---Source : lua/ge/extensions/editor/crawlEditor/boundaries.lua:649
---@param fields any
function editor_crawlEditor_boundaries:drawCustomFields(fields) end

---Source : lua/ge/extensions/editor/crawlEditor/boundaries.lua:586
---@param pos any
function editor_crawlEditor_boundaries:dropToTerrain(pos) end

---Source : lua/ge/extensions/editor/crawlEditor/boundaries.lua:595
function editor_crawlEditor_boundaries:endDragging() end

---Source : lua/ge/extensions/editor/crawlEditor/boundaries.lua:378
---@param mouseInfo any
---@param objects any
function editor_crawlEditor_boundaries:findVert(mouseInfo, objects) end

---Source : lua/ge/extensions/editor/crawlEditor/boundaries.lua:374
function editor_crawlEditor_boundaries:getNewBoundary() end

---Source : lua/ge/extensions/editor/crawlEditor/boundaries.lua:88
---@param crawlEditorParam any
function editor_crawlEditor_boundaries:init(crawlEditorParam) end

---Source : lua/ge/extensions/editor/crawlEditor/boundaries.lua:436
---@param mouseInfo any
function editor_crawlEditor_boundaries:input(mouseInfo) end

---Source : lua/ge/extensions/editor/crawlEditor/boundaries.lua:109
---@param boundaryParam any
function editor_crawlEditor_boundaries:setBoundary(boundaryParam) end

---Source : lua/ge/extensions/editor/crawlEditor/boundaries.lua:102
---@param boundary any
function editor_crawlEditor_boundaries:setFields(boundary) end

---Source : lua/ge/extensions/editor/crawlEditor/boundaries.lua:413
---@param mouseInfo any
function editor_crawlEditor_boundaries:tryInsert(mouseInfo) end

---Source : lua/ge/extensions/editor/crawlEditor/boundaries.lua:478
function editor_crawlEditor_boundaries:updateTransform() end

