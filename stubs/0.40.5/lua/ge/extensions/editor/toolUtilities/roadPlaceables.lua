---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/toolUtilities/roadPlaceables.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Shared controller of "placeable" items for the editor's spline road tools: placing, selecting, dragging and editing items positioned along a road's axis (for example pedestrian crossings, repair groups). A tool can carry several kinds; each registers its "host" table with setHost, and placement, selection, dragging and handles are indexed by kind. The module has no dependency on an unshipped tool folder. The state is global to the module: only one road tool active at a time, each tool calls reset() on activation and deactivation.
--- Access: extension `editor_toolUtilities_roadPlaceables`: `extensions.load("editor_toolUtilities_roadPlaceables")`, then the global `editor_toolUtilities_roadPlaceables`
---@class editor_toolUtilities_roadPlaceables
editor_toolUtilities_roadPlaceables = {}

--- Routes a click on a handle: CTRL deletes it (with an undo entry); a simple click selects it and starts dragging along the road (a single click-drag moves it).
---Source: lua/ge/extensions/editor/toolUtilities/roadPlaceables.lua:127
---@param groups table Groups (roads).
---@param gi integer Group index.
---@param ci integer Item index.
---@param ctrlDown boolean CTRL held.
---@param kind string|nil Kind; otherwise hovered or sole.
---@return string  'deleted', 'selected' or 'none'.
function editor_toolUtilities_roadPlaceables.clickHandle(groups, gi, ci, ctrlDown, kind) end

--- Compact ImGui editor of the selected pedestrian-crossing item (depth, lateral extent, deletion).
---Source: lua/ge/extensions/editor/toolUtilities/roadPlaceables.lua:268
---@return boolean  false when the selection has disappeared (the host then resets its selection kind).
function editor_toolUtilities_roadPlaceables.drawEditor() end

--- Draws handles and highlight of the existing items, all kinds together, only for the selected road or the road owning the selected item.
---Source: lua/ge/extensions/editor/toolUtilities/roadPlaceables.lua:222
---@param groups table Groups (roads).
---@param selGroup integer|nil Index of the selected road.
---@param showSelected boolean true if the host's global selection is currently one of these items (selected style versus hover).
function editor_toolUtilities_roadPlaceables.drawHandles(groups, selGroup, showSelected) end

--- Hover glow and prompt for the item under the cursor this frame (prompt "drag to move, or CTRL to delete").
---Source: lua/ge/extensions/editor/toolUtilities/roadPlaceables.lua:251
---@param groups table Groups (roads).
---@param gi integer Group index.
---@param ci integer Item index.
---@param kind string|nil Kind; otherwise hovered or sole.
function editor_toolUtilities_roadPlaceables.drawHover(groups, gi, ci, kind) end

--- Returns the current selection.
---Source: lua/ge/extensions/editor/toolUtilities/roadPlaceables.lua:83
---@return string|nil  kind.
---@return integer|nil  gi.
---@return integer|nil  ci.
function editor_toolUtilities_roadPlaceables.getSelection() end

--- Ghost preview and click to add while placement mode is active (roads only; aimed by camera ray against the axis, so also on elevated sections). Selects the added item.
---Source: lua/ge/extensions/editor/toolUtilities/roadPlaceables.lua:147
---@param groups table Groups (roads).
---@return boolean  true if an item was added this frame.
function editor_toolUtilities_roadPlaceables.handlePlacement(groups) end

--- Dragging the selected handle along the road; the selection starts the drag.
---Source: lua/ge/extensions/editor/toolUtilities/roadPlaceables.lua:194
---@param groups table Groups (roads).
---@return boolean  true while the module owns the frame (the host then skips the default node/aux drag).
function editor_toolUtilities_roadPlaceables.handleSelectDrag(groups) end

--- True if an item is selected (of the given kind if kind is provided).
---Source: lua/ge/extensions/editor/toolUtilities/roadPlaceables.lua:79
---@param kind string|nil Kind to test.
---@return boolean  true if selection.
function editor_toolUtilities_roadPlaceables.hasSelection(kind) end

--- True during a drag along the road.
---Source: lua/ge/extensions/editor/toolUtilities/roadPlaceables.lua:78
---@return boolean  true if a drag is in progress.
function editor_toolUtilities_roadPlaceables.isDragging() end

--- Tells whether placement mode is active (for this kind if kind is given, otherwise for any). The host tool owns the Add button and drives these accessors.
---Source: lua/ge/extensions/editor/toolUtilities/roadPlaceables.lua:76
---@param kind string|nil Kind to test.
---@return boolean  true if in placement mode.
function editor_toolUtilities_roadPlaceables.isPlaceMode(kind) end

--- Clears everything: host registry, placement mode, selection and dragging. To be called in the host tool's onActivate and onDeactivate.
---Source: lua/ge/extensions/editor/toolUtilities/roadPlaceables.lua:86
function editor_toolUtilities_roadPlaceables.reset() end

--- Selects an item so that a host list can highlight it.
---Source: lua/ge/extensions/editor/toolUtilities/roadPlaceables.lua:82
---@param kind string Kind of the item.
---@param gi integer Group (road) index.
---@param ci integer Index of the item in the group.
function editor_toolUtilities_roadPlaceables.select(kind, gi, ci) end

--- Registers the host of a placeable item kind. To be called in the tool's onActivate, after reset().
---Source: lua/ge/extensions/editor/toolUtilities/roadPlaceables.lua:58
---@param host table Host table with kind, label, getGroups, isRoad, itemsOf, extentOf, frameAt, tForPoint, clampT, addItem, removeItem, deepCopy, undo, redo, defaultDepthM.
function editor_toolUtilities_roadPlaceables.setHost(host) end

--- Enables or disables placement mode for a kind (kind resolved: explicit, hovered or sole).
---Source: lua/ge/extensions/editor/toolUtilities/roadPlaceables.lua:77
---@param on boolean true to arm.
---@param kind string|nil Kind to arm.
function editor_toolUtilities_roadPlaceables.setPlaceMode(on, kind) end

--- Finds the closest item handle under the cursor among all kinds (camera ray against spheres at the roadway edges). Also remembers the hovered kind.
---Source: lua/ge/extensions/editor/toolUtilities/roadPlaceables.lua:95
---@return integer|nil  gi, group index.
---@return integer|nil  ci, item index.
---@return string|nil  kind.
function editor_toolUtilities_roadPlaceables.underMouse() end

