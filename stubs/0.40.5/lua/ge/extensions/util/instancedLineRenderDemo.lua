---@meta
-- tim19Atlas stub generated from lua/ge/extensions/util/instancedLineRenderDemo.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Technical demo of "instanced" line drawing in the debugDrawer (drawLineInstance, drawDot), which allows thick lines with an outline and rounded ends. Once loaded, the extension runs a simulation of 6 attracting masses (inspired by a JavaScript n-body) and draws their trajectories every frame at 3 m height above the origin, twice: without depth test and with it (offset by 5 m in X). The other demos (grid, sine waves, edges, traffic light) are dead code commented out in onPreRender.
--- Access: extension `util_instancedLineRenderDemo`: `extensions.load("util_instancedLineRenderDemo")`, then the global `util_instancedLineRenderDemo`
---@class util_instancedLineRenderDemo
util_instancedLineRenderDemo = {}

--- Called when the extension is loaded: initializes the simulation masses (startSim).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/util/instancedLineRenderDemo.lua:240
function util_instancedLineRenderDemo.onExtensionLoaded() end

--- Hook called every frame before rendering. Advances the demo time, performs a simulation step and draws the trajectories (without then with depth).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/util/instancedLineRenderDemo.lua:222
---@param dtReal number Real-time delta in seconds
---@param dtSim number Simulation time delta in seconds (used by the demo)
---@param dtRaw number Raw time delta (unused)
function util_instancedLineRenderDemo.onPreRender(dtReal, dtSim, dtRaw) end

