---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/markers/missionMarker.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `gameplay_markers_missionMarker` : `extensions.load("gameplay_markers_missionMarker")`, puis la globale `gameplay_markers_missionMarker`
---@class gameplay_markers_missionMarker
gameplay_markers_missionMarker = {}

--- Mission markers are clustered with the original clustering algorithm - when they overlap, they merge.
---Source : lua/ge/extensions/gameplay/markers/missionMarker.lua:488
---@param pois any
---@param allClusters any
function gameplay_markers_missionMarker.cluster(pois, allClusters) end

---Source : lua/ge/extensions/gameplay/markers/missionMarker.lua:436
---@param ... any
function gameplay_markers_missionMarker.create(...) end

--- Classe locale `C` de lua/ge/extensions/gameplay/markers/missionMarker.lua
---@class gameplay_markers_missionMarker_C
local gameplay_markers_missionMarker_C = {}

--- destorys/cleans up all objects created by this
---Source : lua/ge/extensions/gameplay/markers/missionMarker.lua:387
function gameplay_markers_missionMarker_C:clearObjects() end

---Source : lua/ge/extensions/gameplay/markers/missionMarker.lua:318
---@param shapeName any
---@param objectName any
function gameplay_markers_missionMarker_C:createObject(shapeName, objectName) end

---Source : lua/ge/extensions/gameplay/markers/missionMarker.lua:333
function gameplay_markers_missionMarker_C:createObjects() end

---Source : lua/ge/extensions/gameplay/markers/missionMarker.lua:428
---@param td any
---@param dpi any
function gameplay_markers_missionMarker_C:drawOnMinimap(td, dpi) end

---Source : lua/ge/extensions/gameplay/markers/missionMarker.lua:345
function gameplay_markers_missionMarker_C:hide() end

--- called when this object is created. initialize variables here (but dont spawn objects)
---Source : lua/ge/extensions/gameplay/markers/missionMarker.lua:61
function gameplay_markers_missionMarker_C:init() end

---Source : lua/ge/extensions/gameplay/markers/missionMarker.lua:380
---@param visible any
function gameplay_markers_missionMarker_C:instantFade(visible) end

--- Interactivity
---Source : lua/ge/extensions/gameplay/markers/missionMarker.lua:414
---@param interactData any
---@param interactableElements any
function gameplay_markers_missionMarker_C:interactInPlayMode(interactData, interactableElements) end

---Source : lua/ge/extensions/gameplay/markers/missionMarker.lua:86
---@param data any
function gameplay_markers_missionMarker_C:playerIsInArea(data) end

---Source : lua/ge/extensions/gameplay/markers/missionMarker.lua:383
---@param vis any
---@param instant any
function gameplay_markers_missionMarker_C:setVisibilityInBigmap(vis, instant) end

---Source : lua/ge/extensions/gameplay/markers/missionMarker.lua:250
---@param cluster any
function gameplay_markers_missionMarker_C:setup(cluster) end

---Source : lua/ge/extensions/gameplay/markers/missionMarker.lua:375
function gameplay_markers_missionMarker_C:show() end

--- called every frame to update the visuals.
---Source : lua/ge/extensions/gameplay/markers/missionMarker.lua:100
---@param data any
function gameplay_markers_missionMarker_C:update(data) end

