---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/link.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Link object returned by the constructor.
---@class flowgraph_link
local flowgraph_link = {}

--- Restores the hidden state from data[5].
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/link.lua:280
---@param data table serialized data
function flowgraph_link:__onDeserialized(data) end

--- Returns {sourceNode.id, sourcePin.name, targetNode.id, targetPin.name, hidden}.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/link.lua:270
---@return table  link data
function flowgraph_link:__onSerialize() end

--- Turns the links leaving the source pin into a named quick access (see notes) then deletes the selection.
---Source: lua/ge/extensions/flowgraph/link.lua:233
function flowgraph_link:convertToQuickAccess() end

--- Requests a flow animation on the next draw frame.
---Source: lua/ge/extensions/flowgraph/link.lua:182
function flowgraph_link:doFlow() end

--- Draws the link in the editor with a flow animation when the source pin is active in the current frame (never if the manager is stopped, zero speed when paused).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/link.lua:111
function flowgraph_link:draw() end

--- Draws the label (source pin name) in the middle of a state link.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/link.lua:186
---@param sPin table source transition pin (imPos required)
---@param tPin table target transition pin
function flowgraph_link:drawLabel(sPin, tPin) end

--- Shows the tooltip of the hovered link: icon and type of the source pin and its current value.
---Source: lua/ge/extensions/flowgraph/link.lua:68
function flowgraph_link:drawLinkTooltip() end

--- For state links: returns the pair of directions ('E','W' / 'W','E' / 'S','N' / 'N','S') according to the position of the nodes, or nil,nil without positions.
---Source: lua/ge/extensions/flowgraph/link.lua:92
---@return string|nil  source-side direction
---@return string|nil  target-side direction
function flowgraph_link:getDirPins() end

--- Creates the link, registers it in the graph and notifies pins and nodes.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/link.lua:9
---@param graph table graph
---@param sourcePin table source pin
---@param targetPin table target pin
function flowgraph_link:init(graph, sourcePin, targetPin) end

--- Context menu of the link: hide / show, delete (if editing is allowed) and, if the preference flowgraph.debug.displayIds is active, ids.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/link.lua:214
---@param menuPos ImVec2 menu position (unused in the code)
function flowgraph_link:showContextMenu(menuPos) end

