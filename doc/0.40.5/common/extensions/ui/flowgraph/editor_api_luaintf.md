# `ui_flowgraph_editor_api_luaintf`

*File: `lua/common/extensions/ui/flowgraph/editor_api_luaintf.lua` · VM: Common (GE + vehicle) · 314 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/ui/flowgraph/editor_api_luaintf")` (file under extensions/ but not a regular extension)

Lua interface layer to the C++ node editor (Engine.fge, an "imgui-node-editor" style graph editor). The file returns a function that receives a table M (that of ui_flowgraph_editor) and adds to it: identifier constructors (NodeIdPtr, LinkIdPtr, PinIdPtr), enums (StyleColor_*, StyleVar_*, PinKind_*, FlowDirection_*, IconType_*, Dirty_*), and wrappers of the fge functions (current editor, styles, nodes, pins, links, selection, creation/deletion, navigation, shortcuts, context menus, screen/canvas conversion). It is not a loadable extension by itself.

## Notes

- Begin() adjusts the ImGui scale: SetWindowFontScale(1/FontGlobalScale) and sets im.uiscale[0] to 1; End() restores im.uiscale[0] and resets the font scale to 1.
- GetSelectedNodes/GetSelectedLinks are deprecated: they log an error and fill a 0-based array from GetSelectedNodeIds/GetSelectedLinkIds.
- M.setDebugEnabled is assigned to fge.getDebugEnabled (not to a setter): probable copy-paste bug, setDebugEnabled reads instead of writing.
- Default values are applied by the wrappers: Link (white color, thickness 1, isShortcut false), BeginCreate, QueryNewLink2/QueryNewNode2/AcceptNewItem2/RejectNewItem2 (thickness 1), AcceptDeletedItem (deleteDependencies true), SelectNode/SelectLink (id 0, append false), NavigateToContent (duration -1), NavigateToSelection (zoomIn false, duration -1).
- M.ctx is initialized with fge.GetCurrentEditor() if an editor exists; SetCurrentEditor also updates M.ctx.

## Functions

| Function | Description | Line |
|---|---|---|
| `ui_flowgraph_editor_api_luaintf.AcceptDeletedItem(deleteDependencies)` | Accepts the deletion of the queried item. (dynamically assigned) | dyn |
| `ui_flowgraph_editor_api_luaintf.Begin(id, size, readOnly)` | Opens the node editor canvas (fge.Begin) and neutralizes the ImGui UI scale for the duration of the editing. (dynamically assigned) | dyn |
| `ui_flowgraph_editor_api_luaintf.BeginCreate(color, thickness)` | Starts the interactive link/node creation section. (dynamically assigned) | dyn |
| `ui_flowgraph_editor_api_luaintf.End()` | Closes the canvas (fge.End) and restores the UI scale. (dynamically assigned) | dyn |
| `ui_flowgraph_editor_api_luaintf.Flow(linkId, direction)` | Animates a flow on a link. (dynamically assigned) | dyn |
| `ui_flowgraph_editor_api_luaintf.GetSelectedLinks(links, size)` | Deprecated: logs an error; fills links (0-based) with the selected ids. (dynamically assigned) | dyn |
| `ui_flowgraph_editor_api_luaintf.GetSelectedNodes(nodes, size)` | Deprecated: logs an error; fills nodes (0-based) with the selected ids. (dynamically assigned) | dyn |
| `ui_flowgraph_editor_api_luaintf.Link(id, startPinId, endPinId, color, thickness, isShortcut, shortCutLabel)` | Declares a link between two pins. (dynamically assigned) | dyn |
| `ui_flowgraph_editor_api_luaintf.LinkIdPtr()` | Creates a LinkId object initialized to 0. (dynamically assigned) | dyn |
| `ui_flowgraph_editor_api_luaintf.NavigateToContent(duration)` | Centers the view on all the content. (dynamically assigned) | dyn |
| `ui_flowgraph_editor_api_luaintf.NavigateToSelection(zoomIn, duration)` | Centers the view on the selection. (dynamically assigned) | dyn |
| `ui_flowgraph_editor_api_luaintf.NodeIdPtr()` | Creates a NodeId object initialized to 0. (dynamically assigned) | dyn |
| `ui_flowgraph_editor_api_luaintf.PinIdPtr()` | Creates a PinId object initialized to 0. (dynamically assigned) | dyn |
| `ui_flowgraph_editor_api_luaintf.PopStyleColor(count)` | Pops editor style colors (1 by default). (dynamically assigned) | dyn |
| `ui_flowgraph_editor_api_luaintf.PopStyleVar(count)` | Pops editor style variables (1 by default). (dynamically assigned) | dyn |
| `ui_flowgraph_editor_api_luaintf.PtrToId(obj)` | Returns the numeric identifier of a NodeId/LinkId/PinId pointer object (calls obj:id()). (dynamically assigned) | dyn |
| `ui_flowgraph_editor_api_luaintf.SelectLink(linkId, append)` | Selects a link (id 0 if nil). (dynamically assigned) | dyn |
| `ui_flowgraph_editor_api_luaintf.SelectNode(nodeId, append)` | Selects a node (id 0 if nil). (dynamically assigned) | dyn |
| `ui_flowgraph_editor_api_luaintf.SetCurrentEditor(ctx)` | Sets the current editor (M.ctx and fge.SetCurrentEditor). (dynamically assigned) | dyn |

### Parameter details

#### `ui_flowgraph_editor_api_luaintf.AcceptDeletedItem(deleteDependencies)`

