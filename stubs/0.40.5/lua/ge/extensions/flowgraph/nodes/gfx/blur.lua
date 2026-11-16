---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/gfx/blur.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Flowgraph node class (created via `_flowgraph_createNode(C)`).
---@class flowgraph_nodes_gfx_blur_C
local flowgraph_nodes_gfx_blur_C = {}

--- Initializes lastWorking, blurAmount and blurColor.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gfx/blur.lua:24
---@param mgr table flowgraph manager
---@param ... any
function flowgraph_nodes_gfx_blur_C:init(mgr, ...) end

--- Hook called before rendering (dt, dtSim); adds a full-screen blur rectangle to ScreenBlurFX if the node was active within the last 10 frames.
---Source: lua/ge/extensions/flowgraph/nodes/gfx/blur.lua:45
---@param dt any real time elapsed since the last frame (s)
---@param dtSim any simulation elapsed time (s)
function flowgraph_nodes_gfx_blur_C:onPreRender(dt, dtSim) end

--- Configures the blurAmount pin as a float slider between 0 and 1.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gfx/blur.lua:30
function flowgraph_nodes_gfx_blur_C:postInit() end

--- Stores the blur amount, the corresponding color and the current frame number.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gfx/blur.lua:39
function flowgraph_nodes_gfx_blur_C:work() end

