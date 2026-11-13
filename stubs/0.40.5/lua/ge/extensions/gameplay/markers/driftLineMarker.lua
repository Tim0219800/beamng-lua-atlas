---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/markers/driftLineMarker.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `gameplay_markers_driftLineMarker` : `extensions.load("gameplay_markers_driftLineMarker")`, puis la globale `gameplay_markers_driftLineMarker`
---@class gameplay_markers_driftLineMarker
gameplay_markers_driftLineMarker = {}

--- zoneMarkers are not grouped/merged - each poi will be one cluster.
---Source : lua/ge/extensions/gameplay/markers/driftLineMarker.lua:109
---@param pois any
---@param allClusters any
function gameplay_markers_driftLineMarker.cluster(pois, allClusters) end

---Source : lua/ge/extensions/gameplay/markers/driftLineMarker.lua:100
---@param ... any
function gameplay_markers_driftLineMarker.create(...) end

--- Classe locale `C` de lua/ge/extensions/gameplay/markers/driftLineMarker.lua
---@class gameplay_markers_driftLineMarker_C
local gameplay_markers_driftLineMarker_C = {}

---Source : lua/ge/extensions/gameplay/markers/driftLineMarker.lua:18
function gameplay_markers_driftLineMarker_C:clearObjects() end

---Source : lua/ge/extensions/gameplay/markers/driftLineMarker.lua:14
function gameplay_markers_driftLineMarker_C:createObjects() end

---Source : lua/ge/extensions/gameplay/markers/driftLineMarker.lua:90
---@param td any
function gameplay_markers_driftLineMarker_C:drawOnMinimap(td) end

---Source : lua/ge/extensions/gameplay/markers/driftLineMarker.lua:28
function gameplay_markers_driftLineMarker_C:hide() end

---Source : lua/ge/extensions/gameplay/markers/driftLineMarker.lua:9
function gameplay_markers_driftLineMarker_C:init() end

--- Interactivity
---Source : lua/ge/extensions/gameplay/markers/driftLineMarker.lua:75
---@param interactData any
function gameplay_markers_driftLineMarker_C:interactWhileMoving(interactData) end

---Source : lua/ge/extensions/gameplay/markers/driftLineMarker.lua:54
---@param cluster any
function gameplay_markers_driftLineMarker_C:setup(cluster) end

---Source : lua/ge/extensions/gameplay/markers/driftLineMarker.lua:31
function gameplay_markers_driftLineMarker_C:show() end

---Source : lua/ge/extensions/gameplay/markers/driftLineMarker.lua:35
function gameplay_markers_driftLineMarker_C:update() end

