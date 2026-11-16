---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/flowgraph/nodelibrary.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Window class (windowName 'fg_nodelib', windowDescription 'Node library', arrowControllable = true). A static instance is created by flowgraphEditor (M.nodelib) and also serves the context menu.
---@class editor_flowgraph_nodelibrary_C
local editor_flowgraph_nodelibrary_C = {}

--- Sort comparator by name, case-insensitive.
---Source: lua/ge/extensions/editor/flowgraph/nodelibrary.lua:796
---@param a table Item with name field.
---@param b table Item with name field.
---@return boolean  a before b.
function editor_flowgraph_nodelibrary_C._sortFunc(a, b) end

--- Counts the list items and draws the selection/hover frame with automatic scrolling.
---Source: lua/ge/extensions/editor/flowgraph/nodelibrary.lua:1271
---@param cursor ImVec2 Position before the item.
---@param itemSize ImVec2 Size.
---@param doHover boolean Handle hover.
---@param hoverFun function|nil Hover callback.
function editor_flowgraph_nodelibrary_C:arrowHelper(cursor, itemSize, doHover, hoverFun) end

--- Recursively marks dir.isEmpty depending on whether a folder contains elements.
---Source: lua/ge/extensions/editor/flowgraph/nodelibrary.lua:837
---@param dir table Folder.
---@param mode string 'nodes' or 'states'.
function editor_flowgraph_nodelibrary_C:checkEmpty(dir, mode) end

--- Clears the search field, re-filters nodes and macros and resets selection, focus and scrolling to zero.
---Source: lua/ge/extensions/editor/flowgraph/nodelibrary.lua:34
function editor_flowgraph_nodelibrary_C:clear() end

--- Requests creation of the selected node (Enter) or gives focus back to the search field if there is no button.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/flowgraph/nodelibrary.lua:127
function editor_flowgraph_nodelibrary_C:createNode() end

--- Creates a node from a template at the given position, links it to the current pin and adds a history entry. (The function name contains the typo "Buton".)
---Source: lua/ge/extensions/editor/flowgraph/nodelibrary.lua:1214
---@param menuPos ImVec2|nil Position.
---@param node table Node template.
---@return table  Created node (inferred from its use in createStateExitNode).
function editor_flowgraph_nodelibrary_C:createNodeFromButon(menuPos, node) end

--- Creates a state from a template and links it.
---Source: lua/ge/extensions/editor/flowgraph/nodelibrary.lua:1177
---@param menuPos ImVec2|nil Position.
---@param state table State template.
function editor_flowgraph_nodelibrary_C:createStateButton(menuPos, state) end

--- Creates the getter/setter node corresponding to the variable (and links it to the current pin).
---Source: lua/ge/extensions/editor/flowgraph/nodelibrary.lua:981
---@param var table Variable.
---@param menuPos ImVec2|nil Position.
---@param read boolean Getter or setter.
---@param fromMgr boolean Project variable?
function editor_flowgraph_nodelibrary_C:createVariableButton(var, menuPos, read, fromMgr) end

--- Displays a folder as TreeNodes (subfolders then items).
---Source: lua/ge/extensions/editor/flowgraph/nodelibrary.lua:1054
---@param dir table Folder.
---@param menuPos ImVec2|nil Position.
---@param elementFieldName string Field containing the items.
---@param elementFunction function Item display function.
function editor_flowgraph_nodelibrary_C:displayDir(dir, menuPos, elementFieldName, elementFunction) end

--- Displays a macro with hover preview and creation of an instance on click.
---Source: lua/ge/extensions/editor/flowgraph/nodelibrary.lua:1008
---@param macroName string Name.
---@param macro table Macro.
---@param menuPos ImVec2|nil Position.
function editor_flowgraph_nodelibrary_C:displayMacro(macroName, macro, menuPos) end

--- Displays a node template (button, tooltip, preview, drag and drop).
---Source: lua/ge/extensions/editor/flowgraph/nodelibrary.lua:1194
---@param dir table Folder.
---@param menuPos ImVec2|nil Position.
---@param nodeName string Name.
---@param node table Template.
function editor_flowgraph_nodelibrary_C:displayNode(dir, menuPos, nodeName, node) end

--- Displays the sorted results (frecency then score): nodes, variables, states, macros.
---Source: lua/ge/extensions/editor/flowgraph/nodelibrary.lua:637
---@param menuPos ImVec2|nil Creation position.
function editor_flowgraph_nodelibrary_C:displayResults(menuPos) end

--- Displays a simple button with a text and a click function.
---Source: lua/ge/extensions/editor/flowgraph/nodelibrary.lua:1086
---@param menuPos ImVec2|nil Position.
---@param text string Label.
---@param clickFun function Click callback.
---@param ... any Additional arguments (inferred from code).
function editor_flowgraph_nodelibrary_C:displaySimpleElement(menuPos, text, clickFun, ...) end

