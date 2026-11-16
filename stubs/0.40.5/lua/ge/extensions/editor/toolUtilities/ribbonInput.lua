---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/toolUtilities/ribbonInput.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Mouse and keyboard event handling for the "ribbon" splines of the editor's editing tools. A ribbon is a spline laid out in left/right node pairs (each pair has a depth). handleRibbonEvents (alias handlePrismEvents) draws the cursor, the pair placement help (first node, second node), finds the ribbon segment closest to the cursor, handles selection, node dragging (free or rigid), gizmo (Alt), depth adjustment by dragging (0.1 m per pixel, between 1 and 500 m), deletion (Delete), insertion, and records the changes in the undo history.
--- Access: extension `editor_toolUtilities_ribbonInput`: `extensions.load("editor_toolUtilities_ribbonInput")`, then the global `editor_toolUtilities_ribbonInput`
---@class editor_toolUtilities_ribbonInput
editor_toolUtilities_ribbonInput = {}

--- Alias of handleRibbonEvents (old name, "prism" for prism ribbon). Same parameters and return values.
---Source: lua/ge/extensions/editor/toolUtilities/ribbonInput.lua:281
---@param ribbons table List of ribbons.
---@param out table Output table (ribbonIdx or prismIdx, nodeIdx, isGizmoActive).
---@param useGizmo boolean Gizmo usable.
---@param isRigidTranslation boolean Rigid translation.
---@param masterDepth number Depth of new pairs.
---@param updateRibbonDataFn function Update callback.
---@param deepCopyFn function Deep copy callback.
---@param undoFn function Undo callback.
---@param redoFn function Redo callback.
---@return integer  Index of the closest segment.
---@return boolean  Node drag in progress.
function editor_toolUtilities_ribbonInput.handlePrismEvents(ribbons, out, useGizmo, isRigidTranslation, masterDepth, updateRibbonDataFn, deepCopyFn, undoFn, redoFn) end

--- Handles user events for ribbons, to be called every frame by the active tool. Updates out, calls updateRibbonDataFn after each change and records the full state via deepCopyFn / undoFn / redoFn. Returns the best segment found by the search for the segment under the cursor, on the selected ribbon.
---Source: lua/ge/extensions/editor/toolUtilities/ribbonInput.lua:281
---@param ribbons table List of ribbons to edit.
---@param out table Output table: ribbonIdx (ribbon), nodeIdx (node), isGizmoActive (gizmo active).
---@param useGizmo boolean Whether the gizmo is usable.
---@param isRigidTranslation boolean true: dragging moves all nodes by the same vector; false: each node moves independently.
---@param masterDepth number Depth used for new node pairs.
---@param updateRibbonDataFn function Callback to recompute the ribbon data after a change.
---@param deepCopyFn function Callback deep-copying ALL ribbon data (full state) for undo.
---@param undoFn function Callback to undo the full state.
---@param redoFn function Callback to redo the full state.
---@return integer  Index of the segment closest to the cursor on the selected ribbon.
---@return boolean  true if a node drag is in progress (isNodeDrag).
function editor_toolUtilities_ribbonInput.handleRibbonEvents(ribbons, out, useGizmo, isRigidTranslation, masterDepth, updateRibbonDataFn, deepCopyFn, undoFn, redoFn) end

