---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/ezObjectSelect/subtools/fence/session.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Fence editing session of Easy Object Select. begin() discovers an existing fence from the selected object (fence/anchors) or starts a creation; the fence is represented by an editable spline (splineInput, sphere nodes) on which the populationEngine of meshSpline places TSStatic pieces as a preview (max 512). Committing creates/modifies the objects in a single undoable history action ("Edit Fence" or "Delete Fence").
--- Access: extension `editor_ezObjectSelect_subtools_fence_session`: `extensions.load("editor_ezObjectSelect_subtools_fence_session")`, then the global `editor_ezObjectSelect_subtools_fence_session`
---@class editor_ezObjectSelect_subtools_fence_session
editor_ezObjectSelect_subtools_fence_session = {}

--- Starts a session. Fails if a session is already active or if no asset is chosen. If objects are selected, starts from the last one; otherwise starts a blank creation. Saves the original selection and registers the spline tool.
---Source: lua/ge/extensions/editor/ezObjectSelect/subtools/fence/session.lua:520
---@param options table|nil assetPaths (string[]), anchorDistance (m), noOverlap (boolean, true by default unless explicitly false).
---@return boolean  true if the session starts.
---@return string|nil  Error message on failure.
function editor_ezObjectSelect_subtools_fence_session.begin(options) end

--- Cancels the session: restores the source objects and the original selection.
---Source: lua/ge/extensions/editor/ezObjectSelect/subtools/fence/session.lua:722
function editor_ezObjectSelect_subtools_fence_session.cancel() end

--- Deletes the fence's original objects in a single "Delete Fence" history action.
---Source: lua/ge/extensions/editor/ezObjectSelect/subtools/fence/session.lua:698
---@return integer  Number of pieces deleted; 0 if impossible.
function editor_ezObjectSelect_subtools_fence_session.deleteAndCommit() end

--- Commits the fence: serializes the final state, ends the session and records the "Edit Fence" history action (undoable).
---Source: lua/ge/extensions/editor/ezObjectSelect/subtools/fence/session.lua:664
---@return integer  Number of pieces created; 0 if nothing or on error.
function editor_ezObjectSelect_subtools_fence_session.exitAndCommit() end

--- Number of spline nodes (0 without a spline).
---Source: lua/ge/extensions/editor/ezObjectSelect/subtools/fence/session.lua:751
---@return integer  Number of nodes.
function editor_ezObjectSelect_subtools_fence_session.getNodeCount() end

--- Number of preview pieces.
---Source: lua/ge/extensions/editor/ezObjectSelect/subtools/fence/session.lua:743
---@return integer  Number of placements.
function editor_ezObjectSelect_subtools_fence_session.getPieceCount() end

--- Number of original pieces selected at start.
---Source: lua/ge/extensions/editor/ezObjectSelect/subtools/fence/session.lua:747
---@return integer  Number.
function editor_ezObjectSelect_subtools_fence_session.getSelectedPieceCount() end

--- Last status message (validation error, etc.).
---Source: lua/ge/extensions/editor/ezObjectSelect/subtools/fence/session.lua:770
---@return string|nil  Message.
function editor_ezObjectSelect_subtools_fence_session.getStatusMessage() end

--- true if a session is active.
---Source: lua/ge/extensions/editor/ezObjectSelect/subtools/fence/session.lua:735
---@return boolean  Active session.
function editor_ezObjectSelect_subtools_fence_session.isActive() end

--- true if discovery or preview has reached the safety limit; committing is then blocked.
---Source: lua/ge/extensions/editor/ezObjectSelect/subtools/fence/session.lua:759
---@return boolean  Limit reached.
function editor_ezObjectSelect_subtools_fence_session.isCapped() end

--- true if a drag (initial creation or spline node) is in progress.
---Source: lua/ge/extensions/editor/ezObjectSelect/subtools/fence/session.lua:739
---@return boolean  Drag in progress.
function editor_ezObjectSelect_subtools_fence_session.isDragging() end

--- true if the spline is closed as a loop.
---Source: lua/ge/extensions/editor/ezObjectSelect/subtools/fence/session.lua:755
---@return boolean  Loop.
function editor_ezObjectSelect_subtools_fence_session.isLoop() end

--- Enables/disables the no-overlap mode (whole mesh lengths, remainder left empty at the end) and marks the spline for rebuilding.
---Source: lua/ge/extensions/editor/ezObjectSelect/subtools/fence/session.lua:763
---@param enabled boolean true to enable.
function editor_ezObjectSelect_subtools_fence_session.setNoOverlap(enabled) end

--- To be called every frame: handles Esc, the initial creation or spline editing, rebuilds the preview if the spline is modified and draws nodes and spline.
---Source: lua/ge/extensions/editor/ezObjectSelect/subtools/fence/session.lua:616
---@param canAcceptInput boolean true if input can be processed.
---@return boolean  false if no active session.
function editor_ezObjectSelect_subtools_fence_session.update(canAcceptInput) end

