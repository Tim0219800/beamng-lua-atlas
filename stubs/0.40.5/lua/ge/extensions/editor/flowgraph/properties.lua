---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/flowgraph/properties.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Window class (windowName 'fg_properties', windowDescription 'Properties').
---@class editor_flowgraph_properties_C
local editor_flowgraph_properties_C = {}

--- Draws a data table in two key/value columns (sorted keys), or a single row if the only key is 'value'.
---Source: lua/ge/extensions/editor/flowgraph/properties.lua:158
---@param path string Identifier prefix.
---@param cdata table ImGui cache.
---@param v table Edited table.
---@param savePath string Base path.
---@param saveCallback function|nil function(savePath, newValue).
---@param keysEditable boolean|nil Allow renaming the keys.
function editor_flowgraph_properties_C:_drawDataTable(path, cdata, v, savePath, saveCallback, keysEditable) end

--- Draws an edit field suited to the value type and calls saveCallback when the input is validated.
---Source: lua/ge/extensions/editor/flowgraph/properties.lua:24
---@param path string Unique field identifier.
---@param cdata table Cache of ImGui values.
---@param type string Lua type of the value ('number', 'string', 'boolean'...).
---@param v any Current value.
---@param savePath string Path passed to the callback.
---@param saveCallback function function(savePath, newValue).
---@param enterOnly boolean|nil Validate only with Enter (inferred from the name).
---@param padRight number|nil Right margin in pixels.
---@param pin table|nil Pin concerned (numericSetup).
function editor_flowgraph_properties_C:_drawInputField(path, cdata, type, v, savePath, saveCallback, enterOnly, padRight, pin) end

--- Draws an RGBA color picker for a custom property and writes it to item[customName] at the end of the edit.
---Source: lua/ge/extensions/editor/flowgraph/properties.lua:199
---@param item table Node or graph.
---@param customName string Name of the color field.
---@param cdata table ImGui array of 4 floats.
---@return string|nil  History reason if modified.
function editor_flowgraph_properties_C:customPropertyColor(item, customName, cdata) end

--- Draws the window: highlights the links of the selected nodes, handles selection changes, displays the selected node or the graph properties.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/flowgraph/properties.lua:1020
---@param dt number Real delta time (s), passed to node:drawCustomProperties.
function editor_flowgraph_properties_C:draw(dt) end

--- Draws the editable "Input Pins" section for nodes with custom input pins (allowCustomInPins).
---Source: lua/ge/extensions/editor/flowgraph/properties.lua:397
---@param item table Node.
function editor_flowgraph_properties_C:drawCustomInPins(item) end

--- Draws the editable output pins section (allowCustomOutPins).
---Source: lua/ge/extensions/editor/flowgraph/properties.lua:610
---@param item table Node.
function editor_flowgraph_properties_C:drawCustomOutPins(item) end

--- Draws the properties of a graph (name, with update of the integrated node for a macro, etc.).
---Source: lua/ge/extensions/editor/flowgraph/properties.lua:1156
---@param graph table Current graph.
function editor_flowgraph_properties_C:drawGraphProperties(graph) end

--- Draws the "..." combo offering hardcoded value templates for a pin (file selection if pin.allowFiles, path relative to the project folder).
---Source: lua/ge/extensions/editor/flowgraph/properties.lua:745
---@param pin table Input pin.
---@param item table Node.
function editor_flowgraph_properties_C:drawHardTemplates(pin, item) end

--- Draws the "Input Pins" section: visibility, type icon, name, hardcoded value or link.
---Source: lua/ge/extensions/editor/flowgraph/properties.lua:804
---@param item table Node.
function editor_flowgraph_properties_C:drawInPins(item) end

--- Draws the item's colored header with its name and the edit button (mode_edit) for the name and colors.
---Source: lua/ge/extensions/editor/flowgraph/properties.lua:231
---@param item table Node or graph.
function editor_flowgraph_properties_C:drawItemHeader(item) end

--- Draws the item's data table then its input and output pins (editable or not).
---Source: lua/ge/extensions/editor/flowgraph/properties.lua:976
---@param itemType string Item type (not used directly).
---@param item table Node.
function editor_flowgraph_properties_C:drawItemProperties(itemType, item) end

--- Draws the "Output Pins" section: visibility (can be hidden if not linked), type, name and current value (pin._value).
---Source: lua/ge/extensions/editor/flowgraph/properties.lua:934
---@param item table Node.
function editor_flowgraph_properties_C:drawOutPins(item) end

--- Returns the first allowed type (alphabetical order) of a types table; 'number' if types is nil, 'bool' if none.
---Source: lua/ge/extensions/editor/flowgraph/properties.lua:388
---@param types table<string, boolean>|nil Allowed types.
---@return string  Type name.
function editor_flowgraph_properties_C:getFirstAllowedType(types) end

--- Registers the window (visible by default) and loads the header texture art/imgui_node_header.png.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/flowgraph/properties.lua:18
function editor_flowgraph_properties_C:init() end

--- Prepares the name and color (customColor/color, iconColor) edit fields of an item.
---Source: lua/ge/extensions/editor/flowgraph/properties.lua:211
---@param item table Node or graph.
function editor_flowgraph_properties_C:initCustomProperties(item) end

--- Lists the project's macro tags (mgr.macroTags) with renaming and deletion.
---Source: lua/ge/extensions/editor/flowgraph/properties.lua:1133
function editor_flowgraph_properties_C:showAvailableMacroTags() end

--- Calls hideProperties on the previously displayed node and resets the edit states. Called when the window closes.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/flowgraph/properties.lua:1124
function editor_flowgraph_properties_C:unselect() end

