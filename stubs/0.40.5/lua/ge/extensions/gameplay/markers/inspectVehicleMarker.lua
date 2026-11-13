---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/markers/inspectVehicleMarker.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `gameplay_markers_inspectVehicleMarker` : `extensions.load("gameplay_markers_inspectVehicleMarker")`, puis la globale `gameplay_markers_inspectVehicleMarker`
---@class gameplay_markers_inspectVehicleMarker
gameplay_markers_inspectVehicleMarker = {}

--- zoneMarkers are not grouped/merged - each poi will be one cluster.
---Source : lua/ge/extensions/gameplay/markers/inspectVehicleMarker.lua:248
---@param pois any
---@param allClusters any
function gameplay_markers_inspectVehicleMarker.cluster(pois, allClusters) end

---Source : lua/ge/extensions/gameplay/markers/inspectVehicleMarker.lua:239
---@param ... any
function gameplay_markers_inspectVehicleMarker.create(...) end

--- Classe locale `C` de lua/ge/extensions/gameplay/markers/inspectVehicleMarker.lua
---@class gameplay_markers_inspectVehicleMarker_C
local gameplay_markers_inspectVehicleMarker_C = {}

---Source : lua/ge/extensions/gameplay/markers/inspectVehicleMarker.lua:42
function gameplay_markers_inspectVehicleMarker_C:clearObjects() end

---Source : lua/ge/extensions/gameplay/markers/inspectVehicleMarker.lua:38
function gameplay_markers_inspectVehicleMarker_C:createObjects() end

---Source : lua/ge/extensions/gameplay/markers/inspectVehicleMarker.lua:52
function gameplay_markers_inspectVehicleMarker_C:hide() end

---Source : lua/ge/extensions/gameplay/markers/inspectVehicleMarker.lua:26
function gameplay_markers_inspectVehicleMarker_C:init() end

--- Interactivity
---Source : lua/ge/extensions/gameplay/markers/inspectVehicleMarker.lua:231
---@param interactData any
---@param interactableElements any
function gameplay_markers_inspectVehicleMarker_C:interactInPlayMode(interactData, interactableElements) end

---Source : lua/ge/extensions/gameplay/markers/inspectVehicleMarker.lua:202
---@param cluster any
function gameplay_markers_inspectVehicleMarker_C:setup(cluster) end

---Source : lua/ge/extensions/gameplay/markers/inspectVehicleMarker.lua:63
function gameplay_markers_inspectVehicleMarker_C:show() end

---Source : lua/ge/extensions/gameplay/markers/inspectVehicleMarker.lua:86
---@param data any
function gameplay_markers_inspectVehicleMarker_C:update(data) end

