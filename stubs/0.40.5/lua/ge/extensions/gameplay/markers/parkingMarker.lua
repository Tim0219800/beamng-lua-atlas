---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/markers/parkingMarker.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `gameplay_markers_parkingMarker` : `extensions.load("gameplay_markers_parkingMarker")`, puis la globale `gameplay_markers_parkingMarker`
---@class gameplay_markers_parkingMarker
gameplay_markers_parkingMarker = {}

--- parking markers are clustered if the path to the parking spot is identical.
---  if no path is given, that marker will never cluster...
---Source : lua/ge/extensions/gameplay/markers/parkingMarker.lua:497
---@param pois any
---@param allClusters any
function gameplay_markers_parkingMarker.cluster(pois, allClusters) end

---Source : lua/ge/extensions/gameplay/markers/parkingMarker.lua:487
---@param ... any
function gameplay_markers_parkingMarker.create(...) end

--- Classe locale `C` de lua/ge/extensions/gameplay/markers/parkingMarker.lua
---@class gameplay_markers_parkingMarker_C
local gameplay_markers_parkingMarker_C = {}

---Source : lua/ge/extensions/gameplay/markers/parkingMarker.lua:257
---@param data any
function gameplay_markers_parkingMarker_C:checkParking(data) end

---Source : lua/ge/extensions/gameplay/markers/parkingMarker.lua:329
function gameplay_markers_parkingMarker_C:clearObjects() end

---Source : lua/ge/extensions/gameplay/markers/parkingMarker.lua:288
---@param shapeName any
---@param objectName any
function gameplay_markers_parkingMarker_C:createObject(shapeName, objectName) end

---Source : lua/ge/extensions/gameplay/markers/parkingMarker.lua:302
function gameplay_markers_parkingMarker_C:createObjects() end

---Source : lua/ge/extensions/gameplay/markers/parkingMarker.lua:430
---@param corner any
---@param x any
---@param y any
---@param z any
---@param clr any
function gameplay_markers_parkingMarker_C:drawAxisBox(corner, x, y, z, clr) end

---Source : lua/ge/extensions/gameplay/markers/parkingMarker.lua:368
---@param td any
function gameplay_markers_parkingMarker_C:drawOnMinimap(td) end

---Source : lua/ge/extensions/gameplay/markers/parkingMarker.lua:306
function gameplay_markers_parkingMarker_C:hide() end

---Source : lua/ge/extensions/gameplay/markers/parkingMarker.lua:26
function gameplay_markers_parkingMarker_C:init() end

---Source : lua/ge/extensions/gameplay/markers/parkingMarker.lua:360
---@param visible any
function gameplay_markers_parkingMarker_C:instantFade(visible) end

---Source : lua/ge/extensions/gameplay/markers/parkingMarker.lua:352
---@param interactData any
---@param interactableElements any
function gameplay_markers_parkingMarker_C:interactInPlayMode(interactData, interactableElements) end

---Source : lua/ge/extensions/gameplay/markers/parkingMarker.lua:41
---@param cluster any
function gameplay_markers_parkingMarker_C:setup(cluster) end

---Source : lua/ge/extensions/gameplay/markers/parkingMarker.lua:323
function gameplay_markers_parkingMarker_C:show() end

---Source : lua/ge/extensions/gameplay/markers/parkingMarker.lua:135
---@param data any
function gameplay_markers_parkingMarker_C:update(data) end

