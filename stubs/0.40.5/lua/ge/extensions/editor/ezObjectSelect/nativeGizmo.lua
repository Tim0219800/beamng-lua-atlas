---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/ezObjectSelect/nativeGizmo.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Wrapper of the Easy Select tool around the editor's native axis gizmo (editor.updateAxisGizmo / drawAxisGizmo). Captures the transforms/scales of the selection at the start of the drag, applies translation (with grid snap), rotation and scale during the drag, then at the end records undoable history actions (SetObjectTransform / SetObjectScale, transaction "EasySelectNativeTransform" or "EasySelectNativeScale") and emits the hook onEditorObjectSelectionTransformChanged. Prefab offsets are updated for objects contained in a prefab.
--- Access: extension `editor_ezObjectSelect_nativeGizmo`: `extensions.load("editor_ezObjectSelect_nativeGizmo")`, then the global `editor_ezObjectSelect_nativeGizmo`
---@class editor_ezObjectSelect_nativeGizmo
editor_ezObjectSelect_nativeGizmo = {}

--- Reads and clears the "drag ended this frame" flag.
---Source: lua/ge/extensions/editor/ezObjectSelect/nativeGizmo.lua:355
---@return boolean  true if a drag ended
---@return table|nil  {mode, anchorDistance} (applied translation distance, 0 outside translation) if changes were committed
function editor_ezObjectSelect_nativeGizmo.consumeFinished() end

--- To be called every frame: checks that the selection matches the captured drag and that the objects support the current mode (non-empty position/rotation/scale, editor.canManipulateObject), updates the gizmo with the snap options then draws it.
---Source: lua/ge/extensions/editor/ezObjectSelect/nativeGizmo.lua:332
---@param options table|nil {gridSnapEnabled, gridRelative, gridSize, rotateSnapEnabled, rotateSnapSize}
---@return boolean  false if nothing was drawn (selection changed or mode not supported), otherwise true
function editor_ezObjectSelect_nativeGizmo.draw(options) end

--- Indicates whether a gizmo drag is in progress.
---Source: lua/ge/extensions/editor/ezObjectSelect/nativeGizmo.lua:351
---@return boolean
function editor_ezObjectSelect_nativeGizmo.isInteracting() end

--- Cancels the current drag: restores original transforms and scales, clears the flags and cancels the gizmo interaction.
---Source: lua/ge/extensions/editor/ezObjectSelect/nativeGizmo.lua:363
function editor_ezObjectSelect_nativeGizmo.reset() end

