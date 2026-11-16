---@meta
-- tim19Atlas stub generated from lua/ge/extensions/util/decalRoadsEditor.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Debug visualization, dynamically loaded by the engine or the world editor: every frame, it draws the scene's AIPath objects (traffic paths) near the camera: red spheres at the nodes, blue prisms between nodes, and arrow decals per lane (cyan for the left lane, red for the right, reversed if flipDirection). Only AIPaths with drivability > 0 are displayed.
--- Access: extension `util_decalRoadsEditor`: `extensions.load("util_decalRoadsEditor")`, then the global `util_decalRoadsEditor`
---@class util_decalRoadsEditor
util_decalRoadsEditor = {}

--- Load hook: logs "module loaded".
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/util/decalRoadsEditor.lua:109
function util_decalRoadsEditor.onExtensionLoaded() end

--- Unload hook: logs "module unloaded".
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/util/decalRoadsEditor.lua:106
function util_decalRoadsEditor.onExtensionUnloaded() end

--- Hook called before each render: draws the AIPaths near the camera (nodes, segments, lane arrows).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/util/decalRoadsEditor.lua:9
---@param dt number Frame duration (s); unused.
function util_decalRoadsEditor.onPreRender(dt) end

