---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/toolUtilities/splineInput.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `editor_toolUtilities_splineInput` : `extensions.load("editor_toolUtilities_splineInput")`, puis la globale `editor_toolUtilities_splineInput`
---@class editor_toolUtilities_splineInput
editor_toolUtilities_splineInput = {}

---Source : lua/ge/extensions/editor/toolUtilities/splineInput.lua:77
function editor_toolUtilities_splineInput.cancelDrag() end

--- Optimized hit detection that prioritizes by distance to resolve selection conflicts.
---  Returns the best hit target based on closest distance to camera ray.
---  Always checks splines from all tools for cross-tool selection.
---  [SelSpline - The currently selected spline.]
---  [MousePos - The 3D mouse position.]
---  [UseRibs - Whether to check rib handles.]
---  [UseBars - Whether to check bar handles.]
---Source : lua/ge/extensions/editor/toolUtilities/splineInput.lua:478
---@param selSpline any
---@param mousePos any
---@param useRibs any
---@param useBars any
function editor_toolUtilities_splineInput.getBestHitTarget(selSpline, mousePos, useRibs, useBars) end

--- Cross-tool node selection for tools that DON'T run handleSplineEvents themselves (polygon tools such as the
---  forest zone editor). Each frame it hovers foreign-tool spline nodes (glow + 'select' markup) and, on click,
---  switches to that tool and selects the node - exactly the pickup the spline tools get internally. Pass the
---  calling tool's own prefix so its own splines are skipped (the caller selects those itself). Returns true when a
---  foreign node is under the cursor, so the caller can skip its own scene interaction for the frame.
---Source : lua/ge/extensions/editor/toolUtilities/splineInput.lua:701
---@param activePrefix any
function editor_toolUtilities_splineInput.handleForeignNodeSelection(activePrefix) end

--- Handles the user input events for spline-editing tools.
---  Splines are user-editable polylines along the centerline of a variable width. They can be used to create roads, paths, etc.
---  [SelSpline - The selected spline.]
---  [Nodes - The collection of navigation graph nodes to handle events for.]
---  [DeepCopyFunct - A function which deep copies a spline.]
---  [UndoFunct - The undo callback function for a single spline edit.]
---  [RedoFunct - The redo callback function for a single spline edit.]
---  [isBarsLimit - Whether to use velLimits (true) or vels (false) for bar heights.]
---  [useBars - Whether to allow bar interactions (defaults to true).]
---Source : lua/ge/extensions/editor/toolUtilities/splineInput.lua:1171
---@param selSpline any
---@param nodes any
---@param deepCopyFunct any
---@param undoFunct any
---@param redoFunct any
---@param isBarsLimit any
---@param useBars any
function editor_toolUtilities_splineInput.handleNavGraphEvents(selSpline, nodes, deepCopyFunct, undoFunct, redoFunct, isBarsLimit, useBars) end

