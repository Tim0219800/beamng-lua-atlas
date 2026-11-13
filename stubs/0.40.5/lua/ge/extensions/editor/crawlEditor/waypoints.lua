---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/crawlEditor/waypoints.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe locale `C` de lua/ge/extensions/editor/crawlEditor/waypoints.lua (instanciée par la fonction renvoyée par le module)
---@class editor_crawlEditor_waypoints
local editor_crawlEditor_waypoints = {}

---Source : lua/ge/extensions/editor/crawlEditor/waypoints.lua:86
function editor_crawlEditor_waypoints:beginDrag() end

---Source : lua/ge/extensions/editor/crawlEditor/waypoints.lua:179
function editor_crawlEditor_waypoints:createManualPathnode() end

---Source : lua/ge/extensions/editor/crawlEditor/waypoints.lua:97
function editor_crawlEditor_waypoints:dragging() end

---Source : lua/ge/extensions/editor/crawlEditor/waypoints.lua:328
---@param mouseInfo any
function editor_crawlEditor_waypoints:draw(mouseInfo) end

---Source : lua/ge/extensions/editor/crawlEditor/waypoints.lua:546
---@param fields any
function editor_crawlEditor_waypoints:drawCustomFields(fields) end

---Source : lua/ge/extensions/editor/crawlEditor/waypoints.lua:461
---@param pathnode any
---@param index any
function editor_crawlEditor_waypoints:drawPathnodeDetail(pathnode, index) end

---Source : lua/ge/extensions/editor/crawlEditor/waypoints.lua:366
---@param trail any
function editor_crawlEditor_waypoints:drawPathnodeList(trail) end

---Source : lua/ge/extensions/editor/crawlEditor/waypoints.lua:278
function editor_crawlEditor_waypoints:drawPathnodeSegments() end

---Source : lua/ge/extensions/editor/crawlEditor/waypoints.lua:247
function editor_crawlEditor_waypoints:drawPathnodeSelectionIndicators() end

---Source : lua/ge/extensions/editor/crawlEditor/waypoints.lua:139
function editor_crawlEditor_waypoints:endDragging() end

---Source : lua/ge/extensions/editor/crawlEditor/waypoints.lua:538
function editor_crawlEditor_waypoints:getSelectedPathnodeIndex() end

---Source : lua/ge/extensions/editor/crawlEditor/waypoints.lua:167
---@param hovered any
function editor_crawlEditor_waypoints:handleMouseDown(hovered) end

---Source : lua/ge/extensions/editor/crawlEditor/waypoints.lua:33
---@param crawlEditorParam any
function editor_crawlEditor_waypoints:init(crawlEditorParam) end

---Source : lua/ge/extensions/editor/crawlEditor/waypoints.lua:336
function editor_crawlEditor_waypoints:input() end

---Source : lua/ge/extensions/editor/crawlEditor/waypoints.lua:222
function editor_crawlEditor_waypoints:mouseOverPathnodes() end

---Source : lua/ge/extensions/editor/crawlEditor/waypoints.lua:48
---@param id any
function editor_crawlEditor_waypoints:selectPathnode(id) end

---Source : lua/ge/extensions/editor/crawlEditor/waypoints.lua:159
function editor_crawlEditor_waypoints:selectedPathnode() end

---Source : lua/ge/extensions/editor/crawlEditor/waypoints.lua:44
---@param pathParam any
function editor_crawlEditor_waypoints:setPath(pathParam) end

---Source : lua/ge/extensions/editor/crawlEditor/waypoints.lua:542
---@param indexParam any
function editor_crawlEditor_waypoints:setSelectedPathnodeIndex(indexParam) end

---Source : lua/ge/extensions/editor/crawlEditor/waypoints.lua:65
---@param index any
function editor_crawlEditor_waypoints:updateTransform(index) end

