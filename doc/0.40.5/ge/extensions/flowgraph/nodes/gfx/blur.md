# `flowgraph_nodes_gfx_blur`

*File: `lua/ge/extensions/flowgraph/nodes/gfx/blur.lua` · VM: Game Engine (GE) · 62 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/gfx/blur")` (file under extensions/ but not a regular extension)

Flowgraph node "Blur" (repeat_instant, tags gfx/blur). Blurs the scene: pin blurAmount (0 to 1, default 1) becomes the alpha of a full-screen rectangle added to the ScreenBlurFX effect every render frame. Draws nothing if the CEF UI is not visible or if work has not run for more than 10 frames.

## Class `C`

Flowgraph node class (created via `_flowgraph_createNode(C)`).

| Method | Description | Line |
|---|---|---|
| `C:init(mgr, ...)` | Initializes lastWorking, blurAmount and blurColor. | 24 |
| `C:onPreRender(dt, dtSim)` | Hook called before rendering (dt, dtSim); adds a full-screen blur rectangle to ScreenBlurFX if the node was active within the last 10 frames. | 45 |
| `C:postInit()` | Configures the blurAmount pin as a float slider between 0 and 1. | 30 |
| `C:work()` | Stores the blur amount, the corresponding color and the current frame number. | 39 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/gfx/blur.lua`.*
