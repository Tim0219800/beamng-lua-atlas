# `editor_ezObjectSelect_controller`

*File: `lua/ge/extensions/editor/ezObjectSelect/controller.lua` · VM: Game Engine (GE) · 2383 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_ezObjectSelect_controller`: `extensions.load("editor_ezObjectSelect_controller")`, then the global `editor_ezObjectSelect_controller`

Controller of the editor's "Easy Select" tool (M.id = "ezObjectSelect", label "Easy Select"). Replaces classic object selection: discovery of objects under the mouse within a screen radius, stack of overlapping candidates, filters by distance/volume/name pattern, selection, moving (drag with projection onto terrain/raycast/screen, grid and rotation snap, placement on surface), modal operators G/R/S (transformOperator, rotateOperator, scaleOperator), native gizmo, "fence" mode (area selection sub-tool), camera bookmarks, orthographic camera and numpad presets. It centralizes the configuration (cfg), the state (st), the ezObjectSelect.* preferences and the workspace window (Selection, Hints, Fence tabs). It is driven by the module editor/ezObjectSelect.lua (edit mode) which calls activate/deactivate/update/drawWorkspace.

## Notes

- activate() reserves selectability (selectabilityPresets.beginScope "staticsAndProps"); if it fails, returns false and the parent extension returns to the objectSelect mode.
- The request*Shortcut shortcuts (G/R/S) do nothing as long as the suppressCameraForGrs preference is disabled (default false): in that case, S remains camera movement.
- requestNumpadPreset is only taken into account if numpadMode == 1 (numpadMode preference).
- Notable default preferences: discoveryRadius 100 px, maxDiscoveryOutlines 5, maxStackOutlines 5, maxPickDistance 150 m, maxStackDistance 200 m, maxPickVolume 500000 (box volume), selectionGizmoLengthScale 2, selectionGizmoLineWidth 4.
- The prefUi functions are the custom renderers of the preferences (checkbox, slider, list); they ignore their first two parameters (cat, subCat), use item.path to call editor.setPreference and draw a "default value" button.

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_ezObjectSelect_controller.activate()` | Activates the tool: resets the state, reserves selectability, enables the editor's temporary camera, applies the selection tint and the bindings. | 1005 |
| `editor_ezObjectSelect_controller.deactivate()` | Deactivates the tool: cancels fence, modal operators, transform session and native gizmo, restores the selection tint according to gizmos.general.highlightSelectedMeshes, gives back the camera and the numpad, leaves ortho. | 1033 |
| `editor_ezObjectSelect_controller.drawScreenDebug()` | Draws the labels and diagnostics as a screen overlay (hover ring, labels, drag states). Does nothing if the tool is inactive or if fence is active. *(internal)* | 508 |
| `editor_ezObjectSelect_controller.drawWorkspace()` | Draws the content of the "Easy Select" window (Selection tab with snapping/placement/grid/rotation, Hints, Fence; camera bookmarks). *(internal)* | 1808 |
| `editor_ezObjectSelect_controller.invalidateSelectionCache(reason)` | Invalidates the selection model cache and the cached stats volume, and clears the last snapshot. | 1112 |
| `editor_ezObjectSelect_controller.isActive()` | Indicates whether the tool is active. | 1063 |
| `editor_ezObjectSelect_controller.loadPreferences()` | Loads all the editor's ezObjectSelect.* preferences into the local configuration. | 2194 |
| `editor_ezObjectSelect_controller.onAxisGizmoAlignmentChanged()` | Hook relayed when the gizmo alignment (world/local) changes: synchronizes the coordinate mode and passes the space to the active modal operators. *(internal)* *(hook)* | 1098 |
| `editor_ezObjectSelect_controller.onAxisGizmoModeChanged(mode)` | Hook relayed when the axis gizmo mode changes. During a native drag, restores the current mode; if the new mode is translate/rotate/scale, toggles the visibility of the native gizmo (the same mode a second time hides it). *(internal)* *(hook)* | 1074 |
| `editor_ezObjectSelect_controller.onEditorPreferenceValueChanged(path, value)` | Hook: copies the modified value of an ezObjectSelect.* preference into the local configuration. *(internal)* *(hook)* | 2263 |
| `editor_ezObjectSelect_controller.onEditorRegisterPreferences(prefsRegistry)` | Registers the "ezObjectSelect" category (subcategories general, selection, etc.) with default values, bounds and prefUi renderers. *(internal)* *(hook)* | 2330 |
| `editor_ezObjectSelect_controller.refreshSelectedTint()` | Requests re-applying the tint of the selected meshes (setAxisGizmoHighlightSelectedMeshes) if the tool is active. | 1067 |
| `editor_ezObjectSelect_controller.requestFocusShortcut()` | Smoothly centers the camera on the hovered object, otherwise on the selection (editor.fitViewToSelectionSmooth). Ignored during an operation. | 1207 |
| `editor_ezObjectSelect_controller.requestNumpadPreset(preset)` | Stores a numpad view preset, applied on the next update if numpadMode == 1. | 1272 |
| `editor_ezObjectSelect_controller.requestRotateShortcut()` | Requests the rotate operator (R) under the same conditions. | 1154 |
| `editor_ezObjectSelect_controller.requestScaleShortcut()` | Requests the scale operator (S) under the same conditions. | 1163 |
| `editor_ezObjectSelect_controller.requestTransformShortcut()` | Requests the move operator (G) if suppressCameraForGrs is enabled and no operation is in progress and objects are selected. | 1145 |
| `editor_ezObjectSelect_controller.resetInputFilters()` | Unblocks wheel, camera movement, modal inputs and numpad, removes the action maps (Blender, numpad) and clears the shortcut requests. | 410 |
| `editor_ezObjectSelect_controller.update()` | Per-frame update called by the edit mode: handles fence, modal operators, shortcuts, hover/selection, drag, native gizmo, camera and 3D drawing. *(internal)* | 1594 |

