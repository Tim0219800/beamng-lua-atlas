---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/flowgraph/examples.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Examples window class (windowName = 'fg_examples', arrowControllable = true).
---@class editor_flowgraph_examples_C
local editor_flowgraph_examples_C = {}

--- Deserialization (empty).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/flowgraph/examples.lua:302
---@param data table Data.
function editor_flowgraph_examples_C:_onDeserialized(data) end

--- Serialization (empty).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/flowgraph/examples.lua:298
---@param data table Data.
function editor_flowgraph_examples_C:_onSerialize(data) end

--- Counts the item in the navigable list and draws the keyboard selection frame.
---Source: lua/ge/extensions/editor/flowgraph/examples.lua:306
---@param cursor ImVec2 Cursor position before the item.
---@param itemSize ImVec2 Size of the item.
---@param doHover boolean|nil (inferred from code)
function editor_flowgraph_examples_C:arrowHelper(cursor, itemSize, doHover) end

--- Associates the manager and resets the search.
---Source: lua/ge/extensions/editor/flowgraph/examples.lua:13
---@param mgr table Flowgraph manager.
function editor_flowgraph_examples_C:attach(mgr) end

--- Requests validation of the selected item at the next display (doClick).
---Source: lua/ge/extensions/editor/flowgraph/examples.lua:76
function editor_flowgraph_examples_C:createNode() end

--- Displays the search results (or "No Results!").
---Source: lua/ge/extensions/editor/flowgraph/examples.lua:178
function editor_flowgraph_examples_C:displayResults() end

--- Displays the full tree of examples.
---Source: lua/ge/extensions/editor/flowgraph/examples.lua:235
function editor_flowgraph_examples_C:displayTreeView() end

--- Draws the Examples window (search or tree).
---Source: lua/ge/extensions/editor/flowgraph/examples.lua:214
function editor_flowgraph_examples_C:draw() end

--- Draws the "Find" field, the clear button and the help.
---Source: lua/ge/extensions/editor/flowgraph/examples.lua:91
function editor_flowgraph_examples_C:drawSearchInput() end

--- Submits each example to the search utility.
---Source: lua/ge/extensions/editor/flowgraph/examples.lua:119
---@param match string Searched string (not used directly in the body, inferred from code).
function editor_flowgraph_examples_C:findExamples(match) end

--- Re-runs the search if the text has changed and fills self.results.
---Source: lua/ge/extensions/editor/flowgraph/examples.lua:133
function editor_flowgraph_examples_C:findStuff() end

--- Returns the tree and the flat table (via loadExamples).
---Source: lua/ge/extensions/editor/flowgraph/examples.lua:72
---@return table  Tree.
---@return table  Lookup.
function editor_flowgraph_examples_C:getExamplesLookup() end

--- When the window has focus, pushes the "NodeLibrary" action map for arrow-key navigation.
---Source: lua/ge/extensions/editor/flowgraph/examples.lua:283
function editor_flowgraph_examples_C:handleActionMap() end

--- Displays a label, highlighting in orange the occurrences of the searched text.
---Source: lua/ge/extensions/editor/flowgraph/examples.lua:147
---@param label string Label.
---@param highlightText string Text to highlight.
function editor_flowgraph_examples_C:highlightText(label, highlightText) end

--- Registers the window, creates the search utility and loads the examples.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/flowgraph/examples.lua:20
function editor_flowgraph_examples_C:init() end

--- Walks FS:findFiles over the example .flow.json files, builds the tree (res) and the flat table (lookup) with their JSON content, then caches them.
---Source: lua/ge/extensions/editor/flowgraph/examples.lua:30
---@return table  Tree of examples.
---@return table  Flat table path -> data.
function editor_flowgraph_examples_C:loadExamples() end

--- If the item is clicked (or validated by keyboard), creates a manager via core_flowgraphManager.addManager and makes it active in the editor.
---Source: lua/ge/extensions/editor/flowgraph/examples.lua:205
---@param result table Result containing info.data (project data).
function editor_flowgraph_examples_C:manageClick(result) end

--- Moves the keyboard selection in the list.
---Source: lua/ge/extensions/editor/flowgraph/examples.lua:80
---@param up boolean true to move up.
function editor_flowgraph_examples_C:navigateList(up) end

--- Recursively displays a tree node: sorted examples then subfolders.
---Source: lua/ge/extensions/editor/flowgraph/examples.lua:242
---@param element table Tree node.
---@param depth integer Depth (used for ImGui identifiers).
function editor_flowgraph_examples_C:recursiveTreeView(element, depth) end

