---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/ezObjectSelect/cameraBookmarks.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- ImGui camera bookmarks panel for the Easy Select tool. Lets you add the current camera position/rotation (core_camera.getPosition / getQuat), rename, go back to a bookmark, update it or delete it. Bookmarks only live in memory (local table): they are not saved.
--- Access: extension `editor_ezObjectSelect_cameraBookmarks`: `extensions.load("editor_ezObjectSelect_cameraBookmarks")`, then the global `editor_ezObjectSelect_cameraBookmarks`
---@class editor_ezObjectSelect_cameraBookmarks
editor_ezObjectSelect_cameraBookmarks = {}

--- Draws the "Camera Bookmarks" panel (name field, Add Current Position button, list, Rename, Go To, Update View, Delete). Go To clears the camera's inputs/movements then sets position and rotation via core_camera.setPosition/setRotation. To be called every frame from an imgui window.
---Source: lua/ge/extensions/editor/ezObjectSelect/cameraBookmarks.lua:43
function editor_ezObjectSelect_cameraBookmarks.draw() end

