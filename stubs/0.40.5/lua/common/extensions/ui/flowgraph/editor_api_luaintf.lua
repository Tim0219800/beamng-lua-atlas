---@meta
-- tim19Atlas stub generated from lua/common/extensions/ui/flowgraph/editor_api_luaintf.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Lua interface layer to the C++ node editor (Engine.fge, an "imgui-node-editor" style graph editor). The file returns a function that receives a table M (that of ui_flowgraph_editor) and adds to it: identifier constructors (NodeIdPtr, LinkIdPtr, PinIdPtr), enums (StyleColor_*, StyleVar_*, PinKind_*, FlowDirection_*, IconType_*, Dirty_*), and wrappers of the fge functions (current editor, styles, nodes, pins, links, selection, creation/deletion, navigation, shortcuts, context menus, screen/canvas conversion). It is not a loadable extension by itself.
--- Access: `require("extensions/ui/flowgraph/editor_api_luaintf")` (file under extensions/ but not a regular extension)
---@class ui_flowgraph_editor_api_luaintf
ui_flowgraph_editor_api_luaintf = {}

--- Accepts the deletion of the queried item. (dynamically assigned)
---Source: lua/common/extensions/ui/flowgraph/editor_api_luaintf.lua:dyn
---@param deleteDependencies boolean|nil Also deletes dependencies, true by default.
---@return boolean  Result of fge.AcceptDeletedItem.
function ui_flowgraph_editor_api_luaintf.AcceptDeletedItem(deleteDependencies) end

--- Opens the node editor canvas (fge.Begin) and neutralizes the ImGui UI scale for the duration of the editing. (dynamically assigned)
---Source: lua/common/extensions/ui/flowgraph/editor_api_luaintf.lua:dyn
---@param id string ImGui identifier of the canvas.
---@param size ImVec2|nil Size, (0,0) by default.
---@param readOnly boolean|nil Read-only, false by default.
---@return any  Result of fge.Begin.
function ui_flowgraph_editor_api_luaintf.Begin(id, size, readOnly) end

--- Starts the interactive link/node creation section. (dynamically assigned)
---Source: lua/common/extensions/ui/flowgraph/editor_api_luaintf.lua:dyn
---@param color ImVec4|nil Color, white by default.
---@param thickness number|nil Thickness, 1.0 by default.
---@return boolean  Result of fge.BeginCreate.
function ui_flowgraph_editor_api_luaintf.BeginCreate(color, thickness) end

--- Closes the canvas (fge.End) and restores the UI scale. (dynamically assigned)
---Source: lua/common/extensions/ui/flowgraph/editor_api_luaintf.lua:dyn
---@return any  Result of fge.End.
function ui_flowgraph_editor_api_luaintf.End() end

--- Animates a flow on a link. (dynamically assigned)
---Source: lua/common/extensions/ui/flowgraph/editor_api_luaintf.lua:dyn
---@param linkId any Link id.
---@param direction integer|nil FlowDirection_Forward by default.
function ui_flowgraph_editor_api_luaintf.Flow(linkId, direction) end

--- Deprecated: logs an error; fills links (0-based) with the selected ids. (dynamically assigned)
---Source: lua/common/extensions/ui/flowgraph/editor_api_luaintf.lua:dyn
---@param links table Filled array.
---@param size integer Not used.
---@return integer  Number of links.
function ui_flowgraph_editor_api_luaintf.GetSelectedLinks(links, size) end

--- Deprecated: logs an error; fills nodes (0-based) with the selected ids. (dynamically assigned)
---Source: lua/common/extensions/ui/flowgraph/editor_api_luaintf.lua:dyn
---@param nodes table Filled array.
---@param size integer Not used.
---@return integer  Number of nodes.
function ui_flowgraph_editor_api_luaintf.GetSelectedNodes(nodes, size) end

