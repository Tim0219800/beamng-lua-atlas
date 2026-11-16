---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/flowgraph/search.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Window class (windowName 'fg_search', windowDescription 'Search', arrowControllable = true).
---@class editor_flowgraph_search_C
local editor_flowgraph_search_C = {}

--- Deserialization hook: empty.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/flowgraph/search.lua:301
---@param data table Restored data.
function editor_flowgraph_search_C:_onDeserialized(data) end

--- Serialization hook: empty.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/flowgraph/search.lua:297
---@param data table Save table.
function editor_flowgraph_search_C:_onSerialize(data) end

--- Counts the buttons of the list, draws the frame of the selected/hovered item and scrolls to keep it visible.
---Source: lua/ge/extensions/editor/flowgraph/search.lua:305
---@param cursor ImVec2 Cursor position before the item.
---@param itemSize ImVec2 Size of the item.
---@param doHover boolean Not used.
function editor_flowgraph_search_C:arrowHelper(cursor, itemSize, doHover) end

--- Stores the manager, forces a new search and creates the manager's result table.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/flowgraph/search.lua:13
---@param mgr table Flowgraph manager.
function editor_flowgraph_search_C:attach(mgr) end

--- Called by the editor when the user validates (Enter): requests a click on the selected entry at the next draw.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/flowgraph/search.lua:27
function editor_flowgraph_search_C:createNode() end

--- Displays the result list (type, highlighted name, location, score in debug mode) or "No Results!".
---Source: lua/ge/extensions/editor/flowgraph/search.lua:184
function editor_flowgraph_search_C:displayResults() end

--- Draws the "Search" window if it is visible.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/flowgraph/search.lua:264
function editor_flowgraph_search_C:draw() end

--- Draws the "Find:" field, the X button and the help icon (node:/graph:/pin: syntax).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/flowgraph/search.lua:42
function editor_flowgraph_search_C:drawSearchInput() end

--- Submits to the search each graph of type 'graph' of the manager.
---Source: lua/ge/extensions/editor/flowgraph/search.lua:97
---@param match string Searched text (not used).
function editor_flowgraph_search_C:findGraphs(match) end

--- Submits to the search each node of the manager (mgr:allNodes()) and each of their pins, with their location and a frecency identifier.
---Source: lua/ge/extensions/editor/flowgraph/search.lua:70
---@param match string Searched text (not used in the function).
function editor_flowgraph_search_C:findNodes(match) end

--- If the text has changed, re-runs the full search (nodes + graphs) and stores the results for the current manager.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/flowgraph/search.lua:126
function editor_flowgraph_search_C:findStuff() end

--- Extracts the type prefix ('node', 'graph', 'pin') from the typed text.
---Source: lua/ge/extensions/editor/flowgraph/search.lua:170
---@return string|nil  Filtered type or nil.
---@return string  Remaining text in lowercase.
function editor_flowgraph_search_C:getFilterType() end

--- When the window has focus, pushes the 'NodeLibrary' action map and registers itself as the arrow-controllable window.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/flowgraph/search.lua:282
function editor_flowgraph_search_C:handleActionMap() end

--- Writes a label, coloring (orange) up to 6 occurrences of the searched text, case-insensitive.
---Source: lua/ge/extensions/editor/flowgraph/search.lua:144
---@param label string Text to display.
---@param highlightText string Substring to highlight.
function editor_flowgraph_search_C:highlightText(label, highlightText) end

--- Registers the window, creates the text field (128 chars) and the searchUtil search object.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/flowgraph/search.lua:20
function editor_flowgraph_search_C:init() end

--- Handles the click on a result: updates the frecency, selects the graph, deselects everything then selects the node/graph and requests recentering (focusSelection/focusContent).
---Source: lua/ge/extensions/editor/flowgraph/search.lua:235
---@param result table Search result (type 'node', 'graph' or 'pin').
function editor_flowgraph_search_C:manageClick(result) end

--- Moves the keyboard selection in the result list.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/flowgraph/search.lua:31
---@param up boolean true to move up, false to move down.
function editor_flowgraph_search_C:navigateList(up) end

