---@meta
-- tim19Atlas stub generated from lua/ge/extensions/util/terrainGenerator.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `util_terrainGenerator` : `extensions.load("util_terrainGenerator")`, puis la globale `util_terrainGenerator`
---@class util_terrainGenerator
util_terrainGenerator = {}

---Source : lua/ge/extensions/util/terrainGenerator.lua:468
---@param data any
function util_terrainGenerator.new(data) end

--- Classe locale `C` de lua/ge/extensions/util/terrainGenerator.lua
---@class util_terrainGenerator_C
local util_terrainGenerator_C = {}

---Source : lua/ge/extensions/util/terrainGenerator.lua:105
function util_terrainGenerator_C:centerTerrain() end

---Source : lua/ge/extensions/util/terrainGenerator.lua:380
function util_terrainGenerator_C:createTerrain() end

---Source : lua/ge/extensions/util/terrainGenerator.lua:188
---@param dir any
---@param prefix any
function util_terrainGenerator_C:exportTerrainMaps(dir, prefix) end

---Source : lua/ge/extensions/util/terrainGenerator.lua:90
function util_terrainGenerator_C:getMaxHeight() end

---Source : lua/ge/extensions/util/terrainGenerator.lua:184
---@param path any
---@param matName any
function util_terrainGenerator_C:getTextureMap(path, matName) end

---Source : lua/ge/extensions/util/terrainGenerator.lua:39
---@param data any
function util_terrainGenerator_C:init(data) end

---Source : lua/ge/extensions/util/terrainGenerator.lua:73
---@param path any
function util_terrainGenerator_C:loadBitmap(path) end

---Source : lua/ge/extensions/util/terrainGenerator.lua:172
---@param deleteOnly any
function util_terrainGenerator_C:resetTerrain(deleteOnly) end

---Source : lua/ge/extensions/util/terrainGenerator.lua:159
---@param dir any
function util_terrainGenerator_C:resetUserDir(dir) end

---Source : lua/ge/extensions/util/terrainGenerator.lua:57
---@param path any
function util_terrainGenerator_C:saveBitmap(path) end

---Source : lua/ge/extensions/util/terrainGenerator.lua:118
---@param array any
function util_terrainGenerator_C:setBitmapFromArray(array) end

---Source : lua/ge/extensions/util/terrainGenerator.lua:233
function util_terrainGenerator_C:setDefaultMaterial() end

---Source : lua/ge/extensions/util/terrainGenerator.lua:249
---@param matData any
function util_terrainGenerator_C:setMaterials(matData) end

---Source : lua/ge/extensions/util/terrainGenerator.lua:203
---@param path any
---@param size any
---@param height any
---@param scale any
---@param flipY any
function util_terrainGenerator_C:setPngData(path, size, height, scale, flipY) end

---Source : lua/ge/extensions/util/terrainGenerator.lua:112
---@param x any
---@param y any
---@param z any
function util_terrainGenerator_C:setPoint(x, y, z) end

---Source : lua/ge/extensions/util/terrainGenerator.lua:98
---@param vec any
function util_terrainGenerator_C:setTerrainOffset(vec) end

---Source : lua/ge/extensions/util/terrainGenerator.lua:339
function util_terrainGenerator_C:setTextureMaps() end

---Source : lua/ge/extensions/util/terrainGenerator.lua:211
---@param dir any
function util_terrainGenerator_C:setUserDir(dir) end