--- Declares a link between two pins. (dynamically assigned)
---Source: lua/common/extensions/ui/flowgraph/editor_api_luaintf.lua:dyn
---@param id any Link id.
---@param startPinId any Start pin.
---@param endPinId any End pin.
---@param color ImVec4|nil Color, white by default.
---@param thickness number|nil Thickness, 1.0 by default.
---@param isShortcut boolean|nil Shortcut link, false by default.
---@param shortCutLabel string|nil Shortcut label.
---@return any  Result of fge.Link.
function ui_flowgraph_editor_api_luaintf.Link(id, startPinId, endPinId, color, thickness, isShortcut, shortCutLabel) end

--- Creates a LinkId object initialized to 0. (dynamically assigned)
---Source: lua/common/extensions/ui/flowgraph/editor_api_luaintf.lua:dyn
---@return userdata  LinkId.
function ui_flowgraph_editor_api_luaintf.LinkIdPtr() end

--- Centers the view on all the content. (dynamically assigned)
---Source: lua/common/extensions/ui/flowgraph/editor_api_luaintf.lua:dyn
---@param duration number|nil Animation duration, -1.0 by default.
function ui_flowgraph_editor_api_luaintf.NavigateToContent(duration) end

--- Centers the view on the selection. (dynamically assigned)
---Source: lua/common/extensions/ui/flowgraph/editor_api_luaintf.lua:dyn
---@param zoomIn boolean|nil Zooms in, false by default.
---@param duration number|nil Duration, -1.0 by default.
function ui_flowgraph_editor_api_luaintf.NavigateToSelection(zoomIn, duration) end

--- Creates a NodeId object initialized to 0. (dynamically assigned)
---Source: lua/common/extensions/ui/flowgraph/editor_api_luaintf.lua:dyn
---@return userdata  NodeId.
function ui_flowgraph_editor_api_luaintf.NodeIdPtr() end

--- Creates a PinId object initialized to 0. (dynamically assigned)
---Source: lua/common/extensions/ui/flowgraph/editor_api_luaintf.lua:dyn
---@return userdata  PinId.
function ui_flowgraph_editor_api_luaintf.PinIdPtr() end

--- Pops editor style colors (1 by default). (dynamically assigned)
---Source: lua/common/extensions/ui/flowgraph/editor_api_luaintf.lua:dyn
---@param count integer|nil Number to pop, 1 if nil.
function ui_flowgraph_editor_api_luaintf.PopStyleColor(count) end

--- Pops editor style variables (1 by default). (dynamically assigned)
---Source: lua/common/extensions/ui/flowgraph/editor_api_luaintf.lua:dyn
---@param count integer|nil Number to pop, 1 if nil.
function ui_flowgraph_editor_api_luaintf.PopStyleVar(count) end

--- Returns the numeric identifier of a NodeId/LinkId/PinId pointer object (calls obj:id()). (dynamically assigned)
---Source: lua/common/extensions/ui/flowgraph/editor_api_luaintf.lua:dyn
---@param obj userdata NodeId, LinkId or PinId object.
---@return integer  Identifier.
function ui_flowgraph_editor_api_luaintf.PtrToId(obj) end

--- Selects a link (id 0 if nil). (dynamically assigned)
---Source: lua/common/extensions/ui/flowgraph/editor_api_luaintf.lua:dyn
---@param linkId any|nil Link id.
---@param append boolean|nil Adds to the selection, false by default.
function ui_flowgraph_editor_api_luaintf.SelectLink(linkId, append) end

--- Selects a node (id 0 if nil). (dynamically assigned)
---Source: lua/common/extensions/ui/flowgraph/editor_api_luaintf.lua:dyn
---@param nodeId any|nil Node id.
---@param append boolean|nil Adds to the selection, false by default.
function ui_flowgraph_editor_api_luaintf.SelectNode(nodeId, append) end

--- Sets the current editor (M.ctx and fge.SetCurrentEditor). (dynamically assigned)
---Source: lua/common/extensions/ui/flowgraph/editor_api_luaintf.lua:dyn
---@param ctx userdata Editor context created by CreateEditor.
function ui_flowgraph_editor_api_luaintf.SetCurrentEditor(ctx) end