--- Displays the creation button of a "State Exit" node (with transition name).
---Source: lua/ge/extensions/editor/flowgraph/nodelibrary.lua:1114
---@param menuPos ImVec2|nil Position.
---@param label string|nil Transition name.
function editor_flowgraph_nodelibrary_C:displayStateExitButton(menuPos, label) end

--- Displays a state template in the tree.
---Source: lua/ge/extensions/editor/flowgraph/nodelibrary.lua:1157
---@param dir table Folder.
---@param menuPos ImVec2|nil Position.
---@param stateName string Name.
---@param state table Template.
function editor_flowgraph_nodelibrary_C:displayStateTemplate(dir, menuPos, stateName, state) end

--- Displays a variable (Get/Set) as a node creation button with drag and drop support.
---Source: lua/ge/extensions/editor/flowgraph/nodelibrary.lua:934
---@param var table Variable.
---@param menuPos ImVec2|nil Creation position.
---@param read boolean true for a getter.
---@param fromMgr boolean true if project variable.
function editor_flowgraph_nodelibrary_C:displayVariable(var, menuPos, read, fromMgr) end

--- Draws the "Node Library" window if visible (not the context menu).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/flowgraph/nodelibrary.lua:704
function editor_flowgraph_nodelibrary_C:draw() end

--- Draws the full content (filter, search results or tree) for the window or the context menu.
---Source: lua/ge/extensions/editor/flowgraph/nodelibrary.lua:563
---@param menuPos ImVec2|nil Creation position.
---@param usedForContextMenu boolean|nil true in the context menu.
function editor_flowgraph_nodelibrary_C:drawContent(menuPos, usedForContextMenu) end

--- Window that shows all available nodes as a tree, with drag and drop.
---Source: lua/ge/extensions/editor/flowgraph/nodelibrary.lua:185
---@param menuPos ImVec2|nil Node creation position.
function editor_flowgraph_nodelibrary_C:drawContentAsTreeNodes(menuPos) end

--- Draws the "Search:" field, the clear button and, in the context menu, the Paste button.
---Source: lua/ge/extensions/editor/flowgraph/nodelibrary.lua:66
---@param usedForContextMenu boolean true in the context menu.
function editor_flowgraph_nodelibrary_C:drawTextFilter(usedForContextMenu) end

--- Recomputes filteredMacro from mgr:getAvailableMacros().
---Source: lua/ge/extensions/editor/flowgraph/nodelibrary.lua:901
---@param filterPins boolean Pin filter.
function editor_flowgraph_nodelibrary_C:filterMacroTemplates(filterPins) end

--- Returns the macros (name/tag filters are disabled: everything passes).
---Source: lua/ge/extensions/editor/flowgraph/nodelibrary.lua:869
---@param dir table Available macros.
---@param filterPins boolean Not used.
---@return table|nil  Retained macros.
function editor_flowgraph_nodelibrary_C:filterMacros(dir, filterPins) end

--- Recursively filters a template folder (excludes hidden nodes; applies the pin filter in 'nodes' mode).
---Source: lua/ge/extensions/editor/flowgraph/nodelibrary.lua:798
---@param dir table Folder.
---@param filterPins boolean Apply the pin filter.
---@param mode string 'nodes' or 'states'.
---@return table|nil  Filtered tree.
function editor_flowgraph_nodelibrary_C:filterNodes(dir, filterPins, mode) end

--- Recomputes filteredTemplates/filteredFolders for the requested mode (if the mode has changed) then marks the empty folders.
---Source: lua/ge/extensions/editor/flowgraph/nodelibrary.lua:907
---@param filterPins boolean Pin filter.
---@param mode string 'nodes' or 'states'.
function editor_flowgraph_nodelibrary_C:filterTemplates(filterPins, mode) end

--- Submits to the search all visible nodes that pass the pin filter, then the project and graph variables.
---Source: lua/ge/extensions/editor/flowgraph/nodelibrary.lua:435
function editor_flowgraph_nodelibrary_C:findFlowNodes() end

--- Submits to the search the state templates, "New State", "New Group State", "State Exit" (per transition) and the "Comment" node.
---Source: lua/ge/extensions/editor/flowgraph/nodelibrary.lua:495
function editor_flowgraph_nodelibrary_C:findStateNodes() end

--- Submits to the search the "Get x" / "Set x" entries of each variable of a source.
---Source: lua/ge/extensions/editor/flowgraph/nodelibrary.lua:456
---@param source table Variable container.
---@param sourceName string Label ('Project Variable', 'Graph Variable').
---@param sourceNameTag string 'mgr' or 'graph'.
function editor_flowgraph_nodelibrary_C:findVar(source, sourceName, sourceNameTag) end

