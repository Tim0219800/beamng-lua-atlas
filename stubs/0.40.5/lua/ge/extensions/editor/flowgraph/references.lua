---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/flowgraph/references.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe locale `C` de lua/ge/extensions/editor/flowgraph/references.lua
---@class editor_flowgraph_references_C
local editor_flowgraph_references_C = {}

--- because some pins are only created during runtime, we need to make mockups for the nodeTable (Same logic as in basenode)
---Source : lua/ge/extensions/editor/flowgraph/references.lua:232
---@param nodeName any
---@param category any
function editor_flowgraph_references_C:addPinsAndBehavioursForCategory(nodeName, category) end

---Source : lua/ge/extensions/editor/flowgraph/references.lua:82
---@param initialCheck any
function editor_flowgraph_references_C:checkFilesForNodes(initialCheck) end

---Source : lua/ge/extensions/editor/flowgraph/references.lua:35
function editor_flowgraph_references_C:createNodeTable() end

---Source : lua/ge/extensions/editor/flowgraph/references.lua:343
function editor_flowgraph_references_C:draw() end

---Source : lua/ge/extensions/editor/flowgraph/references.lua:376
function editor_flowgraph_references_C:drawViewMode1() end

---Source : lua/ge/extensions/editor/flowgraph/references.lua:497
function editor_flowgraph_references_C:drawViewMode2() end

--- goes through all flowgraphs in directory
---Source : lua/ge/extensions/editor/flowgraph/references.lua:131
---@param flowgraphDirectory any
function editor_flowgraph_references_C:fillNodeTable(flowgraphDirectory) end

---Source : lua/ge/extensions/editor/flowgraph/references.lua:179
function editor_flowgraph_references_C:filterNodes() end

--- recursively goes through node directories
---Source : lua/ge/extensions/editor/flowgraph/references.lua:47
---@param nodeDirectory any
function editor_flowgraph_references_C:findNodesRecursive(nodeDirectory) end

--- this is copied almost completely from nodeLibrary
---Source : lua/ge/extensions/editor/flowgraph/references.lua:294
---@param label any
---@param highlightText any
function editor_flowgraph_references_C:highlightText(label, highlightText) end

---Source : lua/ge/extensions/editor/flowgraph/references.lua:21
function editor_flowgraph_references_C:init() end

---Source : lua/ge/extensions/editor/flowgraph/references.lua:278
---@param nodeName any
---@param direction any
---@param pinName any
function editor_flowgraph_references_C:pinExists(nodeName, direction, pinName) end

---Source : lua/ge/extensions/editor/flowgraph/references.lua:116
function editor_flowgraph_references_C:sortCategories() end

--- sorts projects for most occurrences
---Source : lua/ge/extensions/editor/flowgraph/references.lua:326
function editor_flowgraph_references_C:sortProjects() end

--- updates nodeTable for occurence of node in project
---Source : lua/ge/extensions/editor/flowgraph/references.lua:146
---@param nodeName any
---@param fileName any
function editor_flowgraph_references_C:updateNodeOccurrence(nodeName, fileName) end

