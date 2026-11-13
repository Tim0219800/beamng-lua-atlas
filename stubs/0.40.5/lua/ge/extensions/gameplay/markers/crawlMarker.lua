---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/markers/crawlMarker.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `gameplay_markers_crawlMarker` : `extensions.load("gameplay_markers_crawlMarker")`, puis la globale `gameplay_markers_crawlMarker`
---@class gameplay_markers_crawlMarker
gameplay_markers_crawlMarker = {}

--- crawlmarker are clustered if the area and icon names are identical
---Source : lua/ge/extensions/gameplay/markers/crawlMarker.lua:245
---@param pois any
---@param allClusters any
function gameplay_markers_crawlMarker.cluster(pois, allClusters) end

---Source : lua/ge/extensions/gameplay/markers/crawlMarker.lua:236
---@param ... any
function gameplay_markers_crawlMarker.create(...) end

--- Classe locale `C` de lua/ge/extensions/gameplay/markers/crawlMarker.lua
---@class gameplay_markers_crawlMarker_C
local gameplay_markers_crawlMarker_C = {}

---Source : lua/ge/extensions/gameplay/markers/crawlMarker.lua:145
function gameplay_markers_crawlMarker_C:clearObjects() end

---Source : lua/ge/extensions/gameplay/markers/crawlMarker.lua:123
function gameplay_markers_crawlMarker_C:createObjects() end

---Source : lua/ge/extensions/gameplay/markers/crawlMarker.lua:170
---@param corner any
---@param x any
---@param y any
---@param z any
---@param clr any
function gameplay_markers_crawlMarker_C:drawAxisBox(corner, x, y, z, clr) end

--- minimap
---Source : lua/ge/extensions/gameplay/markers/crawlMarker.lua:228
---@param td any
function gameplay_markers_crawlMarker_C:drawOnMinimap(td) end

---Source : lua/ge/extensions/gameplay/markers/crawlMarker.lua:127
function gameplay_markers_crawlMarker_C:hide() end

---Source : lua/ge/extensions/gameplay/markers/crawlMarker.lua:22
function gameplay_markers_crawlMarker_C:init() end

---Source : lua/ge/extensions/gameplay/markers/crawlMarker.lua:166
---@param visible any
function gameplay_markers_crawlMarker_C:instantFade(visible) end

---Source : lua/ge/extensions/gameplay/markers/crawlMarker.lua:156
---@param interactData any
---@param interactableElements any
function gameplay_markers_crawlMarker_C:interactInPlayMode(interactData, interactableElements) end

---Source : lua/ge/extensions/gameplay/markers/crawlMarker.lua:26
---@param cluster any
function gameplay_markers_crawlMarker_C:setup(cluster) end

---Source : lua/ge/extensions/gameplay/markers/crawlMarker.lua:140
function gameplay_markers_crawlMarker_C:show() end

---Source : lua/ge/extensions/gameplay/markers/crawlMarker.lua:65
---@param data any
function gameplay_markers_crawlMarker_C:update(data) end

