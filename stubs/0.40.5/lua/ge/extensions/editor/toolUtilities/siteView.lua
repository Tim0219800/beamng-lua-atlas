---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/toolUtilities/siteView.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Manages the camera of the outline editor tools (open space editor, parking lot editor): which editing step is shown (Footprint or Design) and which of the three cameras (pan, rotate, free) frames the selection. Relies on editor/toolUtilities/toolCamera for movements. Only one tool is active at a time, so the state (step, mode, last selection) is unique at module level. The massing editor keeps its own version, but offers the same buttons.
--- Access: extension `editor_toolUtilities_siteView`: `extensions.load("editor_toolUtilities_siteView")`, then the global `editor_toolUtilities_siteView`
---@class editor_toolUtilities_siteView
---@field modes table List of camera buttons: { mode = 'pan'|'rotate'|'free', icon, tip }.
---@field steps table List of editing steps offered in the interface: { key = 'footprint', label, icon } and { key = 'design', label, icon }.
editor_toolUtilities_siteView = {}

--- Takes over the editor's camera (toolCam.takeOver) then frames the selection.
---Source: lua/ge/extensions/editor/toolUtilities/siteView.lua:65
---@param m string|nil Mode to activate; defaults to the current mode.
function editor_toolUtilities_siteView.activate(m) end

--- Action of a camera button: switches to that mode, or reframes if it is already active (except 'free', where nothing happens). This second press serves as "go to site".
---Source: lua/ge/extensions/editor/toolUtilities/siteView.lua:104
---@param m string Mode of the clicked button.
function editor_toolUtilities_siteView.clickMode(m) end

--- Per-frame camera driving (toolCam.drive), except in free mode.
---Source: lua/ge/extensions/editor/toolUtilities/siteView.lua:116
---@param blocked boolean Suppresses movement during the tool's modal interactions (drawing, dragging a handle).
function editor_toolUtilities_siteView.drive(blocked) end

--- Sends the active camera (pan or orbit) to the selection, based on the outline supplied by ring(). Also remembers the current selection.
---Source: lua/ge/extensions/editor/toolUtilities/siteView.lua:56
---@param m string|nil 'pan' or other (orbit); defaults to the current mode.
function editor_toolUtilities_siteView.focus(m) end

--- Reframes if the selection (ctx.selIndex()) has changed since the last framing. No effect in free mode.
---Source: lua/ge/extensions/editor/toolUtilities/siteView.lua:109
function editor_toolUtilities_siteView.followSelection() end

--- Returns the current camera mode.
---Source: lua/ge/extensions/editor/toolUtilities/siteView.lua:133
---@return string  'pan', 'rotate' or 'free'.
function editor_toolUtilities_siteView.getMode() end

--- Returns the current step.
---Source: lua/ge/extensions/editor/toolUtilities/siteView.lua:132
---@return string  'footprint' or 'design'.
function editor_toolUtilities_siteView.getStep() end

--- Gives the editor's camera back when leaving the tool (toolCam.handBack(false)).
---Source: lua/ge/extensions/editor/toolUtilities/siteView.lua:121
function editor_toolUtilities_siteView.handBack() end

--- Binds the module to the host tool by storing the context. `ring` returns the outline to frame, `terrainZ` the ground under a point, `selIndex` the current selection (to reframe when it changes) and `onStep` is called when the step changes.
---Source: lua/ge/extensions/editor/toolUtilities/siteView.lua:32
---@param c table Context { ring, terrainZ, selIndex, onStep }.
function editor_toolUtilities_siteView.init(c) end

--- True when the current step is 'footprint'.
---Source: lua/ge/extensions/editor/toolUtilities/siteView.lua:131
---@return boolean  step == 'footprint'.
function editor_toolUtilities_siteView.isShaping() end

--- Resets the tool's opening state: design step, rotate mode, then activates and frames the camera in orbit.
---Source: lua/ge/extensions/editor/toolUtilities/siteView.lua:126
function editor_toolUtilities_siteView.reset() end

--- Changes camera. To 'free': gives the camera back to the editor. From 'free' to another mode: takes over and frames; otherwise, simply reframes.
---Source: lua/ge/extensions/editor/toolUtilities/siteView.lua:71
---@param m string 'pan', 'rotate' or 'free'.
function editor_toolUtilities_siteView.setMode(m) end

--- Changes editing step and calls ctx.onStep(key). 'footprint' forces the pan camera (nodes are drawn flat) and remembers whether the user was in free; on leaving, restores free if that was the case, otherwise goes back to rotate.
---Source: lua/ge/extensions/editor/toolUtilities/siteView.lua:86
---@param key string 'footprint' or 'design'.
function editor_toolUtilities_siteView.setStep(key) end

