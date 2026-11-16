---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/ezObjectSelect/subtools/fence/controller.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- ImGui panel of the "Fence" sub-tool of Easy Object Select. Lets you choose the fence mesh (Asset Browser selection or object selected in Easy Select), set the anchor matching distance (0.05 to 5 m) and the "No overlap" option, then start Select Fence, and, once the mode is active, confirm (Exit Fence Mode), cancel (Cancel Fence) or delete (Delete Fence) the fence. Delegates all the logic to fence/session.
--- Access: extension `editor_ezObjectSelect_subtools_fence_controller`: `extensions.load("editor_ezObjectSelect_subtools_fence_controller")`, then the global `editor_ezObjectSelect_subtools_fence_controller`
---@class editor_ezObjectSelect_subtools_fence_controller
editor_ezObjectSelect_subtools_fence_controller = {}

--- Cancels the current fence session (restores the original pieces).
---Source: lua/ge/extensions/editor/ezObjectSelect/subtools/fence/controller.lua:155
function editor_ezObjectSelect_subtools_fence_controller.cancel() end

--- Draws the sub-tool panel and handles clicks on its buttons (calls fenceSession.begin / exitAndCommit / cancel / deleteAndCommit / setNoOverlap).
---Source: lua/ge/extensions/editor/ezObjectSelect/subtools/fence/controller.lua:28
---@param options table|nil canEnter (boolean): if false, Select Fence is disabled.
function editor_ezObjectSelect_subtools_fence_controller.drawWorkspace(options) end

--- Indicates whether fence mode is active.
---Source: lua/ge/extensions/editor/ezObjectSelect/subtools/fence/controller.lua:159
---@return boolean  true if a session is active.
function editor_ezObjectSelect_subtools_fence_controller.isModeActive() end

--- Passes the frame to fenceSession.update (mouse/keyboard input, preview, drawing).
---Source: lua/ge/extensions/editor/ezObjectSelect/subtools/fence/controller.lua:151
---@param canAcceptInput boolean true if the view can receive input.
---@return boolean  true if a session is active.
function editor_ezObjectSelect_subtools_fence_controller.update(canAcceptInput) end

