---@meta
-- tim19Atlas stub generated from lua/ge/extensions/util/bakeTest.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Internal development tool: after a mission starts, it runs the GPU material "baker" (bakeShapeMaterialsPBR) then the glTF export (exportShapeToGltf) on a fixed list of 10 buildings of the west_coast_usa level, to validate the chain end to end. The results (PNG atlas and .gltf file) are written to /temp/bakeTest/<name>/.
--- Access: extension `util_bakeTest`: `extensions.load("util_bakeTest")`, then the global `util_bakeTest`
---@class util_bakeTest
util_bakeTest = {}

--- Hook called after a mission starts: arms the processing and starts a 60-frame wait.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/util/bakeTest.lua:50
function util_bakeTest.onClientPostStartMission() end

--- Hook called every frame: after the wait, processes one mesh per frame (baking then glTF export) until the end of the list.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/util/bakeTest.lua:55
function util_bakeTest.onUpdate() end

