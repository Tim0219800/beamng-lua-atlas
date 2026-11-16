---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/ezObjectSelect/controller.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Controller of the editor's "Easy Select" tool (M.id = "ezObjectSelect", label "Easy Select"). Replaces classic object selection: discovery of objects under the mouse within a screen radius, stack of overlapping candidates, filters by distance/volume/name pattern, selection, moving (drag with projection onto terrain/raycast/screen, grid and rotation snap, placement on surface), modal operators G/R/S (transformOperator, rotateOperator, scaleOperator), native gizmo, "fence" mode (area selection sub-tool), camera bookmarks, orthographic camera and numpad presets. It centralizes the configuration (cfg), the state (st), the ezObjectSelect.* preferences and the workspace window (Selection, Hints, Fence tabs). It is driven by the module editor/ezObjectSelect.lua (edit mode) which calls activate/deactivate/update/drawWorkspace.
--- Access: extension `editor_ezObjectSelect_controller`: `extensions.load("editor_ezObjectSelect_controller")`, then the global `editor_ezObjectSelect_controller`
---@class editor_ezObjectSelect_controller
editor_ezObjectSelect_controller = {}

--- Activates the tool: resets the state, reserves selectability, enables the editor's temporary camera, applies the selection tint and the bindings.
---Source: lua/ge/extensions/editor/ezObjectSelect/controller.lua:1005
---@return boolean  true if active (already active or activation succeeded), false if the selectability reservation fails
function editor_ezObjectSelect_controller.activate() end

--- Deactivates the tool: cancels fence, modal operators, transform session and native gizmo, restores the selection tint according to gizmos.general.highlightSelectedMeshes, gives back the camera and the numpad, leaves ortho.
---Source: lua/ge/extensions/editor/ezObjectSelect/controller.lua:1033
function editor_ezObjectSelect_controller.deactivate() end

--- Draws the labels and diagnostics as a screen overlay (hover ring, labels, drag states). Does nothing if the tool is inactive or if fence is active.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/ezObjectSelect/controller.lua:508
function editor_ezObjectSelect_controller.drawScreenDebug() end

--- Draws the content of the "Easy Select" window (Selection tab with snapping/placement/grid/rotation, Hints, Fence; camera bookmarks).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/ezObjectSelect/controller.lua:1808
function editor_ezObjectSelect_controller.drawWorkspace() end

--- Invalidates the selection model cache and the cached stats volume, and clears the last snapshot.
---Source: lua/ge/extensions/editor/ezObjectSelect/controller.lua:1112
---@param reason string Reason (e.g. objectAdded, prefabExploded), passed to the cache
function editor_ezObjectSelect_controller.invalidateSelectionCache(reason) end

--- Indicates whether the tool is active.
---Source: lua/ge/extensions/editor/ezObjectSelect/controller.lua:1063
---@return boolean
function editor_ezObjectSelect_controller.isActive() end

--- Loads all the editor's ezObjectSelect.* preferences into the local configuration.
---Source: lua/ge/extensions/editor/ezObjectSelect/controller.lua:2194
function editor_ezObjectSelect_controller.loadPreferences() end

--- Hook relayed when the gizmo alignment (world/local) changes: synchronizes the coordinate mode and passes the space to the active modal operators.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/ezObjectSelect/controller.lua:1098
function editor_ezObjectSelect_controller.onAxisGizmoAlignmentChanged() end

--- Hook relayed when the axis gizmo mode changes. During a native drag, restores the current mode; if the new mode is translate/rotate/scale, toggles the visibility of the native gizmo (the same mode a second time hides it).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/ezObjectSelect/controller.lua:1074
---@param mode integer editor.AxisGizmoMode_Translate, _Rotate or _Scale
function editor_ezObjectSelect_controller.onAxisGizmoModeChanged(mode) end

--- Hook: copies the modified value of an ezObjectSelect.* preference into the local configuration.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/ezObjectSelect/controller.lua:2263
---@param path string Preference path
---@param value any New value
function editor_ezObjectSelect_controller.onEditorPreferenceValueChanged(path, value) end

--- Registers the "ezObjectSelect" category (subcategories general, selection, etc.) with default values, bounds and prefUi renderers.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/ezObjectSelect/controller.lua:2330
---@param prefsRegistry table Preferences registry
function editor_ezObjectSelect_controller.onEditorRegisterPreferences(prefsRegistry) end

--- Requests re-applying the tint of the selected meshes (setAxisGizmoHighlightSelectedMeshes) if the tool is active.
---Source: lua/ge/extensions/editor/ezObjectSelect/controller.lua:1067
function editor_ezObjectSelect_controller.refreshSelectedTint() end

--- Smoothly centers the camera on the hovered object, otherwise on the selection (editor.fitViewToSelectionSmooth). Ignored during an operation.
---Source: lua/ge/extensions/editor/ezObjectSelect/controller.lua:1207
function editor_ezObjectSelect_controller.requestFocusShortcut() end

