---@meta
-- tim19Atlas stub generated from lua/ge/extensions/util/tileBake.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Dev-only: bakes distant-city tile proxies. Buckets every static mesh + big forest item in
---  the level into 200m tiles, packs each tile into one mesh, GPU-bakes it to a shared atlas and
---  writes a tile glTF (via the C++ bakeTileToGltf). Feed the output to DevTools/instalod to make
---  the simplified LODs. Load via:  extensions.load('util/tileBake')
---  Output: /temp/tileBake/<level>/tile_<tx>_<ty>/  (atlas PNGs + tile_<tx>_<ty>.gltf + tile.json)
--- Accès : extension `util_tileBake` : `extensions.load("util_tileBake")`, puis la globale `util_tileBake`
---@class util_tileBake
util_tileBake = {}

--- re-run on (re)load when a level is already up
---Source : lua/ge/extensions/util/tileBake.lua:136
function util_tileBake.onClientPostStartMission() end

---Source : lua/ge/extensions/util/tileBake.lua:136
function util_tileBake.onExtensionLoaded() end

---Source : lua/ge/extensions/util/tileBake.lua:144
function util_tileBake.onUpdate() end

