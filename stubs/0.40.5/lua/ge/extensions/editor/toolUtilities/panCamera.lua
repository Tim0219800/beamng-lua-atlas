---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/toolUtilities/panCamera.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- "Pan" camera shared by the editor's spline tools. It takes over the editor's free camera (via toolCamera), switches to a top-down view and allows moving with right-click and zooming with the mouse wheel. A host tool registers it with configure, calls it every frame with drive, and can have it frame the current selection.
--- Access: extension `editor_toolUtilities_panCamera`: `extensions.load("editor_toolUtilities_panCamera")`, then the global `editor_toolUtilities_panCamera`
---@class editor_toolUtilities_panCamera
editor_toolUtilities_panCamera = {}

--- Deactivates the pan camera and hands the free camera back to the editor (toolCamera.handBack).
---Source: lua/ge/extensions/editor/toolUtilities/panCamera.lua:52
function editor_toolUtilities_panCamera.close() end

--- Registers a callback supplying the points of the current selection, used to frame them when the camera opens.
---Source: lua/ge/extensions/editor/toolUtilities/panCamera.lua:29
---@param opts table|nil Table with the focusProvider field: function with no argument returning a list of {x,y,z} points or nil.
function editor_toolUtilities_panCamera.configure(opts) end

--- To be called every frame: applies movement (right-click drag) and zoom (mouse wheel) via toolCamera.drive.
---Source: lua/ge/extensions/editor/toolUtilities/panCamera.lua:71
---@param blocked boolean|nil true to suspend movement during the tool's modal interactions (polygon drawing, node dragging, placement...).
function editor_toolUtilities_panCamera.drive(blocked) end

--- "Go to" routing: if the pan camera (or toolCamera) is active, makes it fly to the given points and returns true; otherwise returns false and the caller does its normal jump.
---Source: lua/ge/extensions/editor/toolUtilities/panCamera.lua:63
---@param points table List of {x,y,z} points to frame.
---@return boolean  true if the request was handled by the pan camera.
function editor_toolUtilities_panCamera.gotoPoints(points) end

--- Tells whether the pan camera is active.
---Source: lua/ge/extensions/editor/toolUtilities/panCamera.lua:33
---@return boolean  true if the pan camera drives the view.
function editor_toolUtilities_panCamera.isOn() end

--- Activates the pan camera (toolCamera.takeOver) and switches to top-down view: frames the selection supplied by focusProvider if there is one, otherwise switches to top-down view at the camera's current position and height.
---Source: lua/ge/extensions/editor/toolUtilities/panCamera.lua:39
function editor_toolUtilities_panCamera.open() end

--- Toggle: closes the pan camera if it is active, otherwise opens it.
---Source: lua/ge/extensions/editor/toolUtilities/panCamera.lua:57
function editor_toolUtilities_panCamera.toggle() end