--- Stores a numpad view preset, applied on the next update if numpadMode == 1.
---Source: lua/ge/extensions/editor/ezObjectSelect/controller.lua:1272
---@param preset any Requested preset (value forwarded as-is)
function editor_ezObjectSelect_controller.requestNumpadPreset(preset) end

--- Requests the rotate operator (R) under the same conditions.
---Source: lua/ge/extensions/editor/ezObjectSelect/controller.lua:1154
function editor_ezObjectSelect_controller.requestRotateShortcut() end

--- Requests the scale operator (S) under the same conditions.
---Source: lua/ge/extensions/editor/ezObjectSelect/controller.lua:1163
function editor_ezObjectSelect_controller.requestScaleShortcut() end

--- Requests the move operator (G) if suppressCameraForGrs is enabled and no operation is in progress and objects are selected.
---Source: lua/ge/extensions/editor/ezObjectSelect/controller.lua:1145
function editor_ezObjectSelect_controller.requestTransformShortcut() end

--- Unblocks wheel, camera movement, modal inputs and numpad, removes the action maps (Blender, numpad) and clears the shortcut requests.
---Source: lua/ge/extensions/editor/ezObjectSelect/controller.lua:410
function editor_ezObjectSelect_controller.resetInputFilters() end

--- Per-frame update called by the edit mode: handles fence, modal operators, shortcuts, hover/selection, drag, native gizmo, camera and 3D drawing.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/ezObjectSelect/controller.lua:1594
---@return boolean  false if the tool is inactive; otherwise indicates that the tool handled the frame (value compared to true by the edit mode)
function editor_ezObjectSelect_controller.update() end

--- Local table of preference rendering functions in the editor's preferences window. Each function has the signature (cat, subCat, item): cat and subCat are ignored, item.path is the preference path. Each function draws the widget of the matching value and a reset-to-default button.
---@class editor_ezObjectSelect_controller_prefUi
local editor_ezObjectSelect_controller_prefUi = {}

--- Checkbox: hide the hover box segments behind geometry.
---Source: lua/ge/extensions/editor/ezObjectSelect/controller.lua:2057
---@param _ any
---@param _ any
---@param item table Preference entry
function editor_ezObjectSelect_controller_prefUi.boundsDepthTest(_, _, item) end

--- Checkbox: hide the grid lines behind geometry (disabled if the plane is not displayed).
---Source: lua/ge/extensions/editor/ezObjectSelect/controller.lua:2109
---@param _ any
---@param _ any
---@param item table Preference entry
function editor_ezObjectSelect_controller_prefUi.clipMoveConstraintPlane(_, _, item) end

--- Debug mode checkbox (ezObjectSelect.general.debug).
---Source: lua/ge/extensions/editor/ezObjectSelect/controller.lua:1953
---@param _ any
---@param _ any
---@param item table Preference entry (path)
function editor_ezObjectSelect_controller_prefUi.debug(_, _, item) end

--- Integer: screen radius for object discovery (8 to 500 px, default 100).
---Source: lua/ge/extensions/editor/ezObjectSelect/controller.lua:1967
---@param _ any
---@param _ any
---@param item table Preference entry
function editor_ezObjectSelect_controller_prefUi.discoveryRadius(_, _, item) end

--- Checkbox: same for the boxes during drag.
---Source: lua/ge/extensions/editor/ezObjectSelect/controller.lua:2077
---@param _ any
---@param _ any
---@param item table Preference entry
function editor_ezObjectSelect_controller_prefUi.dragBoundsDepthTest(_, _, item) end

--- List: label placement (default "Follow mouse").
---Source: lua/ge/extensions/editor/ezObjectSelect/controller.lua:2087
---@param _ any
---@param _ any
---@param item table Preference entry
function editor_ezObjectSelect_controller_prefUi.labelPlacementMode(_, _, item) end

--- Integer: max number of nearby object outlines (0 to 50, default 5).
---Source: lua/ge/extensions/editor/ezObjectSelect/controller.lua:1976
---@param _ any
---@param _ any
---@param item table Preference entry
function editor_ezObjectSelect_controller_prefUi.maxDiscoveryOutlines(_, _, item) end

--- Float: max distance between the camera focus point and a selectable object (10 to 500, default 150).
---Source: lua/ge/extensions/editor/ezObjectSelect/controller.lua:2001
---@param _ any
---@param _ any
---@param item table Preference entry
function editor_ezObjectSelect_controller_prefUi.maxPickDistance(_, _, item) end

--- Float: max oriented box volume to be selectable (default 500000).
---Source: lua/ge/extensions/editor/ezObjectSelect/controller.lua:2017
---@param _ any
---@param _ any
---@param item table Preference entry
function editor_ezObjectSelect_controller_prefUi.maxPickVolume(_, _, item) end

