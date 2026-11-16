---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/toolUtilities/splineInput.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Shared mouse and keyboard handling for all spline editing tools of the editor (a spline is an editable polyline along a variable-width centerline: roads, paths). Handles selecting and dragging nodes, width handles (ribs) and height handles (bars), the gizmo, adding and inserting nodes, junctions and loops, profile copy-paste (Ctrl+C / Ctrl+V), deletion, undo (via editor.history or an override provided by the tool) and selection across tools. Tools register with registerSplineTool, which makes it possible to select a spline of another tool by clicking on it.
--- Access: extension `editor_toolUtilities_splineInput`: `extensions.load("editor_toolUtilities_splineInput")`, then the global `editor_toolUtilities_splineInput`
---@class editor_toolUtilities_splineInput
editor_toolUtilities_splineInput = {}

--- Cancels the current drag state (alias of clearDragState): clears spline, node, previous state, rib, bar and aux flags.
---Source: lua/ge/extensions/editor/toolUtilities/splineInput.lua:77
function editor_toolUtilities_splineInput.cancelDrag() end

--- Hit detection that breaks ties by distance to the camera: returns the best target (node, rib or bar) closest to the camera ray, always checking the splines of all tools for cross-tool selection. Nodes have priority.
---Source: lua/ge/extensions/editor/toolUtilities/splineInput.lua:478
---@param selSpline table|nil Selected spline.
---@param mousePos vec3 3D mouse position.
---@param useRibs boolean Also test the width handles.
---@param useBars boolean Also test the height handles.
---@return table|nil  Target: fields type ('node', 'rib', 'bar'), splineIdx, nodeIdx, toolName, among others; nil if nothing.
function editor_toolUtilities_splineInput.getBestHitTarget(selSpline, mousePos, useRibs, useBars) end

--- Node selection from another tool, for tools that do not run handleSplineEvents (polygon tools such as the forest zone editor). Every frame, hovers the spline nodes of other tools (glow and "select" text) and, on click, switches to that tool and selects the node, starting a drag if the target tool supports it.
---Source: lua/ge/extensions/editor/toolUtilities/splineInput.lua:701
---@param activePrefix string Prefix of the calling tool, whose splines are ignored.
---@return boolean  True if a foreign node is under the cursor, so the caller skips its own scene interaction.
function editor_toolUtilities_splineInput.handleForeignNodeSelection(activePrefix) end

--- Processes the input events for a path in a navigation graph: click on a graph node to add it to or remove it from the path (with its default speed and limit 13.5 m/s), drag speed bars (0 to 70 m/s), cursor and help texts.
---Source: lua/ge/extensions/editor/toolUtilities/splineInput.lua:1171
---@param selSpline table|nil Selected spline (graphNodes, vels, velLimits, barPoints).
---@param nodes table Navigation graph nodes.
---@param deepCopyFunct function Deep copy of a spline.
---@param undoFunct function Undo callback.
---@param redoFunct function Redo callback.
---@param isBarsLimit boolean Use velLimits (true) or vels (false) for the bar height.
---@param useBars boolean|nil Allow bars (true by default).
function editor_toolUtilities_splineInput.handleNavGraphEvents(selSpline, nodes, deepCopyFunct, undoFunct, redoFunct, isBarsLimit, useBars) end