Accepts the deletion of the queried item. (dynamically assigned)

- `deleteDependencies` (*boolean|nil*) : Also deletes dependencies, true by default.
- **returns**: boolean Result of fge.AcceptDeletedItem.

#### `ui_flowgraph_editor_api_luaintf.Begin(id, size, readOnly)`

Opens the node editor canvas (fge.Begin) and neutralizes the ImGui UI scale for the duration of the editing. (dynamically assigned)

- `id` (*string*) : ImGui identifier of the canvas.
- `size` (*ImVec2|nil*) : Size, (0,0) by default.
- `readOnly` (*boolean|nil*) : Read-only, false by default.
- **returns**: any Result of fge.Begin.

#### `ui_flowgraph_editor_api_luaintf.BeginCreate(color, thickness)`

Starts the interactive link/node creation section. (dynamically assigned)

- `color` (*ImVec4|nil*) : Color, white by default.
- `thickness` (*number|nil*) : Thickness, 1.0 by default.
- **returns**: boolean Result of fge.BeginCreate.

#### `ui_flowgraph_editor_api_luaintf.End()`

Closes the canvas (fge.End) and restores the UI scale. (dynamically assigned)

- **returns**: any Result of fge.End.

#### `ui_flowgraph_editor_api_luaintf.Flow(linkId, direction)`

Animates a flow on a link. (dynamically assigned)

- `linkId` (*any*) : Link id.
- `direction` (*integer|nil*) : FlowDirection_Forward by default.

#### `ui_flowgraph_editor_api_luaintf.GetSelectedLinks(links, size)`

Deprecated: logs an error; fills links (0-based) with the selected ids. (dynamically assigned)

- `links` (*table*) : Filled array.
- `size` (*integer*) : Not used.
- **returns**: integer Number of links.

#### `ui_flowgraph_editor_api_luaintf.GetSelectedNodes(nodes, size)`

Deprecated: logs an error; fills nodes (0-based) with the selected ids. (dynamically assigned)

- `nodes` (*table*) : Filled array.
- `size` (*integer*) : Not used.
- **returns**: integer Number of nodes.

#### `ui_flowgraph_editor_api_luaintf.Link(id, startPinId, endPinId, color, thickness, isShortcut, shortCutLabel)`

Declares a link between two pins. (dynamically assigned)

- `id` (*any*) : Link id.
- `startPinId` (*any*) : Start pin.
- `endPinId` (*any*) : End pin.
- `color` (*ImVec4|nil*) : Color, white by default.
- `thickness` (*number|nil*) : Thickness, 1.0 by default.
- `isShortcut` (*boolean|nil*) : Shortcut link, false by default.
- `shortCutLabel` (*string|nil*) : Shortcut label.
- **returns**: any Result of fge.Link.

#### `ui_flowgraph_editor_api_luaintf.LinkIdPtr()`

Creates a LinkId object initialized to 0. (dynamically assigned)

- **returns**: userdata LinkId.

#### `ui_flowgraph_editor_api_luaintf.NavigateToContent(duration)`

Centers the view on all the content. (dynamically assigned)

- `duration` (*number|nil*) : Animation duration, -1.0 by default.

#### `ui_flowgraph_editor_api_luaintf.NavigateToSelection(zoomIn, duration)`

Centers the view on the selection. (dynamically assigned)

- `zoomIn` (*boolean|nil*) : Zooms in, false by default.
- `duration` (*number|nil*) : Duration, -1.0 by default.

#### `ui_flowgraph_editor_api_luaintf.NodeIdPtr()`

Creates a NodeId object initialized to 0. (dynamically assigned)

- **returns**: userdata NodeId.

#### `ui_flowgraph_editor_api_luaintf.PinIdPtr()`

Creates a PinId object initialized to 0. (dynamically assigned)

- **returns**: userdata PinId.

#### `ui_flowgraph_editor_api_luaintf.PopStyleColor(count)`

Pops editor style colors (1 by default). (dynamically assigned)

- `count` (*integer|nil*) : Number to pop, 1 if nil.

#### `ui_flowgraph_editor_api_luaintf.PopStyleVar(count)`

Pops editor style variables (1 by default). (dynamically assigned)

- `count` (*integer|nil*) : Number to pop, 1 if nil.

#### `ui_flowgraph_editor_api_luaintf.PtrToId(obj)`

Returns the numeric identifier of a NodeId/LinkId/PinId pointer object (calls obj:id()). (dynamically assigned)

- `obj` (*userdata*) : NodeId, LinkId or PinId object.
- **returns**: integer Identifier.

#### `ui_flowgraph_editor_api_luaintf.SelectLink(linkId, append)`

Selects a link (id 0 if nil). (dynamically assigned)

- `linkId` (*any|nil*) : Link id.
- `append` (*boolean|nil*) : Adds to the selection, false by default.

#### `ui_flowgraph_editor_api_luaintf.SelectNode(nodeId, append)`

Selects a node (id 0 if nil). (dynamically assigned)

- `nodeId` (*any|nil*) : Node id.
- `append` (*boolean|nil*) : Adds to the selection, false by default.

#### `ui_flowgraph_editor_api_luaintf.SetCurrentEditor(ctx)`

Sets the current editor (M.ctx and fge.SetCurrentEditor). (dynamically assigned)

- `ctx` (*userdata*) : Editor context created by CreateEditor.

## Calls into the engine (C++)

- `obj:` `id`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/common/extensions/ui/flowgraph/editor_api_luaintf.lua`.*
