---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/flowgraph/references.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Window class (windowName 'fg_references', windowDescription 'References'). Main data: nodeTable (by node name: displayName, amount, pins {inPins,outPins}, category, behaviour, amountForProjects), nodeStatistics, filteredNodes, sortedProjects, sortedCategories, viewMode (1 list, 2 detail).
---@class editor_flowgraph_references_C
local editor_flowgraph_references_C = {}

--- Adds to the nodeTable entry the pins and behaviors (simple, duration, once) that are only created at runtime depending on the node's category.
---Source: lua/ge/extensions/editor/flowgraph/references.lua:232
---@param nodeName string Node concerned.
---@param category string|nil Node category.
function editor_flowgraph_references_C:addPinsAndBehavioursForCategory(nodeName, category) end

--- Recomputes the occurrences of each node in the .flow.json files and in the current project, then re-filters and re-sorts.
---Source: lua/ge/extensions/editor/flowgraph/references.lua:82
---@param initialCheck boolean true at creation: does not reset the counters.
function editor_flowgraph_references_C:checkFilesForNodes(initialCheck) end

--- Builds nodeTable from the available node templates then counts the usages (checkFilesForNodes(true)).
---Source: lua/ge/extensions/editor/flowgraph/references.lua:35
function editor_flowgraph_references_C:createNodeTable() end

--- Draws the window: "Load Data" button while nodeTable is empty, otherwise navigation arrows and view 1 or 2.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/flowgraph/references.lua:343
function editor_flowgraph_references_C:draw() end

--- List view: search field, filter mode combo, statistics and node list.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/flowgraph/references.lua:376
function editor_flowgraph_references_C:drawViewMode1() end

--- Detail view of the inspected node: pins and projects that use it.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/flowgraph/references.lua:497
function editor_flowgraph_references_C:drawViewMode2() end

--- Reads each flowgraph file of the list and updates the occurrences of its nodes.
---Source: lua/ge/extensions/editor/flowgraph/references.lua:131
---@param flowgraphDirectory string[] Paths of .flow.json files.
function editor_flowgraph_references_C:fillNodeTable(flowgraphDirectory) end

--- Builds filteredNodes according to the typed text and the filter mode (All, Current, unused), sorted by decreasing number of usages.
---Source: lua/ge/extensions/editor/flowgraph/references.lua:179
function editor_flowgraph_references_C:filterNodes() end

--- Recursively walks the node folder tree and creates one nodeTable entry per node (in/out pins from the pinSchema, category, behaviors) while updating the per-category statistics.
---Source: lua/ge/extensions/editor/flowgraph/references.lua:47
---@param nodeDirectory table Template tree returned by getAvailableNodeTemplates.
function editor_flowgraph_references_C:findNodesRecursive(nodeDirectory) end

--- Writes a label, highlighting the occurrences of the searched text (copy from nodelibrary).
---Source: lua/ge/extensions/editor/flowgraph/references.lua:294
---@param label string Text.
---@param highlightText string Substring to highlight.
function editor_flowgraph_references_C:highlightText(label, highlightText) end

--- Registers the window and initializes the tables, the view mode (1) and the filter (All).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/flowgraph/references.lua:21
function editor_flowgraph_references_C:init() end

--- Indicates whether a pin of this name already exists in the node's entry.
---Source: lua/ge/extensions/editor/flowgraph/references.lua:278
---@param nodeName string Node.
---@param direction string 'in' or 'out'.
---@param pinName string Pin name.
---@return boolean|nil  true if found, otherwise nil.
function editor_flowgraph_references_C:pinExists(nodeName, direction, pinName) end

--- Sorts the categories by decreasing number of node types in self.sortedCategories.
---Source: lua/ge/extensions/editor/flowgraph/references.lua:116
function editor_flowgraph_references_C:sortCategories() end

--- Sorts the projects using the inspected node by decreasing number of occurrences in self.sortedProjects.
---Source: lua/ge/extensions/editor/flowgraph/references.lua:326
function editor_flowgraph_references_C:sortProjects() end

--- Increments the usage counters of a node (total, per project, per category); creates an 'OBSOLETE' entry if the node is unknown.
---Source: lua/ge/extensions/editor/flowgraph/references.lua:146
---@param nodeName string Name (path) of the node type.
---@param fileName string Project file where it appears.
function editor_flowgraph_references_C:updateNodeOccurrence(nodeName, fileName) end

