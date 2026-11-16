# `editor_cameraBookmarks`

*File: `lua/ge/extensions/editor/cameraBookmarks.lua` · VM: Game Engine (GE) · 143 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_cameraBookmarks`: `extensions.load("editor_cameraBookmarks")`, then the global `editor_cameraBookmarks`

Editor window "Camera Bookmarks" (Camera menu). Lets you create, copy, paste, go to and delete camera bookmarks (CameraBookmark objects stored in the group returned by editor.getCameraBookmarks()). Adding, deleting and pasting a position go through the editor undo history (editor.history:commitAction).

## Notes

- No utility function exported: the module only exposes editor hooks.
- A bookmark is created via worldEditorCppApi.createObject('CameraBookmark') with datablock CameraBookmarkMarker and scale '5 5 5'.
- The undo/redo replay functions are local (createBookmarkRedo, deleteBookmarkRedo, setCameraTransformRedo/Undo).

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_cameraBookmarks.onEditorGui()` | Draws the "Camera Bookmarks" window: name field + Add button, Copy Location / Paste Location buttons, then the bookmark list with Go To, Copy and Delete. Called every frame by the editor. *(internal)* *(hook)* | 79 |
| `editor_cameraBookmarks.onEditorInitialized()` | Registers the window (500x500) and the "Camera Bookmarks" menu entry in the Camera menu group. Called once at editor initialization. *(internal)* *(hook)* | 133 |
| `editor_cameraBookmarks.onExtensionLoaded()` | Extension load hook; empty. *(internal)* *(hook)* | 130 |

## Calls into the engine (C++)

- `obj:` `deleteObject`, `getInternalName`, `getTransform`
- `scenetree.` `findObjectById`
- `worldEditorCppApi.` `createObject`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/cameraBookmarks.lua`.*