--- Handles the user input events for spline-editing tools.
---  Splines are user-editable polylines along the centerline of a variable width. They can be used to create roads, paths, etc.
---  [Splines - The collection of splines to handle events for.]
---  [Out - A table which contains the following common fields (will be updated as the user interacts with the splines):]
---  [SelSplineIdx - The index of the selected spline.]
---  [SelNodeIdx - The index of the selected node.]
---  [SelLayerIdx - The index of the selected layer. NOTE: This is only used for the 'decal placement' case.]
---  [IsGizmoActive - A flag which indicates whether the gizmo is active.]
---  [IsRotEnabled - A flag which indicates whether the rotation gizmo is enabled.]
---  [IsConformToTerrain - A flag which indicates whether the spline should be conform to the surface below, or not. Used for vertical gizmo control.]
---  [UseRibs - A flag which indicates whether to use ribs (handles for width adjustment).]
---  [UseBars - A flag which indicates whether to use bars (handles for height adjustment).]
---  [IsBarsLimits - A flag which indicates whether the bars are limits (true) or velocities (false).]
---  [UseCopyPaste - A flag which indicates whether to use the copy/paste profile feature.]
---  [UseGizmo - A flag which indicates whether to use gizmo.]
---  [IsLockShape - A flag which indicates whether the shape of the spline is locked, or not.]
---  [DefaultSplineWidth - The default width for a spline when adding a new node, in meters.]
---  [DeepCopyFunct - A function which deep copies a spline.]
---  [DeepCopyStateFunct - A function which deep copies the state of a spline.]
---  [CopyProfileFunct - A function which copies a profile.]
---  [PasteProfileFunct - A function which pastes a profile.]
---  [RibStartDragCallback - A function which is called when the user starts dragging a rib.]
---  [AfterEndDragCallback - A function which is called when the user ends dragging.]
---  [JoinFunct - A function which is called when the user forms a join.]
---  [UndoFunct - The undo callback function for a single spline edit.]
---  [RedoFunct - The redo callback function for a single spline edit.]
---  [UndoStateFunct - The undo callback function for the full spline state edit.]
---  [RedoStateFunct - The redo callback function for the full spline state edit.]
---Source : lua/ge/extensions/editor/toolUtilities/splineInput.lua:775
---@param splines any
---@param out any
---@param isRotEnabled any
---@param isConformToTerrain any
---@param useRibs any
---@param useBars any
---@param isBarsLimits any
---@param useCopyPaste any
---@param useGizmo any
---@param isLockShape any
---@param defaultSplineWidth any
---@param deepCopyFunct any
---@param deepCopyStateFunct any
---@param copyProfileFunct any
---@param pasteProfileFunct any
---@param afterEndDragCallback any
---@param joinFunct any
---@param undoFunct any
---@param redoFunct any
---@param undoStateFunct any
---@param redoStateFunct any
---@param midJoinFunct any
---@param canJoinFunct any
---@param canJoinAuxFunct any
---@param eventOptions any
function editor_toolUtilities_splineInput.handleSplineEvents(splines, out, isRotEnabled, isConformToTerrain, useRibs, useBars, isBarsLimits, useCopyPaste, useGizmo, isLockShape, defaultSplineWidth, deepCopyFunct, deepCopyStateFunct, copyProfileFunct, pasteProfileFunct, afterEndDragCallback, joinFunct, undoFunct, redoFunct, undoStateFunct, redoStateFunct, midJoinFunct, canJoinFunct, canJoinAuxFunct, eventOptions) end

---Source : lua/ge/extensions/editor/toolUtilities/splineInput.lua:97
function editor_toolUtilities_splineInput.isDragging() end

--- Registers a spline-editing tool for use with the shared spline input utilities.
---  [prefix]           - Tool display prefix (from splineMgr.getToolPrefixStr()).
---  [getSplinesFn]     - Function returning the tool's spline array.
---  [getEditModeKeyFn] - Function returning the editor editMode key for this tool.
---  [deepCopyFn]       - Function deep-copying a single spline.
---  [deepCopyStateFn]  - Function deep-copying the full spline tool state.
---  [uiModuleName]     - Name of the UI module (e.g. 'editor_meshSpline').
---  [getAuxNodesFn]    - Optional: returns extra selectable node positions (vec3 array), same hit rules as road nodes.
---  [isNodeLockedFn]   - Optional: isNodeLockedFn(spline, nodeIdx) → true to allow select but not drag/gizmo/delete.
---Source : lua/ge/extensions/editor/toolUtilities/splineInput.lua:665
---@param prefix any
---@param getSplinesFn any
---@param getEditModeKeyFn any
---@param deepCopyFn any
---@param deepCopyStateFn any
---@param uiModuleName any
---@param getAuxNodesFn any
---@param isNodeLockedFn any
function editor_toolUtilities_splineInput.registerSplineTool(prefix, getSplinesFn, getEditModeKeyFn, deepCopyFn, deepCopyStateFn, uiModuleName, getAuxNodesFn, isNodeLockedFn) end

---Source : lua/ge/extensions/editor/toolUtilities/splineInput.lua:103
---@param prefix any
function editor_toolUtilities_splineInput.setHostedTool(prefix) end

