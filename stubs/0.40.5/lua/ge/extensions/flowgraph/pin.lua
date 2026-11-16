---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/pin.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Flowgraph pin. Notable fields: graph, id, name, type (string or list of types), direction ('in'/'out'), node, default, defaultValue, description, hidden, links, hardTemplates, impulse, chainFlow, tableType, pinMode, quickAccess.
---@class flowgraph_pin
local flowgraph_pin = {}

--- Draws an input pin in the editor (type icon, name, optional constant value with a padlock).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/pin.lua:99
---@param builder any Node constructor.
---@param style table ImGui style.
---@param alpha number Opacity.
---@param simpleDraw string Display mode ('simple' hides the name).
---@param constValue any Constant value to display, or nil.
---@param outWidth number Column width.
function flowgraph_pin:_draw_in(builder, style, alpha, simpleDraw, constValue, outWidth) end

--- Draws an output pin in the editor (right-aligned name then icon).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/pin.lua:132
---@param builder any Node constructor.
---@param style table ImGui style.
---@param alpha number Opacity.
---@param simpleDraw string Display mode.
---@param const any Not used for an output.
---@param outWidth number Column width.
function flowgraph_pin:_draw_out(builder, style, alpha, simpleDraw, const, outWidth) end

--- Computes the pin's display width (icon + text + margin).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/pin.lua:164
---@param simpleDraw any Not used (the mode is read from the preferences).
---@return number  Width.
function flowgraph_pin:_getCalculatedWidth(simpleDraw) end

--- Called when a link is created: replaces `links[1]` (non-flow input) or adds the link; makes the pin visible.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/pin.lua:347
---@param link table Added link.
function flowgraph_pin:_onLink(link) end

--- Called when a link is deleted: removes it from the list.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/pin.lua:356
---@param link table Removed link.
function flowgraph_pin:_onUnlink(link) end

--- Draws the pin (according to `direction`) with the right opacity, handles the click (node selection) and remembers the hover.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/pin.lua:262
---@param builder any Node constructor.
---@param style table ImGui style.
---@param isHeader boolean Not used in the code.
---@param constValue any Constant value to display.
---@param outWidth number Width.
---@return boolean  Result of `isActive()`.
function flowgraph_pin:draw(builder, style, isHeader, constValue, outWidth) end

--- Displays the pin's ImGui tooltip: name, valid or connected type, table type and description.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/pin.lua:188
---@param mgr table Flowgraph manager.
function flowgraph_pin:drawTooltip(mgr) end

--- Returns the pin's first link (`links[1]`), or nil.
---Source: lua/ge/extensions/flowgraph/pin.lua:79
---@return table|nil  First link.
function flowgraph_pin:getFirstConnectedLink() end

--- If the pin is of type table (or includes table), returns `tableType` (or 'generic'); otherwise an empty string.
---Source: lua/ge/extensions/flowgraph/pin.lua:156
---@return string  Table subtype.
function flowgraph_pin:getTableType() end

--- Returns 'impulse' if the pin is an impulse, 'chainFlow' if it is a chained flow, otherwise its type (used to choose the icon).
---Source: lua/ge/extensions/flowgraph/pin.lua:152
---@return string|table  Display type.
function flowgraph_pin:getTypeWithImpulseAndChain() end

--- Marks all of the pin's links as highlighted (`_highlight = true`).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/pin.lua:256
function flowgraph_pin:highlightLinks() end

--- If the pin is hovered, highlights its links and displays its tooltip.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/pin.lua:299
---@param mgr table Manager.
function flowgraph_pin:hoverDraw(mgr) end

--- Constructor: records the graph, gets a unique id from the manager (`getNextFreePinLinkId`), stores name/type/direction/default value and enables usage tracking of `value`. An output pin of type `delegate` gets `hasOutputDelegates = true`.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/pin.lua:13
---@param graph table Graph that contains the pin.
---@param node table Owning node.
---@param direction string 'in' or 'out'.
---@param type string|table Pin type (flow, number, string, bool, vec3, quat, color, table, any...) or list of types.
---@param name string Pin name.
---@param default any Default value.
---@param description string Help text shown in the tooltip.
function flowgraph_pin:init(graph, node, direction, type, name, default, description) end

--- While a link is being created, tells whether this pin can be a target (active) or should be grayed out.
---Source: lua/ge/extensions/flowgraph/pin.lua:180
---@return boolean  true if usable.
function flowgraph_pin:isActive() end

--- Returns true if the pin has at least one link or if its value is hardcoded (`pinMode == 'hardcoded'`). Used by some nodes to skip unnecessary computations.
---Source: lua/ge/extensions/flowgraph/pin.lua:369
---@return boolean  true if used.
function flowgraph_pin:isUsed() end

--- Pin context menu in the editor: quick access, hide the pin (if it has no links), show/hide its links, debug.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/pin.lua:306
---@param menuPos any Menu position.
---@param main table Main editor.
function flowgraph_pin:showContextMenu(menuPos, main) end

--- Writes a quaternion into `value` as a reused {x, y, z, w} table.
---Source: lua/ge/extensions/flowgraph/pin.lua:383
---@param v quat Source quaternion.
function flowgraph_pin:valueSetQuat(v) end

--- Writes a vector into `value` as a reused {x, y, z} table (no allocation).
---Source: lua/ge/extensions/flowgraph/pin.lua:373
---@param v vec3 Source vector.
function flowgraph_pin:valueSetVec3(v) end

