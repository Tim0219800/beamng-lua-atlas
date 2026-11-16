---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/ezObjectSelect/viewportOrientationGizmo.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Small 2D orientation gizmo drawn in a corner of the editor view (ImGui, foreground draw list) for Easy Object Select: three axes X (red), Y (green), Z (blue) projected according to the camera orientation (core_camera.getQuat), with solid labeled positive tips and darker negative tips. Displays "W" (world) or "L" (local) depending on whether a local object is given.
--- Access: extension `editor_ezObjectSelect_viewportOrientationGizmo`: `extensions.load("editor_ezObjectSelect_viewportOrientationGizmo")`, then the global `editor_ezObjectSelect_viewportOrientationGizmo`
---@class editor_ezObjectSelect_viewportOrientationGizmo
editor_ezObjectSelect_viewportOrientationGizmo = {}

--- Draws the gizmo. If localObjectId designates an existing object, the axes follow its transform matrix (L mode), otherwise the world axes (W mode). The tips are sorted by depth.
---Source: lua/ge/extensions/editor/ezObjectSelect/viewportOrientationGizmo.lua:52
---@param rightOffset number|nil Offset from the right edge of the scene view, in pixels before uiscale (default 64).
---@param topOffset number|nil Offset from the top, in pixels before uiscale (default 64).
---@param localObjectId integer|nil ID of an object whose local axes are displayed.
function editor_ezObjectSelect_viewportOrientationGizmo.draw(rightOffset, topOffset, localObjectId) end

