---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/util/hsvColor.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Flowgraph node class; each instance represents a node in a graph.
---@class flowgraph_nodes_util_hsvColor_C
local flowgraph_nodes_util_hsvColor_C = {}

--- Converts HSV to a {r, g, b} table via the global function HSVtoRGB; the hue is brought into [0,1[ and s, v are clamped to [0,1].
---Source: lua/ge/extensions/flowgraph/nodes/util/hsvColor.lua:27
---@param h number Hue.
---@param s number Saturation.
---@param v number Value (brightness).
function flowgraph_nodes_util_hsvColor_C:HSVtoRGB(h, s, v) end

--- Does nothing.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/util/hsvColor.lua:23
function flowgraph_nodes_util_hsvColor_C:init() end

--- Computes the color and writes {r, g, b, alpha} to color.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/util/hsvColor.lua:32
function flowgraph_nodes_util_hsvColor_C:work() end

