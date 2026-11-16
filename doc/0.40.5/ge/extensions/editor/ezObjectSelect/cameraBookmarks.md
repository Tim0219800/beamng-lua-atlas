# `editor_ezObjectSelect_cameraBookmarks`

*File: `lua/ge/extensions/editor/ezObjectSelect/cameraBookmarks.lua` · VM: Game Engine (GE) · 105 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_ezObjectSelect_cameraBookmarks`: `extensions.load("editor_ezObjectSelect_cameraBookmarks")`, then the global `editor_ezObjectSelect_cameraBookmarks`

ImGui camera bookmarks panel for the Easy Select tool. Lets you add the current camera position/rotation (core_camera.getPosition / getQuat), rename, go back to a bookmark, update it or delete it. Bookmarks only live in memory (local table): they are not saved.

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_ezObjectSelect_cameraBookmarks.draw()` | Draws the "Camera Bookmarks" panel (name field, Add Current Position button, list, Rename, Go To, Update View, Delete). Go To clears the camera's inputs/movements then sets position and rotation via core_camera.setPosition/setRotation. To be called every frame from an imgui window. | 43 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/ezObjectSelect/cameraBookmarks.lua`.*
