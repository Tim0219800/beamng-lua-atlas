---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/markers/bigmapMarker.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `gameplay_markers_bigmapMarker` : `extensions.load("gameplay_markers_bigmapMarker")`, puis la globale `gameplay_markers_bigmapMarker`
---@class gameplay_markers_bigmapMarker
---@field containsAnyDelivery boolean
---@field containsAnyMission boolean
gameplay_markers_bigmapMarker = {}

---Source : lua/ge/extensions/gameplay/markers/bigmapMarker.lua:235
---@param ... any
function gameplay_markers_bigmapMarker.createMarker(...) end

---Source : lua/ge/extensions/gameplay/markers/bigmapMarker.lua:242
---@param pois any
---@param idPrefix any
function gameplay_markers_bigmapMarker.merge(pois, idPrefix) end

--- Classe locale `C` de lua/ge/extensions/gameplay/markers/bigmapMarker.lua
---@class gameplay_markers_bigmapMarker_C
local gameplay_markers_bigmapMarker_C = {}

--- destorys/cleans up all objects created by this
---Source : lua/ge/extensions/gameplay/markers/bigmapMarker.lua:214
function gameplay_markers_bigmapMarker_C:clearObjects() end

---Source : lua/ge/extensions/gameplay/markers/bigmapMarker.lua:199
function gameplay_markers_bigmapMarker_C:hide() end

--- called when this object is created. initialize variables here (but dont spawn objects)
---Source : lua/ge/extensions/gameplay/markers/bigmapMarker.lua:29
function gameplay_markers_bigmapMarker_C:init() end

---Source : lua/ge/extensions/gameplay/markers/bigmapMarker.lua:208
---@param visible any
function gameplay_markers_bigmapMarker_C:instantFade(visible) end

---Source : lua/ge/extensions/gameplay/markers/bigmapMarker.lua:191
function gameplay_markers_bigmapMarker_C:setFullAlphaInstant() end

---Source : lua/ge/extensions/gameplay/markers/bigmapMarker.lua:196
---@param value any
function gameplay_markers_bigmapMarker_C:setHidden(value) end

---Source : lua/ge/extensions/gameplay/markers/bigmapMarker.lua:156
---@param cluster any
function gameplay_markers_bigmapMarker_C:setup(cluster) end

---Source : lua/ge/extensions/gameplay/markers/bigmapMarker.lua:203
function gameplay_markers_bigmapMarker_C:show() end

--- called every frame to update the visuals.
---Source : lua/ge/extensions/gameplay/markers/bigmapMarker.lua:77
---@param data any
function gameplay_markers_bigmapMarker_C:update(data) end

