# `editor_ezObjectSelect_viewportOrientationGizmo`

*File: `lua/ge/extensions/editor/ezObjectSelect/viewportOrientationGizmo.lua` · VM: Game Engine (GE) · 134 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_ezObjectSelect_viewportOrientationGizmo`: `extensions.load("editor_ezObjectSelect_viewportOrientationGizmo")`, then the global `editor_ezObjectSelect_viewportOrientationGizmo`

Small 2D orientation gizmo drawn in a corner of the editor view (ImGui, foreground draw list) for Easy Object Select: three axes X (red), Y (green), Z (blue) projected according to the camera orientation (core_camera.getQuat), with solid labeled positive tips and darker negative tips. Displays "W" (world) or "L" (local) depending on whether a local object is given.

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_ezObjectSelect_viewportOrientationGizmo.draw(rightOffset, topOffset, localObjectId)` | Draws the gizmo. If localObjectId designates an existing object, the axes follow its transform matrix (L mode), otherwise the world axes (W mode). The tips are sorted by depth. | 52 |

### Parameter details

#### `editor_ezObjectSelect_viewportOrientationGizmo.draw(rightOffset, topOffset, localObjectId)`

Draws the gizmo. If localObjectId designates an existing object, the axes follow its transform matrix (L mode), otherwise the world axes (W mode). The tips are sorted by depth.

- `rightOffset` (*number|nil*) : Offset from the right edge of the scene view, in pixels before uiscale (default 64).
- `topOffset` (*number|nil*) : Offset from the top, in pixels before uiscale (default 64).
- `localObjectId` (*integer|nil*) : ID of an object whose local axes are displayed.

## Calls into the engine (C++)

- `obj:` `getTransform`
- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/ezObjectSelect/viewportOrientationGizmo.lua`.*
