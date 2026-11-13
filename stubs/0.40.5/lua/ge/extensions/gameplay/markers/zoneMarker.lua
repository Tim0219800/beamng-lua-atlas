---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/markers/zoneMarker.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `gameplay_markers_zoneMarker` : `extensions.load("gameplay_markers_zoneMarker")`, puis la globale `gameplay_markers_zoneMarker`
---@class gameplay_markers_zoneMarker
gameplay_markers_zoneMarker = {}

--- zoneMarkers are not grouped/merged - each poi will be one cluster.
---Source : lua/ge/extensions/gameplay/markers/zoneMarker.lua:57
---@param pois any
---@param allClusters any
function gameplay_markers_zoneMarker.cluster(pois, allClusters) end

---Source : lua/ge/extensions/gameplay/markers/zoneMarker.lua:48
---@param ... any
function gameplay_markers_zoneMarker.create(...) end

--- Classe locale `C` de lua/ge/extensions/gameplay/markers/zoneMarker.lua
---@class gameplay_markers_zoneMarker_C
local gameplay_markers_zoneMarker_C = {}

---Source : lua/ge/extensions/gameplay/markers/zoneMarker.lua:24
function gameplay_markers_zoneMarker_C:clearObjects() end

---Source : lua/ge/extensions/gameplay/markers/zoneMarker.lua:20
function gameplay_markers_zoneMarker_C:createObjects() end

---Source : lua/ge/extensions/gameplay/markers/zoneMarker.lua:21
function gameplay_markers_zoneMarker_C:hide() end

---Source : lua/ge/extensions/gameplay/markers/zoneMarker.lua:7
function gameplay_markers_zoneMarker_C:init() end

---Source : lua/ge/extensions/gameplay/markers/zoneMarker.lua:23
---@param visible any
function gameplay_markers_zoneMarker_C:instantFade(visible) end

--- Interactivity
---Source : lua/ge/extensions/gameplay/markers/zoneMarker.lua:27
---@param interactData any
---@param interactableElements any
function gameplay_markers_zoneMarker_C:interactInPlayMode(interactData, interactableElements) end

---Source : lua/ge/extensions/gameplay/markers/zoneMarker.lua:19
---@param value any
function gameplay_markers_zoneMarker_C:setHidden(value) end

---Source : lua/ge/extensions/gameplay/markers/zoneMarker.lua:12
---@param cluster any
function gameplay_markers_zoneMarker_C:setup(cluster) end

---Source : lua/ge/extensions/gameplay/markers/zoneMarker.lua:22
function gameplay_markers_zoneMarker_C:show() end

---Source : lua/ge/extensions/gameplay/markers/zoneMarker.lua:9
---@param data any
function gameplay_markers_zoneMarker_C:update(data) end

