---@meta
-- tim19Atlas stub generated from lua/ge/extensions/util/tileBake.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Development-only tool: produces tile proxies for the distant city. It distributes each static mesh (TSStatic) and each large forest object of the level into 200 m tiles, merges each tile into a mesh, bakes it on the GPU into a shared atlas and writes one glTF per tile (via the C++ function bakeTileToGltf). The outputs are then used by the DevTools/instalod tool to produce simplified LODs. Output: /temp/tileBake/<level>/tile_<tx>_<ty>/ (atlas PNG, tile_<tx>_<ty>.gltf and tile.json).
--- Access: extension `util_tileBake`: `extensions.load("util_tileBake")`, then the global `util_tileBake`
---@class util_tileBake
util_tileBake = {}

--- Hook called at the end of level loading; rearms the baking (same function as onExtensionLoaded).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/util/tileBake.lua:136
function util_tileBake.onClientPostStartMission() end

--- Arms the baking when the extension is loaded while a level is already in place: enables the pending mode, waits 60 frames, resets the counters. Same function as onClientPostStartMission.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/util/tileBake.lua:136
function util_tileBake.onExtensionLoaded() end

--- Hook called every frame. Once armed: waits for the warmup to end, collects the instances per tile, then bakes one tile per call and logs the progress and the final summary (OK/failures).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/util/tileBake.lua:144
function util_tileBake.onUpdate() end

