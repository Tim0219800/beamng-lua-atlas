# `core_cameraModes_gameengine`

*File: `lua/ge/extensions/core/cameraModes/gameengine.lua` · VM: Game Engine (GE) · 108 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/core/cameraModes/gameengine")` (file under extensions/ but not a regular extension)

Final global filter (runningOrder 1) that sends the computed pose (data.res) to the rendering engine: for the main view, setCameraPosRotFovNearClipC (with OpenXR, first combines the headset's predicted pose); for an extra context (split-screen, video stream), RenderViewManagerInstance:updateViewCamera with optional orthographic projection (res.ortho). Marks the main view 'cameraMotionContinuous' during big map transitions. Returns a constructor.

## Notes

- Split-screen views narrower than 16:9 get a widened FOV (33% of the theoretical compensation). Far plane fixed at 2000 m for extra views.
- Does not check levelLoaded: core_cameraUpdate only runs with a level loaded.

## Class `C`

Output filter to the engine.

The module returns a constructor: `local obj = require("core_cameraModes_gameengine")(options)`.

| Method | Description | Line |
|---|---|---|
| `C:init()` | isGlobal = true, runningOrder = 1, isFilter = true, hidden = true. | 12 |
| `C:update(data)` | Pushes data.res to the main view or to data.renderView. | 68 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/core/cameraModes/gameengine.lua`.*