### Parameter details

#### `editor_ezObjectSelect_controller.activate()`

Activates the tool: resets the state, reserves selectability, enables the editor's temporary camera, applies the selection tint and the bindings.

- **returns**: boolean true if active (already active or activation succeeded), false if the selectability reservation fails

#### `editor_ezObjectSelect_controller.invalidateSelectionCache(reason)`

Invalidates the selection model cache and the cached stats volume, and clears the last snapshot.

- `reason` (*string*) : Reason (e.g. objectAdded, prefabExploded), passed to the cache

#### `editor_ezObjectSelect_controller.isActive()`

Indicates whether the tool is active.

- **returns**: boolean 

#### `editor_ezObjectSelect_controller.onAxisGizmoModeChanged(mode)`

Hook relayed when the axis gizmo mode changes. During a native drag, restores the current mode; if the new mode is translate/rotate/scale, toggles the visibility of the native gizmo (the same mode a second time hides it).

- `mode` (*integer*) : editor.AxisGizmoMode_Translate, _Rotate or _Scale

#### `editor_ezObjectSelect_controller.onEditorPreferenceValueChanged(path, value)`

Hook: copies the modified value of an ezObjectSelect.* preference into the local configuration.

- `path` (*string*) : Preference path
- `value` (*any*) : New value

#### `editor_ezObjectSelect_controller.onEditorRegisterPreferences(prefsRegistry)`

Registers the "ezObjectSelect" category (subcategories general, selection, etc.) with default values, bounds and prefUi renderers.

- `prefsRegistry` (*table*) : Preferences registry

#### `editor_ezObjectSelect_controller.requestNumpadPreset(preset)`

Stores a numpad view preset, applied on the next update if numpadMode == 1.

- `preset` (*any*) : Requested preset (value forwarded as-is)

#### `editor_ezObjectSelect_controller.update()`

Per-frame update called by the edit mode: handles fence, modal operators, shortcuts, hover/selection, drag, native gizmo, camera and 3D drawing.

- **returns**: boolean false if the tool is inactive; otherwise indicates that the tool handled the frame (value compared to true by the edit mode)

## Class `prefUi`

Local table of preference rendering functions in the editor's preferences window. Each function has the signature (cat, subCat, item): cat and subCat are ignored, item.path is the preference path. Each function draws the widget of the matching value and a reset-to-default button.