--- Extracts a type prefix from the search text (empty typeOrder table: in practice returns nil and the text).
---Source: lua/ge/extensions/editor/flowgraph/nodelibrary.lua:404
---@return string|nil  Type.
---@return string  Text.
function editor_flowgraph_nodelibrary_C:getFilterType() end

--- Indicates whether a folder contains only subfolders (at the first element examined).
---Source: lua/ge/extensions/editor/flowgraph/nodelibrary.lua:46
---@param dir table Template folder.
---@return boolean  Test result.
function editor_flowgraph_nodelibrary_C:hasFoldersOnly(dir) end

--- Writes a label, highlighting the occurrences of the searched text.
---Source: lua/ge/extensions/editor/flowgraph/nodelibrary.lua:610
---@param label string Text.
---@param highlightText string Text to highlight.
function editor_flowgraph_nodelibrary_C:highlightText(label, highlightText) end

--- Initializes search, focus, list indices, registers the window (visible by default) and loads the shared frecency.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/flowgraph/nodelibrary.lua:16
function editor_flowgraph_nodelibrary_C:init() end

--- Links a new state to the current link pin (input flow if the pin is an output, otherwise first output to this pin).
---Source: lua/ge/extensions/editor/flowgraph/nodelibrary.lua:1139
---@param node table Created state node.
function editor_flowgraph_nodelibrary_C:linkState(node) end

--- Moves the keyboard selection (up/down) in the list.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/flowgraph/nodelibrary.lua:135
---@param up boolean true to move up.
function editor_flowgraph_nodelibrary_C:navigateList(up) end

--- Indicates whether a node template has a pin compatible with newNodeLinkPin (and is not the source node).
---Source: lua/ge/extensions/editor/flowgraph/nodelibrary.lua:720
---@param node table Node template.
---@return boolean  true if it passes the filter.
function editor_flowgraph_nodelibrary_C:pinsFilter(node) end

--- Appends to libtxt one line per node of a folder (recursive) for the CSV export.
---Source: lua/ge/extensions/editor/flowgraph/nodelibrary.lua:1337
---@param dir table Folder.
---@param name string Folder name.
---@param tagIndex table Tag index.
---@param libtxt string[] Output lines.
function editor_flowgraph_nodelibrary_C:printDir(dir, name, tagIndex, libtxt) end

--- Exports nodeLib.csv (Name, File, Path, Pin Schema, Todo, Description) and pinLib.csv (Pin, Count, Node, Desc). Developer tool.
---Source: lua/ge/extensions/editor/flowgraph/nodelibrary.lua:1308
function editor_flowgraph_nodelibrary_C:printNodesWithTags() end

--- Computes a.__matchScore for auto-connect: +1000 identical name, +300 identical type, +100 name included, -1150 if one is named 'reset'. Returns nothing. Used by uiAutoConnectShortcut.
---Source: lua/ge/extensions/editor/flowgraph/nodelibrary.lua:1035
---@param a table Source pin (receives __matchScore).
---@param b table Target pin.
function editor_flowgraph_nodelibrary_C:ratePinSimilarity(a, b) end

--- Recursively collects the tags and pins of all nodes for the export.
---Source: lua/ge/extensions/editor/flowgraph/nodelibrary.lua:1386
---@param dir table Folder.
---@param list table Tag table.
---@param pins table Table {names, pins} of the pins.
function editor_flowgraph_nodelibrary_C:recursiveGetTags(dir, list, pins) end

--- Reloads the macro list if mgr.newMacroAdded is true.
---Source: lua/ge/extensions/editor/flowgraph/nodelibrary.lua:882
function editor_flowgraph_nodelibrary_C:refreshMacro() end

--- Reloads and sorts by name the list of state templates.
---Source: lua/ge/extensions/editor/flowgraph/nodelibrary.lua:889
function editor_flowgraph_nodelibrary_C:refreshStateTemplates() end

--- Sets the pin a link is being dragged from: the list is then filtered to compatible nodes/variables.
---Source: lua/ge/extensions/editor/flowgraph/nodelibrary.lua:62
---@param newNodeLinkPin table|nil Source pin of the link being created.
function editor_flowgraph_nodelibrary_C:setNewNodeLinkPin(newNodeLinkPin) end

--- Marks the instance as static (permanent window/menu).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/flowgraph/nodelibrary.lua:57
function editor_flowgraph_nodelibrary_C:setStatic() end

--- Indicates whether a variable is compatible with the current link pin (identical type, 'any', or flow for output).
---Source: lua/ge/extensions/editor/flowgraph/nodelibrary.lua:386
---@param var table Variable (type field).
---@param dir string|nil 'in' or 'out'.
---@return boolean|nil  true if compatible.
function editor_flowgraph_nodelibrary_C:variablePinFilter(var, dir) end