--- Processes the input events of spline tools for one frame: hover, selection, adding and inserting nodes, dragging nodes, ribs and bars, gizmo, junctions, profile copy-paste, deletion, and committing undo steps. Updates the `out` table (selected spline and node, gizmo state, etc.).
---Source: lua/ge/extensions/editor/toolUtilities/splineInput.lua:775
---@param splines table Collection of splines to manage.
---@param out table Table updated during interaction: selection (spline index, node index, layer index for the "decal placement" case), isGizmoActive, etc.
---@param isRotEnabled boolean Rotation gizmo allowed.
---@param isConformToTerrain boolean The spline must conform to the surface below (vertical gizmo control).
---@param useRibs boolean Use ribs (width handles).
---@param useBars boolean Use bars (height handles).
---@param isBarsLimits boolean The bars are limits (true) or speeds (false).
---@param useCopyPaste boolean Enable profile copy-paste.
---@param useGizmo boolean Use the gizmo.
---@param isLockShape boolean The spline shape is locked.
---@param defaultSplineWidth number Default width of a new node, in meters.
---@param deepCopyFunct function Deep copy of a spline.
---@param deepCopyStateFunct function Deep copy of a spline's state.
---@param copyProfileFunct function Copies a profile.
---@param pasteProfileFunct function Pastes a profile.
---@param afterEndDragCallback function|nil Called at the end of a drag with (selSpline, wasAuxDrag, auxIdx, dragSplineIdx, dragNodeIdx).
---@param joinFunct function|nil Called when the user forms a junction.
---@param undoFunct function Undo callback of a spline edit.
---@param redoFunct function Redo callback of a spline edit.
---@param undoStateFunct function|nil Undo callback of the full-state edit.
---@param redoStateFunct function|nil Redo callback of the full-state edit.
---@param midJoinFunct function|nil Called for a mid-spline junction.
---@param canJoinFunct function|nil Tells whether a junction is allowed (inferred from code).
---@param canJoinAuxFunct function|nil Variant of canJoinFunct for auxiliary nodes (inferred from code).
---@param eventOptions table|nil Options: commitHistoryOverride, preserveNodeZ, suppressAddNode, midJoinRefusalFn, maxWidth, gizmoAnchorFn.
function editor_toolUtilities_splineInput.handleSplineEvents(splines, out, isRotEnabled, isConformToTerrain, useRibs, useBars, isBarsLimits, useCopyPaste, useGizmo, isLockShape, defaultSplineWidth, deepCopyFunct, deepCopyStateFunct, copyProfileFunct, pasteProfileFunct, afterEndDragCallback, joinFunct, undoFunct, redoFunct, undoStateFunct, redoStateFunct, midJoinFunct, canJoinFunct, canJoinAuxFunct, eventOptions) end

--- True if a drag is in progress (node, auxiliary node or gizmo).
---Source: lua/ge/extensions/editor/toolUtilities/splineInput.lua:97
---@return boolean  Active drag.
function editor_toolUtilities_splineInput.isDragging() end

--- Registers a spline editing tool for the shared input utilities. Called again with the same prefix (hot reload), it updates the callbacks of the existing registration; does nothing if prefix is nil. Warning: on update, getAuxNodesFn and isNodeLockedFn are replaced as is, even if they are nil.
---Source: lua/ge/extensions/editor/toolUtilities/splineInput.lua:665
---@param prefix string Display prefix of the tool (from splineMgr.getToolPrefixStr()).
---@param getSplinesFn function Returns the tool's spline array.
---@param getEditModeKeyFn function Returns the editor edit mode key for this tool.
---@param deepCopyFn function Deep copy of a spline.
---@param deepCopyStateFn function Deep copy of the entire tool state.
---@param uiModuleName string Name of the UI module (e.g. 'editor_meshSpline'), which exposes setSelectedSplineIdx and setSelectedNodeIdx.
---@param getAuxNodesFn function|nil Optional: returns additional selectable node positions (array of vec3), same hit rules as road nodes.
---@param isNodeLockedFn function|nil Optional: isNodeLockedFn(spline, nodeIdx) returns true to allow selection but not dragging, the gizmo or deletion.
function editor_toolUtilities_splineInput.registerSplineTool(prefix, getSplinesFn, getEditModeKeyFn, deepCopyFn, deepCopyStateFn, uiModuleName, getAuxNodesFn, isNodeLockedFn) end

--- Declares that a tool is hosted in another edit mode: its prefix is then used as the active tool name instead of the edit mode's displayName.
---Source: lua/ge/extensions/editor/toolUtilities/splineInput.lua:103
---@param prefix string|nil Prefix of the hosted tool, nil to cancel.
function editor_toolUtilities_splineInput.setHostedTool(prefix) end

