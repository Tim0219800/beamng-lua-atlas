---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/cameraBookmarks.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Editor window "Camera Bookmarks" (Camera menu). Lets you create, copy, paste, go to and delete camera bookmarks (CameraBookmark objects stored in the group returned by editor.getCameraBookmarks()). Adding, deleting and pasting a position go through the editor undo history (editor.history:commitAction).
--- Access: extension `editor_cameraBookmarks`: `extensions.load("editor_cameraBookmarks")`, then the global `editor_cameraBookmarks`
---@class editor_cameraBookmarks
editor_cameraBookmarks = {}

--- Draws the "Camera Bookmarks" window: name field + Add button, Copy Location / Paste Location buttons, then the bookmark list with Go To, Copy and Delete. Called every frame by the editor.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/cameraBookmarks.lua:79
function editor_cameraBookmarks.onEditorGui() end

--- Registers the window (500x500) and the "Camera Bookmarks" menu entry in the Camera menu group. Called once at editor initialization.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/cameraBookmarks.lua:133
function editor_cameraBookmarks.onEditorInitialized() end

--- Extension load hook; empty.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/cameraBookmarks.lua:130
function editor_cameraBookmarks.onExtensionLoaded() end