| Method | Description | Line |
|---|---|---|
| `prefUi.boundsDepthTest(_, _, item)` | Checkbox: hide the hover box segments behind geometry. | 2057 |
| `prefUi.clipMoveConstraintPlane(_, _, item)` | Checkbox: hide the grid lines behind geometry (disabled if the plane is not displayed). | 2109 |
| `prefUi.debug(_, _, item)` | Debug mode checkbox (ezObjectSelect.general.debug). | 1953 |
| `prefUi.discoveryRadius(_, _, item)` | Integer: screen radius for object discovery (8 to 500 px, default 100). | 1967 |
| `prefUi.dragBoundsDepthTest(_, _, item)` | Checkbox: same for the boxes during drag. | 2077 |
| `prefUi.labelPlacementMode(_, _, item)` | List: label placement (default "Follow mouse"). | 2087 |
| `prefUi.maxDiscoveryOutlines(_, _, item)` | Integer: max number of nearby object outlines (0 to 50, default 5). | 1976 |
| `prefUi.maxPickDistance(_, _, item)` | Float: max distance between the camera focus point and a selectable object (10 to 500, default 150). | 2001 |
| `prefUi.maxPickVolume(_, _, item)` | Float: max oriented box volume to be selectable (default 500000). | 2017 |
| `prefUi.maxStackDistance(_, _, item)` | Float: beyond this camera distance, hover only resolves the best object (10 to 1000, default 200). | 2026 |
| `prefUi.maxStackOutlines(_, _, item)` | Integer: max number of overlapping candidate outlines (1 to 50, default 5). | 1985 |
| `prefUi.numpadMode(_, _, item)` | List: numpad mode (standard or view presets). | 2180 |
| `prefUi.orientationGizmoRightOffset(_, _, item)` | Integer: horizontal offset in pixels from the top-right corner (default 75). | 2156 |
| `prefUi.orientationGizmoTopOffset(_, _, item)` | Integer: vertical offset in pixels from the top-right corner (default 140). | 2144 |
| `prefUi.outlineMode(_, _, item)` | List: outline mode (Outline or filled boxes). | 2042 |
| `prefUi.selectedBoundsDepthTest(_, _, item)` | Checkbox: same for the boxes of selected objects. | 2067 |
| `prefUi.selectedTintEnabled(_, _, item)` | Checkbox: tint the selected meshes. | 2035 |
| `prefUi.selectionGizmoLengthScale(_, _, item)` | Float: length multiplier of the origin axes of selected objects (default 2). | 2119 |
| `prefUi.selectionGizmoLineWidth(_, _, item)` | Float: thickness of these axes (default 4). | 2128 |
| `prefUi.showDistanceRing(_, _, item)` | Checkbox: maximum selection distance ring. | 1994 |
| `prefUi.showHoverRing(_, _, item)` | Checkbox: hover ring and guide lines. | 1960 |
| `prefUi.showMoveConstraintPlane(_, _, item)` | Checkbox: draw the move plane (free or planar G). | 2102 |
| `prefUi.showOrientationGizmo(_, _, item)` | Checkbox: fixed world/local orientation indicator in the viewport. | 2137 |
| `prefUi.showVolumeFilteredObjects(_, _, item)` | Checkbox: red outline of objects excluded by the volume limit. | 2010 |
| `prefUi.suppressCameraForGrs(_, _, item)` | Checkbox: reserve G, R, S for the Move/Rotate/Scale modal tools (removes WASD camera movement). | 2168 |

## Calls into the engine (C++)

- `Engine.` `castRay`
- `debugDrawer:` `drawSphere`
- `obj:` `disableCollision`, `enableCollision`, `getID`, `getPosition`, `getTransform`, `getWorldBox`
- `scenetree.` `findObjectById`
- `worldEditorCppApi.` `setAxisGizmoHighlightSelectedMeshes`, `setAxisGizmoMode`, `setAxisGizmoSelectedElement`, `setHoveredObjectId`

**Loads extensions:** `core_orthoCamera`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/ezObjectSelect/controller.lua`.*