--- Float: beyond this camera distance, hover only resolves the best object (10 to 1000, default 200).
---Source: lua/ge/extensions/editor/ezObjectSelect/controller.lua:2026
---@param _ any
---@param _ any
---@param item table Preference entry
function editor_ezObjectSelect_controller_prefUi.maxStackDistance(_, _, item) end

--- Integer: max number of overlapping candidate outlines (1 to 50, default 5).
---Source: lua/ge/extensions/editor/ezObjectSelect/controller.lua:1985
---@param _ any
---@param _ any
---@param item table Preference entry
function editor_ezObjectSelect_controller_prefUi.maxStackOutlines(_, _, item) end

--- List: numpad mode (standard or view presets).
---Source: lua/ge/extensions/editor/ezObjectSelect/controller.lua:2180
---@param _ any
---@param _ any
---@param item table Preference entry
function editor_ezObjectSelect_controller_prefUi.numpadMode(_, _, item) end

--- Integer: horizontal offset in pixels from the top-right corner (default 75).
---Source: lua/ge/extensions/editor/ezObjectSelect/controller.lua:2156
---@param _ any
---@param _ any
---@param item table Preference entry
function editor_ezObjectSelect_controller_prefUi.orientationGizmoRightOffset(_, _, item) end

--- Integer: vertical offset in pixels from the top-right corner (default 140).
---Source: lua/ge/extensions/editor/ezObjectSelect/controller.lua:2144
---@param _ any
---@param _ any
---@param item table Preference entry
function editor_ezObjectSelect_controller_prefUi.orientationGizmoTopOffset(_, _, item) end

--- List: outline mode (Outline or filled boxes).
---Source: lua/ge/extensions/editor/ezObjectSelect/controller.lua:2042
---@param _ any
---@param _ any
---@param item table Preference entry
function editor_ezObjectSelect_controller_prefUi.outlineMode(_, _, item) end

--- Checkbox: same for the boxes of selected objects.
---Source: lua/ge/extensions/editor/ezObjectSelect/controller.lua:2067
---@param _ any
---@param _ any
---@param item table Preference entry
function editor_ezObjectSelect_controller_prefUi.selectedBoundsDepthTest(_, _, item) end

--- Checkbox: tint the selected meshes.
---Source: lua/ge/extensions/editor/ezObjectSelect/controller.lua:2035
---@param _ any
---@param _ any
---@param item table Preference entry
function editor_ezObjectSelect_controller_prefUi.selectedTintEnabled(_, _, item) end

--- Float: length multiplier of the origin axes of selected objects (default 2).
---Source: lua/ge/extensions/editor/ezObjectSelect/controller.lua:2119
---@param _ any
---@param _ any
---@param item table Preference entry
function editor_ezObjectSelect_controller_prefUi.selectionGizmoLengthScale(_, _, item) end

--- Float: thickness of these axes (default 4).
---Source: lua/ge/extensions/editor/ezObjectSelect/controller.lua:2128
---@param _ any
---@param _ any
---@param item table Preference entry
function editor_ezObjectSelect_controller_prefUi.selectionGizmoLineWidth(_, _, item) end

--- Checkbox: maximum selection distance ring.
---Source: lua/ge/extensions/editor/ezObjectSelect/controller.lua:1994
---@param _ any
---@param _ any
---@param item table Preference entry
function editor_ezObjectSelect_controller_prefUi.showDistanceRing(_, _, item) end

--- Checkbox: hover ring and guide lines.
---Source: lua/ge/extensions/editor/ezObjectSelect/controller.lua:1960
---@param _ any
---@param _ any
---@param item table Preference entry
function editor_ezObjectSelect_controller_prefUi.showHoverRing(_, _, item) end

--- Checkbox: draw the move plane (free or planar G).
---Source: lua/ge/extensions/editor/ezObjectSelect/controller.lua:2102
---@param _ any
---@param _ any
---@param item table Preference entry
function editor_ezObjectSelect_controller_prefUi.showMoveConstraintPlane(_, _, item) end

--- Checkbox: fixed world/local orientation indicator in the viewport.
---Source: lua/ge/extensions/editor/ezObjectSelect/controller.lua:2137
---@param _ any
---@param _ any
---@param item table Preference entry
function editor_ezObjectSelect_controller_prefUi.showOrientationGizmo(_, _, item) end

--- Checkbox: red outline of objects excluded by the volume limit.
---Source: lua/ge/extensions/editor/ezObjectSelect/controller.lua:2010
---@param _ any
---@param _ any
---@param item table Preference entry
function editor_ezObjectSelect_controller_prefUi.showVolumeFilteredObjects(_, _, item) end

--- Checkbox: reserve G, R, S for the Move/Rotate/Scale modal tools (removes WASD camera movement).
---Source: lua/ge/extensions/editor/ezObjectSelect/controller.lua:2168
---@param _ any
---@param _ any
---@param item table Preference entry
function editor_ezObjectSelect_controller_prefUi.suppressCameraForGrs(_, _, item) end

